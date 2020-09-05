// globals are preprocessed variables that can be used anywhere
// they'll automatically be substituted for the variable or value
// they stand for.
//
// ex. in here, "move_xOffset" will always be replaced with "var9"

// if you're looking for various quirks in brawl's coding that requires
// you to do certain things, scroll to the bottom of this file

// used when planning / executing moves
#let move_xOffset = var9
#let move_yOffset = var10
#let move_xRange = var11
#let move_yRange = var12
#let move_hitFrame = var13
#let move_IASA = var14

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
#const noComboVal = 255

#const mv_edgeguard = 255

// the following is the data that I give the AI that allows it to determine
// where it should be before performing an attack.
// it will attempt to a point with these parameters in
// 1.as, and if it does, it'll perform the action provided

// jab123
#const jab123_IASA = 14
#const jab123_xOffset = 2
#const jab123_yOffset = 0
#const jab123_xRange = 20
#const jab123_yRange = 5
#const jab123_dist1 = 6

// ftilt
#const ftilt_IASA = 30
#const ftilt_xOffset = 7
#const ftilt_yOffset = 10
#const ftilt_xRange = 25
#const ftilt_yRange = 10
#const ftilt_dist1 = 20

// utilt
#const utilt_IASA = 38
#const utilt_xOffset = 7
#const utilt_yOffset = 10
#const utilt_xRange = 15
#const utilt_yRange = 10
#const utilt_dist1 = 30

// dtilt
#const dtilt_IASA = 35
#const dtilt_xOffset = 5
#const dtilt_yOffset = 0
#const dtilt_xRange = 15
#const dtilt_yRange = 5
#const dtilt_dist1 = 20

// fsmash
#const fsmash_IASA = 49
#const fsmash_xOffset = 5
#const fsmash_yOffset = 5
#const fsmash_xRange = 10
#const fsmash_yRange = 10
#const fsmash_dist1 = 13

// usmash
#const usmash_IASA = 32
#const usmash_xOffset = 4
#const usmash_yOffset = 10
#const usmash_xRange = 13
#const usmash_yRange = 25
#const usmash_dist1 = 13

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
#const grab_xOffset = 0
#const grab_yOffset = 1
#const grab_xRange = 7
#const grab_yRange = 2
#const grab_dist1 = 16

// tells when an aerial should be falling & low to the ground
#const mv_lowAerial = 254

// NAir
#const nair_IASA = 45
#const nair_xOffset = 11
#const nair_yOffset = -2
#const nair_xRange = 20
#const nair_yRange = 10
#const nair_dist1 = 20

// FAir
#const fair_IASA = 36
#const fair_xOffset = 8
#const fair_yOffset = -3
#const fair_xRange = 9
#const fair_yRange = 11
#const fair_dist1 = 25

// BAir
#const bair_IASA = 29
#const bair_xOffset = -5
#const bair_yOffset = -5
#const bair_xRange = 10
#const bair_yRange = 10
#const bair_dist1 = 13

// UAir
// (not currently implemented)
// will perform a *falling* uAir to a grounded opponent or something
#const uair_IASA = 30
#const uair_xOffset = 5
#const uair_yOffset = -10
#const uair_xRange = 20
#const uair_yRange = 10
#const uair_dist1 = 10

// DAir
#const dair_IASA = 38
#const dair_xOffset = 0
#const dair_yOffset = 10
#const dair_xRange = 20
#const dair_yRange = 13
#const dair_dist1 = 19


//___________________________
// quirks
//-------
// any script that is called with the Call command MUST
// end with TWO Return statements otherwise it will crash.
