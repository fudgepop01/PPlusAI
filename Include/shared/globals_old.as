#const walkInitVel = 9999.9999
#const walkAcc = 9999.9999
#const walkMaxVel = 9999.9999
#const groundFric = 9999.9999
#const dashInitVel = 9999.9999
#const dashRunTermVel = 9999.9999
#const groundedMaxXVel = 9999.9999
#const dashCancelFrameWindow = 9999.9999
#const guardOnMaxMomentum = 9999.9999
#const jumpSquatFrames = 9999.9999
#const jumpXInitVel = 9999.9999
#const jumpYInitVel = 9999.9999
#const jumpXGroundMult = 9999.9999
#const fastFallSpeed = 9999.9999
#const gravity = 9999.9999
#const weight = 9999.9999
#const shieldSize = 9999.9999

#const recoveryHeight = 0
#const sweetSpotYRange = 4
#const ledgeRefreshDist = 40
#const maxYEdgeDistWithJump = 9999.9999
#const maxYEdgeDist = 9999.9999
#const maxYEdgeDistJumpNoUpB = 9999.9999
#const maxXEdgeDist = 9999.9999
#const minXEdgeDist = 15

#const oWalkingDist = 9999.9999
#const oJumpingDist = 15
#const shortEdgeRange = 9999.9999
#const edgeRange = 9999.9999
#const calloutSpeed = 9999.9999

#const jumpIfOWithin = 9999.9999
#const SHIfOBeyond = 9999.9999
#const FHIfOBeyond = 9999.9999
#const DJIfOWithin = 9999.9999
#const DJIfOBeyond = 9999.9999

#const techChaseCloseDist = 9999.9999
#const techChaseFarDist = 9999.9999

#const dashCountMax = 9999.9999
#const dashForceTurnFrame = 9999.9999
#const dashDanceMinFrames = 9999.9999
#const DDWaveDash = 9999.9999
#const DDMaxRange = 9999.9999

#const minBaseReactionTime = 9999.9999
#const maxBaseReactionTime = 9999.9999
#const hitboxSizeMultiplier = 0.0

#let globTempVar = var17


// THIS IS TO BE USED IMMEDIATELY WITH SIMPLE OPERATIONS OTHERWISE SIDE EFFECTS MAY OCCUR
#let immediateTempVar = var22
#let anotherTempVar = var23

// used when planning / executing moves
#let move_angle = var8
#let move_xOffset = var9
#let move_yOffset = var10
#let move_xRange = var11
#let move_yRange = var12
#let move_hitFrame = var13
#let move_lastHitFrame = var14
#let move_IASA = var15
#let move_currKnockback = var15

// recorded after the move is executed / hits;
// will not interfere with move position type
#let hit_knockback = var16

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
// I don't think I've used this once - but it might be important
// at some point so I'll keep it around.
#let lastScript = var21
#let currGoal = var21
#const cg_nothing = 0
#const cg_runAway = 1
#const cg_edgeguard = 2
#const cg_recover = 3
#const cg_combo = 4
#const cg_fishForGrab = 5
#const cg_fishForMove = 6
#const cg_circleCamp = 7
#const cg_avoidAttack = 8
#const cg_returnToCenter = 9
#const cg_baitOption = 10
#const cg_string = 11
#const cg_inHitstun = 12

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
#const man_oXHitDist = 3
#const man_oXAttackDist = 4
#const man_oYAttackDist = 5
#const man_dashdance = 6
#const man_approach = 7
#const man_defend = 8
#const man_techchase = 9
#const man_shield = 10
#const man_attacking = 11
#const man_atEdgeInit = 12
#const man_aim = 13
#const man_outOfHitstun = 14
#const man_willTech = 15

#const op_null = 0
#const op_attack = 1
#const op_defend = 2
#const op_grab = 3

#const op_towards = 1
#const op_neutral = 2
#const op_away = 3

#const op_threat = 1
#const op_wait = 2
#const op_commit = 3

#const op_overshoot = 1
// #const op_neutral = 2
#const op_undershoot = 3

#const op_jump = 1
// #const op_neutral = 2
#const op_hitstun_attack = 3

#const op_tech = 1
#const op_noTech = 2

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

// works beacause it isn't approaching - it's used to track what tactics
// work or fail vs the target opponent
#let edgeType = var16
#const et_threat = 101
#const et_wait = 102
#const et_commit = 103

// controls the approach the AI uses. It's okay because MOVES shouldn't care
// about what script was called previously - only what move they are.
#let approachType = var16
#const at_attack = 1 // default
#const at_defend = 2
#const at_edgeguard = 3
#const at_undershoot = 4
#const at_overshoot = 5
#const at_ledgeRefresh = 6
#const at_combo = 7
#const at_OFF_LEDGE = 8
#const at_immediate = 9
#const at_reroll = 10
#const at_retreat = 11
#const at_poke = 12
#const at_threaten = 13
#const at_fakeout = 14

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
