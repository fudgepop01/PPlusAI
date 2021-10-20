#const sc_laser = 0x8101
#const tr_laser = hex(0x8101)

// defining attributes here as constants (just in case)
#const walkInitVel = 0.1
#const walkAcc = 0.15
#const walkMaxVel = 1.3
#const groundFric = 0.09
#const dashInitVel = 2.1
#const dashRunTermVel = 2
#const groundedMaxXVel = 3
#const dashCancelFrameWindow = 1
#const guardOnMaxMomentum = 0.8
#const jumpSquatFrames = 4
#const jumpXInitVel = 0.9
#const jumpYInitVel = 3.2
#const jumpYInitVelShort = 2
#const jumpXGroundMult = 1
#const fastFallSpeed = 3.4
#const gravity = 0.16
#const weight = 85
#const shieldSize = 7.7

#const maxYEdgeDistWithJump = 90
#const maxYEdgeDist = 70
#const maxYEdgeDistJumpNoUpB = 25
#const maxXEdgeDist = 70

#const oWalkingDist = 20
#const oJumpingDist = 15
#const shortEdgeRange = 10
#const edgeRange = 25
#const calloutSpeed = 0.3

#const jumpIfOWithin = 80
#const SHIfOBeyond = 7
#const FHIfOBeyond = 20
#const DJIfOWithin = 30
#const DJIfOBeyond = 45

#const techChaseCloseDist = 20
#const techChaseFarDist = 40

#const dashCountMax = 30
#const dashForceTurnFrame = 9
#const dashDanceMinFrames = 2
#const DDWaveDash = 0.5
#const DDMaxRange = 150

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
#const jab123_xOffset = 5
#const jab123_yOffset = -1
#const jab123_xRange = 7.25
#const jab123_yRange = 5.5
#const jab123_hitFrame = 4
#const jab123_lastHitFrame = 5
#const jab123_damage_info = Jab123|4|20|53|80

// dashattack
#const dashattack_IASA = 40
#const dashattack_xOffset = 20
#const dashattack_yOffset = -2
#const dashattack_xRange = 7.5
#const dashattack_yRange = 3
#const dashattack_hitFrame = 11
#const dashattack_lastHitFrame = 15
#const dashattack_damage_info = DashAttack|9|35|100|74

#const gen_xOffset = -70
#const gen_yOffset = 50
#const gen_xRange = 70
#const gen_yRange = 50

// ftilt
#const ftilt_IASA = 32
#const ftilt_xOffset = 2
#const ftilt_yOffset = 0
#const ftilt_xRange = 10
#const ftilt_yRange = 7
#const ftilt_hitFrame = 7
#const ftilt_lastHitFrame = 10
#const ftilt_damage_info = FTilt|6|25|150|50

// utilt
#const utilt_IASA = 27
#const utilt_xOffset = -3
#const utilt_yOffset = 0
#const utilt_xRange = 7.5
#const utilt_yRange = 13.5
#const utilt_hitFrame = 6
#const utilt_lastHitFrame = 10
#const utilt_damage_info = UTilt|9|30|110|80

// dtilt
#const dtilt_IASA = 27
#const dtilt_xOffset = 3
#const dtilt_yOffset = 1
#const dtilt_xRange = 11
#const dtilt_yRange = 5
#const dtilt_hitFrame = 9
#const dtilt_lastHitFrame = 10
#const dtilt_damage_info = DTilt|8|30|100|68

// fsmash, 4
#const fsmash_IASA = calc(42 + 7)
#const fsmash_xOffset = -2
#const fsmash_yOffset = 1
#const fsmash_xRange = 20
#const fsmash_yRange = 5.5
#const fsmash_hitFrame = calc(4 + 7)
#const fsmash_lastHitFrame = calc(10 + 7)
#const fsmash_damage_info = FSmash|13|40|90|361

// usmash, 3
#const usmash_IASA = calc(46 + 4)
#const usmash_xOffset = -22
#const usmash_yOffset = 0
#const usmash_xRange = 31
#const usmash_yRange = 13.5
#const usmash_hitFrame = calc(8 + 4)
#const usmash_lastHitFrame = calc(13 + 4)
#const usmash_damage_info = USmash|12|40|100|100

#const mv_usmash_late = 1
#const usmash_late_hitFrame = calc(14 + 4)
#const usmash_late_lastHitFrame = calc(21 + 4)
#const usmash_damage_info = USmash|11|25|100|40

// dsmash, 3
#const dsmash_IASA = calc(41 + 3)
#const dsmash_xOffset = -18
#const dsmash_yOffset = 2
#const dsmash_xRange = 19.5
#const dsmash_yRange = 14.5
#const dsmash_hitFrame = calc(6 + 3)
#const dsmash_lastHitFrame = calc(7 + 3)
#const dsmash_damage_info = DSmash|15|25|100|40

#const mv_dsmash_hit2 = 1
#const dsmash_hit2_hitFrame = calc(12 + 3)
#const dsmash_hit2_lastHitFrame = calc(13 + 3)
#const dsmash_hit2_damage_info = DSmash|13|25|100|40

// noochB
#const nspecial_IASA = 45
#const nspecial_xOffset = 11
#const nspecial_yOffset = -3
#const nspecial_xRange = 42
#const nspecial_yRange = 4
#const nspecial_hitFrame = 15
#const nspecial_lastHitFrame = 108
#const nspecial_damage_info = NSpecial|3|w5|100|361

#const nspecial_aim_yOffset = -3
#const nspecial_aim_xRange = 15
#const nspecial_aim_yRange = 4

#const nspecialair_IASA = 45
#const nspecialair_xOffset = 4
#const nspecialair_yOffset = -2
#const nspecialair_xRange = 55
#const nspecialair_yRange = 8
#const nspecialair_hitFrame = 15
#const nspecialair_lastHitFrame = 108
#const nspecialair_damage_info = NSpecialAir|3|w5|100|361


// upB
#const uspecial_IASA = 9999.9999
#const uspecial_xOffset = -5
#const uspecial_yOffset = -1
#const uspecial_xRange = 5
#const uspecial_yRange = 43
#const uspecial_hitFrame = 44
#const uspecial_lastHitFrame = 66
#const uspecial_damage_info = USpecial|16|80|60|80

// downB
#const dspecial_IASA = 5
#const dspecial_xOffset = -8
#const dspecial_yOffset = 2
#const dspecial_xRange = 8
#const dspecial_yRange = 8
#const dspecial_hitFrame = 1
#const dspecial_lastHitFrame = 1
#const dspecial_damage_info = DSpecial|8|110|50|84

#const dspecialair_IASA = 5
#const dspecialair_xOffset = -8
#const dspecialair_yOffset = 2
#const dspecialair_xRange = 8
#const dspecialair_yRange = 8
#const dspecialair_hitFrame = 1
#const dspecialair_lastHitFrame = 1
#const dspecialair_damage_info = DSpecialAir|8|110|50|84

// sideB
#const sspecial_IASA = calc(18 + 5 + 36)
#const sspecial_xOffset = 28
#const sspecial_yOffset = -14
#const sspecial_xRange = 6
#const sspecial_yRange = 8
#const sspecial_hitFrame = 17
#const sspecial_lastHitFrame = 20
#const sspecial_damage_info = SSpecial|3|68|60|60

#const sspecialair_IASA = calc(18 + 5 + 36)
#const sspecialair_xOffset = 28
#const sspecialair_yOffset = -14
#const sspecialair_xRange = 6
#const sspecialair_yRange = 8
#const sspecialair_hitFrame = 17
#const sspecialair_lastHitFrame = 20
#const sspecialair_damage_info = SSpecialAir|3|68|60|60

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 2
#const grab_yOffset = -1
#const grab_xRange = 5.5
#const grab_yRange = 4.5
#const grab_hitFrame = 7
#const grab_lastHitFrame = 8

#const grab_damage_info = Grab|0|0|0|0
#const fthrow_damage_info = Grab|2|54|135|45
#const dthrow_damage_info = Grab|3|70|50|55
#const bthrow_damage_info = Grab|5|70|58|60
#const uthrow_damage_info = Grab|2|70|100|77

// NAir
#const nair_IASA = 40
#const nair_xOffset = -6
#const nair_yOffset = 1
#const nair_xRange = 6.5
#const nair_yRange = 8
#const nair_hitFrame = 7
#const nair_lastHitFrame = 24
#const nair_damage_info = NAir|4|20|0|0


// FAir
#const fair_IASA = 30
#const fair_xOffset = -6
#const fair_yOffset = 7
#const fair_xRange = 10.5
#const fair_yRange = 13.5
#const fair_hitFrame = 11
#const fair_lastHitFrame = 14
#const fair_damage_info = FAir|15|25|100|70


// BAir
#const bair_IASA = 29
#const bair_xOffset = -16
#const bair_yOffset = -1
#const bair_xRange = 8.5
#const bair_yRange = 5.5
#const bair_hitFrame = 7
#const bair_lastHitFrame = 10
#const bair_damage_info = BAir|14|22|102|361

// UAir
#const uair_IASA = 30
#const uair_xOffset = -13
#const uair_yOffset = -1
#const uair_xRange = 14.5
#const uair_yRange = 12
#const uair_hitFrame = 7
#const uair_lastHitFrame = 11
#const uair_damage_info = UAir|11|20|100|57

// DAir
#const dair_IASA = 37
#const dair_xOffset = -5
#const dair_yOffset = 10
#const dair_xRange = 5.5
#const dair_yRange = 7
#const dair_hitFrame = 13
#const dair_lastHitFrame = 15
#const dair_damage_info = DAir|14|15|100|270