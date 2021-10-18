// globals are preprocessed variables that can be used anywhere
// they'll automatically be substituted for the variable or value
// they stand for.
//
// ex. in here, "move_xOffset" will always be replaced with "var9"

#const shortHopHeight = 15
#const djumpHeight = 22
#const wavedashDist = 8

#const pt_jumpiness = 0.07
#const pt_djumpiness = 0.12
#const pt_bait_dashAwayChance = 0.55
#const pt_bait_wdashAwayChance = 0.65
#const pt_wall_chance = 0.6
#const pt_platChance = 0.02
#const pt_baitChance = 0.55
#const pt_aggression = 0.6
#const pt_braveChance = 0.2
#const pt_circleCampChance = 0.18

#const dashForceTurnFrame = 8
#const dashDanceMinFrames = 3

#const sweetSpotYRange = 4
#const maxYEdgeDistWithJump = 75
#const maxYEdgeDist = 58
#const maxYEdgeDistJumpNoUpB = 25
#const maxXEdgeDist = 60

#const oWalkingDist = 20
#const oJumpingDist = 15
#const shortEdgeRange = 10
#const edgeRange = 25
#const calloutSpeed = 0.3

#const jumpIfOWithin = 75
#const SHIfOBeyond = 7
#const FHIfOBeyond = 25
#const DJIfOWithin = 32
#const DJIfOBeyond = 23

#const techChaseCloseDist = 20
#const techChaseFarDist = 40

#const DDWaveDash = 0.06
#const DDMaxRange = 80

// 0 through 21 if defensive things were consistent
#const minBaseReactionTime = 0
#const maxBaseReactionTime = 21

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
#const jab123_IASA = 24
#const jab123_xOffset = 6.68
#const jab123_yOffset = -0.25
#const jab123_xRange = 10.26
#const jab123_yRange = 6
#const jab123_hitFrame = 8
#const jab123_lastHitFrame = 10
#const jab123_damage_info = Jab123|6|w25|100|361

// dashattack
#const dashattack_IASA = 66
#const dashattack_xOffset = 15.12
#const dashattack_yOffset = 1.81
#const dashattack_xRange = 11.08
#const dashattack_yRange = 7.61
#const dashattack_hitFrame = 26
#const dashattack_lastHitFrame = 29
#const dashattack_damage_info = DashAttack|16|35|95|35

// ftilt
#const ftilt_IASA = 45
#const ftilt_xOffset = 5.94
#const ftilt_yOffset = -1.08
#const ftilt_xRange = 16.97
#const ftilt_yRange = 6.04
#const ftilt_hitFrame = 12
#const ftilt_lastHitFrame = 15
#const ftilt_damage_info = FTilt|12|20|80|361

// utilt
#const utilt_IASA = 33
#const utilt_xOffset = -16.02
#const utilt_yOffset = -4.59
#const utilt_xRange = 15.24
#const utilt_yRange = 14.93
#const utilt_hitFrame = 7
#const utilt_lastHitFrame = 17
#const utilt_damage_info = UTilt|12|30|120|96

// dtilt
#const dtilt_IASA = 32
#const dtilt_xOffset = 4.86
#const dtilt_yOffset = 1.79
#const dtilt_xRange = 10.24
#const dtilt_yRange = 5.03
#const dtilt_hitFrame = 6
#const dtilt_lastHitFrame = 8
#const dtilt_damage_info = DTilt|10|20|100|361

// fsmash
#const fsmash_IASA = 79
#const fsmash_xOffset = -0.29
#const fsmash_yOffset = 8.85
#const fsmash_xRange = 25.33
#const fsmash_yRange = 22.01
#const fsmash_hitFrame = 40
#const fsmash_lastHitFrame = 43
#const fsmash_damage_info = FSmash|24|55|90|361

// usmash
#const usmash_IASA = 57
#const usmash_xOffset = -23.09
#const usmash_yOffset = 0.16
#const usmash_xRange = 23.59
#const usmash_yRange = 18.9
#const usmash_hitFrame = 18
#const usmash_lastHitFrame = 24
#const usmash_damage_info = USmash|20|40|83|80

// dsmash
#const dsmash_IASA = 47
#const dsmash_xOffset = -0.4
#const dsmash_yOffset = -0.78
#const dsmash_xRange = 13.57
#const dsmash_yRange = 6.5
#const dsmash_hitFrame = 15
#const dsmash_lastHitFrame = 18
#const dsmash_damage_info = DSmash|18|50|79|130

#const mv_dsmash_hit2 = 1
#const dsmash_hit2_xOffset = -27.15
#const dsmash_hit2_yOffset = 0.5
#const dsmash_hit2_xRange = 13.44
#const dsmash_hit2_yRange = 6.79
#const dsmash_hit2_hitFrame = 19
#const dsmash_hit2_lastHitFrame = 24
#const dsmash_hit2_damage_info = DSmash|15|50|82|125

// noochB
#const nspecial_IASA = 21
#const nspecial_xOffset = -5
#const nspecial_yOffset = 0
#const nspecial_xRange = 9
#const nspecial_yRange = 9
#const nspecial_hitFrame = 17
#const nspecial_lastHitFrame = 19
#const nspecial_damage_info = NSpecial|8|10|100|90

#const nspecialair_IASA = 80
#const nspecialair_xOffset = -5
#const nspecialair_yOffset = 0
#const nspecialair_xRange = 9
#const nspecialair_yRange = 9
#const nspecialair_hitFrame = 17
#const nspecialair_lastHitFrame = 19
#const nspecialair_damage_info = NSpecialAir|8|10|100|90

// upB
#const uspecial_IASA = 9999.9999
#const uspecial_xOffset = 9999.9999
#const uspecial_yOffset = 9999.9999
#const uspecial_xRange = 9999.9999
#const uspecial_yRange = 9999.9999
#const uspecial_hitFrame = 9999.9999
#const uspecial_lastHitFrame = 9999.9999

// downB
#const dspecial_IASA = 57
#const dspecial_xOffset = -4.01
#const dspecial_yOffset = -5.36
#const dspecial_xRange = 15.4
#const dspecial_yRange = 10.93
#const dspecial_hitFrame = 8
#const dspecial_lastHitFrame = 10
#const dspecial_damage_info = DSpecial|11|40|80|35

// sideB
#const sspecial_IASA = 58
#const sspecial_xOffset = 0
#const sspecial_yOffset = 10
#const sspecial_xRange = 30
#const sspecial_yRange = 30
#const sspecial_hitFrame = 30
#const sspecial_lastHitFrame = 51 // just a dummy
#const sspecial_damage_info = SSpecial|8|10|100|90

#const sspecialair_IASA = 58
#const sspecialair_xOffset = 0
#const sspecialair_yOffset = 10
#const sspecialair_xRange = 30
#const sspecialair_yRange = 30
#const sspecialair_hitFrame = 30
#const sspecialair_lastHitFrame = 51 // just a dummy
#const sspecialair_damage_info = SSpecialAir|8|10|100|90

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 3.54
#const grab_yOffset = -0.09
#const grab_xRange = 8.69
#const grab_yRange = 4.41
#const grab_hitFrame = 7
#const grab_lastHitFrame = 8

#const grab_damage_info = Grab|0|0|0|0
#const fthrow_damage_info = Grab|8|80|75|45
#const dthrow_damage_info = Grab|4|80|50|40
#const bthrow_damage_info = Grab|9|60|94|-45
#const uthrow_damage_info = Grab|5|60|72|90

// NAir
#const nair_IASA = 36
#const nair_xOffset = -11.06
#const nair_yOffset = 3.06
#const nair_xRange = 11.06
#const nair_yRange = 11.06
#const nair_hitFrame = 6
#const nair_lastHitFrame = 7
#const nair_damage_info = NAir|12|30|85|75

#const mv_nair_weak = 1
#const nair_weak_xOffset = -11.06
#const nair_weak_yOffset = 3.06
#const nair_weak_xRange = 11.06
#const nair_weak_yRange = 11.06
#const nair_weak_hitFrame = 8
#const nair_weak_lastHitFrame = 28
#const nair_weak_damage_info = NAir|7|30|95|75

// FAir
#const fair_IASA = 39
#const fair_xOffset = 1.01
#const fair_yOffset = 3.37
#const fair_xRange = 12.87
#const fair_yRange = 16.58
#const fair_hitFrame = 13
#const fair_lastHitFrame = 18
#const fair_damage_info = FAir|15|15|100|361

// BAir
#const bair_IASA = 32
#const bair_xOffset = -20.58
#const bair_yOffset = 0.45
#const bair_xRange = 8.48
#const bair_yRange = 5.68
#const bair_hitFrame = 6
#const bair_lastHitFrame = 8
#const bair_damage_info = BAir|13|20|100|361

#const mv_bair_weak = 1
#const bair_weak_xOffset = -19.79
#const bair_weak_yOffset = 0.77
#const bair_weak_xRange = 8.09
#const bair_weak_yRange = 5.9
#const bair_weak_hitFrame = 9
#const bair_weak_lastHitFrame = 21
#const bair_weak_damage_info = BAir|9|20|100|361

// UAir
#const uair_IASA = 44
#const uair_xOffset = -9.1
#const uair_yOffset = -11.06
#const uair_xRange = 9.19
#const uair_yRange = 13.22
#const uair_hitFrame = 10
#const uair_lastHitFrame = 24
#const uair_damage_info = UAir|12|40|85|70

// DAir
#const dair_IASA = 37
#const dair_xOffset = -7.11
#const dair_yOffset = 16.17
#const dair_xRange = 7.39
#const dair_yRange = 13.07
#const dair_hitFrame = 9
#const dair_lastHitFrame = 26
#const dair_damage_info = DAir|3|70|105|70