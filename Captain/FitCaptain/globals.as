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

#const maxYEdgeDistWithJump = 65
#const maxYEdgeDist = 45
#const oWalkingDist = 10
#const shortEdgeRange = 10
#const edgeRange = 25
#const calloutSpeed = 0.3

#const jumpIfOWithin = 70
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

#const killComboThreshold = 80

#let globTempVar = var17

// used when planning / executing moves
#let move_xOffset = var9
#let move_yOffset = var10
#let move_xRange = var11
#let move_yRange = var12
#let move_hitFrame = var13
#let move_lastHitFrame = var14
#let move_IASA = var15


// recorded after the move is executed / hits;
// will not interfere with move position type
#let hit_knockback = var16


// used in various places to tell what part the routine should jump to
// effectively used to communicate between scripts
#let movePart = var18
// what variation of the move to use. Important when a move
// has multiple or complex uses (such as grab)
#let moveVariant = var19
// used in many places to store what the last attack was.
// must be set manually.
#let lastAttack = var20
// I don't think I've used this once - but it might be important
// at some point so I'll keep it around.
#let lastScript = var21

// used when planning combos / tech chases
// (currently unused)
// it's okay that there's some overlap because you would only use these
// when calculating what move to use, not when attempting to get to the
// opponent
#let oWeight = var9
#let oGravity = var10
#let oRollFVulFrame = var11
#let oRollBVulFrame = var12
#let oGetupVulFrame = var13
#let oGetupFVulFrame = var14
#let oGetupBVulFrame = var15

#const techRollVulFrame = 21

#const valJab123 = 24625
#const valFTilt = 24626
#const valUTilt = 24627
#const valDTilt = 24628
#const valFSmash = 24629
#const valUSmash = 24630
#const valDSmash = 24631
#const valNSp = 24632
#const valSSp = 24633
#const valUSp = 24634
#const valDSp = 24635
#const valGrab = 24636

#const valNAir = 24641
#const valFAir = 24642
#const valBAir = 24643
#const valUAir = 24644
#const valDAir = 24645
#const valNSpAir = 24646
#const valSSpAir = 24647
#const valUSpAir = 24648
#const valDSpAir = 24649

#let noCombo = var19
#const noComboVal = 256

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

// the following is the data that I give the AI that allows it to determine
// where it should be before performing an attack.
// it will attempt to a point with these parameters in
// 1.as, and if it does, it'll perform the action provided

// this works because it's used exclusively in 1.as and aerial attacks
// where it's used IMMEDIATELY before being modified
#let shouldFastFall = var2

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

// ftilt
#const ftilt_IASA = 30
#const ftilt_xOffset = 1
#const ftilt_yOffset = -9
#const ftilt_xRange = 9
#const ftilt_yRange = 3
#const ftilt_hitFrame = 9
#const ftilt_lastHitFrame = 11

// utilt
#const utilt_IASA = 38
#const utilt_xOffset = 1
#const utilt_yOffset = 2
#const utilt_xRange = 7
#const utilt_yRange = 13
#const utilt_hitFrame = 17
#const utilt_lastHitFrame = 22

// dtilt
#const dtilt_IASA = 35
#const dtilt_xOffset = 1
#const dtilt_yOffset = 0
#const dtilt_xRange = 10
#const dtilt_yRange = 5
#const dtilt_hitFrame = 10
#const dtilt_lastHitFrame = 15

// fsmash
#const fsmash_IASA = 49
#const fsmash_xOffset = 3
#const fsmash_yOffset = -7
#const fsmash_xRange = 8
#const fsmash_yRange = 3
#const fsmash_hitFrame = 19
#const fsmash_lastHitFrame = 21

// usmash
#const usmash_IASA = 41
#const usmash_xOffset = -1
#const usmash_yOffset = -3
#const usmash_xRange = 6
#const usmash_yRange = 13
#const usmash_hitFrame = 22
#const usmash_lastHitFrame = 29

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

// sideB
#const sspecial_IASA = 9999.9999
#const sspecial_xOffset = 9999.9999
#const sspecial_yOffset = 9999.9999
#const sspecial_xRange = 9999.9999
#const sspecial_yRange = 9999.9999
#const sspecial_hitFrame = 9999.9999
#const sspecial_lastHitFrame = 9999.9999

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
#const sspecial_xOffset = 0
#const sspecial_yOffset = 0
#const sspecial_xRange = 20
#const sspecial_yRange = 10
#const sspecial_hitFrame = 20
#const sspecial_lastHitFrame = 20 // just a dummy

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

#const grab_IASA = 32
#const grab_xOffset = 1
#const grab_yOffset = -6
#const grab_xRange = 3
#const grab_yRange = 4
#const grab_hitFrame = 7
#const grab_lastHitFrame = 8

// NAir
#const nair_IASA = 45
#const nair_xOffset = -4
#const nair_yOffset = -3
#const nair_xRange = 10
#const nair_yRange = 3
#const nair_hitFrame = 7
#const nair_lastHitFrame = 12

#const mv_approachingNair = 1
#const app_nair_xOffset = -4
#const app_nair_yOffset = -3
#const app_nair_xRange = 25
#const app_nair_hitFrame = 7
#const app_nair_lastHitFrame = 29

#const mv_nairHit2 = 2
#const nairHit2_hitFrame = 20
#const nairHit2_lastHitFrame = 29

// FAir
#const fair_IASA = 36
#const fair_xOffset = 1
#const fair_yOffset = 0
#const fair_xRange = 6
#const fair_yRange = 6
#const fair_hitFrame = 14
#const fair_lastHitFrame = 16

#const mv_fair_weak = 1
#const fair_weak_hitFrame = 17
#const fair_weak_lastHitFrame = 30

// BAir
#const bair_IASA = 29
#const bair_xOffset = -15
#const bair_yOffset = -2
#const bair_xRange = 7
#const bair_yRange = 4
#const bair_hitFrame = 10
#const bair_lastHitFrame = 17

// UAir
#const uair_IASA = 30
#const uair_xOffset = 0
#const uair_yOffset = -3
#const uair_xRange = 8
#const uair_yRange = 8
#const uair_hitFrame = 6
#const uair_lastHitFrame = 10

#const mv_uair_tipman = 1
#const uair_tipman_xOffset = -8
#const uair_tipman_yOffset = -3
#const uair_tipman_xRange = 8
#const uair_tipman_yRange = 8
#const uair_tipman_hitFrame = 11
#const uair_tipman_lastHitFrame = 13

// DAir
#const dair_IASA = 38
#const dair_xOffset = -4
#const dair_yOffset = 10
#const dair_xRange = 5
#const dair_yRange = 12
#const dair_hitFrame = 16
#const dair_lastHitFrame = 20


//___________________________
// quirks
//-------
// any script that is called with the Call command MUST
// end with TWO Return statements otherwise it will crash.
