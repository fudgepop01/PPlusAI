#const DIRY_ABOVE = 14
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 14.24
#const cs_jumpHeight = 33.13
#const cs_djumpHeight = 8.28
#const cs_wavedashDist = 25

#const pt_jumpiness = 0.1
#const pt_djumpiness = 0.07
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.55
#const pt_bait_wdashAwayChance = 0.2
#const pt_wall_chance = 0.5
#const pt_platChance = 0.08
#const pt_baitchance = 0.9
#const pt_braveChance = 0.8
#const pt_circleCampChance = 0.12

#const cs_dashForceTurnFrame = 8
#const cs_dashDanceMinFrames = 3

#const recovery_moves = uspecial|sspecial

#const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1E2)) && !(Equal CurrSubaction hex(0x1E3)) && !(Equal CurrSubaction hex(0x1E4))
#const uspecial_recovery_info = common|60

#const sspecial_subaction_check = !(Equal CurrSubaction hex(0x1D4)) && !(Equal CurrSubaction hex(0x1D5)) && !(Equal CurrSubaction hex(0x1D7))
#const sspecial_recovery_info = common|60

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x119) || Equal CurrAction hex(0x11a)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x11d) 
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x11b) || Equal CurrAction hex(0x11c)

// jab123
#const jab123_IASA = 39
#const jab123_xOffset = -17.07
#const jab123_yOffset = 0
#const jab123_xRange = 17.07
#const jab123_yRange = 7.75
#const jab123_hitFrame = 8
#const jab123_lastHitFrame = 22
#const jab123_damage_info = Jab123|3|40|100|361

// dashattack
#const dashattack_IASA = 39
#const dashattack_xOffset = 10.02
#const dashattack_yOffset = -3.73
#const dashattack_xRange = 7.76
#const dashattack_yRange = 3.73
#const dashattack_hitFrame = 4
#const dashattack_lastHitFrame = 7
#const dashattack_damage_info = DashAttack|8|40|88|60

#const mv_dashattack_weak = 1
#const dashattack_weak_xOffset = 16.81
#const dashattack_weak_yOffset = 0.97
#const dashattack_weak_xRange = 11.23
#const dashattack_weak_yRange = 6.08
#const dashattack_weak_hitFrame = 8
#const dashattack_weak_lastHitFrame = 14
#const dashattack_weak_damage_info = DashAttack|3|20|88|80

// ftilt
#const ftilt_IASA = 25
#const ftilt_xOffset = 4.29
#const ftilt_yOffset = -1.52
#const ftilt_xRange = 9.98
#const ftilt_yRange = 4.5
#const ftilt_hitFrame = 3
#const ftilt_lastHitFrame = 4
#const ftilt_damage_info = FTilt|4|0|100|70

#const mv_ftilt2 = 1
#const ftilt2_IASA = 37
#const ftilt2_xOffset = 0.48
#const ftilt2_yOffset = -1.52
#const ftilt2_xRange = 10.51
#const ftilt2_yRange = 4.5
#const ftilt2_hitFrame = 10
#const ftilt2_lastHitFrame = 11
#const ftilt2_damage_info = FTilt|3|0|100|70

#const mv_ftilt3 = 2
#const ftilt3_IASA = 51
#const ftilt3_xOffset = 3.7
#const ftilt3_yOffset = -1
#const ftilt3_xRange = 10.13
#const ftilt3_yRange = 10.5
#const ftilt3_hitFrame = 18
#const ftilt3_lastHitFrame = 19
#const ftilt3_damage_info = FTilt|5|50|113|65

// utilt
#const utilt_IASA = 28
#const utilt_xOffset = -7.71
#const utilt_yOffset = -7.78
#const utilt_xRange = 8.02
#const utilt_yRange = 12.31
#const utilt_hitFrame = 8
#const utilt_lastHitFrame = 18
#const utilt_damage_info = UTilt|7|35|145|85

// dtilt
#const dtilt_IASA = 19
#const dtilt_xOffset = 4.89
#const dtilt_yOffset = 0.8
#const dtilt_xRange = 10.96
#const dtilt_yRange = 4.8
#const dtilt_hitFrame = 6
#const dtilt_lastHitFrame = 7
#const dtilt_damage_info = DTilt|5|20|116|37

// fsmash
#const fsmash_IASA = 51
#const fsmash_xOffset = 3.5
#const fsmash_yOffset = 1.91
#const fsmash_xRange = 9.64
#const fsmash_yRange = 7.93
#const fsmash_hitFrame = 25
#const fsmash_lastHitFrame = 26
#const fsmash_damage_info = FSmash|16|30|110|361

// usmash
#const usmash_IASA = 48
#const usmash_xOffset = -17.03
#const usmash_yOffset = -1.54
#const usmash_xRange = 16.28
#const usmash_yRange = 13.76
#const usmash_hitFrame = 9
#const usmash_lastHitFrame = 20
#const usmash_damage_info = USmash|5|40|185|70

// dsmash
#const dsmash_IASA = 47
#const dsmash_xOffset = 1.49
#const dsmash_yOffset = 1.69
#const dsmash_xRange = 10.54
#const dsmash_yRange = 4.51
#const dsmash_hitFrame = 6
#const dsmash_lastHitFrame = 7
#const dsmash_damage_info = DSmash|13|50|80|361

#const mv_dsmash_hit2 = 1
#const dsmash_hit2_xOffset = -22.57
#const dsmash_hit2_yOffset = 1.69
#const dsmash_hit2_xRange = 10.72
#const dsmash_hit2_yRange = 4.51
#const dsmash_hit2_hitFrame = 15
#const dsmash_hit2_lastHitFrame = 16
#const dsmash_hit2_damage_info = DSmash|13|50|93|361

// noochB
// #const nspecial_IASA = 46
// #const nspecial_xOffset = 2.76
// #const nspecial_yOffset = 3.96
// #const nspecial_xRange = 8.43
// #const nspecial_yRange = 13.73
// #const nspecial_hitFrame = 17
// #const nspecial_lastHitFrame = 22
// #const nspecial_damage_info = nspecial|7|30|100|361

// upB
// #const uspecial_IASA = 33
// #const uspecial_xOffset = 8.12
// #const uspecial_yOffset = 5.59
// #const uspecial_xRange = 5.88
// #const uspecial_yRange = 16.99
// #const uspecial_hitFrame = 8
// #const uspecial_lastHitFrame = 9
// #const uspecial_damage_info = USpecial|9|85|90|75

// #const uspecialair_IASA = 33
// #const uspecialair_xOffset = 8.12
// #const uspecialair_yOffset = 5.59
// #const uspecialair_xRange = 5.88
// #const uspecialair_yRange = 16.99
// #const uspecialair_hitFrame = 8
// #const uspecialair_lastHitFrame = 9
// #const uspecialair_damage_info = USpecialAir|9|85|90|75

// downB
#const dspecial_IASA = 77
#const dspecial_xOffset = -15.11
#const dspecial_yOffset = 1.43
#const dspecial_xRange = 9.61
#const dspecial_yRange = 6.5
#const dspecial_hitFrame = 26
#const dspecial_lastHitFrame = 27
#const dspecial_damage_info = dspecial|14|35|114|361

#const dspecialair_IASA = 77
#const dspecialair_xOffset = -15.11
#const dspecialair_yOffset = 1.43
#const dspecialair_xRange = 9.61
#const dspecialair_yRange = 6.5
#const dspecialair_hitFrame = 26
#const dspecialair_lastHitFrame = 27
#const dspecialair_damage_info = dspecial|14|35|114|361

// sideB
// #const sspecial_IASA = 29
// #const sspecial_xOffset = 2.64
// #const sspecial_yOffset = 2.49
// #const sspecial_xRange = 11.86
// #const sspecial_yRange = 14.11
// #const sspecial_hitFrame = 6
// #const sspecial_lastHitFrame = 8
// #const sspecial_damage_info = sspecial|4|55|25|96

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 1.5
#const grab_yOffset = -2.5
#const grab_xRange = 6.25
#const grab_yRange = 4
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 29
#const fthrow_throwFrame = 4
#const fthrow_damage_info = Grab|3|50|140|65
#const dthrow_IASA = 71
#const dthrow_throwFrame = 49
#const dthrow_damage_info = Grab|1|20|220|52
#const bthrow_IASA = 36
#const bthrow_throwFrame = 16
#const bthrow_damage_info = Grab|3|60|140|45
#const uthrow_IASA = 72
#const uthrow_throwFrame = 43
#const uthrow_damage_info = Grab|10|69|70|90

// NAir
#const nair_IASA = 42
#const nair_xOffset = -7
#const nair_yOffset = 6.6
#const nair_xRange = 9.18
#const nair_yRange = 12.36
#const nair_hitFrame = 3
#const nair_lastHitFrame = 6
#const nair_damage_info = NAir|12|30|100|361

#const mv_nair_med = 1
#const nair_med_xOffset = -12.23
#const nair_med_yOffset = 6.6
#const nair_med_xRange = 12.17
#const nair_med_yRange = 11.29
#const nair_med_hitFrame = 7
#const nair_med_lastHitFrame = 15
#const nair_med_damage_info = NAir|9|15|100|361

#const mv_nair_weak = 2
#const nair_weak_xOffset = -9.63
#const nair_weak_yOffset = 4.32
#const nair_weak_xRange = 9.64
#const nair_weak_yRange = 9.86
#const nair_weak_hitFrame = 16
#const nair_weak_lastHitFrame = 28
#const nair_weak_damage_info = NAir|4|10|100|361

// FAir
#const fair_IASA = 33
#const fair_xOffset = 0.01
#const fair_yOffset = 1.4
#const fair_xRange = 7.57
#const fair_yRange = 6.57
#const fair_hitFrame = 6
#const fair_lastHitFrame = 14
#const fair_damage_info = FAir|4|30|130|361

// BAir
#const bair_IASA = 35
#const bair_xOffset = -14
#const bair_yOffset = 5
#const bair_xRange = 7.5
#const bair_yRange = 12.5
#const bair_hitFrame = 10
#const bair_lastHitFrame = 11
#const bair_damage_info = BAir|14|30|100|-361

// UAir
#const uair_IASA = 22
#const uair_xOffset = -17.8
#const uair_yOffset = -6
#const uair_xRange = 15.4
#const uair_yRange = 8.25
#const uair_hitFrame = 5
#const uair_lastHitFrame = 6
#const uair_damage_info = UAir|8|40|105|78


// DAir
#const dair_IASA = 41
#const dair_xOffset = -7.5
#const dair_yOffset = 10.5
#const dair_xRange = 10.25
#const dair_yRange = 6.5
#const dair_hitFrame = 12
#const dair_lastHitFrame = 13
#const dair_damage_info = DAir|14|30|80|35