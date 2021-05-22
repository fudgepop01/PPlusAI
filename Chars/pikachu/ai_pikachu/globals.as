// globals are preprocessed variables that can be used anywhere
// they'll automatically be substituted for the variable or value
// they stand for.
//
// ex. in here, "move_xOffset" will always be replaced with "var9"

// defining attributes here as constants (just in case)
#const walkInitVel = 0.15
#const walkAcc = 0.1
#const walkMaxVel = 1.24
#const groundFric = 0.09
#const dashInitVel = 1.8
#const dashRunTermVel = 1.8
#const groundedMaxXVel = 3
#const dashCancelFrameWindow = 1
#const guardOnMaxMomentum = 0.96
#const jumpSquatFrames = 3
#const jumpXInitVel = 0.8
#const jumpYInitVel = 2.71
#const jumpYInitVelShort = 1.81
#const jumpXGroundMult = 0.8
#const fastFallSpeed = 2.7
#const gravity = 0.11
#const weight = 80
#const shieldSize = 7

#const maxYEdgeDistWithJump = 69
#const maxYEdgeDist = 58
#const maxYEdgeDistJumpNoUpB = 25
#const maxXEdgeDist = 60

#const oWalkingDist = 20
#const oJumpingDist = 15
#const shortEdgeRange = 10
#const edgeRange = 25
#const calloutSpeed = 0.3

#const jumpIfOWithin = 80
#const SHIfOBeyond = 7
#const FHIfOBeyond = 23
#const DJIfOWithin = 35
#const DJIfOBeyond = 23

#const techChaseCloseDist = 20
#const techChaseFarDist = 40

#const dashCountMax = 15
#const dashForceTurnFrame = 27
#const dashDanceMinFrames = 3
#const DDWaveDash = 0.1
#const DDMaxRange = 35

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
#const jab123_IASA = 17
#const jab123_xOffset = 1
#const jab123_yOffset = 0
#const jab123_xRange = 6
#const jab123_yRange = 4
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 3
#const jab123_damage_info = Jab123|2|7|50|0

// ftilt
#const ftilt_IASA = 30
#const ftilt_xOffset = 3
#const ftilt_yOffset = 0.5
#const ftilt_xRange = 6.5
#const ftilt_yRange = 4.7
#const ftilt_hitFrame = 5
#const ftilt_lastHitFrame = 9
#const ftilt_damage_info = FTilt|8|10|100|361

// utilt
#const utilt_IASA = 24
#const utilt_xOffset = -14
#const utilt_yOffset = 2.5
#const utilt_xRange = 13
#const utilt_yRange = 11
#const utilt_hitFrame = 7
#const utilt_lastHitFrame = 14
#const utilt_damage_info = UTilt|7|45|124|96

// dtilt
#const dtilt_IASA = 19
#const dtilt_xOffset = 7
#const dtilt_yOffset = 0
#const dtilt_xRange = 7
#const dtilt_yRange = 4
#const dtilt_hitFrame = 7
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|8|12|100|35

// fsmash, 14
#const fsmash_IASA = 51
#const fsmash_xOffset = 4
#const fsmash_yOffset = 1
#const fsmash_xRange = 10
#const fsmash_yRange = 4.5
#const fsmash_hitFrame = 19
#const fsmash_lastHitFrame = 21
#const fsmash_damage_info = FSmash|19|25|95|361

// usmash, 5
#const usmash_IASA = 46
#const usmash_xOffset = 0
#const usmash_yOffset = 0
#const usmash_xRange = 5.5
#const usmash_yRange = 11
#const usmash_hitFrame = 9
#const usmash_lastHitFrame = 11
#const usmash_damage_info = USmash|16|40|110|85

// dsmash, 5
#const dsmash_IASA = 57
#const dsmash_xOffset = 1
#const dsmash_yOffset = 1
#const dsmash_xRange = 1
#const dsmash_yRange = 1
#const dsmash_hitFrame = 7
#const dsmash_lastHitFrame = 25
#const dsmash_damage_info = DSmash|3|70|170|70

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
#const sspecial_IASA = 9999.9999
#const sspecial_xOffset = 9999.9999
#const sspecial_yOffset = 9999.9999
#const sspecial_xRange = 9999.9999
#const sspecial_yRange = 9999.9999
#const sspecial_hitFrame = 9999.9999
#const sspecial_lastHitFrame = 9999.9999

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
#const fthrow_damage_info = Grab|2|45|110|45
#const dthrow_damage_info = Grab|5|80|56|75
#const bthrow_damage_info = Grab|9|75|50|45
#const uthrow_damage_info = Grab|5|90|45|90

// NAir
#const nair_IASA = 41
#const nair_xOffset = -5
#const nair_yOffset = 0
#const nair_xRange = 5
#const nair_yRange = 5
#const nair_hitFrame = 3
#const nair_lastHitFrame = 10
#const nair_damage_info = NAir|12|18|100|361

#const mv_nair_weak = 1
#const nair_weak_hitFrame = 11
#const nair_weak_lastHitFrame = 28
#const app_nair_damage_info = NAir|9|0|100|361


// FAir
#const fair_IASA = 41
#const fair_xOffset = -6
#const fair_yOffset = -0.5
#const fair_xRange = 8.3
#const fair_yRange = 5
#const fair_hitFrame = 22
#const fair_lastHitFrame = 27
#const fair_damage_info = FAir|3|70|90|361


// BAir
#const bair_IASA = 33
#const bair_xOffset = -18
#const bair_yOffset = -1.450
#const bair_xRange = 7.3
#const bair_yRange = 6
#const bair_hitFrame = 8
#const bair_lastHitFrame = 9
#const bair_damage_info = BAir|14|25|100|361

// UAir
#const uair_IASA = 30
#const uair_xOffset = -13
#const uair_yOffset = -3.4
#const uair_xRange = 6.25
#const uair_yRange = 10
#const uair_hitFrame = 3
#const uair_lastHitFrame = 4
#const uair_damage_info = UAir|7|100|41|80

#const mv_uair_mid = 1
#const uair_mid_xOffset = -6.75
#const uair_mid_yOffset = 0
#const uair_mid_xRange = 6.25
#const uair_mid_yRange = 4
#const uair_mid_hitFrame = 5
#const uair_mid_lastHitFrame = 6
#const uair_mid_damage_info = UAir|7|60|41|0

#const mv_uair_end = 2
#const uair_end_xOffset = -1.5
#const uair_end_yOffset = -3.4
#const uair_end_xRange = 6.25
#const uair_end_yRange = 10
#const uair_end_hitFrame = 7
#const uair_end_lastHitFrame = 8
#const uair_end_damage_info = UAir|7|80|41|130

// DAir
#const dair_IASA = 43
#const dair_xOffset = -6
#const dair_yOffset = 10
#const dair_xRange = 5
#const dair_yRange = 9
#const dair_hitFrame = 14
#const dair_lastHitFrame = 26
#const dair_damage_info = DAir|12|20|100|361