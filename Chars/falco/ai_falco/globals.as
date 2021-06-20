#const sc_laser_still = 0x8101
#const tr_laser_still = hex(0x8101)

// defining attributes here as constants (just in case)
#const walkInitVel = 0.2
#const walkAcc = 0.1
#const walkMaxVel = 1.4
#const groundFric = 0.08
#const dashInitVel = 1.9
#const dashRunTermVel = 1.5
#const groundedMaxXVel = 3
#const dashCancelFrameWindow = 1
#const guardOnMaxMomentum = 0.75
#const jumpSquatFrames = 5
#const jumpXInitVel = 0.7
#const jumpYInitVel = 4.27
#const jumpYInitVelShort = 2.07
#const jumpXGroundMult = 1
#const fastFallSpeed = 3.5
#const gravity = 0.17
#const weight = 80
#const shieldSize = 8.9

#const maxYEdgeDistWithJump = 90
#const maxYEdgeDist = 58
#const maxYEdgeDistJumpNoUpB = 40
#const maxXEdgeDist = 60

#const oWalkingDist = 20
#const oJumpingDist = 15
#const shortEdgeRange = 10
#const edgeRange = 25
#const calloutSpeed = 0.3

#const jumpIfOWithin = 100
#const SHIfOBeyond = 7
#const FHIfOBeyond = 23
#const DJIfOWithin = 55
#const DJIfOBeyond = 40

#const techChaseCloseDist = 20
#const techChaseFarDist = 40

#const dashCountMax = 30
#const dashForceTurnFrame = 10
#const dashDanceMinFrames = 2
#const DDWaveDash = 0.6
#const DDMaxRange = 150

// 0 through 21 if defensive things were consistent
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
#const jab123_IASA = 16
#const jab123_xOffset = 8
#const jab123_yOffset = -3
#const jab123_xRange = 6
#const jab123_yRange = 4
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 3
#const jab123_damage_info = Jab123|4|0|100|70

// dashattack
#const dashattack_IASA = 36
#const dashattack_xOffset = 1
#const dashattack_yOffset = -4
#const dashattack_xRange = 4
#const dashattack_yRange = 4
#const dashattack_hitFrame = 4
#const dashattack_lastHitFrame = 7
#const dashattack_damage_info = DashAttack|9|35|90|72

#const mv_dashattack_weak = 1
#const dashattack_hitFrame = 8
#const dashattack_lastHitFrame = 17
#const dashattack_damage_info = DashAttack|6|20|90|72

#const gen_xOffset = -70
#const gen_yOffset = 50
#const gen_xRange = 70
#const gen_yRange = 50

// ftilt
#const ftilt_IASA = 27
#const ftilt_xOffset = -1
#const ftilt_yOffset = -4
#const ftilt_xRange = 4.5
#const ftilt_yRange = 7.5
#const ftilt_hitFrame = 5
#const ftilt_lastHitFrame = 9
#const ftilt_damage_info = FTilt|9|0|100|361

// utilt
#const utilt_IASA = 23
#const utilt_xOffset = -10
#const utilt_yOffset = 0
#const utilt_xRange = 9
#const utilt_yRange = 11
#const utilt_hitFrame = 5
#const utilt_lastHitFrame = 11
#const utilt_damage_info = UTilt|9|30|120|93

// dtilt
#const dtilt_IASA = 28
#const dtilt_xOffset = 3
#const dtilt_yOffset = 0
#const dtilt_xRange = 7
#const dtilt_yRange = 3
#const dtilt_hitFrame = 7
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|13|25|125|75

// fsmash, 4
#const fsmash_IASA = calc(38 + 4)
#const fsmash_xOffset = 4
#const fsmash_yOffset = -2
#const fsmash_xRange = 8
#const fsmash_yRange = 8
#const fsmash_hitFrame = calc(9 + 4)
#const fsmash_lastHitFrame = calc(18 + 4)
#const fsmash_damage_info = FSmash|17|40|90|361

// usmash, 3
#const usmash_IASA = calc(43 + 3)
#const usmash_xOffset = -11
#const usmash_yOffset = -2
#const usmash_xRange = 12
#const usmash_yRange = 13
#const usmash_hitFrame = calc(5 + 3)
#const usmash_lastHitFrame = calc(8 + 3)
#const usmash_damage_info = USmash|14|25|100|95

// dsmash, 3
#const dsmash_IASA = calc(44 + 3)
#const dsmash_xOffset = -13.5
#const dsmash_yOffset = 3
#const dsmash_xRange = 12
#const dsmash_yRange = 4.6
#const dsmash_hitFrame = calc(4 + 3)
#const dsmash_lastHitFrame = calc(8 + 3)
#const dsmash_damage_info = DSmash|16|70|20|25

// noochB
#const nspecial_IASA = calc(7 + 25 + 29)
#const nspecial_xOffset = 4
#const nspecial_yOffset = -2
#const nspecial_xRange = 55
#const nspecial_yRange = 8
#const nspecial_hitFrame = 8
#const nspecial_lastHitFrame = 108
#const nspecial_damage_info = NSpecial|3|w5|100|361

#const nspecial_aim_yOffset = -7
#const nspecial_aim_xRange = 15
#const nspecial_aim_yRange = 2

#const nspecialair_IASA = calc(7 + 25 + 29)
#const nspecialair_xOffset = 4
#const nspecialair_yOffset = -2
#const nspecialair_xRange = 55
#const nspecialair_yRange = 8
#const nspecialair_hitFrame = 8
#const nspecialair_lastHitFrame = 108
#const nspecialair_damage_info = NSpecialAir|3|w5|100|361


// upB
#const uspecial_IASA = 9999.9999
#const uspecial_xOffset = -8.5
#const uspecial_yOffset = 0
#const uspecial_xRange = 8
#const uspecial_yRange = 8
#const uspecial_hitFrame = 44
#const uspecial_lastHitFrame = 66
#const uspecial_damage_info = USpecial|16|80|60|80

// downB
#const dspecial_IASA = 5
#const dspecial_xOffset = -5
#const dspecial_yOffset = -2
#const dspecial_xRange = 5
#const dspecial_yRange = 5
#const dspecial_hitFrame = 1
#const dspecial_lastHitFrame = 1
#const dspecial_damage_info = DSpecial|8|110|50|84

#const dspecialair_IASA = 5
#const dspecialair_xOffset = -5
#const dspecialair_yOffset = -2
#const dspecialair_xRange = 5
#const dspecialair_yRange = 5
#const dspecialair_hitFrame = 1
#const dspecialair_lastHitFrame = 1
#const dspecialair_damage_info = DSpecialAir|8|110|50|84

// sideB
#const sspecial_IASA = calc(16 + 4 + 41)
#const sspecial_xOffset = -4
#const sspecial_yOffset = 0
#const sspecial_xRange = 27
#const sspecial_yRange = 4
#const sspecial_hitFrame = 17
#const sspecial_lastHitFrame = 20
#const sspecial_damage_info = SSpecial|7|74|60|65

#const sspecialair_IASA = calc(16 + 4 + 41)
#const sspecialair_xOffset = -4
#const sspecialair_yOffset = 0
#const sspecialair_xRange = 27
#const sspecialair_yRange = 4
#const sspecialair_hitFrame = 17
#const sspecialair_lastHitFrame = 20
#const sspecialair_damage_info = SSpecialAir|7|72|38|270

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = -0.75
#const grab_yOffset = -2
#const grab_xRange = 5
#const grab_yRange = 4
#const grab_hitFrame = 7
#const grab_lastHitFrame = 8

#const grab_damage_info = Grab|0|0|0|0
#const fthrow_damage_info = Grab|3|35|135|45
#const dthrow_damage_info = Grab|1|150|40|270
#const bthrow_damage_info = Grab|2|80|85|56
#const uthrow_damage_info = Grab|2|75|110|90

// NAir
#const nair_IASA = 42
#const nair_xOffset = -2
#const nair_yOffset = 0
#const nair_xRange = 6
#const nair_yRange = 5
#const nair_hitFrame = 4
#const nair_lastHitFrame = 7
#const nair_damage_info = NAir|12|10|100|361

#const mv_nair_weak = 1
#const nair_weak_hitFrame = 8
#const nair_weak_lastHitFrame = 31
#const nair_weak_damage_info = NAir|9|0|100|361


// FAir
#const fair_IASA = 53
#const fair_xOffset = -1
#const fair_yOffset = -1
#const fair_xRange = 7
#const fair_yRange = 5
#const fair_hitFrame = 6
#const fair_lastHitFrame = 45
#const fair_damage_info = FAir|7|10|100|361


// BAir
#const bair_IASA = 38
#const bair_xOffset = -14
#const bair_yOffset = -1
#const bair_xRange = 10
#const bair_yRange = 6
#const bair_hitFrame = 4
#const bair_lastHitFrame = 7
#const bair_damage_info = BAir|15|0|100|361

#const mv_bair_weak = 1
#const bair_weak_hitFrame = 8
#const bair_weak_lastHitFrame = 19
#const bair_weak_damage_info = BAir|9|0|100|361

// UAir
#const uair_IASA = 36
#const uair_xOffset = -6
#const uair_yOffset = -4
#const uair_xRange = 5
#const uair_yRange = 9
#const uair_hitFrame = 8
#const uair_lastHitFrame = 9
#const uair_damage_info = UAir|5|30|22|90

#const mv_uair_hit2 = 1
#const uair_hit2_hitFrame = 11
#const uair_hit2_lastHitFrame = 14
#const uair_hit2_damage_info = UAir|10|22|120|70

// DAir
#const dair_IASA = 51
#const dair_xOffset = -5
#const dair_yOffset = 0
#const dair_xRange = 5
#const dair_yRange = 5
#const dair_hitFrame = 5
#const dair_lastHitFrame = 14
#const dair_damage_info = DAir|12|10|100|290

#const mv_dair_weak = 1
#const dair_weak_hitFrame = 15
#const dair_weak_lastHitFrame = 24
#const dair_weak_damage_info = DAir|8|20|107|290