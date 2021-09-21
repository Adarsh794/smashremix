// Shield.asm
if !{defined __SHIELD__} {
define __SHIELD__()
print "included Shield.asm\n"

// @ Description
// Thise file changes shield colors to match port colors.

include "OS.asm"
include "Global.asm"
include "Color.asm"
include "Character.asm"

scope Shield {

    // @ Description
    // This function overwrites the logic to generate a shield color. This is a controversial "fix"
    // and will soon be replaced by selectable shield colors.
    // 2021/05/23 - "soon" has finally come
    scope color_fix_: {
        OS.patch_start(0x0007C8E8, 0x801010E8)
        j       color_fix_
        nop
        _color_fix_return:
        OS.patch_end()

        or      t6, t7, t5                  // original line 1
        // t8 needs to hold rgba32 color by end of function

        addiu   sp, sp,-0x0020              // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      t1, 0x0008(sp)              // ~
        sw      t2, 0x000C(sp)              // ~
        sw      t3, 0x0010(sp)              // save registers

        lw      t1, 0x0084(a0)              // t1 = shield object special struct
        lw      t0, 0x0004(t1)              // t0 = player object
        lw      t0, 0x0084(t0)              // t0 = player struct
        lw      t1, 0x0018(t1)              // t1 = port shielding
        sll     t2, t1, 0x0002              // t2 = port * 4
        li      t3, state_table             // ~
        addu    t2, t2, t3                  // t2 = state_table + (port * 4)
        lw      t2, 0x0000(t2)              // t2 = shield state
        beqz    t2, _teams_check            // branch if shield state is default(0)
        nop
        
        _custom:
        // t2 is shield state
        sll     t2, t2, 0x2                 // t2 = shield state * 4
        li      t8, table_custom            // ~
        addu    t8, t8, t2                  // t8 = table_custom + (shield state * 4)
        b       _return                     // branch to end
        lw      t8, 0x0000(t8)              // t8 = shield color

        _teams_check:
        li      t2, Global.match_info
        lw      t2, 0x0000(t2)              // t2 = match info struct
        addiu   t3, t2, 0x0002              // t3 = address of teams byte, if vs
        li      t2, Global.vs.teams         // t2 = pointer to teams byte
        bne     t2, t3, _cpu                // if not vs, skip
        lbu     t2, 0x0000(t2)              // t2 = teams
        beqz    t2, _cpu                    // if (!teams), skip
        nop
        lbu     t1, 0x000C(t0)              // t1 = team

        // team 0 = red, team 1 = blue, team 2 green
        // green is in not in table[2], it's in table[3]
        // 0 = 0b00, 1 = 0b01, 2 = 0b10
        // *shift team right 1*
        // (0 >> 1) = 0b00, (1 >> 1) = 0b00, (2 >> 1) = 0b01 
        // so t1 + (t1 >> 1) = team color

        srl     t2, t1, 0x0001              // t2 = (t1 >> 1)
        add     t1, t1, t2                  // t2 = correct team color
        b       _human_or_team              // ~
        nop

        _cpu:
        lbu     t0, 0x0023(t0)              // t6 = type (player = 0, cpu = 1)
        bne     t0, r0, _return             // branch to human/cpu
        ori     t8, r0, 0x00C0              // cpu shield = 0x000000C0

        _human_or_team:
        sll     t1, t1, 0x0002              // ~
        li      t8, table_default           // ~
        add     t8, t8, t1                  // ~
        lw      t8, 0x0000(t8)              // t8 = table_default[player_or_team]

        _return:
        lw      t0, 0x0004(sp)              // ~
        lw      t1, 0x0008(sp)              // ~
        lw      t3, 0x0010(sp)              // ~
        addiu   sp, sp, 0x0020              // deallocate stack space
        j       _color_fix_return           // return
        ori     t8, t8, 0x00C0              // set alpha channel

        table_default:
        dw (0xFFFFFF00 & Color.high.RED)    // p1
        dw (0xFFFFFF00 & Color.high.BLUE)   // p2
        dw (0xFFFFFF00 & Color.high.YELLOW) // p3
        dw (0xFFFFFF00 & Color.high.GREEN)  // p4
        
        table_custom:
        dw 0                                // Default
        dw 0xFF000000                       // Red
        dw 0xFF800000                       // Orange
        dw 0xFFFF0000                       // Yellow
        dw 0x80FF0000                       // Lime (Chartreuse)
        dw 0x00FF0000                       // Green
        dw 0x00FF8000                       // Turquoise (Spring Green)
        dw 0x00FFFF00                       // Cyan
        dw 0x0080FF00                       // Azure
        dw 0x0000FF00                       // Blue
        dw 0x8000FF00                       // Purple (Violet)
        dw 0xFF00FF00                       // Magenta
        dw 0xFF008000                       // Pink (Rose)
        dw 0xA8402000                       // Brown
        dw 0x00000000                       // Black
        dw 0xA0A0A000                       // White
    }

    state_table:
    dw  0   // P1
    dw  0   // P2
    dw  0   // P3
    dw  0   // P4
}

} // __SHIELD__
