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
#const jumpXGroundMult = 1
#const fastFallSpeed = 2.5
#const gravity = 0.125
#const weight = 94
#const shieldSize = 8.6

#const maxYEdgeDistWithJump = 65
#const maxYEdgeDist = 45
#const oWalkingDist = 10
#const shortEdgeRange = 10
#const edgeRange = 25
#const calloutSpeed = 0.3

#const jumpIfOWithin = 90
#const SHIfOBeyond = 15
#const FHIfOBeyond = 20
#const DJIfOWithin = 50
#const DJIfOBeyond = 35

#const techChaseCloseDist = 10
#const techChaseFarDist = 25

#const dashCountMax = 20
#const dashForceTurnFrame = 27
#const dashDanceMinFrames = 3
#const DDWaveDash = 0.2

#const minBaseReactionTime = 0
#const maxBaseReactionTime = 21

#const killComboThreshold = 70

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
#const at_throwOut = 4
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

// dashattack
#const DA_IASA = 38
#const DA_xOffset = -1
#const DA_yOffset = -4
#const DA_xRange = 8.4
#const DA_yRange = 3.85
#const DA_hitFrame = 6
#const DA_lastHitFrame = 15

// ftilt
#const ftilt_IASA = 27
#const ftilt_xOffset = 1
#const ftilt_yOffset = -5.650
#const ftilt_xRange = 6.4
#const ftilt_yRange = 3.850
#const ftilt_hitFrame = 10
#const ftilt_lastHitFrame = 14

// utilt
#const utilt_IASA = 28
#const utilt_xOffset = -12
#const utilt_yOffset = 1
#const utilt_xRange = 12.4
#const utilt_yRange = 12.85
#const utilt_hitFrame = 5
#const utilt_lastHitFrame = 14

// dtilt
#const dtilt_IASA = 26
#const dtilt_xOffset = 1
#const dtilt_yOffset = 1
#const dtilt_xRange = 8.55
#const dtilt_yRange = 3.85
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 8

// fsmash
#const fsmash_IASA = 51
#const fsmash_xOffset = 6
#const fsmash_yOffset = -2
#const fsmash_xRange = 10.55
#const fsmash_yRange = 6
#const fsmash_hitFrame = 20
#const fsmash_lastHitFrame = 24

// usmash
#const mv_usmash_cancel = 1

#const usmash_IASA = 26
#const usmash_xOffset = 1
#const usmash_yOffset = 0
#const usmash_xRange = 4.55
#const usmash_yRange = 19.6
#const usmash_hitFrame = 11
#const usmash_lastHitFrame = 24

// dsmash
#const dsmash_IASA = 52
#const dsmash_xOffset = -17
#const dsmash_yOffset = -1
#const dsmash_xRange = 16
#const dsmash_yRange = 4.6
#const dsmash_hitFrame = 13
#const dsmash_lastHitFrame = 18

// noochB
#const mv_ASC = 1

#const nspecial_IASA = 26
#const nspecial_xOffset = 8
#const nspecial_yOffset = -3
#const nspecial_xRange = 69 // nice
#const nspecial_yRange = 5
#const nspecial_hitFrame = 8
#const nspecial_lastHitFrame = 8

#const nspecial_start_xRange = 90
#const nspecial_start_yRange = 10
#const nspecial_start_yOffset = 5

#const mv_aurabomb = 2
#const nspecial_aurabomb_xOffset = 0
#const nspecial_aurabomb_yOffset = 4
#const nspecial_aurabomb_yRange = 10

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

// NAir
#const nair_IASA = 54
#const nair_xOffset = -10
#const nair_yOffset = -1.5
#const nair_xRange = 9.5
#const nair_yRange = 4.6
#const nair_hitFrame = 9
#const nair_lastHitFrame = 15

#const mv_nair_mid = 1
#const nair_mid_hitFrame = 16
#const nair_mid_lastHitFrame = 28

#const mv_nair_weak = 2
#const nair_weak_hitFrame = 29
#const nair_weak_lastHitFrame = 41

// FAir
#const fair_IASA = 31
#const fair_xOffset = 0
#const fair_yOffset = 1
#const fair_xRange = 7.5
#const fair_yRange = 4.6
#const fair_hitFrame = 6
#const fair_lastHitFrame = 12

#const mv_fair_scoop = 1
#const fair_scoop_xOffset = 0
#const fair_scoop_yOffset = 3
#const fair_scoop_xRange = 3.5
#const fair_scoop_yRange = 7.6
#const fair_scoop_hitFrame = 4
#const fair_scoop_lastHitFrame = 5

// BAir
#const bair_IASA = 33
#const bair_xOffset = -16
#const bair_yOffset = 0
#const bair_xRange = 7
#const bair_yRange = 5
#const bair_hitFrame = 10
#const bair_lastHitFrame = 13

// UAir
#const uair_IASA = 29
#const uair_xOffset = -4
#const uair_yOffset = -6
#const uair_xRange = 4
#const uair_yRange = 7
#const uair_hitFrame = 7
#const uair_lastHitFrame = 10

// DAir
#const dair_IASA = 29
#const dair_xOffset = -4
#const dair_yOffset = 10
#const dair_xRange = 4
#const dair_yRange = 7
#const dair_hitFrame = 4
#const dair_lastHitFrame = 12
