// Camera.asm
if !{defined __CAMERA__} {
define __CAMERA__()
print "included Camera.asm\n"


// @ Description
// This file includes Camera related toggles and fixes.

include "Global.asm"
include "Toggles.asm"
include "OS.asm"

// 80131470 - camera

scope Camera {

    // @ Description
    // This catches a call to Global.get_random_int and sets the result depending on the cinematic entry toggle value.
    scope cinematic_entry_: {
        OS.patch_start(0x0008E250, 0x80112A50)
        j       cinematic_entry_
        nop
        _cinematic_entry_return:
        OS.patch_end()

        jal     Global.get_random_int_      // original line 1
        lli     a0, 0x0003                  // original line 2

        li      a0, Toggles.entry_cinematic_entry
        lw      a0, 0x0004(a0)              // a0 = 1 if always, 2 if never, 0 if default
        beqz    a0, _return                 // if set to default, use v0 returned from get_random_int_
        addiu   a0, a0, -0x0001             // a0 = 0 if always, 1 if never
        beqzl   a0, _return                 // if set to always, set v0 to 2
        lli     v0, 0x0002                  // force cinematic entry

        // otherwise, it's set to never
        lli     v0, 0x0000                  // force no cinematic entry

        _return:
        j       _cinematic_entry_return     // return
        nop

    }

    // @ Description
    // Allows 360 control over the camera by changing the floats to check against
    // inspired by [Gaudy (Emudigital)] 
    OS.patch_start(0x000AC494, 0x80130C94)
    float32 100                             // x limit
    dw 0x39AE9681                           // x increment
    float32 -100                            // x limit
    float32 100                             // y limit
    dw 0x39AE9681                           // y increment
    float32 -100                            // y limit
    OS.patch_end()
    
    // @ Description
    // Subroutine which freezes the camera on the World 1-1 stage.
    // Replaces a JAL to subroutine to 0x80018FBC which is used to update the camera's position.
    scope frozen_camera_: {
    
        OS.patch_start(0x87DA8, 0x8010C5A8)
        jal     frozen_camera_
        OS.patch_end()
        
        OS.patch_start(0x87E58, 0x8010C658)
        jal     frozen_camera_
        OS.patch_end()
        
        OS.patch_start(0x87EC8, 0x8010C6C8)
        jal     frozen_camera_
        OS.patch_end()
        
        OS.patch_start(0x880AC, 0x8010C8AC)
        jal     frozen_camera_
        OS.patch_end()
        
        // Function
        addiu   sp, sp,-0x0018             // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      t1, 0x0008(sp)              // ~
        sw      t2, 0x000C(sp)              // ~
        sw      ra, 0x0010(sp)              // store t0 - t2, ra
        
        li      t0, Global.match_info       // ~
        lw      t0, 0x0000(t0)              // t0 = match_info
        lbu     t0, 0x0001(t0)              // t0 = stage id
        li      t1, frozen_world1           // t1 = frozen camera parameters for WORLD1
        ori     t2, r0, Stages.id.WORLD1    // t2 = id.WORLD1
        beq     t0, t2, _frozen             // use frozen camera if stage = WORLD1
        nop
		li      t1, Toggles.entry_hazard_mode
        lw      t1, 0x0004(t1)              // t1 = hazard_mode (hazards disabled when t1 = 1 or 3)
        andi    t1, t1, 0x0001              // t1 = 1 if hazard_mode is 1 or 3, 0 otherwise
        bnez    t1, _normal                 // if hazard_mode enabled, skip frozen camera for flat zones
        nop
        li      t1, gb_land                 // t1 = frozen camera parameters for Gameboy Land
        ori     t2, r0, Stages.id.GB_LAND   // t2 = id.GB_LAND
        beq     t0, t2, _frozen             // use frozen camera if stage = GB_LAND
        nop
        li      t1, frozen_flat_zone_2      // t1 = frozen camera parameters for FLAT_ZONE_2
		ori     t2, r0, Stages.id.FLAT_ZONE_2 // t1 = id.FLAT_ZONE_2
        beq     t0, t2, _frozen             // use frozen camera if stage = FLAT_ZONE_2
        nop
		li      t1, frozen_flat_zone        // t1 = frozen camera parameters for FLAT_ZONE
		ori     t2, r0, Stages.id.FLAT_ZONE // t1 = id.FLAT_ZONE_2
        beq     t0, t2, _frozen             // use frozen camera if stage = FLAT_ZONE
        nop
        
        _normal:
        // if we reach this point, update camera as normal
        jal     0x80018FBC                  // original JAL
        nop
        b       _end                        // end subroutine
        nop
        
		_frozen:
        // if we reach this point, update camera position with fixed camera parameters
        // t1 = frozen camera parameters
		li      t0, struct.pointer          // ~
        lw      t0, 0x0000(t0)              // t0 = camera struct
        lw      t2, 0x0000(t1)              // ~
        sw      t2, struct.x(t0)            // update camera x
        lw      t2, 0x0004(t1)              // ~
        sw      t2, struct.y(t0)            // update camera y
        lw      t2, 0x0008(t1)              // ~
        sw      t2, struct.z(t0)            // update camera z
        lw      t2, 0x000C(t1)              // ~
        sw      t2, struct.focal_x(t0)      // update camera focal x
        lw      t2, 0x0010(t1)              // ~
        sw      t2, struct.focal_y(t0)      // update camera focal y
        lw      t2, 0x0014(t1)              // ~
        sw      t2, struct.focal_z(t0)      // update camera focal z
        
        _end:
        lw      t0, 0x0004(sp)              // ~
        lw      t1, 0x0008(sp)              // ~
        lw      t2, 0x000C(sp)              // ~
        lw      ra, 0x0010(sp)              // load t0 - t2, ra
        addiu   sp, sp, 0x0018              // deallocate stack space
        jr      ra                          // return
        nop
    }
    
    // @ Description
    // Frozen camera parameters for WORLD1
    frozen_world1:
    float32 0                               // camera x position
    float32 -100                            // camera y position
    float32 6600                            // camera z position
    float32 0                               // camera focal x position
    float32 -100                            // camera focal y position
    float32 0                               // camera focal z position
	
	// @ Description
    // Frozen camera parameters for FLAT_ZONE_2
    frozen_flat_zone_2:
    float32 0                               // camera x position
    float32 0                               // camera y position
    float32 8000                            // camera z position
    float32 0                               // camera focal x position
    float32 0                               // camera focal y position
    float32 0                               // camera focal z position
	
	// @ Description
    // Frozen camera parameters for FLAT_ZONE
    frozen_flat_zone:
    float32 0                               // camera x position
    float32 -100                            // camera y position
    float32 6600                            // camera z position
    float32 0                               // camera focal x position
    float32 -100                            // camera focal y position
    float32 0                               // camera focal z position
    
    	// @ Description
    // Frozen camera parameters for GB_LAND
    gb_land:
    float32 0                               // camera x position
    float32 1250                            // camera y position
    float32 7000                            // camera z position
    float32 0                               // camera focal x position
    float32 1250                            // camera focal y position
    float32 0                               // camera focal z position
    
    // @ Description
    // camera struct constants
    scope struct {
        constant pointer(0x80131460)
        constant x(0xC4)
        constant y(0xC8)
        constant z(0xCC)
        constant focal_x(0xD0)
        constant focal_y(0xD4)
        constant focal_z(0xD8)
    }
    
    // @ Description
    // This pushes back the camera when playing on Venom or GB Land.
    scope camera_adjust_: {
        OS.patch_start(0x62A70, 0x800E7270)
        j       camera_adjust_
        nop
        _return:
        OS.patch_end()
        
        li      t8, Global.current_screen   // ~
        lbu     t8, 0x0000(t8)              // t8 = current screen
        addiu   at, r0, 0x0016              // Vs screen ID
        beq     at, t8, _stage_check        // stage check if in vs
        addiu   at, r0, 0x0036              // Training screen ID
        beq     at, t8, _stage_check        // stage check if in vs
        addiu   at, r0, 0x0077              // Special 1p screen ID used for Allstar and Multiman
        beq     at, t8, _stage_check        // stage check if in vs
        addiu   at, r0, 0x0001              // 1p screen ID
        bne     at, t8, _standard           // if not in any of the battle screens, skip to standard
        nop
        
        _stage_check:
        li      t8, Global.match_info       // ~
        lw      t8, 0x0000(t8)              // t8 = match_info
        lbu     t8, 0x0001(t8)              // t8 = stage id
        
        addiu   at, r0, Stages.id.GB_LAND   // insert venom stage ID
        beq     t8, at, _max_zoom           // branch if on Gameboy Land
        lui     at, 0x3FE0                  // load Venom Camera Distance
        
        addiu   at, r0, Stages.id.VENOM     // insert venom stage ID
        bne     t8, at, _standard           // branch if not on Venom
        lui     at, 0x3FE0                  // load Venom Camera Distance
        
        _max_zoom:
        j       _return                     // return
        mtc1    at, f4                      // original line 2
        
        _standard:
        lui     at, 0x3F80                  // load camera distance, original line 1
        j       _return                     // return
        mtc1    at, f4                      // original line 2

    }
}

} // __CAMERA__
