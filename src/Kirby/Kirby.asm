// Kirby.asm

// This file contains file inclusions, action edits, and assembly for Kirby.

scope Kirby {
    // Insert Moveset files
    insert GND_NSP_GROUND,"moveset/GND_NSP_GROUND.bin"
    insert GND_NSP_AIR,"moveset/GND_NSP_AIR.bin"
    insert DRM_NSP_GROUND,"moveset/DRM_NSP_GROUND.bin"
    insert DRM_NSP_AIR,"moveset/DRM_NSP_AIR.bin"
    insert DSAMUS_CHARGE, "moveset/DSAMUS_CHARGE.bin"
    insert DSAMUS_CHARGELOOP, "moveset/DSAMUS_CHARGELOOP.bin"; Moveset.GO_TO(DSAMUS_CHARGELOOP) // loops
    insert YLINK_NSP,"moveset/YLINK_NSP.bin"
    insert WARIO_NSP_TRAIL,"moveset/WARIO_NSP_TRAIL.bin"
    WARIO_NSP_GROUND:; Moveset.CONCURRENT_STREAM(WARIO_NSP_TRAIL); insert "moveset/WARIO_NSP_GROUND.bin"
    WARIO_NSP_AIR:; Moveset.CONCURRENT_STREAM(WARIO_NSP_TRAIL); insert "moveset/WARIO_NSP_AIR.bin"
    insert WARIO_NSP_RECOIL,"moveset/WARIO_NSP_RECOIL.bin"
    insert FALCO_NSP_GROUND,"moveset/FALCO_NSP_GROUND.bin"
    insert FALCO_NSP_AIR,"moveset/FALCO_NSP_AIR.bin"
    insert BOWSER_NSP,"moveset/BOWSER_NSP.bin"
    insert PIANO_NSP,"moveset/PIANO_NSP.bin"
    insert WOLF_NSP_GROUND,"moveset/WOLF_NSP_GROUND.bin"
    insert WOLF_NSP_AIR,"moveset/WOLF_NSP_AIR.bin"
    insert CONKER_NSP_BEGIN,"moveset/CONKER_NSP2_BEGIN.bin"
    insert CONKER_NSP_WAIT,"moveset/CONKER_NSP2_WAIT.bin"
    insert CONKER_NSP_WAIT_LOOP,"moveset/CONKER_NSP2_WAIT_LOOP.bin"; Moveset.GO_TO(CONKER_NSP_WAIT_LOOP) // loops
    insert CONKER_NSP_END,"moveset/CONKER_NSP2_END.bin"
    insert MTWO_NSPG_BEGIN,"moveset/MTWO_NSPG_BEGIN.bin"
    insert MTWO_NSPG_CHARGE, "moveset/MTWO_NSPG_CHARGE.bin"
    insert MTWO_NSP_CHARGE_LOOP, "moveset/MTWO_NSP_CHARGE_LOOP.bin"; Moveset.GO_TO(MTWO_NSP_CHARGE_LOOP) // loops
    insert MTWO_NSPA_CHARGE, "moveset/MTWO_NSPA_CHARGE.bin"; Moveset.GO_TO(MTWO_NSP_CHARGE_LOOP) // go to loop
    insert MTWO_NSPG_SHOOT,"moveset/MTWO_NSPG_SHOOT.bin"
    insert MTWO_NSPA_BEGIN,"moveset/MTWO_NSPA_BEGIN.bin"
    insert MTWO_NSPA_SHOOT,"moveset/MTWO_NSPA_SHOOT.bin"
    insert MARTH_NSP_1,"moveset/MARTH_NSP_1.bin"
    insert MARTH_NSP_2_HIGH,"moveset/MARTH_NSP_2_HIGH.bin"
    insert MARTH_NSP_2,"moveset/MARTH_NSP_2.bin"
    insert MARTH_NSP_2_LOW,"moveset/MARTH_NSP_2_LOW.bin"
    insert MARTH_NSP_3_HIGH,"moveset/MARTH_NSP_3_HIGH.bin"
    insert MARTH_NSP_3,"moveset/MARTH_NSP_3.bin"
    insert MARTH_NSP_3_LOW,"moveset/MARTH_NSP_3_LOW.bin"

    // Add Action Parameters                // Action Name       // Base Action // Animation                    // Moveset Data         // Flags
    Character.add_new_action_params(KIRBY,  GND_NSP_Ground,             0x127,  -1,                             GND_NSP_GROUND,         -1)
    Character.add_new_action_params(KIRBY,  GND_NSP_Air,                0x128,  -1,                             GND_NSP_AIR,            -1)
    Character.add_new_action_params(KIRBY,  DRM_NSP_Ground,             0xE7,   -1,                             DRM_NSP_GROUND,         -1)
    Character.add_new_action_params(KIRBY,  DRM_NSP_Air,                0xE8,   -1,                             DRM_NSP_AIR,            -1)
    Character.add_new_action_params(KIRBY,  DSAMUS_Charge,              0xEE,   -1,                             DSAMUS_CHARGE,          -1)
    Character.add_new_action_params(KIRBY,  YLINK_NSP_Ground,           0x11F,  -1,                             YLINK_NSP,              -1)
    Character.add_new_action_params(KIRBY,  YLINK_NSP_Air,              0x122,  -1,                             YLINK_NSP,              -1)
    Character.add_new_action_params(KIRBY,  LUCAS_NSP_Ground,           0xFE,   File.KIRBY_LUCAS_NSP_G,         -1,                     0x40000000)
    Character.add_new_action_params(KIRBY,  LUCAS_NSP_Air,              0xFF,   File.KIRBY_LUCAS_NSP_A,         -1,                     0x00000000)
    Character.add_new_action_params(KIRBY,  WARIO_NSP_Ground,           -1,     File.KIRBY_WARIO_NSP_G,         WARIO_NSP_GROUND,       0)
    Character.add_new_action_params(KIRBY,  WARIO_NSP_Air,              -1,     File.KIRBY_WARIO_NSP_A,         WARIO_NSP_AIR,          0)
    Character.add_new_action_params(KIRBY,  WARIO_NSP_Recoil_Ground,     -1,    File.KIRBY_WARIO_NSPR_G,        WARIO_NSP_RECOIL,       0)
    Character.add_new_action_params(KIRBY,  WARIO_NSP_Recoil_Air,        -1,    File.KIRBY_WARIO_NSPR_A,        WARIO_NSP_RECOIL,       0)
    Character.add_new_action_params(KIRBY,  FALCO_NSP_Ground,           0xEB,   File.KIRBY_FALCO_NSP_G,         FALCO_NSP_GROUND,       0)
    Character.add_new_action_params(KIRBY,  FALCO_NSP_Air,              0xEC,   File.KIRBY_FALCO_NSP_A,         FALCO_NSP_AIR,          0)
    Character.add_new_action_params(KIRBY,  BOWSER_NSP_Ground,          0x129,  File.KIRBY_BOWSER_NSP,          BOWSER_NSP,             0x1D000000)
    Character.add_new_action_params(KIRBY,  BOWSER_NSP_Air,             0x12C,  File.KIRBY_BOWSER_NSP,          BOWSER_NSP,             0x1D000000)
    Character.add_new_action_params(KIRBY,  PIANO_NSP_Ground,           0xE7,   File.KIRBY_PIANO_NSP_G,         PIANO_NSP,              0x1C000000)
    Character.add_new_action_params(KIRBY,  PIANO_NSP_Air,              0xE8,   File.KIRBY_PIANO_NSP_A,         PIANO_NSP,              0x1C000000)
    Character.add_new_action_params(KIRBY,  WOLF_NSP_Ground,            0xE7,   File.KIRBY_WOLF_NSP_G,          WOLF_NSP_GROUND,        -1)
    Character.add_new_action_params(KIRBY,  WOLF_NSP_Air,               0xE8,   File.KIRBY_WOLF_NSP_A,          WOLF_NSP_AIR,           -1)
    Character.add_new_action_params(KIRBY,  CONKER_NSP_Ground_Begin,    -1,     File.KIRBY_CONKER_NSPG_BEGIN,   CONKER_NSP_BEGIN,       0)
    Character.add_new_action_params(KIRBY,  CONKER_NSP_Ground_Wait,     -1,     File.KIRBY_CONKER_NSPG_WAIT,    CONKER_NSP_WAIT,        0)
    Character.add_new_action_params(KIRBY,  CONKER_NSP_Ground_End,      -1,     File.KIRBY_CONKER_NSPG_END,     CONKER_NSP_END,         0)
    Character.add_new_action_params(KIRBY,  CONKER_NSP_Air_Begin,       -1,     File.KIRBY_CONKER_NSPA_BEGIN,   CONKER_NSP_BEGIN,       0)
    Character.add_new_action_params(KIRBY,  CONKER_NSP_Air_Wait,        -1,     File.KIRBY_CONKER_NSPA_WAIT,    CONKER_NSP_WAIT,        0)
    Character.add_new_action_params(KIRBY,  CONKER_NSP_Air_End,         -1,     File.KIRBY_CONKER_NSPA_END,     CONKER_NSP_END,         0)
    Character.add_new_action_params(KIRBY,  MTWO_NSP_Ground_Begin,      -1,     File.KIRBY_MTWO_NSPG_BEGIN,     MTWO_NSPG_BEGIN,        0x10000000)
    Character.add_new_action_params(KIRBY,  MTWO_NSP_Ground_Charge,     -1,     File.KIRBY_MTWO_NSPG_CHARGE,    MTWO_NSPG_CHARGE,       0x10000000)
    Character.add_new_action_params(KIRBY,  MTWO_NSP_Ground_Shoot,      -1,     File.KIRBY_MTWO_NSPG_SHOOT,     MTWO_NSPG_SHOOT,        0x10000000)
    Character.add_new_action_params(KIRBY,  MTWO_NSP_Air_Begin,         -1,     File.KIRBY_MTWO_NSPA_BEGIN,     MTWO_NSPA_BEGIN,        0x10000000)
    Character.add_new_action_params(KIRBY,  MTWO_NSP_Air_Charge,        -1,     File.KIRBY_MTWO_NSPA_CHARGE,    MTWO_NSPA_CHARGE,       0x10000000)
    Character.add_new_action_params(KIRBY,  MTWO_NSP_Air_Shoot,         -1,     File.KIRBY_MTWO_NSPA_SHOOT,     MTWO_NSPA_SHOOT,        0x10000000)
    Character.add_new_action_params(KIRBY,  MARTH_NSPG_1,               -1,     File.KIRBY_MARTH_NSPG_1,        MARTH_NSP_1,            0)
    Character.add_new_action_params(KIRBY,  MARTH_NSPG_2_High,          -1,     File.KIRBY_MARTH_NSPG_2_HI,     MARTH_NSP_2_HIGH,       0)
    Character.add_new_action_params(KIRBY,  MARTH_NSPG_2_Mid,           -1,     File.KIRBY_MARTH_NSPG_2,        MARTH_NSP_2,            0)
    Character.add_new_action_params(KIRBY,  MARTH_NSPG_2_Low,           -1,     File.KIRBY_MARTH_NSPG_2_LO,     MARTH_NSP_2_LOW,        0)
    Character.add_new_action_params(KIRBY,  MARTH_NSPG_3_High,          -1,     File.KIRBY_MARTH_NSPG_3_HI,     MARTH_NSP_3_HIGH,       0x40000000)
    Character.add_new_action_params(KIRBY,  MARTH_NSPG_3_Mid,           -1,     File.KIRBY_MARTH_NSPG_3,        MARTH_NSP_3,            0x40000000)
    Character.add_new_action_params(KIRBY,  MARTH_NSPG_3_Low,           -1,     File.KIRBY_MARTH_NSPG_3_LO,     MARTH_NSP_3_LOW,        0x40000000)
    Character.add_new_action_params(KIRBY,  MARTH_NSPA_1,               -1,     File.KIRBY_MARTH_NSPA_1,        MARTH_NSP_1,            0)
    Character.add_new_action_params(KIRBY,  MARTH_NSPA_2_High,          -1,     File.KIRBY_MARTH_NSPA_2_HI,     MARTH_NSP_2_HIGH,       0)
    Character.add_new_action_params(KIRBY,  MARTH_NSPA_2_Mid,           -1,     File.KIRBY_MARTH_NSPA_2,        MARTH_NSP_2,            0)
    Character.add_new_action_params(KIRBY,  MARTH_NSPA_2_Low,           -1,     File.KIRBY_MARTH_NSPA_2_LO,     MARTH_NSP_2_LOW,        0)
    Character.add_new_action_params(KIRBY,  MARTH_NSPA_3_High,          -1,     File.KIRBY_MARTH_NSPA_3_HI,     MARTH_NSP_3_HIGH,       0)
    Character.add_new_action_params(KIRBY,  MARTH_NSPA_3_Mid,           -1,     File.KIRBY_MARTH_NSPA_3,        MARTH_NSP_3,            0)
    Character.add_new_action_params(KIRBY,  MARTH_NSPA_3_Low,           -1,     File.KIRBY_MARTH_NSPA_3_LO,     MARTH_NSP_3_LOW,        0)


    // Add Actions                  // Action Name       // Base Action //Parameters                       // Staling ID    // Main ASM                 // Interrupt/Other ASM              // Movement/Physics ASM     // Collision ASM
    Character.add_new_action(KIRBY, GND_NSP_Ground,             0x127,  ActionParams.GND_NSP_Ground,            -1,         -1,                         -1,                                 -1,                         -1)
    Character.add_new_action(KIRBY, GND_NSP_Air,                0x128,  ActionParams.GND_NSP_Air,               -1,         -1,                         -1,                                 -1,                         -1)
    Character.add_new_action(KIRBY, DRM_NSP_Ground,             0xE7,   ActionParams.DRM_NSP_Ground,            -1,         -1,                         -1,                                 -1,                         -1)
    Character.add_new_action(KIRBY, DRM_NSP_Air,                0xE8,   ActionParams.DRM_NSP_Air,               -1,         -1,                         -1,                                 -1,                         -1)
    Character.add_new_action(KIRBY, DSAMUS_Charge,              0xEE,   ActionParams.DSAMUS_Charge,             -1,         -1,                         -1,                                 -1,                         -1)
    Character.add_new_action(KIRBY, YLINK_NSP_Ground,           0x11F,  ActionParams.YLINK_NSP_Ground,          -1,         -1,                         -1,                                 -1,                         -1)
    Character.add_new_action(KIRBY, YLINK_NSP_Air,              0x122,  ActionParams.YLINK_NSP_Air,             -1,         -1,                         -1,                                 -1,                         -1)
    Character.add_new_action(KIRBY, LUCAS_NSP_Ground,           0xFE,   ActionParams.LUCAS_NSP_Ground,          -1,         -1,                         -1,                                 0x800D8CCC,                 -1)
    Character.add_new_action(KIRBY, LUCAS_NSP_Air,              0xFF,   ActionParams.LUCAS_NSP_Air,             -1,         -1,                         LucasNSP.air_move_,                 -1,                         -1)
    Character.add_new_action(KIRBY, WARIO_NSP_Ground,           -1,     ActionParams.WARIO_NSP_Ground,          0x12,       0x800D94C4,                 WarioNSP.ground_move_,              WarioNSP.ground_physics_,   WarioNSP.ground_collision_)
    Character.add_new_action(KIRBY, WARIO_NSP_Air,              -1,     ActionParams.WARIO_NSP_Air,             0x12,       0x800D94E8,                 WarioNSP.air_move_,                 WarioNSP.air_physics_,      WarioNSP.air_collision_)
    Character.add_new_action(KIRBY, WARIO_NSP_Recoil_Ground,    -1,     ActionParams.WARIO_NSP_Recoil_Ground,   0x12,       0x800D94C4,                 0,                                  0x800D8BB4,                 WarioNSP.recoil_ground_collision_)
    Character.add_new_action(KIRBY, WARIO_NSP_Recoil_Air,       -1,     ActionParams.WARIO_NSP_Recoil_Air,      0x12,       0x800D94E8,                 WarioNSP.recoil_move_,              WarioNSP.recoil_physics_,   WarioNSP.recoil_air_collision_)
    Character.add_new_action(KIRBY, FALCO_NSP_Ground,           0xEB,   ActionParams.FALCO_NSP_Ground,          -1,         0x800D94C4,                 Phantasm.ground_subroutine_,        -1,                         -1)
    Character.add_new_action(KIRBY, FALCO_NSP_Air,              0xEC,   ActionParams.FALCO_NSP_Air,             -1,         0x8015C750,                 Phantasm.air_subroutine_,           Phantasm.air_physics_,      Phantasm.air_collision_)
    Character.add_new_action(KIRBY, BOWSER_NSP_Ground,          0x129,  ActionParams.BOWSER_NSP_Ground,         -1,         BowserNSP.main_,            -1,                                 0x800D8BB4,                 0x800DDF44)
    Character.add_new_action(KIRBY, BOWSER_NSP_Air,             0x12C,  ActionParams.BOWSER_NSP_Air,            -1,         BowserNSP.main_,            -1,                                 0x800D91EC,                 BowserNSP.air_collision_)
    Character.add_new_action(KIRBY, PIANO_NSP_Ground,           0xE7,   ActionParams.PIANO_NSP_Ground,          -1,         -1,                         -1,                                 -1,                         -1)
    Character.add_new_action(KIRBY, PIANO_NSP_Air,              0xE8,   ActionParams.PIANO_NSP_Air,             -1,         -1,                         -1,                                 0x800D91EC,                 -1)
    Character.add_new_action(KIRBY, WOLF_NSP_Ground,            0xEB,   ActionParams.WOLF_NSP_Ground,           -1,         WolfNSP.main,               -1,                                 -1,                         -1)
    Character.add_new_action(KIRBY, WOLF_NSP_Air,               0xEC,   ActionParams.WOLF_NSP_Air,              -1,         WolfNSP.main,               -1,                                 -1,                         WolfNSP.air_collision_)
    Character.add_new_action(KIRBY, CONKER_NSP_Ground_Begin,    -1,     ActionParams.CONKER_NSP_Ground_Begin,   0x12,       ConkerNSP.ground_begin_main_, 0,                                0x800D8BB4,                 ConkerNSP.ground_collision_)
    Character.add_new_action(KIRBY, CONKER_NSP_Ground_Wait,     -1,     ActionParams.CONKER_NSP_Ground_Wait,    0x12,       ConkerNSP.ground_wait_main_,  0,                                0x800D8BB4,                 ConkerNSP.ground_collision_)
    Character.add_new_action(KIRBY, CONKER_NSP_Ground_End,      -1,     ActionParams.CONKER_NSP_Ground_End,     0x12,       ConkerNSP.end_main_,          0,                                0x800D8BB4,                 ConkerNSP.ground_collision_)
    Character.add_new_action(KIRBY, CONKER_NSP_Air_Begin,       -1,     ActionParams.CONKER_NSP_Air_Begin,      0x12,       ConkerNSP.air_begin_main_,    0,                                0x800D90E0,                 ConkerNSP.air_collision_)
    Character.add_new_action(KIRBY, CONKER_NSP_Air_Wait,        -1,     ActionParams.CONKER_NSP_Air_Wait,       0x12,       ConkerNSP.air_wait_main_,     0,                                0x800D90E0,                 ConkerNSP.air_collision_)
    Character.add_new_action(KIRBY, CONKER_NSP_Air_End,         -1,     ActionParams.CONKER_NSP_Air_End,        0x12,       ConkerNSP.end_main_,          0,                                0x800D90E0,                 ConkerNSP.air_collision_end_)
    Character.add_new_action(KIRBY, MTWO_NSP_Ground_Begin,      -1,     ActionParams.MTWO_NSP_Ground_Begin,     0x12,       MewtwoNSP.begin_main_,        0x8015D464,                         0x800D8BB4,               MewtwoNSP.kirby_ground_begin_collision_)
    Character.add_new_action(KIRBY, MTWO_NSP_Ground_Charge,     -1,     ActionParams.MTWO_NSP_Ground_Charge,    0x12,       MewtwoNSP.kirby_charge_main_, MewtwoNSP.ground_charge_interrupt_, 0x800D8BB4,               MewtwoNSP.kirby_ground_charge_collision_)
    Character.add_new_action(KIRBY, MTWO_NSP_Ground_Shoot,      -1,     ActionParams.MTWO_NSP_Ground_Shoot,     0x12,       MewtwoNSP.kirby_shoot_main_,  0,                                  0x800D8BB4,               MewtwoNSP.kirby_ground_shoot_collision_)
    Character.add_new_action(KIRBY, MTWO_NSP_Air_Begin,         -1,     ActionParams.MTWO_NSP_Air_Begin,        0x12,       MewtwoNSP.begin_main_,        0x8015D464,                         0x800D90E0,               MewtwoNSP.air_begin_collision_)
    Character.add_new_action(KIRBY, MTWO_NSP_Air_Charge,        -1,     ActionParams.MTWO_NSP_Air_Charge,       0x12,       MewtwoNSP.kirby_charge_main_, MewtwoNSP.air_charge_interrupt_,    0x800D91EC,               MewtwoNSP.air_charge_collision_)
    Character.add_new_action(KIRBY, MTWO_NSP_Air_Shoot,         -1,     ActionParams.MTWO_NSP_Air_Shoot,        0x12,       MewtwoNSP.kirby_shoot_main_,  0,                                  0x800D91EC,               MewtwoNSP.air_shoot_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPG_1,               -1,     ActionParams.MARTH_NSPG_1,              0x12,       MarthNSP.ground_main_,      0,                                  0x800D8CCC,                 MarthNSP.kirby_ground_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPG_2_High,          -1,     ActionParams.MARTH_NSPG_2_High,         0x12,       MarthNSP.ground_main_,      0,                                  0x800D8CCC,                 MarthNSP.kirby_ground_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPG_2_Mid,           -1,     ActionParams.MARTH_NSPG_2_Mid,          0x12,       MarthNSP.ground_main_,      0,                                  0x800D8CCC,                 MarthNSP.kirby_ground_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPG_2_Low,           -1,     ActionParams.MARTH_NSPG_2_Low,          0x12,       MarthNSP.ground_main_,      0,                                  0x800D8CCC,                 MarthNSP.kirby_ground_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPG_3_High,          -1,     ActionParams.MARTH_NSPG_3_High,         0x12,       MarthNSP.ground_main_,      0,                                  0x800D8CCC,                 MarthNSP.kirby_ground_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPG_3_Mid,           -1,     ActionParams.MARTH_NSPG_3_Mid,          0x12,       MarthNSP.ground_main_,      0,                                  0x800D8CCC,                 MarthNSP.kirby_ground_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPG_3_Low,           -1,     ActionParams.MARTH_NSPG_3_Low,          0x12,       MarthNSP.ground_main_,      0,                                  0x800D8CCC,                 MarthNSP.kirby_ground_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPA_1,               -1,     ActionParams.MARTH_NSPA_1,              0x12,       MarthNSP.air_main_,         0,                                  0x800D91EC,                 MarthNSP.air_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPA_2_High,          -1,     ActionParams.MARTH_NSPA_2_High,         0x12,       MarthNSP.air_main_,         0,                                  0x800D91EC,                 MarthNSP.air_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPA_2_Mid,           -1,     ActionParams.MARTH_NSPA_2_Mid,          0x12,       MarthNSP.air_main_,         0,                                  0x800D91EC,                 MarthNSP.air_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPA_2_Low,           -1,     ActionParams.MARTH_NSPA_2_Low,          0x12,       MarthNSP.air_main_,         0,                                  0x800D91EC,                 MarthNSP.air_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPA_3_High,          -1,     ActionParams.MARTH_NSPA_3_High,         0x12,       MarthNSP.air_main_,         0,                                  0x800D91EC,                 MarthNSP.air_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPA_3_Mid,           -1,     ActionParams.MARTH_NSPA_3_Mid,          0x12,       MarthNSP.air_main_,         0,                                  0x800D91EC,                 MarthNSP.air_collision_)
    Character.add_new_action(KIRBY, MARTH_NSPA_3_Low,           -1,     ActionParams.MARTH_NSPA_3_Low,          0x12,       MarthNSP.air_main_,         0,                                  0x800D91EC,                 MarthNSP.air_collision_)


    Character.table_patch_start(kirby_ground_nsp, Character.id.WARIO, 0x4)
    dw      WarioNSP.ground_initial_
    OS.patch_end()
    Character.table_patch_start(kirby_air_nsp, Character.id.WARIO, 0x4)
    dw      WarioNSP.air_initial_
    OS.patch_end()

    Character.table_patch_start(kirby_ground_nsp, Character.id.BOWSER, 0x4)
    dw      BowserNSP.ground_initial_
    OS.patch_end()

    Character.table_patch_start(kirby_air_nsp, Character.id.BOWSER, 0x4)
    dw      BowserNSP.air_initial_
    OS.patch_end()

    Character.table_patch_start(kirby_ground_nsp, Character.id.CONKER, 0x4)
    dw      ConkerNSP.ground_begin_initial_
    OS.patch_end()
    Character.table_patch_start(kirby_air_nsp, Character.id.CONKER, 0x4)
    dw      ConkerNSP.air_begin_initial_
    OS.patch_end()

    Character.table_patch_start(kirby_ground_nsp, Character.id.MTWO, 0x4)
    dw      MewtwoNSP.ground_begin_initial_
    OS.patch_end()
    Character.table_patch_start(kirby_air_nsp, Character.id.MTWO, 0x4)
    dw      MewtwoNSP.air_begin_initial_
    OS.patch_end()

    Character.table_patch_start(kirby_ground_nsp, Character.id.MARTH, 0x4)
    dw      MarthNSP.ground_1_initial_
    OS.patch_end()
    Character.table_patch_start(kirby_air_nsp, Character.id.MARTH, 0x4)
    dw      MarthNSP.air_1_initial_
    OS.patch_end()

    //TODO: maybe move this asm to the shared file?

    // @ Description
    // Macro for clone_power_action_swap_, used to fill action blocks.
    macro clone_action(original, clone) {
        lli     t7, {original}              // t7 = original action id
        beql    t7, a1, _end                // end if current action = {original}
        lli     a1, {clone}                 // a1 = {clone} if branch is taken
    }

    // @ Description
    // Patch which overrides the action ID when Kirby uses a cloned version of a copied power (Ganondorf, Dr. Mario, etc.)
    scope clone_power_action_swap_: {
        OS.patch_start(0x62734, 0x800E6F34)
        j       clone_power_action_swap_
        sw      a0, 0x0090(sp)              // original line 1
        _return:
        OS.patch_end()

        // a1 contains the action ID we are changing to
        // s1, t8, t7, t0 are all safe
        lw      s1, 0x0084(a0)              // s1 = player struct
        lw      t7, 0x0008(s1)              // t7 = character id
        lli     t8, Character.id.KIRBY      // t8 = id.KIRBY
        beq     t7, t8, _kirby              // branch if character = KIRBY
        lli     t8, Character.id.JKIRBY     // t8 = id.JKIRBY
        bne     t7, t8, _end                // skip if character != JKIRBY
        nop

        _kirby:
        // this block will determine if Kirby has copied a character with cloned actions
        lw      t7, 0x0ADC(s1)              // t7 = character id of copied power
        lli     t8, Character.id.GND        // t8 = id.GND
        beq     t7, t8, _gnd_actions        // branch if copied power = GND
        lli     t8, Character.id.DRM        // t8 = id.DRM
        beq     t7, t8, _drm_actions        // branch if copied power = DRM
        lli     t8, Character.id.JMARIO     // t8 = id.JMARIO
        beq     t7, t8, _jmario_actions     // branch if copied power = JMARIO
        lli     t8, Character.id.DSAMUS     // t8 = id.DSAMUS
        beq     t7, t8, _dsamus_actions     // branch if copied power = DSAMUS
        lli     t8, Character.id.YLINK      // t8 = id.YLINK
        beq     t7, t8, _ylink_actions      // branch if copied power = YLINK
        lli     t8, Character.id.LUCAS      // t8 = id.LUCAS
        beq     t7, t8, _lucas_actions      // branch if copied power = LUCAS
        lli     t8, Character.id.FALCO      // t8 = id.FALCO
        beq     t7, t8, _falco_actions      // branch if copied power = FALCO
        lli     t8, Character.id.PIANO      // t8 = id.PIANO
        beq     t7, t8, _piano_actions      // branch if copied power = PIANO
        lli     t8, Character.id.WOLF       // t8 = id.WOLF
        beq     t7, t8, _wolf_actions       // branch if copied power = WOLF
        nop
        // add additional clone checks here
        // if we reach this point then Kirby isn't using a cloned power
        b       _end
        nop

        _gnd_actions:
        // this block contains action swaps for Ganondorf's power
        clone_action(0x127, Action.GND_NSP_Ground)
        clone_action(0x128, Action.GND_NSP_Air)
        // if we reach this point then Kirby is not initializing a cloned action
        b       _end
        nop

        _drm_actions:
        // this block contains action swaps for Dr. Mario's power
        clone_action(0xE9, Action.DRM_NSP_Ground)
        clone_action(0xEA, Action.DRM_NSP_Air)
        // if we reach this point then Kirby is not initializing a cloned action
        b       _end
        nop

        _jmario_actions:
        // this block contains action swaps for J Mario's power
        clone_action(0xE9, 0xE7)
        clone_action(0xEA, 0xE8)
        // if we reach this point then Kirby is not initializing a cloned action
        b       _end
        nop

        _dsamus_actions:
        // this block contains action swaps for Dark Samus's power
        clone_action(0xEE, Action.DSAMUS_Charge)
        // if we reach this point then Kirby is not initializing a cloned action
        b       _end
        nop

        _ylink_actions:
        // this block contains action swaps for Young Link's power
        clone_action(0x11F, Action.YLINK_NSP_Ground)
        clone_action(0x122, Action.YLINK_NSP_Air)
        // if we reach this point then Kirby is not initializing a cloned action
        b       _end
        nop

        _lucas_actions:
        // this block contains action swaps for Lucas's power
        clone_action(0xFE, Action.LUCAS_NSP_Ground)
        clone_action(0xFF, Action.LUCAS_NSP_Air)
        // if we reach this point then Kirby is not initializing a cloned action
        b       _end
        nop

        _falco_actions:
        // this block contains action swaps for Falco's power
        clone_action(0xEB, Action.FALCO_NSP_Ground)
        clone_action(0xEC, Action.FALCO_NSP_Air)
        // if we reach this point then Kirby is not initializing a cloned action
        b       _end
        nop

        _piano_actions:
        // this block contains action swaps for Piano's power
        clone_action(0xE9, Action.PIANO_NSP_Ground)
        clone_action(0xEA, Action.PIANO_NSP_Air)
        // if we reach this point then Kirby is not initializing a cloned action
        b       _end
        nop

        _wolf_actions:
        // this block contains action swaps for Wolf's power
        clone_action(0xEB, Action.WOLF_NSP_Ground)
        clone_action(0xEC, Action.WOLF_NSP_Air)
        // if we reach this point then Kirby is not initializing a cloned action
        b       _end
        nop

        _end:
        j       _return
        sw      a1, 0x0094(sp)              // original line 2
    }
    
    // Modify grounded routine for Kirby
    Character.table_patch_start(grounded_script, Character.id.KIRBY, 0x4)
    dw clear_marth_flag_
    OS.patch_end()
    
    // @ Description
    // Jump table patch for which clears the pseudo-jump flag if Kirby is using the Marth hat.
    scope clear_marth_flag_: {
        lw      t0, 0x0ADC(v0)              // t0 = character id of copied power
        lli     at, Character.id.MARTH      // at = id.MARTH
        beql    at, t0, _end                // branch if copied character is Marth...
        sw      r0, 0x0AE0(v0)              // ...and clear pseudo-jump flag
        
        _end:
        j       0x800DE44C                  // return
        nop
    }
}