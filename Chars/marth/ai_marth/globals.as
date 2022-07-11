#const DIRY_ABOVE = 13
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = 0
#const DIRX_FRONT = 2
#const DIRX_BACK = -2

#const cs_shortHopHeight = 14.77
#const cs_jumpHeight = 36.32
#const cs_djumpHeight = 26.23
#const cs_wavedashDist = 35

#const cs_recoveryDistX = 80
#const cs_recoveryDistY = -50


#const pt_jumpiness = 0.05
#const pt_djumpiness = 0.02
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.45
#const pt_bait_wdashAwayChance = 0.45
#const pt_wall_chance = 0.7
#const pt_platChance = 0.1
#const pt_baitChance = 0.8
#const pt_braveChance = 0.65
#const pt_circleCampChance = 0.1

#const cs_dashForceTurnFrame = 13
#const cs_dashDanceMinFrames = 3

#const recovery_moves = uspecial|sspecial

#const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1D6)) && !(Equal CurrSubaction hex(0x1D7))
#const uspecial_recovery_info = common|60

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x11a) || Equal CurrAction hex(0x11b) || Equal CurrAction hex(0x11c) || Equal CurrAction hex(0x11c)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115)

// jab123
#const jab123_IASA = 25
#const jab123_xOffset = 4.1
#const jab123_yOffset = 2.16
#const jab123_xRange = 12.05
#const jab123_yRange = 10.97
#const jab123_hitFrame = 4
#const jab123_lastHitFrame = 7
#const jab123_damage_info = Jab123|4|20|50|361

#const mv_jab123_strong = 1
#const jab123_strong_xOffset = 14.09
#const jab123_strong_yOffset = 2.16
#const jab123_strong_xRange = 7.06
#const jab123_strong_yRange = 10.97
#const jab123_strong_hitFrame = 4
#const jab123_strong_lastHitFrame = 7
#const jab123_strong_damage_info = jab123|6|30|60|361

// dashattack
#const dashattack_IASA = 40
#const dashattack_xOffset = 24.83
#const dashattack_yOffset = 2.07
#const dashattack_xRange = 12.19
#const dashattack_yRange = 8
#const dashattack_hitFrame = 12
#const dashattack_lastHitFrame = 15
#const dashattack_damage_info = DashAttack|11|70|55|110

#const mv_dashattack_strong = 2
#const dashattack_strong_xOffset = 38.37
#const dashattack_strong_yOffset = 2.07
#const dashattack_strong_xRange = 5.42
#const dashattack_strong_yRange = 6.66
#const dashattack_strong_hitFrame = 12
#const dashattack_strong_lastHitFrame = 15
#const dashattack_strong_damage_info = DashAttack|12|70|55|110

// ftilt
#const ftilt_IASA = 35
#const ftilt_xOffset = 2.73
#const ftilt_yOffset = -0.76
#const ftilt_xRange = 13.49
#const ftilt_yRange = 12.87
#const ftilt_hitFrame = 7
#const ftilt_lastHitFrame = 10
#const ftilt_damage_info = FTilt|9|30|70|361

// utilt
#const utilt_IASA = 31
#const utilt_xOffset = 2.14
#const utilt_yOffset = -10.18
#const utilt_xRange = 5.86
#const utilt_yRange = 5.5
#const utilt_hitFrame = 6
#const utilt_lastHitFrame = 8
#const utilt_damage_info = UTilt|8|40|116|361

#const mv_utilt_start_outer = 1
#const utilt_start_outer_xOffset = 4.63
#const utilt_start_outer_yOffset = -6.7
#const utilt_start_outer_xRange = 8.87
#const utilt_start_outer_yRange = 12.41
#const utilt_start_outer_hitFrame = 6
#const utilt_start_outer_lastHitFrame = 8
#const utilt_start_outer_damage_info = UTilt|12|50|100|110

// #const mv_utilt_end_inner = 2
// #const utilt_end_inner_xOffset = -1.29
// #const utilt_end_inner_yOffset = -9.42
// #const utilt_end_inner_xRange = 5.83
// #const utilt_end_inner_yRange = 5.88
// #const utilt_end_inner_hitFrame = 9
// #const utilt_end_inner_lastHitFrame = 12
// #const utilt_end_inner_damage_info = UTilt|9|30|116|361

#const mv_utilt_end_outer = 3
#const utilt_end_outer_xOffset = -11.93
#const utilt_end_outer_yOffset = -8.71
#const utilt_end_outer_xRange = 12.77
#const utilt_end_outer_yRange = 11.51
#const utilt_end_outer_hitFrame = 9
#const utilt_end_outer_lastHitFrame = 12
#const utilt_end_outer_damage_info = UTilt|13|50|100|85

// dtilt
#const dtilt_IASA = 19
#const dtilt_xOffset = 7.71
#const dtilt_yOffset = 2.84
#const dtilt_xRange = 10.89
#const dtilt_yRange = 6.61
#const dtilt_hitFrame = 7
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|9|40|40|30

#const mv_dtilt_outer = 2
#const dtilt_outer_xOffset = 21.28
#const dtilt_outer_yOffset = 2.84
#const dtilt_outer_xRange = 4.11
#const dtilt_outer_yRange = 4.15
#const dtilt_outer_hitFrame = 7
#const dtilt_outer_lastHitFrame = 9
#const dtilt_outer_damage_info = DTilt|10|50|40|30

// fsmash
#const fsmash_IASA = 48
#const fsmash_xOffset = 4.93
#const fsmash_yOffset = 3.57
#const fsmash_xRange = 14.14
#const fsmash_yRange = 16.41
#const fsmash_hitFrame = 11
#const fsmash_lastHitFrame = 14
#const fsmash_damage_info = FSmash|14|60|70|361

#const mv_fsmash_outer = 1
#const fsmash_outer_xOffset = 9.24
#const fsmash_outer_yOffset = 3.17
#const fsmash_outer_xRange = 11.98
#const fsmash_outer_yRange = 16.21
#const fsmash_outer_hitFrame = 11
#const fsmash_outer_lastHitFrame = 14
#const fsmash_outer_damage_info = FSmash|20|80|70|361

// usmash
#const usmash_IASA = 41
// #const usmash_xOffset = -10.59
// #const usmash_yOffset = -3.34
// #const usmash_xRange = 10.59
// #const usmash_yRange = 4.3
// #const usmash_hitFrame = 9
// #const usmash_lastHitFrame = 13
// #const usmash_damage_info = USmash|8|w100|100|75

// #const mv_usmash_mid = 1
#const usmash_xOffset = -4.41
#const usmash_yOffset = -16.36
#const usmash_xRange = 4.78
#const usmash_yRange = 5.07
#const usmash_hitFrame = 9
#const usmash_lastHitFrame = 13
#const usmash_damage_info = USmash|15|30|80|90

#const mv_usmash_strong = 2
#const usmash_strong_xOffset = -4.31
#const usmash_strong_yOffset = -23.43
#const usmash_strong_xRange = 4.39
#const usmash_strong_yRange = 4.68
#const usmash_strong_hitFrame = 9
#const usmash_strong_lastHitFrame = 13
#const usmash_strong_damage_info = USmash|18|60|80|90

// dsmash
#const dsmash_IASA = 62
#const dsmash_xOffset = 2.16
#const dsmash_yOffset = -1.16
#const dsmash_xRange = 10.73
#const dsmash_yRange = 4.87
#const dsmash_hitFrame = 6
#const dsmash_lastHitFrame = 8
#const dsmash_damage_info = DSmash|11|70|72|75

#const mv_dsmash_hit1_outer = 2
#const dsmash_hit1_outer_xOffset = 20.16
#const dsmash_hit1_outer_yOffset = 0.53
#const dsmash_hit1_outer_xRange = 3.91
#const dsmash_hit1_outer_yRange = 3.91
#const dsmash_hit1_outer_hitFrame = 6
#const dsmash_hit1_outer_lastHitFrame = 8
#const dsmash_hit1_outer_damage_info = DSmash|16|70|100|70

#const mv_dsmash_hit2 = 3
#const dsmash_hit2_xOffset = -17.54
#const dsmash_hit2_yOffset = 0.34
#const dsmash_hit2_xRange = 10.03
#const dsmash_hit2_yRange = 4.9
#const dsmash_hit2_hitFrame = 21
#const dsmash_hit2_lastHitFrame = 23
#const dsmash_hit2_damage_info = DSmash|11|30|100|-361

#const mv_dsmash_hit2_outer = 5
#const dsmash_hit2_outer_xOffset = -21.89
#const dsmash_hit2_outer_yOffset = 1.26
#const dsmash_hit2_outer_xRange = 3.91
#const dsmash_hit2_outer_yRange = 3.91
#const dsmash_hit2_outer_hitFrame = 21
#const dsmash_hit2_outer_lastHitFrame = 23
#const dsmash_hit2_outer_damage_info = DSmash|16|70|100|-75

// noochB
#const nspecial_IASA = 46
#const nspecial_xOffset = -1.05
#const nspecial_yOffset = 3.96
#const nspecial_xRange = 13.23
#const nspecial_yRange = 16.03
#const nspecial_hitFrame = 17
#const nspecial_lastHitFrame = 22
#const nspecial_damage_info = NSpecial|7|34|100|361

#const nspecialair_IASA = 46
#const nspecialair_xOffset = -1.05
#const nspecialair_yOffset = 3.96
#const nspecialair_xRange = 13.23
#const nspecialair_yRange = 16.03
#const nspecialair_hitFrame = 17
#const nspecialair_lastHitFrame = 22
#const nspecialair_damage_info = NSpecialAir|7|34|100|361

// upB
#const uspecial_IASA = 141
#const uspecial_xOffset = 6.67
#const uspecial_yOffset = -0.46
#const uspecial_xRange = 3.91
#const uspecial_yRange = 3.91
#const uspecial_hitFrame = 5
#const uspecial_lastHitFrame = 5
#const uspecial_damage_info = USpecial|13|80|70|361

#const uspecialair_IASA = 141
#const uspecialair_xOffset = 3.46
#const uspecialair_yOffset = 0.62
#const uspecialair_xRange = 3.91
#const uspecialair_yRange = 3.91
#const uspecialair_hitFrame = 5
#const uspecialair_lastHitFrame = 5
#const uspecialair_damage_info = USpecialAir|10|60|70|74

// downB
// #const dspecial_IASA = 5
// #const dspecial_xOffset = -8
// #const dspecial_yOffset = 1.5
// #const dspecial_xRange = 8
// #const dspecial_yRange = 8
// #const dspecial_hitFrame = 1
// #const dspecial_lastHitFrame = 1
// #const dspecial_damage_info = DSpecial|5|w80|100|-360

// #const dspecialair_IASA = 5
// #const dspecialair_xOffset = -8
// #const dspecialair_yOffset = 1.5
// #const dspecialair_xRange = 8
// #const dspecialair_yRange = 8
// #const dspecialair_hitFrame = 1
// #const dspecialair_lastHitFrame = 1
// #const dspecialair_damage_info = DSpecialAir|5|55|35|20


// LMAOOOOOOOOOO
// sideB
#const sspecial_IASA = 29
#const sspecial_xOffset = 2.64
#const sspecial_yOffset = 2.49
#const sspecial_xRange = 11.86
#const sspecial_yRange = 14.11
#const sspecial_hitFrame = 6
#const sspecial_lastHitFrame = 8
#const sspecial_damage_info = sspecial|4|55|25|96

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 4.18
#const grab_yOffset = -4.63
#const grab_xRange = 7.28
#const grab_yRange = 4.36
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 33
#const fthrow_throwFrame = 13
#const fthrow_damage_info = Grab|4|70|45|50

#const dthrow_IASA = 44
#const dthrow_throwFrame = 13
#const dthrow_damage_info = Grab|5|65|50|50

#const bthrow_IASA = 41
#const bthrow_throwFrame = 6
#const bthrow_damage_info = Grab|4|70|60|-63

#const uthrow_IASA = 46
#const uthrow_throwFrame = 11
#const uthrow_damage_info = Grab|4|60|130|87

// NAir
#const nair_IASA = 49
#const nair_xOffset = -4.7
#const nair_yOffset = -4.63
#const nair_xRange = 11.99
#const nair_yRange = 5.87
#const nair_hitFrame = 6
#const nair_lastHitFrame = 7
#const nair_damage_info = NAir|4|30|40|100

#const mv_nair_hit2_inner = 1
#const nair_hit2_inner_xOffset = -16.24
#const nair_hit2_inner_yOffset = -0.66
#const nair_hit2_inner_xRange = 17.76
#const nair_hit2_inner_yRange = 11.01
#const nair_hit2_inner_hitFrame = 6
#const nair_hit2_inner_lastHitFrame = 21
#const nair_hit2_inner_damage_info = NAir|10|50|80|361

#const mv_nair_hit2_strong = 2
#const nair_hit2_strong_xOffset = -4.42
#const nair_hit2_strong_yOffset = -4.63
#const nair_hit2_strong_xRange = 4.53
#const nair_hit2_strong_yRange = 3.91
#const nair_hit2_strong_hitFrame = 15
#const nair_hit2_strong_lastHitFrame = 21
#const nair_hit2_strong_damage_info = NAir|10|50|80|361

// FAir
#const fair_IASA = 29
#const fair_xOffset = -3.13
#const fair_yOffset = 1.07
#const fair_xRange = 9.04
#const fair_yRange = 10.45
#const fair_hitFrame = 4
#const fair_lastHitFrame = 7
#const fair_damage_info = FAir|9|20|70|361

#const mv_fair_outer = 2
#const fair_outer_xOffset = 7.49
#const fair_outer_yOffset = 0.8
#const fair_outer_xRange = 6.42
#const fair_outer_yRange = 12.81
#const fair_outer_hitFrame = 4
#const fair_outer_lastHitFrame = 7
#const fair_outer_damage_info = FAir|13|42|70|67

// BAir
#const bair_IASA = 34
#const bair_xOffset = -23.66
#const bair_yOffset = 2.65
#const bair_xRange = 12.77
#const bair_yRange = 14.84
#const bair_hitFrame = 7
#const bair_lastHitFrame = 11
#const bair_damage_info = BAir|10|30|70|-361

// UAir
#const uair_IASA = 43
#const uair_xOffset = -14.71
#const uair_yOffset = -8.42
#const uair_xRange = 15.81
#const uair_yRange = 10.69
#const uair_hitFrame = 5
#const uair_lastHitFrame = 8
#const uair_damage_info = UAir|10|30|70|80

#const mv_uair_outer = 2
#const uair_outer_xOffset = -14.71
#const uair_outer_yOffset = -10.41
#const uair_outer_xRange = 15.81
#const uair_outer_yRange = 9.7
#const uair_outer_hitFrame = 5
#const uair_outer_lastHitFrame = 8
#const uair_outer_damage_info = UAir|13|40|70|90

// DAir
#const dair_IASA = 59
#const dair_xOffset = -18
#const dair_yOffset = 8.5
#const dair_xRange = 16.38
#const dair_yRange = 10.78
#const dair_hitFrame = 6
#const dair_lastHitFrame = 9
#const dair_damage_info = DAir|10|40|70|80

#const mv_dair_outer = 2
#const dair_outer_xOffset = -18
#const dair_outer_yOffset = 8.5
#const dair_outer_xRange = 16.38
#const dair_outer_yRange = 10.39
#const dair_outer_hitFrame = 6
#const dair_outer_lastHitFrame = 9
#const dair_outer_damage_info = DAir|13|40|70|290