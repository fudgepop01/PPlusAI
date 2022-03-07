// BASICS

#const true = 1
#const false = 0

// MOVE RANGE STUFF
#const DIRY_ABOVE = 10
#const DIRY_BELOW = 5
#const DIRX_FRONT = 5
#const DIRX_BACK = -3

// "PERSONALITY" traits
#const pt_braveChance = 0.65
#const pt_baitChance = 0.65
#const pt_aggression = 0.85
#const pt_wall_chance = 0.45
#const pt_circleCampChance = 0.45

#const pt_bait_dashAwayChance = 0.85
#const pt_bait_wdashAwayChance = 0.35
#const pt_jumpiness = 0.05
#const pt_djumpiness = 0.07
#const pt_platChance = 0.05
#const pt_SDIChance = 0.5
#const pt_reactionTimeMultiplier = 1

#const idx_aggression = 0
#const idx_bait_dashAwayChance = 1
#const idx_bait_wdashAwayChance = 2
#const idx_baitChance = 3
#const idx_braveChance = 4
#const idx_circleCampChance = 5
#const idx_djumpiness = 6
#const idx_jumpiness = 7
#const idx_platChance = 8
#const idx_SDIChance = 9
#const idx_wall_chance = 10
#const idx_reaction_time = 11


// #const cs_airdodge_speed = 3.1
#const cs_riskReactionBalance = 1.0
#const cs_airdodge_speed = 2.5

#const cs_dashForceTurnFrame = 8
#const cs_dashDanceMinFrames = 4
#const cs_shortHopHeight = 25.344
#const cs_djumpHeight = 39.514
#const cs_wavedashDist = 25
#const cs_recoveryDistY = -40
#const cs_recoveryDistX = 50

// used with common ai pac
#let chr_trait_select = var22
#let chr_trait_return = var22
#const chr_pt_jumpiness = 0
#const chr_pt_djumpiness = 1
#const chr_cs_riskReactionBalance = 2
#const chr_pt_aggression = 3
#const chr_pt_baitChance = 4
#const chr_pt_bait_dashAwayChance = 5
#const chr_pt_bait_wdashAwayChance = 6
#const chr_pt_wall_chance = 7
#const chr_pt_braveChance = 8
#const chr_pt_platChance = 9
#const chr_pt_circleCampChance = 10
#const chr_pt_SDIChance = 11
#const chr_cs_dashForceTurnFrame = 12
#const chr_cs_dashDanceMinFrames = 13
#const chr_cs_shortHopHeight = 14
#const chr_cs_djumpHeight = 15
#const chr_cs_wavedashDist = 16
#const chr_cs_recoveryDistX = 17
#const chr_cs_recoveryDistY = 18
#const chr_cs_moveData = 19
#const chr_calc_angleFix = 20
#const chr_calc_certainty = 21

#const chr_chk_isAerialAttack = 100
#const chr_chk_OInCombo = 200

#const chr_get_moveDir = 0.001
#const chr_get_moveDirY = 0.002
#const chr_get_OEndlag = 0.003
#const chr_get_OEndlagSafe = 0.004

#const evt_rangedHit = 10000
#const evt_chrChecks = 20000
#const evt_gotHit = 30000
#const evt_checkDefend = 40000

#const shortEdgeRange = 15

// for use with GetOptionChance
#const mov_idle = 1
#const mov_walk = 2
#const mov_run = 3
#const mov_dash = 4
#const mov_dashturn = 5
#const mov_crouch = 6
#const mov_jump = 7
#const mov_djump = 8
#const mov_fall = 9
#const mov_shield = 10
#const mov_airdodge = 11
#const mov_roll = 12
#const mov_tech = 13
#const mov_attack = 14
#const mov_grab = 15


// ATTRIBUTES
#const attr_walkInitVel = hex(0x18);
#const attr_walkAccel = hex(0x1c);
#const attr_walkMaxVel = hex(0x20);
#const attr_groundFriction = hex(0x24);
#const attr_dashInitVel = hex(0x28);
#const attr_dashRunAccA = hex(0x2c);
#const attr_dashRunAccB = hex(0x30);
#const attr_dashRunTermVel = hex(0x34);
#const attr_runAccel_maybe = hex(0x38);
#const attr_groundedMaxXVel = hex(0x3c);
#const attr_guardOnMaxMomentum = hex(0x40);
#const attr_jumpXInitVel = hex(0x44);
#const attr_jumpYInitVel = hex(0x48);
#const attr_jumpXVelGroundMult = hex(0x4c);
#const attr_jumpXInitTermVel = hex(0x50);
#const attr_jumpYInitVelShort = hex(0x54);
#const attr_airJumpYMult = hex(0x58);
#const attr_airJumpAdditionalHVel = hex(0x5c);
#const attr_footstoolInitVel = hex(0x60);
#const attr_footstoolInitVelShort = hex(0x64);
#const attr_footstoolCancelWindow = hex(0x68);
#const attr_meteorCancelDelay = hex(0x6c);
#const attr_gravity = hex(0x70);
#const attr_maxFallSpeed = hex(0x74);
#const attr_airFrictionY = hex(0x78);
#const attr_airYTermVel = hex(0x7c);
#const attr_airMobilityA = hex(0x80);
#const attr_airMobilityB = hex(0x84);
#const attr_airXTermVel = hex(0x88);
#const attr_airFrictionX = hex(0x8c);
#const attr_fastFallSpeed = hex(0x90);
#const attr_airXTermVelHard = hex(0x94);
// #const attr_unk_0x90 = hex(0x98);
#const attr_jab2Window = hex(0x9c);
#const attr_jab3Window = hex(0xa0);
#const attr_ftilt2Window = hex(0xa4);
#const attr_ftilt3Window = hex(0xa8);
#const attr_fsmash2Window = hex(0xac);
#const attr_flipDirFrame = hex(0xb0);
// #const attr_unk_0xac = hex(0xb4);
#const attr_weight = hex(0xb8);
#const attr_size = hex(0xbc);
#const attr_resultsScreenSize = hex(0xc0);
// #const attr_unk_0xbc = hex(0xc4);
// #const attr_unk_0xc0 = hex(0xc8);
#const attr_shieldSize = hex(0xcc);
#const attr_shieldBreakVel = hex(0xd0);
#const attr_shieldStrength = hex(0xd4);
// #const attr_unk_0xd0 = hex(0xd8);
#const attr_respawnPlatformSize = hex(0xdc);
// #const attr_unk_0xd8 = hex(0xe0);
// #const attr_unk_0xdc = hex(0xe4);
// #const attr_unk_0xe0 = hex(0xe8);
#const attr_edgeJumpXVel = hex(0xec);
// #const attr_unk_0xf0 = hex(0xf0);
// #const attr_unk_0xf4 = hex(0xf4);
// #const attr_unk_0xf8 = hex(0xf8);
// #const attr_unk_0xfc = hex(0xfc);
// #const attr_unk_0x100 = hex(0x100);
#const attr_itemThrowStrength = hex(0x104);
// #const attr_unk_0x108 = hex(0x108);
// #const attr_unk_0x10c = hex(0x10c);
// #const attr_unk_0x110 = hex(0x110);
#const attr_projectileItemMoveSpeed = hex(0x114);
#const attr_projectileItemMoveSpeedDashF = hex(0x118);
#const attr_projectileItemMoveSpeedDashB = hex(0x11c);
// #const attr_unk_0x120 = hex(0x120);
#const attr_lightLandingLag = hex(0x124);
#const attr_normalLandingLag = hex(0x128);
#const attr_nairLandingLag = hex(0x12c);
#const attr_fairLandingLag = hex(0x130);
#const attr_bairLandingLag = hex(0x134);
#const attr_uairLandingLag = hex(0x138);
#const attr_dairLandingLag = hex(0x13c);
#const attr_termVelHardFrames = hex(0x140);
#const attr_hipNBone = hex(0x144);
#const attr_tagHeightValue = hex(0x148);
// #const attr_unk_0x14c = hex(0x14c);
#const attr_walljumpXVel = hex(0x150);
#const attr_lhandNBone = hex(0x154);
#const attr_rhandNBone = hex(0x158);
// #const attr_unk_0x164 = hex(0x15c);
#const attr_waterYAcc = hex(0x160);
// #const attr_unk_0x16c = hex(0x164);
// #const attr_unk_0x170 = hex(0x168);
// #const attr_unk_0x178 = hex(0x16c);
// #const attr_unk_0x17c = hex(0x170);
#const attr_eggSize = hex(0x174);
// #const attr_unk_0x18c = hex(0x178);
// #const attr_unk_0x190 = hex(0x17c);
// #const attr_unk_0x194 = hex(0x180);
// #const attr_unk_0x198 = hex(0x184);
// #const attr_unk_0x19c = hex(0x188);
// #const attr_unk_0x1a0 = hex(0x18c);
// #const attr_unk_0x1a4 = hex(0x190);
// #const attr_unk_0x1ac = hex(0x194);
// #const attr_unk_0x1b0 = hex(0x198);
// #const attr_unk_0x1b4 = hex(0x19c);
// #const attr_unk_0x1b8 = hex(0x1a0);
#const attr_xRotNBone = hex(0x1a4);
// #const attr_unk_0x1c0 = hex(0x1a8);
// #const attr_unk_0x1c4 = hex(0x1ac);
// #const attr_unk_0x1c8 = hex(0x1b0);
// #const attr_unk_0x1d0 = hex(0x1b4);
#const attr_cameraInitialYOffset = hex(0x1b8);
#const attr_cameraSizeFront = hex(0x1bc);
#const attr_cameraSizeBack = hex(0x1c0);
#const attr_cameraSizeBottom = hex(0x1c4);
// #const attr_unk_0x1e8 = hex(0x1c8);
#const attr_zoomCameraSizeFront = hex(0x1cc);
#const attr_zoomCameraSizeBack = hex(0x1d0);
#const attr_zoomCameraSizeTop = hex(0x1d4);
// #const attr_unk_0x288 = hex(0x1d8);
// #const attr_unk_0x298 = hex(0x1dc);
// char _spacer2[0x3a8 - hex(0x1e00x1e0);
#const attr_dashCancelFrameWindow = hex(0x3a8);
#const attr_jumpSquatFrames = hex(0x3ac);
#const attr_numJumps = hex(0x3b0);
#const attr_glideFrameWindow = hex(0x3b4);
#const attr_edgeJumpYVel = hex(0x3b8);
// #const attr_unk_0xec = hex(0x3bc);
#const attr_walljumpYVel = hex(0x3c0);
// #const attr_unk_0x158 = hex(0x3c4);
// #const attr_unk_0x174 = hex(0x3c8);
#const attr_spitStarSize = hex(0x3cc);
#const attr_spitStarDamage = hex(0x3d0);
#const attr_hipNBone2 = hex(0x3d4);
// #const attr_unk_0x1cc = hex(0x3d8);
#const attr_cameraSizeTop = hex(0x3dc);
// #const attr_unk_0x28c = hex(0x3e0);
// #const attr_unk_0x290 = hex(0x3e4);
// #const attr_unk_0x294 = hex(0x3e8);
// #const attr_unk_0x29c = hex(0x3ec);

#const OAttackCond = OCurrAction >= hex(0x24) && OCurrAction <= hex(0x34)

// ACTION CATEGORIES N' STUFF
#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115)

// global temporary variables
#let globTempVar = var17
#let immediateTempVar = var22
// THIS IS TO BE USED IMMEDIATELY WITH SIMPLE OPERATIONS OTHERWISE SIDE EFFECTS MAY OCCUR
#let anotherTempVar = var23


// until then, these variables are free for use in general movement
#let goalX = var13
#let goalY = var14

// used when a move has been chosen for execution
// #let move_angle = var15
// #let move_xOffset = var10
// #let move_yOffset = var11
// #let move_xRange = var12
// #let move_yRange = var13
// #let move_lastHitFrame = var14
// #let move_hitFrame = var15
// #let move_IASA = var16

// used to tell the AI to skip the initialization of a new
// goal when moving to mainHub
#let skipMainInit = var15
#const mainInitSkip = -1
#const sm_execAttack = -2


// recorded after the move is executed / hits;
// will not interfere with move position type
#let scriptVariant = var16
#const sv_none = 0

#const sv_wavedash_in = 1
#const sv_wavedash_out = 2
#const sv_wavedash_neutral = 3
#const sv_wavedash_awayFromLedge = 4
#const sv_wavedash_goal = 5

#const sv_jump_over = 1
#const sv_jump_neutral = 2
#const sv_jump_away = 3
#const svp_jump_fullhop = 0.1

#const sv_roll_through = 1
#const sv_roll_away = 2
#const sv_roll_toCenter = 3

#const sv_dash_towards = 1
#const sv_dash_away = 2
#const sv_dash_away_defense = 3
#const sv_dash_toCenter = 4
#const sv_dash_through = 5

#const sv_aerialdrift_towards = 1
#const sv_aerialdrift_away = 2

#const sv_attackgoal_justy = 1
#const sv_attackgoal_justx = 2
#const sv_attackgoal_self = 3

#const sv_checkHit = 1

#const sv_execute_fastfall = 1
#const sv_execute_willhit = 2

// dice slots
#const dslot0 = 0
#const dslot1 = 1

// what variation of the move to use. Important when a move
// has multiple or complex uses (such as grab)
#let moveVariant = var19
// used in many places to store what the last attack was.
// must be set manually.
#let lastAttack = var20

// #goals
#let currGoal = var21
#const cg_nothing = 0
#const cg_runAway = 1
#const cg_recover = 3
#const cg_combo = 4
#const cg_circleCamp = 7
#const cg_camp_attack = 7.1
#const cg_avoidAttack = 8
#const cg_returnToCenter = 9
#const cg_bait = 10
#const cg_bait_attack = 10.1
#const cg_bait_shield = 10.2
#const cg_bait_center = 10.3
#const cg_bait_wait = 10.4
#const cg_bait_dashdance = 10.5
#const cg_bait_dashawayWhenApproached = 10.6
#const cg_string = 11
#const cg_inHitstun = 12
#const cg_defend = 13
#const cg_special = 14
#const cg_ledge = 15
#const cg_ledge_edgeguard = 15.1
#const cg_attack = 16
#const cg_attack_overshoot = 16.1
#const cg_attack_undershoot = 16.2
#const cg_attack_wall = 16.3
#const cg_attack_reversal = 16.4
#const cg_attack_shieldPunish = 16.5
#const cg_attack_crossup = 16.6
#const cg_edgeguard = 16.7
#const cg_edgeguard_ledge = 16.8
#const cg_recover_reversal = 16.9
#const cg_lying = 17

#const techRollVulFrame = 22

#const valJab123 = hex(0x6031)
#const valFTilt = hex(0x6032)
#const valUTilt = hex(0x6033)
#const valDTilt = hex(0x6034)
#const valFSmash = hex(0x6035)
#const valUSmash = hex(0x6036)
#const valDSmash = hex(0x6037)
#const valNSpecial = hex(0x6038)
#const valSSpecial = hex(0x6039)
#const valUSpecial = hex(0x603A)
#const valDSpecial = hex(0x603B)
#const valGrab = hex(0x603C)
#const valDashAttack = hex(0x603D)

#const valNAir = hex(0x6041)
#const valFAir = hex(0x6042)
#const valBAir = hex(0x6043)
#const valUAir = hex(0x6044)
#const valDAir = hex(0x6045)
#const valNSpecialAir = hex(0x6046)
#const valSSpecialAir = hex(0x6047)
#const valUSpecialAir = hex(0x6048)
#const valDSpecialAir = hex(0x6049)

#const valGeneral = 25000
#const valShield = 25001
#const valOffensiveShield = 25002
#const valJumpOver = 25003

#const gen_xOffset = -35
#const gen_yOffset = 35
#const gen_xRange = 35
#const gen_yRange = 35
#const gen_hitFrame = 10
#const gen_lastHitFrame = 10
#const gen_IASA = 1

#let noCombo = var19
#const noComboVal = 256

// AI "mode" values
#const md_attack = 1
#const md_defend = 2

// AI taunt values
#const utaunt = 1
#const staunt = 2
#const dtaunt = 3

// AI Tracker Values (0-15)

#const man_OFramesPostHitstun = 4
#const man_ODIAngle = 5
#const man_OApproachPatterns = 6
#const man_ODefendOption = 7
#const man_OBaitDirection = 8
#const man_OBaitOption = 9
#const man_OXHitDist = 10
#const man_OXAttackDist = 11
#const man_OGetupOption = 12
#const man_OTechOption = 13
#const man_OOOSOption = 14
#const man_OOutOfHitstun = 15

#const op_DI_in = 1
#const op_DI_neutral = 2
#const op_DI_out = 3

#const op_null = 0
#const op_attack = 1
#const op_defend = 2
#const op_grab = 3

#const op_hitstun_jump = 1
#const op_hitstun_attack = 2
#const op_hitstun_fall = 3

#const op_OOOS_WD = 1
#const op_OOOS_attack = 2
#const op_OOOS_grab = 3

#const op_tech_in = 1
#const op_tech_neutral = 2
#const op_tech_out = 3

#const op_getup_in = 1
#const op_getup_attack = 2
#const op_getup_out = 3

#const op_angle_in = 1
#const op_angle_none = 2
#const op_angle_out = 3

#const op_bait_move = 1
#const op_bait_attack = 2
#const op_bait_shield = 3

#const op_defend_attack = 1
#const op_defend_grab = 2
#const op_defend_shield = 3

#const op_baitdir_neutral = 1
#const op_baitdir_overshoot = 2
#const op_baitdir_undershoot = 3

#const op_attack_close = 1
#const op_attack_mid = 2
#const op_attack_far = 3

#const op_approach_runaway = 1
#const op_approach_neutral = 2
#const op_approach_attacking = 3

// situation types
#const st_floor = 1
#const st_offstage = 2
#const st_disadv_above_plat = 3
#const st_disadv_below_plat = 4
#const st_disadv_no_plat = 5
#const st_plat_high_camp = 6
#const st_plat_high_reg = 7
#const st_plat_reg_camp = 8
#const st_plat_reg_reg = 9
#const st_below_plat = 10
#const st_between_plat = 11

// AI values
#const LV1 = 0
#const LV2 = 15
#const LV3 = 21
#const LV4 = 31
#const LV5 = 42
#const LV6 = 48
#const LV7 = 60
#const LV8 = 75
#const LV9 = 100
#const LV10 = 101

// this works because it's used exclusively in 1.as and aerial attacks
// where it's used IMMEDIATELY before being modified
#let shouldFastFall = var2

#const mv_fthrow = 2
#const mv_dthrow = 3
#const mv_bthrow = 4
#const mv_uthrow = 5

// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

// basic placeholder move values

#const jab123_IASA = 0
#const jab123_xOffset = 0
#const jab123_yOffset = 0
#const jab123_xRange = 0
#const jab123_yRange = 0
#const jab123_hitFrame = 0
#const jab123_lastHitFrame = 0

// dashattack
#const DA_IASA = 0
#const DA_xOffset = 0
#const DA_yOffset = 0
#const DA_xRange = 0
#const DA_yRange = 0
#const DA_hitFrame = 0
#const DA_lastHitFrame = 0

// ftilt
#const ftilt_IASA = 0
#const ftilt_xOffset = 0
#const ftilt_yOffset = 0
#const ftilt_xRange = 0
#const ftilt_yRange = 0
#const ftilt_hitFrame = 0
#const ftilt_lastHitFrame = 0

// utilt
#const utilt_IASA = 0
#const utilt_xOffset = 0
#const utilt_yOffset = 0
#const utilt_xRange = 0
#const utilt_yRange = 0
#const utilt_hitFrame = 0
#const utilt_lastHitFrame = 0

// dtilt
#const dtilt_IASA = 0
#const dtilt_xOffset = 0
#const dtilt_yOffset = 0
#const dtilt_xRange = 0
#const dtilt_yRange = 0
#const dtilt_hitFrame = 0
#const dtilt_lastHitFrame = 0

// fsmash
#const fsmash_IASA = 0
#const fsmash_xOffset = 0
#const fsmash_yOffset = 0
#const fsmash_xRange = 0
#const fsmash_yRange = 0
#const fsmash_hitFrame = 0
#const fsmash_lastHitFrame = 0

// usmash
#const usmash_IASA = 0
#const usmash_xOffset = 0
#const usmash_yOffset = 0
#const usmash_xRange = 0
#const usmash_yRange = 0
#const usmash_hitFrame = 0
#const usmash_lastHitFrame = 0

// dsmash
#const dsmash_IASA = 0
#const dsmash_xOffset = 0
#const dsmash_yOffset = 0
#const dsmash_xRange = 0
#const dsmash_yRange = 0
#const dsmash_hitFrame = 0
#const dsmash_lastHitFrame = 0

// noochB
#const nspecial_IASA = 0
#const nspecial_xOffset = 0
#const nspecial_yOffset = 0
#const nspecial_xRange = 0
#const nspecial_yRange = 0
#const nspecial_hitFrame = 0
#const nspecial_lastHitFrame = 0

#const nspecial_start_xRange = 0
#const nspecial_start_yRange = 0
#const nspecial_start_yOffset = 0

// sideB
#const sspecial_IASA = 0
#const sspecial_xOffset = 0
#const sspecial_yOffset = 0
#const sspecial_xRange = 0
#const sspecial_yRange = 0
#const sspecial_hitFrame = 0
#const sspecial_lastHitFrame = 0

// upB
#const uspecial_IASA = 0
#const uspecial_xOffset = 0
#const uspecial_yOffset = 0
#const uspecial_xRange = 0
#const uspecial_yRange = 0
#const uspecial_hitFrame = 0
#const uspecial_lastHitFrame = 0

// downB
#const dspecial_IASA = 0
#const dspecial_xOffset = 0
#const dspecial_yOffset = 0
#const dspecial_xRange = 0
#const dspecial_yRange = 0
#const dspecial_hitFrame = 0
#const dspecial_lastHitFrame = 0

#const grab_IASA = 0
#const grab_xOffset = 0
#const grab_yOffset = 0
#const grab_xRange = 0
#const grab_yRange = 0
#const grab_hitFrame = 0
#const grab_lastHitFrame = 0

// NAir
#const nair_IASA = 0
#const nair_xOffset = 0
#const nair_yOffset = 0
#const nair_xRange = 0
#const nair_yRange = 0
#const nair_hitFrame = 0
#const nair_lastHitFrame = 0

// FAir
#const fair_IASA = 0
#const fair_xOffset = 0
#const fair_yOffset = 0
#const fair_xRange = 0
#const fair_yRange = 0
#const fair_hitFrame = 0
#const fair_lastHitFrame = 0

// BAir
#const bair_IASA = 0
#const bair_xOffset = 0
#const bair_yOffset = 0
#const bair_xRange = 0
#const bair_yRange = 0
#const bair_hitFrame = 0
#const bair_lastHitFrame = 0

// UAir
#const uair_IASA = 0
#const uair_xOffset = 0
#const uair_yOffset = 0
#const uair_xRange = 0
#const uair_yRange = 0
#const uair_hitFrame = 0
#const uair_lastHitFrame = 0

// DAir
#const dair_IASA = 0
#const dair_xOffset = 0
#const dair_yOffset = 0
#const dair_xRange = 0
#const dair_yRange = 0
#const dair_hitFrame = 0
#const dair_lastHitFrame = 0
