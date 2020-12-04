// globals are preprocessed variables that can be used anywhere
// they'll automatically be substituted for the variable or value
// they stand for.
//
// ex. in here, "move_xOffset" will always be replaced with "var9"

// if you're looking for various quirks in brawl's coding that requires
// you to do certain things, scroll to the bottom of this file

#let globTempVar = var17

// used when planning / executing moves
#let move_xOffset = var9
#let move_yOffset = var10
#let move_xRange = var11
#let move_yRange = var12
#let move_hitFrame = var13
#let move_length = var14
#let move_IASA = var15

#let move_knockback = var16

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


#let noCombo = var19
#const noComboVal = 256

#const mv_edgeguard = 255
#const mv_ledgeRefresh = 254
#const mv_throwOut = 253

// AI "mode" values
#const md_attack = 1
#const md_defend = 2

// AI taunt values
#const utaunt = 1
#const staunt = 2
#const dtaunt = 3

// controls the approach the AI uses. It's okay because MOVES shouldn't care
// about what script was called previously - only what move they are.
#let approachType = var21
#const at_attack = 1 // default
#const at_defend = 2

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

// jab123
#const mv_gentlemen = 0
#const mv_jabReset = 1

#const jab123_IASA = 14
#const jab123_xOffset = 4
#const jab123_yOffset = -7
#const jab123_xRange = 12
#const jab123_yRange = 6
#const jab123_hitFrame = 3
#const jab123_length = 3

// ftilt
#const ftilt_IASA = 30
#const ftilt_xOffset = 0
#const ftilt_yOffset = -5
#const ftilt_xRange = 20
#const ftilt_yRange = 5
#const ftilt_hitFrame = 9
#const ftilt_length = 3


// utilt
#const utilt_IASA = 38
#const utilt_xOffset = 8
#const utilt_yOffset = -7
#const utilt_xRange = 15
#const utilt_yRange = 10
#const utilt_hitFrame = 17
#const utilt_length = 6

// dtilt
#const dtilt_IASA = 35
#const dtilt_xOffset = 5
#const dtilt_yOffset = 0
#const dtilt_xRange = 15
#const dtilt_yRange = 5
#const dtilt_hitFrame = 10
#const dtilt_length = 6

// fsmash
#const fsmash_IASA = 49
#const fsmash_xOffset = 7
#const fsmash_yOffset = -5
#const fsmash_xRange = 17
#const fsmash_yRange = 6
#const fsmash_hitFrame = 19
#const fsmash_length = 3

// usmash
#const usmash_IASA = 32
#const usmash_xOffset = 1
#const usmash_yOffset = -20
#const usmash_xRange = 11
#const usmash_yRange = 15
#const usmash_hitFrame = 22
#const usmash_length = 8

// dsmash
// #const dsmash_IASA = 45
// #const dsmash_xOffset = 0
// #const dsmash_yOffset = 3
// #const dsmash_xRange = 24
// #const dsmash_yRange = 3
// #const dsmash_yRange = 3
// #const usmash_length = 8


// sideB
#const sspecial_IASA = 26
#const sspecial_xOffset = 20
#const sspecial_yOffset = 0
#const sspecial_xRange = 20
#const sspecial_yRange = 6
#const sspecial_hitFrame = 20
#const sspecial_length = 1

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
#const grab_xOffset = 4
#const grab_yOffset = -8
#const grab_xRange = 5
#const grab_yRange = 2
#const grab_hitFrame = 7
#const grab_length = 2

// tells when an aerial should be falling & low to the ground
#const mv_lowAerial = 254

// NAir
#const nair_IASA = 45
#const nair_xOffset = 17
#const nair_yOffset = -3
#const nair_xRange = 10
#const nair_yRange = 3
#const nair_hitFrame = 14
#const nair_length = 6

#const mv_approachingNair = 1
#const app_nair_xOffset = 5
#const app_nair_yOffset = -3
#const app_nair_xRange = 35
#const app_nair_hitFrame = 11

#const mv_nairHit2 = 2
#const nairHit2_hitFrame = 20
#const nairHit2_length = 9

// FAir
#const fair_IASA = 36
#const fair_xOffset = 8
#const fair_yOffset = -6
#const fair_xRange = 6
#const fair_yRange = 4
#const fair_hitFrame = 14
#const fair_length = 3

// BAir
#const bair_IASA = 29
#const bair_xOffset = -7
#const bair_yOffset = -5
#const bair_xRange = 10
#const bair_yRange = -4
#const bair_hitFrame = 10
#const bair_length = 8

// UAir
#const uair_IASA = 30
#const uair_xOffset = 5
#const uair_yOffset = -16
#const uair_xRange = 10
#const uair_yRange = 8
#const uair_hitFrame = 6
#const uair_length = 8

// DAir
#const dair_IASA = 38
#const dair_xOffset = 0
#const dair_yOffset = -14
#const dair_xRange = 10
#const dair_yRange = 10
#const dair_hitFrame = 16
#const dair_length = 5


//___________________________
// quirks
//-------
// any script that is called with the Call command MUST
// end with TWO Return statements otherwise it will crash.
