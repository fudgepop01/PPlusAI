// globals are preprocessed variables that can be used anywhere
// they'll automatically be substituted for the variable or value
// they stand for.
//
// ex. in here, "move_xOffset" will always be replaced with "var9"

// defining attributes here as constants (just in case)
#const walkInitVel = 0.3
#const walkAcc = 0.1
#const walkMaxVel = 1
#const groundFric = 0.04
#const dashInitVel = 1.4
#const dashRunTermVel = 1.4
#const groundedMaxXVel = 3
#const dashCancelFrameWindow = 1
#const guardOnMaxMomentum = 0.75
#const jumpSquatFrames = 3
#const jumpXInitVel = 0.9
#const jumpYInitVel = 2.382
#const jumpYInitVelShort = 1.482
#const jumpXGroundMult = 0.7
#const fastFallSpeed = 2.3
#const gravity = 0.082
#const weight = 90
#const shieldSize = 8.64

#const maxYEdgeDistWithJump = 80
#const maxYEdgeDist = 40
#const maxYEdgeDistJumpNoUpB = 60
#const maxXEdgeDist = 35

#const oWalkingDist = 15
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

#const dashCountMax = 14
#const dashForceTurnFrame = 17
#const dashDanceMinFrames = 3
#const DDWaveDash = 0.6
#const DDMaxRange = 55

#const minBaseReactionTime = 0
#const maxBaseReactionTime = 21

#const killComboThreshold = 80

#const at_hover = 255
#const at_teleport = 254

// the following is the data that I give the AI that allows it to determine
// where it should be before performing an attack.
// it will attempt to a point with these parameters in
// 1.as, and if it does, it'll perform the action provided

// jab123
#const mv_gentlemen = 0
#const mv_jabReset = 1

#const jab123_IASA = 18
#const jab123_xOffset = 4
#const jab123_yOffset = -6
#const jab123_xRange = 6
#const jab123_yRange = 4
#const jab123_hitFrame = 8
#const jab123_lastHitFrame = 9
#const jab123_damage_info = Jab123|6|w35|100|83

// ftilt
#const ftilt_IASA = 29
#const ftilt_xOffset = 5
#const ftilt_yOffset = -3
#const ftilt_xRange = 10
#const ftilt_yRange = 4
#const ftilt_hitFrame = 6
#const ftilt_lastHitFrame = 8
#const ftilt_damage_info = FTilt|10|40|80|361

// utilt
#const utilt_IASA = 28
#const utilt_xOffset = -6
#const utilt_yOffset = 2
#const utilt_xRange = 10
#const utilt_yRange = 16
#const utilt_hitFrame = 6
#const utilt_lastHitFrame = 13
#const utilt_damage_info = UTilt|8|25|134|78

// dtilt
#const dtilt_IASA = 20
#const dtilt_xOffset = 2
#const dtilt_yOffset = 0
#const dtilt_xRange = 11
#const dtilt_yRange = 4
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 7
#const dtilt_damage_info = DTilt|8|40|80|80

// fsmash
// #const fsmash_startup = 14
#const fsmash_IASA = 39
#const fsmash_xOffset = 20
#const fsmash_yOffset = -4
#const fsmash_xRange = 5
#const fsmash_yRange = 5
#const fsmash_hitFrame = 19
#const fsmash_lastHitFrame = 22
#const fsmash_damage_info = FSmash|20|30|80|361

// usmash
// #const usmash_startup = 2
#const usmash_IASA = 61
#const usmash_xOffset = -10
#const usmash_yOffset = -6
#const usmash_xRange = 10
#const usmash_yRange = 9
#const usmash_hitFrame = 8
#const usmash_lastHitFrame = 35
#const usmash_damage_info = USmash|10|40|118|90

// dsmash
// #const dsmash_startup = 17
#const dsmash_IASA = 27
#const dsmash_xOffset = 8
#const dsmash_yOffset = 3
#const dsmash_xRange = 6
#const dsmash_yRange = 6
#const dsmash_hitFrame = 21
#const dsmash_lastHitFrame = 23
#const dsmash_damage_info = DSmash|17|30|103|361

// neutral B
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

// sideB
#const sspecial_IASA = 49
#const sspecial_xOffset = 0
#const sspecial_yOffset = 0
#const sspecial_xRange = 20
#const sspecial_yRange = 10
#const sspecial_hitFrame = 20
#const sspecial_lastHitFrame = 20
#const sspecial_damage_info = SSpecial|10|65|64|87

// upB
#const uspecial_IASA = 26
#const uspecial_xOffset = 0
#const uspecial_yOffset = 0
#const uspecial_xRange = 20
#const uspecial_yRange = 10
#const uspecial_hitFrame = 20
#const uspecial_lastHitFrame = 20

// downB
#const dspecial_IASA = 26
#const dspecial_xOffset = 5
#const dspecial_yOffset = -10
#const dspecial_xRange = 11
#const dspecial_yRange = 3
#const dspecial_hitFrame = 20
#const dspecial_lastHitFrame = 20

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 3
#const grab_yOffset = -3
#const grab_xRange = 5
#const grab_yRange = 6
#const grab_hitFrame = 7
#const grab_lastHitFrame = 8

#const grab_damage_info = Grab|0|0|0|0
#const fthrow_damage_info = Grab|1|40|104|72
#const dthrow_damage_info = Grab|6|65|50|69
#const bthrow_damage_info = Grab|11|70|80|45
#const uthrow_damage_info = Grab|12|100|67|90

// common aerial variant
#const mv_hc = 1

// NAir
#const nair_IASA = 42
#const nair_xOffset = -9
#const nair_yOffset = 1
#const nair_xRange = 8
#const nair_yRange = 6
#const nair_hitFrame = 5
#const nair_lastHitFrame = 38
#const nair_damage_info = NAir|4|70|80|361

#const nair_hc_lastHitFrame = 30
#const nair_hc_damage_info = NAir|2|w20|100|160

// FAir
#const fair_IASA = 37
#const fair_xOffset = 3
#const fair_yOffset = 3
#const fair_xRange = 5
#const fair_yRange = 5
#const fair_hitFrame = 6
#const fair_lastHitFrame = 8
#const fair_damage_info = FAir|14|40|100|84

// BAir
#const bair_IASA = 29
#const bair_xOffset = -21
#const bair_yOffset = 5
#const bair_xRange = 9
#const bair_yRange = 10
#const bair_hitFrame = 8
#const bair_lastHitFrame = 11
#const bair_damage_info = BAir|11|20|100|361

// UAir
#const uair_IASA = 30
#const uair_xOffset = -14
#const uair_yOffset = -7
#const uair_xRange = 18
#const uair_yRange = 8
#const uair_hitFrame = 8
#const uair_lastHitFrame = 12
#const uair_damage_info = UAir|12|0|100|55

// DAir
#const dair_IASA = 44
#const dair_xOffset = -8
#const dair_yOffset = 10
#const dair_xRange = 8
#const dair_yRange = 7
#const dair_hitFrame = 15
#const dair_lastHitFrame = 19
#const dair_damage_info = DAir|16|20|100|270

//___________________________
// quirks
//-------
// any script that is called with the Call command MUST
// end with TWO Return statements otherwise it will crash.
