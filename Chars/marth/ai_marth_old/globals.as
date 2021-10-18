// defining attributes here as constants (just in case)
#const walkInitVel = 0.15
#const walkAcc = 0
#const walkMaxVel = 1.6
#const groundFric = 0.06
#const dashInitVel = 1.5
#const dashRunTermVel = 1.8
#const groundedMaxXVel = 3
#const dashCancelFrameWindow = 1
#const guardOnMaxMomentum = 0.75
#const jumpSquatFrames = 4
#const jumpXInitVel = 1
#const jumpYInitVel = 2.485
#const jumpYInitVelShort = 1.585
#const jumpXGroundMult = 0.8
#const fastFallSpeed = 2.5
#const gravity = 0.0.085
#const weight = 87
#const shieldSize = 9.8

#const maxYEdgeDistWithJump = 85
#const maxYEdgeDist = 66
#const maxYEdgeDistJumpNoUpB = 25
#const maxXEdgeDist = 40

#const oWalkingDist = 20
#const oJumpingDist = 15
#const shortEdgeRange = 10
#const edgeRange = 25
#const calloutSpeed = 0.3

#const jumpIfOWithin = 70
#const SHIfOBeyond = 7
#const FHIfOBeyond = 20
#const DJIfOWithin = 35
#const DJIfOBeyond = 15

#const techChaseCloseDist = 20
#const techChaseFarDist = 40

#const dashCountMax = 40
#const dashForceTurnFrame = 13
#const dashDanceMinFrames = 3
#const DDWaveDash = 0.5
#const DDMaxRange = 150

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
#const jab123_IASA = 26
#const jab123_xOffset = 2
#const jab123_yOffset = 1
#const jab123_xRange = 12.5
#const jab123_yRange = 12
#const jab123_hitFrame = 4
#const jab123_lastHitFrame = 7
#const jab123_damage_info = Jab123|6|30|60|361

// dashattack
#const dashattack_IASA = 41
#const dashattack_xOffset = 22
#const dashattack_yOffset = 1
#const dashattack_xRange = 12
#const dashattack_yRange = 9
#const dashattack_hitFrame = 12
#const dashattack_lastHitFrame = 15
#const dashattack_damage_info = DashAttack|12|70|55|110

#const gen_xOffset = -70
#const gen_yOffset = 50
#const gen_xRange = 70
#const gen_yRange = 50

// ftilt
#const ftilt_IASA = 36
#const ftilt_xOffset = 4
#const ftilt_yOffset = 1
#const ftilt_xRange = 13
#const ftilt_yRange = 13.5
#const ftilt_hitFrame = 7
#const ftilt_lastHitFrame = 10
#const ftilt_damage_info = FTilt|13|70|60|361

// utilt
#const utilt_IASA = 32
#const utilt_xOffset = -11
#const utilt_yOffset = -1
#const utilt_xRange = 16.5
#const utilt_yRange = 12.5
#const utilt_hitFrame = 6
#const utilt_lastHitFrame = 12
#const utilt_damage_info = UTilt|12|50|100|110

// dtilt
#const dtilt_IASA = 20
#const dtilt_xOffset = 8
#const dtilt_yOffset = 2
#const dtilt_xRange = 10.5
#const dtilt_yRange = 6
#const dtilt_hitFrame = 7
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|10|50|40|30

// fsmash, 4
#const fsmash_IASA = calc(46 + 3)
#const fsmash_xOffset = 5
#const fsmash_yOffset = 3
#const fsmash_xRange = 14.5
#const fsmash_yRange = 16
#const fsmash_hitFrame = calc(8 + 3)
#const fsmash_lastHitFrame = calc(11 + 3)
#const fsmash_damage_info = FSmash|20|80|70|361

// usmash, 3
#const usmash_IASA = calc(42 + 5)
#const usmash_xOffset = -4
#const usmash_yOffset = -4
#const usmash_xRange = 4
#const usmash_yRange = 14
#const usmash_hitFrame = calc(9 + 5)
#const usmash_lastHitFrame = calc(13 + 5)
#const usmash_damage_info = USmash|18|60|80|90

// dsmash, 3
#const dsmash_IASA = calc(59 + 4)
#const dsmash_xOffset = -21
#const dsmash_yOffset = 2
#const dsmash_xRange = 24
#const dsmash_yRange = 6
#const dsmash_hitFrame = calc(2 + 4)
#const dsmash_lastHitFrame = calc(19 + 4)
#const dsmash_damage_info = DSmash|16|70|100|70

// noochB
// #const nspecial_IASA = 45
// #const nspecial_xOffset = 11
// #const nspecial_yOffset = -3
// #const nspecial_xRange = 42
// #const nspecial_yRange = 4
// #const nspecial_hitFrame = 15
// #const nspecial_lastHitFrame = 108
// #const nspecial_damage_info = NSpecial|3|w5|100|361

// #const nspecialair_IASA = 45
// #const nspecialair_xOffset = 4
// #const nspecialair_yOffset = -2
// #const nspecialair_xRange = 55
// #const nspecialair_yRange = 8
// #const nspecialair_hitFrame = 15
// #const nspecialair_lastHitFrame = 108
// #const nspecialair_damage_info = NSpecialAir|3|w5|100|361


// upB
// #const uspecial_IASA = 9999.9999
// #const uspecial_xOffset = -5
// #const uspecial_yOffset = -1
// #const uspecial_xRange = 5
// #const uspecial_yRange = 43
// #const uspecial_hitFrame = 44
// #const uspecial_lastHitFrame = 66
// #const uspecial_damage_info = USpecial|16|80|60|80

// downB
// #const dspecial_IASA = 5
// #const dspecial_xOffset = -8
// #const dspecial_yOffset = 2
// #const dspecial_xRange = 8
// #const dspecial_yRange = 8
// #const dspecial_hitFrame = 1
// #const dspecial_lastHitFrame = 1
// #const dspecial_damage_info = DSpecial|8|110|50|84

// #const dspecialair_IASA = 5
// #const dspecialair_xOffset = -8
// #const dspecialair_yOffset = 2
// #const dspecialair_xRange = 8
// #const dspecialair_yRange = 8
// #const dspecialair_hitFrame = 1
// #const dspecialair_lastHitFrame = 1
// #const dspecialair_damage_info = DSpecialAir|8|110|50|84

// sideB
// #const sspecial_IASA = calc(18 + 5 + 36)
// #const sspecial_xOffset = 28
// #const sspecial_yOffset = -14
// #const sspecial_xRange = 6
// #const sspecial_yRange = 8
// #const sspecial_hitFrame = 17
// #const sspecial_lastHitFrame = 20
// #const sspecial_damage_info = SSpecial|3|68|60|60

// #const sspecialair_IASA = calc(18 + 5 + 36)
// #const sspecialair_xOffset = 28
// #const sspecialair_yOffset = -14
// #const sspecialair_xRange = 6
// #const sspecialair_yRange = 8
// #const sspecialair_hitFrame = 17
// #const sspecialair_lastHitFrame = 20
// #const sspecialair_damage_info = SSpecialAir|3|68|60|60

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 4
#const grab_yOffset = -5
#const grab_xRange = 7
#const grab_yRange = 4
#const grab_hitFrame = 7
#const grab_lastHitFrame = 8

#const grab_damage_info = Grab|0|0|0|0
#const fthrow_damage_info = Grab|4|70|45|50
#const dthrow_damage_info = Grab|5|65|50|-50
#const bthrow_damage_info = Grab|4|70|60|-63
#const uthrow_damage_info = Grab|4|60|130|87

// NAir
#const nair_IASA = 50
#const nair_xOffset = -4
#const nair_yOffset = 5
#const nair_xRange = 11
#const nair_yRange = 5
#const nair_hitFrame = 6
#const nair_lastHitFrame = 7
#const nair_damage_info = NAir|4|30|40|100

#const mv_nair_hit2 = 1
#const nair_xOffset = -17
#const nair_yOffset = -1
#const nair_xRange = 17
#const nair_yRange = 10.5
#const nair_hitFrame = 15
#const nair_lastHitFrame = 21
#const nair_damage_info = NAir|10|50|80|361

// FAir
#const fair_IASA = 30
#const fair_xOffset = -2
#const fair_yOffset = 7
#const fair_xRange = 11
#const fair_yRange = 16
#const fair_hitFrame = 4
#const fair_lastHitFrame = 7
#const fair_damage_info = FAir|13|42|70|67

// BAir
#const bair_IASA = 35
#const bair_xOffset = -23
#const bair_yOffset = 2
#const bair_xRange = 12.5
#const bair_yRange = 14.5
#const bair_hitFrame = 7
#const bair_lastHitFrame = 11
#const bair_damage_info = BAir|13|30|70|361

// UAir
#const uair_IASA = 44
#const uair_xOffset = -14
#const uair_yOffset = -9
#const uair_xRange = 15.5
#const uair_yRange = 10
#const uair_hitFrame = 5
#const uair_lastHitFrame = 8
#const uair_damage_info = UAir|13|40|70|90

// DAir
#const dair_IASA = 60
#const dair_xOffset = -17
#const dair_yOffset = 8
#const dair_xRange = 15.5
#const dair_yRange = 10.5
#const dair_hitFrame = 6
#const dair_lastHitFrame = 9
#const dair_damage_info = DAir|13|40|70|290