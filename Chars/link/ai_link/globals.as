#const DIRY_ABOVE = 15
#const DIRY_BELOW_AIR = 2
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = 0

#const pt_jumpiness = 0.1
#const pt_djumpiness = 0.04
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.6
#const pt_bait_wdashAwayChance = 0.15
#const pt_wall_chance = 1.35
#const pt_platChance = 0.1
#const pt_baitChance = 0.9
#const pt_braveChance = 0.85
#const pt_circleCampChance = 0.55

#const cs_dashForceTurnFrame = 11
#const cs_dashDanceMinFrames = 4

#const cs_shortHopHeight = 11.78
#const cs_jumpHeight = 30.96
#const cs_djumpHeight = 22
#const cs_wavedashDist = 18
#const cs_recoveryDistX = 50
#const cs_recoveryDistY = -45

#const recovery_moves = uspecial

#const uspecial_subaction_check = !(True)
#const uspecial_recovery_info = common|0

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x119)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115)

// jab123
#const jab123_IASA = 19
#const jab123_xOffset = 2.16
#const jab123_yOffset = -3.32
#const jab123_xRange = 10.99
#const jab123_yRange = 6.46
#const jab123_hitFrame = 6
#const jab123_lastHitFrame = 8
#const jab123_damage_info = Jab123|5|16|37|361

#const mv_jab1232 = 1
#const jab123_2_IASA = 16
#const jab123_2_xOffset = 4.57
#const jab123_2_yOffset = -1.74
#const jab123_2_xRange = 9.95
#const jab123_2_yRange = 5.89
#const jab123_2_hitFrame = 5
#const jab123_2_lastHitFrame = 7
#const jab123_2_damage_info = Jab123|3|40|20|78

#const mv_jab1233 = 2
#const jab123_3_IASA = 31
#const jab123_3_xOffset = 2.36
#const jab123_3_yOffset = -5.25
#const jab123_3_xRange = 11.81
#const jab123_3_yRange = 4.41
#const jab123_3_hitFrame = 6
#const jab123_3_lastHitFrame = 10
#const jab123_3_damage_info = Jab123|6|40|50|30

// dashattack
#const dashattack_IASA = 39
#const dashattack_xOffset = 5.75
#const dashattack_yOffset = 1.56
#const dashattack_xRange = 15.64
#const dashattack_yRange = 8.32
#const dashattack_hitFrame = 7
#const dashattack_lastHitFrame = 12
#const dashattack_damage_info = DashAttack|14|25|100|65

// ftilt
#const ftilt_IASA = 36
#const ftilt_xOffset = -11.19
#const ftilt_yOffset = 3.09
#const ftilt_xRange = 17.25
#const ftilt_yRange = 13.72
#const ftilt_hitFrame = 14
#const ftilt_lastHitFrame = 17
#const ftilt_damage_info = FTilt|14|15|90|35

// utilt
#const utilt_IASA = 30
#const utilt_xOffset = -20.78
#const utilt_yOffset = 0.42
#const utilt_xRange = 18.15
#const utilt_yRange = 15.39
#const utilt_hitFrame = 9
#const utilt_lastHitFrame = 15
#const utilt_damage_info = UTilt|9|30|124|85

// dtilt
#const dtilt_IASA = 29
#const dtilt_xOffset = 3.07
#const dtilt_yOffset = 2.04
#const dtilt_xRange = 10.44
#const dtilt_yRange = 5.64
#const dtilt_hitFrame = 10
#const dtilt_lastHitFrame = 13
#const dtilt_damage_info = DTilt|11|90|50|280

// fsmash
#const fsmash_IASA = 49
#const fsmash_xOffset = 6.19
#const fsmash_yOffset = -2.93
#const fsmash_xRange = 13.49
#const fsmash_yRange = 10.71
#const fsmash_hitFrame = 15
#const fsmash_lastHitFrame = 18
#const fsmash_damage_info = FSmash|16|25|93|361

#const mv_fsmash2 = 1
#const fsmash2_IASA = 68
#const fsmash2_xOffset = 7.92
#const fsmash2_yOffset = -5.49
#const fsmash2_xRange = 12.58
#const fsmash2_yRange = 4.99
#const fsmash2_hitFrame = 29
#const fsmash2_lastHitFrame = 33
#const fsmash2_damage_info = FSmash|20|30|100|65

// usmash
#const usmash_IASA = 61
#const usmash_xOffset = -18.44
#const usmash_yOffset = -1.26
#const usmash_xRange = 17.54
#const usmash_yRange = 16.36
#const usmash_hitFrame = 11
#const usmash_lastHitFrame = 41
#const usmash_damage_info = USmash|10|70|90|90

// dsmash
#const dsmash_IASA = 38
#const dsmash_xOffset = 3.07
#const dsmash_yOffset = 2.28
#const dsmash_xRange = 11.72
#const dsmash_yRange = 4.69
#const dsmash_hitFrame = 4
#const dsmash_lastHitFrame = 6
#const dsmash_damage_info = DSmash|17|26|95|75

#const mv_dsmash_back = 1
#const dsmash_back_xOffset = -25.37
#const dsmash_back_yOffset = 1.83
#const dsmash_back_xRange = 11.15
#const dsmash_back_yRange = 4.99
#const dsmash_back_hitFrame = 16
#const dsmash_back_lastHitFrame = 18
#const dsmash_back_damage_info = DSmash|17|20|90|75

// noochB
#const nspecial_IASA = 48
#const nspecial_xOffset = 0
#const nspecial_yOffset = 5
#const nspecial_xRange = 100
#const nspecial_yRange = 10
#const nspecial_hitFrame = 18
#const nspecial_lastHitFrame = 40
#const nspecial_damage_info = NSpecial|3|0|0|0

#const nspecialair_IASA = 48
#const nspecialair_xOffset = 0
#const nspecialair_yOffset = 5
#const nspecialair_xRange = 100
#const nspecialair_yRange = 10
#const nspecialair_hitFrame = 18
#const nspecialair_lastHitFrame = 40
#const nspecialair_damage_info = NSpecialAir|3|0|0|0

// upB
#const uspecial_IASA = 81
#const uspecial_xOffset = -19.42
#const uspecial_yOffset = -2.02
#const uspecial_xRange = 21.41
#const uspecial_yRange = 7.04
#const uspecial_hitFrame = 8
#const uspecial_lastHitFrame = 14
#const uspecial_damage_info = USpecial|15|32|95|361

#const mv_uspecial_late = 1
#const uspecial_late_xOffset = -20.78
#const uspecial_late_yOffset = -2.02
#const uspecial_late_xRange = 22.09
#const uspecial_late_yRange = 7.04
#const uspecial_late_hitFrame = 8
#const uspecial_late_lastHitFrame = 47
#const uspecial_late_damage_info = USpecial|5|60|100|-360

#const uspecialair_IASA = 140
#const uspecialair_xOffset = -17.92
#const uspecialair_yOffset = -3.84
#const uspecialair_xRange = 19.02
#const uspecialair_yRange = 24.51
#const uspecialair_hitFrame = 8
#const uspecialair_lastHitFrame = 51
#const uspecialair_damage_info = USpecialAir|6|40|123|45

// downB
#const dspecial_IASA = 75
#const dspecial_xOffset = 20
#const dspecial_yOffset = 50
#const dspecial_xRange = 50
#const dspecial_yRange = 50
#const dspecial_hitFrame = 49
#const dspecial_lastHitFrame = 60
#const dspecial_damage_info = DSpecial|11|0|0|0

#const dspecialair_IASA = 75
#const dspecialair_xOffset = 20
#const dspecialair_yOffset = 50
#const dspecialair_xRange = 50
#const dspecialair_yRange = 50
#const dspecialair_hitFrame = 49
#const dspecialair_lastHitFrame = 60
#const dspecialair_damage_info = DSpecialAir|11|0|0|0

// sideB
#const sspecial_IASA = 58
#const sspecial_xOffset = -2
#const sspecial_yOffset = 10
#const sspecial_xRange = 40
#const sspecial_yRange = 30
#const sspecial_hitFrame = 25
#const sspecial_lastHitFrame = 51 // just a dummy
#const sspecial_damage_info = SSpecial|8|10|100|90

#const sspecialair_IASA = 58
#const sspecialair_xOffset = -2
#const sspecialair_yOffset = 10
#const sspecialair_xRange = 40
#const sspecialair_yRange = 30
#const sspecialair_hitFrame = 25
#const sspecialair_lastHitFrame = 51 // just a dummy
#const sspecialair_damage_info = SSpecialAir|8|10|100|90

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 64
#const grab_xOffset = -3.14
#const grab_yOffset = -4.05
#const grab_xRange = 6.45
#const grab_yRange = 4.21
#const grab_hitFrame = 11
#const grab_lastHitFrame = 18
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 35
#const fthrow_throwFrame = 12
#const fthrow_damage_info = Grab|4|35|110|55

#const dthrow_IASA = 53
#const dthrow_throwFrame = 27
#const dthrow_damage_info = Grab|4|85|40|85

#const bthrow_IASA = 35
#const bthrow_throwFrame = 12
#const bthrow_damage_info = Grab|4|40|110|50

#const uthrow_IASA = 50
#const uthrow_throwFrame = 28
#const uthrow_damage_info = Grab|8|30|125|90

// NAir
#const nair_IASA = 35
#const nair_xOffset = -6.27
#const nair_yOffset = -2.19
#const nair_xRange = 10.19
#const nair_yRange = 6.48
#const nair_hitFrame = 4
#const nair_lastHitFrame = 6
#const nair_damage_info = NAir|12|15|100|361

#const mv_nair_late = 1
#const nair_late_xOffset = -6.09
#const nair_late_yOffset = -2.19
#const nair_late_xRange = 10.11
#const nair_late_yRange = 6.46
#const nair_late_hitFrame = 7
#const nair_late_lastHitFrame = 31
#const nair_late_damage_info = NAir|7|10|100|361

// FAir
#const fair_IASA = 51
#const fair_xOffset = 0.12
#const fair_yOffset = -3.78
#const fair_xRange = 10.86
#const fair_yRange = 5.83
#const fair_hitFrame = 14
#const fair_lastHitFrame = 16
#const fair_damage_info = FAir|14|20|105|361

#const mv_fair_hit2 = 1
#const fair_hit2_xOffset = -1.13
#const fair_hit2_yOffset = -9.01
#const fair_hit2_xRange = 9.46
#const fair_hit2_yRange = 5.28
#const fair_hit2_hitFrame = 28
#const fair_hit2_lastHitFrame = 31
#const fair_hit2_damage_info = FAir|10|46|60|80

// BAir
#const bair_IASA = 26
#const bair_xOffset = -14.89
#const bair_yOffset = -3.76
#const bair_xRange = 9.02
#const bair_yRange = 5.36
#const bair_hitFrame = 6
#const bair_lastHitFrame = 9
#const bair_damage_info = BAir|7|w25|100|-361

#const mv_bair_strong = 1
#const bair_strong_xOffset = -14.71
#const bair_strong_yOffset = -3.93
#const bair_strong_xRange = 9.04
#const bair_strong_yRange = 5.31
#const bair_strong_hitFrame = 16
#const bair_strong_lastHitFrame = 21
#const bair_strong_damage_info = BAir|7|15|100|-40

// UAir
#const uair_IASA = 56
#const uair_xOffset = -4.19
#const uair_yOffset = -14.2
#const uair_xRange = 4.41
#const uair_yRange = 8.88
#const uair_hitFrame = 5
#const uair_lastHitFrame = 7
#const uair_damage_info = UAir|16|25|85|80

#const mv_uair_weak = 1
#const uair_weak_xOffset = -4.17
#const uair_weak_yOffset = -14.51
#const uair_weak_xRange = 4.59
#const uair_weak_yRange = 8.78
#const uair_weak_hitFrame = 8
#const uair_weak_lastHitFrame = 49
#const uair_weak_damage_info = UAir|12|25|85|80

// DAir
#const dair_IASA = 79
#const dair_xOffset = -4.09
#const dair_yOffset = -0.19
#const dair_xRange = 4.69
#const dair_yRange = 5.77
#const dair_hitFrame = 13
#const dair_lastHitFrame = 15
#const dair_damage_info = DAir|22|50|80|65

#const mv_dair_late = 1
#const dair_late_xOffset = -4.09
#const dair_late_yOffset = -0.19
#const dair_late_xRange = 4.69
#const dair_late_yRange = 5.77
#const dair_late_hitFrame = 16
#const dair_late_lastHitFrame = 64
#const dair_late_damage_info = DAir|19|40|80|65