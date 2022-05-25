#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 15.6
#const cs_jumpHeight = 27.04
#const cs_djumpHeight = 27.04
#const cs_wavedashDist = 20

#const pt_jumpiness = 0.15
#const pt_djumpiness = 0.15
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.2
#const pt_bait_wdashAwayChance = 0.3
#const pt_wall_chance = 0.6
#const pt_platChance = 0.23
#const pt_baitChance = 0.85
#const pt_braveChance = 0.45
#const pt_circleCampChance = 0.2

#const cs_dashForceTurnFrame = 10
#const cs_dashDanceMinFrames = 3
#const cs_recoveryDistX = 90
#const cs_recoveryDistY = -100

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x129)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x129) || Equal CurrAction hex(0x12b) 
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x12c)

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
#const mv_gentlemen = 0
#const mv_jabReset = 1

#const jab123_IASA = 15
#const jab123_xOffset = 4.83
#const jab123_yOffset = -1.74
#const jab123_xRange = 4.41
#const jab123_yRange = 3.16
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 3
#const jab123_damage_info = Jab123|3|8|50|361

// dashattack
#const dashattack_IASA = 46
#const dashattack_xOffset = -1.14
#const dashattack_yOffset = 0.25
#const dashattack_xRange = 29.68
#const dashattack_yRange = 4.38
#const dashattack_hitFrame = 8
#const dashattack_lastHitFrame = 31
#const dashattack_damage_info = DashAttack|6|45|90|65

// ftilt
#const ftilt_IASA = 27
#const ftilt_xOffset = 4.06
#const ftilt_yOffset = -1.97
#const ftilt_xRange = 7.71
#const ftilt_yRange = 4.24
#const ftilt_hitFrame = 5
#const ftilt_lastHitFrame = 8
#const ftilt_damage_info = FTilt|11|8|100|361

// utilt
#const utilt_IASA = 23
#const utilt_xOffset = -14.38
#const utilt_yOffset = -2.2
#const utilt_xRange = 12.31
#const utilt_yRange = 8.89
#const utilt_hitFrame = 4
#const utilt_lastHitFrame = 10
#const utilt_damage_info = UTilt|8|50|101|92

// dtilt
#const dtilt_IASA = 20
#const dtilt_xOffset = 3.79
#const dtilt_yOffset = 2.78
#const dtilt_xRange = 7.63
#const dtilt_yRange = 5.12
#const dtilt_hitFrame = 4
#const dtilt_lastHitFrame = 7
#const dtilt_damage_info = DTilt|10|40|30|20

// fsmash
#const fsmash_IASA = 52
#const fsmash_xOffset = -0.17
#const fsmash_yOffset = -0.68
#const fsmash_xRange = 13.15
#const fsmash_yRange = 4.9
#const fsmash_hitFrame = 13
#const fsmash_lastHitFrame = 22
#const fsmash_damage_info = FSmash|15|40|100|38

#const mv_fsmash_weak = 1
#const fsmash_weak_xOffset = -0.17
#const fsmash_weak_yOffset = -0.68
#const fsmash_weak_xRange = 13.15
#const fsmash_weak_yRange = 4.9
#const fsmash_weak_hitFrame = 13
#const fsmash_weak_lastHitFrame = 22
#const fsmash_weak_damage_info = FSmash|13|25|100|73

// usmash
#const usmash_IASA = 40
#const usmash_xOffset = -3.56
#const usmash_yOffset = -0.72
#const usmash_xRange = 7.02
#const usmash_yRange = 10.65
#const usmash_hitFrame = 11
#const usmash_lastHitFrame = 14
#const usmash_damage_info = USmash|15|30|125|75

#const mv_usmash_late = 1
#const usmash_late_xOffset = -8.66
#const usmash_late_yOffset = -5.71
#const usmash_late_xRange = 9.58
#const usmash_late_yRange = 8.46
#const usmash_late_hitFrame = 13
#const usmash_late_lastHitFrame = 19
#const usmash_late_damage_info = USmash|13|10|50|50

// dsmash
#const dsmash_IASA = 51
#const dsmash_xOffset = -13.18
#const dsmash_yOffset = 2.42
#const dsmash_xRange = 12.85
#const dsmash_yRange = 5.3
#const dsmash_hitFrame = 9
#const dsmash_lastHitFrame = 23
#const dsmash_damage_info = DSmash|14|20|85|28

// noochB
#const nspecial_IASA = 9999.9999
#const nspecial_xOffset = 9999.9999
#const nspecial_yOffset = 9999.9999
#const nspecial_xRange = 9999.9999
#const nspecial_yRange = 9999.9999
#const nspecial_hitFrame = 9999.9999
#const nspecial_lastHitFrame = 9999.9999

// upB
#const uspecial_IASA = 47
#const uspecial_xOffset = 2.75
#const uspecial_yOffset = 6
#const uspecial_xRange = 11.9
#const uspecial_yRange = 7.75
#const uspecial_hitFrame = 23
#const uspecial_lastHitFrame = 37
#const uspecial_damage_info = USpecial|8|50|75|82

// downB
#const dspecial_IASA = 47
#const dspecial_xOffset = 3.09
#const dspecial_yOffset = 2.86
#const dspecial_xRange = 12.6
#const dspecial_yRange = 4.28
#const dspecial_hitFrame = 7
#const dspecial_lastHitFrame = 14
#const dspecial_damage_info = DSpecial|8|30|90|90

#const mv_dspecial_weak = 1
#const dspecial_weak_xOffset = 20.46
#const dspecial_weak_yOffset = 2.4
#const dspecial_weak_xRange = 8.89
#const dspecial_weak_yRange = 4.05
#const dspecial_weak_hitFrame = 15
#const dspecial_weak_lasthitFrame = 28
#const dspecial_weak_damage_info = DSpecial|6|25|100|90

#const dspecialair_IASA = 71
#const dspecialair_xOffset = -4.5
#const dspecialair_yOffset = 40
#const dspecialair_xRange = 4.5
#const dspecialair_yRange = 45
#const dspecialair_hitFrame = 16
#const dspecialair_lastHitFrame = 40
#const dspecialair_damage_info = DSpecialAir|13|55|100|70


// sideB
#const sspecial_IASA = 55
#const sspecial_xOffset = 4.09
#const sspecial_yOffset = 0.73
#const sspecial_xRange = 5.58
#const sspecial_yRange = 5
#const sspecial_hitFrame = 18
#const sspecial_lastHitFrame = 19
#const sspecial_damage_info = SSpecial|23|65|78|65

#const sspecialair_IASA = 51
#const sspecialair_xOffset = 1.79
#const sspecialair_yOffset = -0.32
#const sspecialair_xRange = 7.65
#const sspecialair_yRange = 5.03
#const sspecialair_hitFrame = 17
#const sspecialair_lastHitFrame = 19
#const sspecialair_damage_info = SSpecialAir|18|65|82|60

#const mv_sspecialair_second = 1
#const sspecialair_second_xOffset = 3.77
#const sspecialair_second_yOffset = 0.45
#const sspecialair_second_xRange = 6.91
#const sspecialair_second_yRange = 4.7
#const sspecialair_second_hitFrame = 34
#const sspecialair_second_lastHitFrame = 35
#const sspecialair_second_damage_info = SSpecialAir|15|55|70|20

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 1.57
#const grab_yOffset = -1.5
#const grab_xRange = 6.67
#const grab_yRange = 3.91
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 53
#const fthrow_throwFrame = 44
#const fthrow_damage_info = Grab|8|70|64|84

#const dthrow_IASA = 63
#const dthrow_throwFrame = 43
#const dthrow_damage_info = Grab|2|34|50|50

#const bthrow_IASA = 51
#const bthrow_throwFrame = 28
#const bthrow_damage_info = Grab|8|80|50|-45

#const uthrow_IASA = 69
#const uthrow_throwFrame = 50
#const uthrow_damage_info = Grab|10|90|85|85

// NAir
#const nair_IASA = 42
#const nair_xOffset = -10.61
#const nair_yOffset = 5.94
#const nair_xRange = 10.25
#const nair_yRange = 9.65
#const nair_hitFrame = 3
#const nair_lastHitFrame = 6
#const nair_damage_info = NAir|12|15|100|80

#const mv_nair_weak = 1
#const nair_weak_xOffset = -8.07
#const nair_weak_yOffset = 3.34
#const nair_weak_xRange = 7.81
#const nair_weak_yRange = 8.17
#const nair_weak_hitFrame = 7
#const nair_weak_lastHitFrame = 29
#const nair_weak_damage_info = NAir|9|0|100|55

// FAir
#const fair_IASA = 37
#const fair_xOffset = -0.91
#const fair_yOffset = 1.73
#const fair_xRange = 8.71
#const fair_yRange = 5.5
#const fair_hitFrame = 7
#const fair_lastHitFrame = 22
#const fair_damage_info = FAir|8|0|146|361

// BAir
#const bair_IASA = 35
#const bair_xOffset = -14.25
#const bair_yOffset = 1.4
#const bair_xRange = 8.59
#const bair_yRange = 5.99
#const bair_hitFrame = 6
#const bair_lastHitFrame = 8
#const bair_damage_info = BAir|14|10|100|361

#const mv_bair_weak = 1
#const bair_weak_xOffset = -14.25
#const bair_weak_yOffset = 1.4
#const bair_weak_xRange = 8.59
#const bair_weak_yRange = 5.99
#const bair_weak_hitFrame = 9
#const bair_weak_lastHitFrame = 20
#const bair_weak_damage_info = BAir|10|0|100|361

// UAir
#const uair_IASA = 33
#const uair_xOffset = -3.16
#const uair_yOffset = -1.34
#const uair_xRange = 7.22
#const uair_yRange = 7.66
#const uair_hitFrame = 8
#const uair_lastHitFrame = 10
#const uair_damage_info = UAir|15|5|115|75

#const mv_uair_tipman = 1
#const uair_tipman_xOffset = -9.8
#const uair_tipman_yOffset = 1.86
#const uair_tipman_xRange = 7.64
#const uair_tipman_yRange = 9.26
#const uair_tipman_hitFrame = 11
#const uair_tipman_lastHitFrame = 13
#const uair_tipman_damage_info = UAir|12|10|90|-30

// DAir
#const dair_IASA = 49
#const dair_xOffset = -2.85
#const dair_yOffset = 8.72
#const dair_xRange = 6.98
#const dair_yRange = 8.71
#const dair_hitFrame = 13
#const dair_lastHitFrame = 29
#const dair_damage_info = DAir|3|10|100|270