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
#const pt_riskReactionBalance = 1.0
#const pt_platChance = 0.05
// 0.15

#const pt_SDIChance = 0.35

#const pt_dashForceTurnFrame = 8
#const pt_dashDanceMinFrames = 4
#const pt_shortHopHeight = 25.344
#const pt_djumpHeight = 39.514
#const pt_wavedashDist = 25
#const pt_recoveryDistY = -40
#const pt_recoveryDistX = 50

// used with common ai pac
#let chr_trait_select = var10
#let chr_trait_return = var10
#const chr_pt_jumpiness = 0
#const chr_pt_djumpiness = 1
#const chr_pt_riskReactionBalance = 2
#const chr_pt_aggression = 3
#const chr_pt_baitChance = 4
#const chr_pt_bait_dashAwayChance = 5
#const chr_pt_bait_wdashAwayChance = 6
#const chr_pt_wall_chance = 7
#const chr_pt_braveChance = 8
#const chr_pt_platChance = 9
#const chr_pt_circleCampChance = 10
#const chr_pt_SDIChance = 11
#const chr_pt_dashForceTurnFrame = 12
#const chr_pt_dashDanceMinFrames = 13
#const chr_pt_shortHopHeight = 14
#const chr_pt_djumpHeight = 15
#const chr_pt_wavedashDist = 16
#const chr_pt_recoveryDistX = 17
#const chr_pt_recoveryDistY = 18

#const chr_chk_isAerialAttack = 100

#const shortEdgeRange = 15


// ATTRIBUTES
#const attr_walkInitVel = 0
#const attr_walkAcc = 1
#const attr_walkMaxVel = 2
#const attr_groundFriction = 3
#const attr_dashInitVel = 4
#const attr_dashRunAccA = 5
#const attr_dashRunAccB = 6
#const attr_dashRunTermVel = 7
// #const ] = 8
#const attr_groundedMaxXVel = 9
#const attr_dashCancelFrameWindow = 10
#const attr_guardOnMaxMomentum = 11
#const attr_jumpSquatFrames = 12
#const attr_jumpXInitVel = 13
#const attr_jumpYInitVel = 14
#const attr_jumpXVelGroundMult = 15
#const attr_jumpXInitTermVel = 16
#const attr_jumpYInitVelShort = 17
#const attr_airJumpYMult = 18
// #const attr_airJumpYMult = 19
#const attr_footstoolInitVel = 20
#const attr_footstoolInitVelShort = 21
// #const ] = 22
#const attr_meteorCancelDelay = 23
#const attr_numJumps = 24
#const attr_gravity = 25
#const attr_maxFallSpeed = 26
#const attr_airFrictionY = 27
#const attr_airYTermVel = 28
#const attr_airMobilityA = 29
#const attr_airMobilityB = 30
#const attr_airXTermVel = 31
#const attr_airFrictionX = 32
#const attr_fastFallSpeed = 33
#const attr_airXTermVelHard = 34
#const attr_glideFrameWindow = 35
// #const ] = 36
#const attr_jab2Window = 37
#const attr_jab3Window = 38
#const attr_ftilt2Window = 39
#const attr_ftilt3Window = 40
#const attr_fsmash2Window = 41
#const attr_flipDirFrame = 42
// #const ] = 43
#const attr_weight = 44
#const attr_size = 45
#const attr_resultsScreenSize = 46
// #const ] = 47
#const attr_shieldSize = 48
#const attr_shieldBreakVel = 49
#const attr_shieldStrength = 50
// #const ] = 51
#const attr_respawnPlatformSize = 52
// #const ] = 53
#const attr_edgeJumpXVel = 54
#const attr_edgeJumpYVel = 55
// #const ] = 56
#const attr_itemThrowStrength = 57
// #const ] = 58
#const attr_projectileItemMoveSpeed = 59
#const attr_projectileItemMoveSpeedDashF = 60
#const attr_projectileItemMoveSpeedDashB = 61
// #const ] = 62
#const attr_lightLandingLag = 63
#const attr_normalLandingLag = 64
#const attr_nairLandingLag = 65
#const attr_fairLandingLag = 66
#const attr_bairLandingLag = 67
#const attr_uairLandingLag = 68
#const attr_dairLandingLag = 69
#const attr_termVelHardFrames = 70

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
#let goalX = var8
#let goalY = var9

// used when a move has been chosen for execution
#let move_angle = var8
#let move_xOffset = var10
#let move_yOffset = var11
#let move_xRange = var12
#let move_yRange = var13
#let move_hitFrame = var14
#let move_lastHitFrame = var15
#let move_IASA = var16

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
#const sv_dash_toCenter = 3
#const sv_dash_through = 4

#const sv_aerialdrift_towards = 1
#const sv_aerialdrift_away = 2

#const sv_attackgoal_justy = 1
#const sv_attackgoal_justx = 2
#const sv_attackgoal_self = 3

#const sv_checkHit = 1
#const sv_execute_fastfall = 1
#const sv_execute_willhit = 2


// used in various places to tell what part the routine should jump to
// effectively used to communicate between scripts
#let movePart = var18
#const mp_ATK = 255
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
#const cg_string = 11
#const cg_inHitstun = 12
#const cg_defend = 13
#const cg_special = 14
#const cg_ledge = 15
#const cg_attack = 16
#const cg_attack_overshoot = 16.1
#const cg_attack_undershoot = 16.2
#const cg_attack_wall = 16.3
#const cg_attack_reversal = 16.4
#const cg_edgeguard = 16.5
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

#const man_ODefendOption = 7
#const man_OBaitDirection = 8
#const man_OBaitOption = 9
#const man_OXHitDist = 10
#const man_OXAttackDist = 11
#const man_OGetupOption = 12
#const man_OTechOption = 13
#const man_OOOSOption = 14
#const man_OOutOfHitstun = 15

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

#const op_bait_move = 1
#const op_bait_grab = 2
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
