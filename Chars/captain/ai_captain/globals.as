// globals are preprocessed variables that can be used anywhere
// they'll automatically be substituted for the variable or value
// they stand for.
//
// ex. in here, "move_xOffset" will always be replaced with "var9"

// defining attributes here as constants (just in case)
#const walkInitVel = 0.15
#const walkAcc = 0.1
#const walkMaxVel = 0.85
#const groundFric = 0.08
#const dashInitVel = 2
#const dashRunTermVel = 2.3
#const groundedMaxXVel = 3
#const dashCancelFrameWindow = 1
#const guardOnMaxMomentum = 0.75
#const jumpSquatFrames = 4
#const jumpXInitVel = 0.95
#const jumpYInitVel = 3.23
#const jumpXGroundMult = 0.75
#const fastFallSpeed = 3.5
#const gravity = 0.13
#const weight = 104
#const shieldSize = 9.6

#const maxYEdgeDistWithJump = 70
#const maxYEdgeDist = 50
#const maxYEdgeDistJumpNoUpB = 25
#const maxXEdgeDist = 60

#const oWalkingDist = 10
#const shortEdgeRange = 10
#const edgeRange = 25
#const calloutSpeed = 0.3

#const jumpIfOWithin = 90
#const SHIfOBeyond = 15
#const FHIfOBeyond = 20
#const DJIfOWithin = 55
#const DJIfOBeyond = 35

#const techChaseCloseDist = 10
#const techChaseFarDist = 25

#const dashCountMax = 10
#const dashForceTurnFrame = 27
#const dashDanceMinFrames = 3
#const DDWaveDash = 0.1

#const minBaseReactionTime = 0
#const maxBaseReactionTime = 21

#const killComboThreshold = 65

#const neutral_xOffset = -10
#const neutral_yOffset = 10
#const neutral_xRange = 10
#const neutral_yRange = 10

#const techRollVulFrame = 21

// the following is the data that I give the AI that allows it to determine
// where it should be before performing an attack.
// it will attempt to a point with these parameters in
// 1.as, and if it does, it'll perform the action provided

// this works because it's used exclusively in 1.as and aerial attacks
// where it's used IMMEDIATELY before being modified
#let shouldFastFall = var2

// function stuff
/// recovery
#const recovery_moves = uspecial|sspecial

#const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1D6)) && !(Equal CurrSubaction hex(0x1D7))
#const uspecial_recovery_info = common|60

#const sspecial_subaction_check = !(Equal CurrSubaction hex(0x1D4)) && !(Equal CurrSubaction hex(0x1D5))
#const sspecial_recovery_info = custom

// jab123
#const mv_gentlemen = 0
#const mv_jabReset = 1

#const jab123_IASA = 14
#const jab123_xOffset = 1
#const jab123_yOffset = -9
#const jab123_xRange = 8
#const jab123_yRange = 2
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 5
#const jab123_damage_info = Jab123|8|20|100|55

// ftilt
#const ftilt_IASA = 30
#const ftilt_xOffset = 1
#const ftilt_yOffset = -9
#const ftilt_xRange = 9
#const ftilt_yRange = 3
#const ftilt_hitFrame = 9
#const ftilt_lastHitFrame = 11
#const ftilt_damage_info = FTilt|11|10|100|361

// utilt
#const utilt_IASA = 38
#const utilt_xOffset = 1
#const utilt_yOffset = 2
#const utilt_xRange = 7
#const utilt_yRange = 13
#const utilt_hitFrame = 17
#const utilt_lastHitFrame = 22
#const utilt_damage_info = UTilt|13|50|80|361

// dtilt
#const dtilt_IASA = 35
#const dtilt_xOffset = 1
#const dtilt_yOffset = 0
#const dtilt_xRange = 10
#const dtilt_yRange = 5
#const dtilt_hitFrame = 10
#const dtilt_lastHitFrame = 15
#const dtilt_damage_info = DTilt|12|25|75|70

// fsmash
#const fsmash_IASA = 49
#const fsmash_xOffset = 1
#const fsmash_yOffset = -7
#const fsmash_xRange = 8
#const fsmash_yRange = 3
#const fsmash_hitFrame = 19
#const fsmash_lastHitFrame = 21
#const fsmash_damage_info = FSmash|20|24|100|361

// usmash
#const usmash_IASA = 41
#const usmash_xOffset = -1
#const usmash_yOffset = -3
#const usmash_xRange = 6
#const usmash_yRange = 13
#const usmash_hitFrame = 22
#const usmash_lastHitFrame = 29
#const usmash_damage_info = USmash|13|30|126|90

// dsmash
#const dsmash_IASA = 9999.9999
#const dsmash_xOffset = 9999.9999
#const dsmash_yOffset = 9999.9999
#const dsmash_xRange = 9999.9999
#const dsmash_yRange = 9999.9999
#const dsmash_yRange = 9999.9999
#const dsmash_hitFrame = 9999.9999
#const dsmash_lastHitFrame = 9999.9999

// noochB
#const nspecial_IASA = 9999.9999
#const nspecial_xOffset = 9999.9999
#const nspecial_yOffset = 9999.9999
#const nspecial_xRange = 9999.9999
#const nspecial_yRange = 9999.9999
#const nspecial_hitFrame = 9999.9999
#const nspecial_lastHitFrame = 9999.9999

// upB
#const uspecial_IASA = 9999.9999
#const uspecial_xOffset = 9999.9999
#const uspecial_yOffset = 9999.9999
#const uspecial_xRange = 9999.9999
#const uspecial_yRange = 9999.9999
#const uspecial_hitFrame = 9999.9999
#const uspecial_lastHitFrame = 9999.9999

// downB
#const dspecial_IASA = 9999.9999
#const dspecial_xOffset = 9999.9999
#const dspecial_yOffset = 9999.9999
#const dspecial_xRange = 9999.9999
#const dspecial_yRange = 9999.9999
#const dspecial_hitFrame = 9999.9999
#const dspecial_lastHitFrame = 9999.9999

// sideB
#const sspecial_IASA = 26
#const sspecial_xOffset = 3
#const sspecial_yOffset = 0
#const sspecial_xRange = 14
#const sspecial_yRange = 8
#const sspecial_hitFrame = 26
#const sspecial_lastHitFrame = 26 // just a dummy
#const sspecial_damage_info = SSpecial|7|78|80|90

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 1
#const grab_yOffset = -6
#const grab_xRange = 3
#const grab_yRange = 4
#const grab_hitFrame = 7
#const grab_lastHitFrame = 8

#const grab_damage_info = Grab|0|0|0|0
#const fthrow_damage_info = Grab|4|45|105|45
#const dthrow_damage_info = Grab|7|75|34|65
#const bthrow_damage_info = Grab|4|30|130|45
#const uthrow_damage_info = Grab|3|70|105|85

// NAir
#const nair_IASA = 45
#const nair_xOffset = -4
#const nair_yOffset = -3
#const nair_xRange = 10
#const nair_yRange = 3
#const nair_hitFrame = 7
#const nair_lastHitFrame = 12
#const nair_damage_info = NAir|5|w40|100|78

#const mv_app_nair = 1
#const app_nair_xOffset = -4
#const app_nair_yOffset = -3
#const app_nair_xRange = 25
#const app_nair_hitFrame = 7
#const app_nair_lastHitFrame = 29
#const app_nair_damage_info = NAir|7|40|100|361

#const mv_nairHit2 = 2
#const nairHit2_hitFrame = 20
#const nairHit2_lastHitFrame = 29
#const nairHit2_damage_info = NAir|7|40|100|361

// FAir
#const fair_IASA = 36
#const fair_xOffset = 1
#const fair_yOffset = -1.450
#const fair_xRange = 5.3
#const fair_yRange = 5
#const fair_hitFrame = 14
#const fair_lastHitFrame = 16
#const fair_damage_info = FAir|18|24|100|32

#const mv_fair_weak = 1
#const fair_weak_hitFrame = 17
#const fair_weak_lastHitFrame = 30
#const fair_weak_damage_info = FAir|6|35|80|361

// BAir
#const bair_IASA = 29
#const bair_xOffset = -16
#const bair_yOffset = -1.450
#const bair_xRange = 7.3
#const bair_yRange = 6
#const bair_hitFrame = 10
#const bair_lastHitFrame = 17
#const bair_damage_info = BAir|14|20|100|361

// UAir
#const uair_IASA = 30
#const uair_xOffset = -3
#const uair_yOffset = -4.45
#const uair_xRange = 9.6
#const uair_yRange = 11
#const uair_hitFrame = 6
#const uair_lastHitFrame = 10
#const uair_damage_info = UAir|13|10|100|361

#const mv_uair_tipman = 1
#const uair_tipman_xOffset = -8
#const uair_tipman_yOffset = -3
#const uair_tipman_xRange = 8
#const uair_tipman_yRange = 8
#const uair_tipman_hitFrame = 11
#const uair_tipman_lastHitFrame = 13
#const uair_tipman_damage_info = UAir|12|8|80|30

// DAir
#const dair_IASA = 38
#const dair_xOffset = -4
#const dair_yOffset = 10
#const dair_xRange = 5
#const dair_yRange = 12
#const dair_hitFrame = 16
#const dair_lastHitFrame = 20
#const dair_damage_info = DAir|16|40|100|270