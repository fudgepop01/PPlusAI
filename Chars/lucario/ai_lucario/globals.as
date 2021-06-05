// globals are preprocessed variables that can be used anywhere
// they'll automatically be substituted for the variable or value
// they stand for.
//
// ex. in here, "move_xOffset" will always be replaced with "var9"

// defining attributes here as constants (just in case)
#const walkInitVel = 0.3
#const walkAcc = 0.1
#const walkMaxVel = 1.3
#const groundFric = 0.095
#const dashInitVel = 2.05
#const dashRunTermVel = 1.85
#const groundedMaxXVel = 3
#const dashCancelFrameWindow = 1
#const guardOnMaxMomentum = 0.75
#const jumpSquatFrames = 3
#const jumpXInitVel = 1.1
#const jumpYInitVel = 3.1
#const jumpYInitVelShort = 1.95
#const jumpXGroundMult = 1
#const fastFallSpeed = 2.5
#const gravity = 0.125
#const weight = 94
#const shieldSize = 8.6

#const recoveryHeight = -50
#const maxYEdgeDistWithJump = 85
#const maxYEdgeDist = 70
#const maxYEdgeDistJumpNoUpB = 20
#const maxXEdgeDist = 45

#const oWalkingDist = 10
#const shortEdgeRange = 10
#const edgeRange = 25
#const calloutSpeed = 0.3

#const jumpIfOWithin = 60
#const SHIfOBeyond = 7
#const FHIfOBeyond = 25
#const DJIfOWithin = 35
#const DJIfOBeyond = 23

#const techChaseCloseDist = 10
#const techChaseFarDist = 25

#const dashCountMax = 25
#const dashForceTurnFrame = 10
#const dashDanceMinFrames = 3
#const DDWaveDash = 0.2
#const DDMaxRange = 45

#const minBaseReactionTime = 0
#const maxBaseReactionTime = 21

#const killComboThreshold = 70
// #const hitboxSizeMultiplier = 0.8

// AI "mode" values
#const md_attack = 1
#const md_defend = 2

// AI taunt values
#const utaunt = 1
#const staunt = 2
#const dtaunt = 3

// controls the approach the AI uses. It's okay because MOVES shouldn't care
// about what script was called previously - only what move they are.
#let approachType = var16
#const at_attack = 1 // default
#const at_defend = 2
#const at_edgeguard = 3
#const at_undershoot = 4
#const at_ledgeRefresh = 5

// the following is the data that I give the AI that allows it to determine
// where it should be before performing an attack.
// it will attempt to a point with these parameters in
// 1.as, and if it does, it'll perform the action provided

// this works because it's used exclusively in 1.as and aerial attacks
// where it's used IMMEDIATELY before being modified
#let shouldFastFall = var2

// just used in combo hub, should be alright
#let isImmediateCombo = var16
#const immediate = 255

// jab123
#const mv_gentlemen = 0
#const mv_jabReset = 1

#const jab123_IASA = 19
#const jab123_xOffset = 0
#const jab123_yOffset = -4
#const jab123_xRange = 7.4
#const jab123_yRange = 3.85
#const jab123_hitFrame = 6
#const jab123_lastHitFrame = 7
#const jab123_damage_info = Jab123|5|30|120|55

// dashattack
#const dashattack_IASA = 38
#const dashattack_xOffset = -1
#const dashattack_yOffset = -4
#const dashattack_xRange = 8.4
#const dashattack_yRange = 3.85
#const dashattack_hitFrame = 6
#const dashattack_lastHitFrame = 15
#const dashattack_damage_info = DashAttack|10|45|55|55

// ftilt
#const ftilt_IASA = 27
#const ftilt_xOffset = 1
#const ftilt_yOffset = -5.650
#const ftilt_xRange = 8.4
#const ftilt_yRange = 3.850
#const ftilt_hitFrame = 10
#const ftilt_damage_info = FTilt|10|40|35|40

// utilt
#const utilt_IASA = 28
#const utilt_xOffset = -12
#const utilt_yOffset = 1
#const utilt_xRange = 12.4
#const utilt_yRange = 12.85
#const utilt_hitFrame = 5
#const utilt_lastHitFrame = 14
#const utilt_damage_info = UTilt|8|35|90|85

// dtilt
#const dtilt_IASA = 26
#const dtilt_xOffset = 1
#const dtilt_yOffset = 1
#const dtilt_xRange = 8.55
#const dtilt_yRange = 3.85
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 8
#const dtilt_damage_info = DTilt|6|35|100|80

// fsmash
#const fsmash_IASA = 51
#const fsmash_xOffset = 6
#const fsmash_yOffset = -2
#const fsmash_xRange = 10.55
#const fsmash_yRange = 6
#const fsmash_hitFrame = 20
#const fsmash_lastHitFrame = 24
#const fsmash_damage_info = FSmash|14|20|100|361

// usmash
#const mv_usmash_cancel = 1

#const usmash_IASA = 26
#const usmash_xOffset = 1
#const usmash_yOffset = 0
#const usmash_xRange = 4.55
#const usmash_yRange = 19.6
#const usmash_hitFrame = 11
#const usmash_lastHitFrame = 24
#const usmash_damage_info = USmash|6|45|175|83

#const usmash_cancel_damage_info = USmash|4|48|100|90

// dsmash
#const dsmash_IASA = 52
#const dsmash_xOffset = -17
#const dsmash_yOffset = -1
#const dsmash_xRange = 16
#const dsmash_yRange = 4.6
#const dsmash_hitFrame = 13
#const dsmash_lastHitFrame = 18
#const dsmash_damage_info = DSmash|14|25|100|361

// noochB
#const mv_ASC = 1

#const nspecial_IASA = 26
#const nspecial_xOffset = 8
#const nspecial_yOffset = -3
#const nspecial_xRange = 69 // nice
#const nspecial_yRange = 5
#const nspecial_hitFrame = 8
#const nspecial_lastHitFrame = 8
#const nspecial_damage_info = NSpecial|0|0|0|0

#const nspecial_start_xRange = 90
#const nspecial_start_yRange = 10
#const nspecial_start_yOffset = 5
#const nspecial_start_damage_info = NSpecial|0|0|0|0

#const mv_aurabomb = 2
#const nspecial_aurabomb_xOffset = 0
#const nspecial_aurabomb_yOffset = 4
#const nspecial_aurabomb_yRange = 10
#const nspecial_aurabomb_damage_info = NSpecial|0|0|0|0

// sideB
#const mv_sspecial_power = 1
#const mv_sspecial_spike = 2

#const sspecial_IASA = 58
#const sspecial_xOffset = 0.5
#const sspecial_yOffset = -5
#const sspecial_xRange = 7.5
#const sspecial_yRange = 3.6
#const sspecial_hitFrame = 12
#const sspecial_lastHitFrame = 14
#const sspecial_damage_info = SSpecial|3|40|212|65
#const sspecial_power_damage_info = SSpecial|5|65|219|65

// upB
#const uspecial_IASA = 50
#const uspecial_xOffset = -5
#const uspecial_yOffset = -5
#const uspecial_xRange = 5
#const uspecial_yRange = 5
#const uspecial_hitFrame = 1
#const uspecial_lastHitFrame = 1

// downB
#const mv_dspecial_cancel = 1

#const dspecial_IASA = 30
#const dspecial_xOffset = 0
#const dspecial_yOffset = 0
#const dspecial_xRange = 25
#const dspecial_yRange = 10
#const dspecial_hitFrame = 10
#const dspecial_lastHitFrame = 10
#const dspecial_damage_info = DSpecial|0|0|0|0
#const dspecial_cancel_damage_info = DSpecial|0|0|0|0

// grab
// "mv" stands for "move variant" - it's just a naming convention
// these are the variations of "grab" so I know exactly what throw
// was used
#const mv_fthrow = 1
#const mv_dthrow = 2
#const mv_bthrow = 3
#const mv_uthrow = 4

// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 31
#const grab_xOffset = 1
#const grab_yOffset = -3
#const grab_xRange = 6
#const grab_yRange = 3
#const grab_hitFrame = 7
#const grab_lastHitFrame = 8

#const grab_damage_info = Grab|0|0|0|0
#const fthrow_damage_info = Grab|10|20|90|45
#const dthrow_damage_info = Grab|7|80|44|70
#const bthrow_damage_info = Grab|10|35|75|45
#const uthrow_damage_info = Grab|5|60|105|75

// NAir
#const nair_IASA = 54
#const nair_xOffset = -10
#const nair_yOffset = -1.5
#const nair_xRange = 9.5
#const nair_yRange = 4.6
#const nair_hitFrame = 9
#const nair_lastHitFrame = 15
#const nair_damage_info = NAir|15|20|100|361

#const mv_nair_mid = 1
#const nair_mid_hitFrame = 16
#const nair_mid_lastHitFrame = 28
#const nair_mid_damage_info = NAir|12|15|100|50

#const mv_nair_weak = 2
#const nair_weak_hitFrame = 29
#const nair_weak_lastHitFrame = 41
#const nair_weak_damage_info = NAir|9|10|100|60

// FAir
#const fair_IASA = 31
#const fair_xOffset = 0
#const fair_yOffset = 1
#const fair_xRange = 7.5
#const fair_yRange = 4.6
#const fair_hitFrame = 6
#const fair_lastHitFrame = 12
#const fair_damage_info = FAir|11|30|70|361

#const mv_fair_scoop = 1
#const fair_scoop_xOffset = 0
#const fair_scoop_yOffset = 3
#const fair_scoop_xRange = 3.5
#const fair_scoop_yRange = 7.6
#const fair_scoop_hitFrame = 4
#const fair_scoop_lastHitFrame = 5
#const fair_scoop_damage_info = FAir|11|30|70|361

// BAir
#const bair_IASA = 33
#const bair_xOffset = -16
#const bair_yOffset = 0
#const bair_xRange = 7
#const bair_yRange = 5
#const bair_hitFrame = 10
#const bair_lastHitFrame = 13
#const bair_damage_info = BAir|14|20|100|361

// UAir
#const mv_uair_strong = 1

#const uair_IASA = 29
#const uair_xOffset = -4
#const uair_yOffset = -6
#const uair_xRange = 4
#const uair_yRange = 7
#const uair_hitFrame = 7
#const uair_lastHitFrame = 10
#const uair_damage_info = UAir|11|30|80|80

#const uair_yOffset = -12
#const uair_yRange = 3
#const uair_strong_damage_info = UAir|12|40|100|90

// DAir
#const mv_dair_weak = 1

#const dair_IASA = 29
#const dair_xOffset = -4
#const dair_yOffset = 10
#const dair_xRange = 4
#const dair_yRange = 7
#const dair_hitFrame = 4
#const dair_lastHitFrame = 12
#const dair_damage_info = DAir|8|50|110|361

#const dair_weak_lastHitFrame = 5
#const dair_weak_damage_info = DAir|8|20|30|85



