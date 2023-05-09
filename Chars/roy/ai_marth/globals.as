#const DIRY_ABOVE = 13
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = 0
#const DIRX_FRONT = 2
#const DIRX_BACK = -2

#const cs_shortHopHeight = 11.42
#const cs_jumpHeight = 32.3
#const cs_djumpHeight = 22.96
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
#const jab123_xOffset = 1.4
#const jab123_yOffset = -2.13
#const jab123_xRange = 11.65
#const jab123_yRange = 7.33
#const jab123_hitFrame = 4
#const jab123_lastHitFrame = 7
#const jab123_damage_info = Jab123|8|30|66|361

// dashattack
#const dashattack_IASA = 39
#const dashattack_xOffset = 23.47
#const dashattack_yOffset = -2.74
#const dashattack_xRange = 8.82
#const dashattack_yRange = 5.56
#const dashattack_hitFrame = 13
#const dashattack_lastHitFrame = 17
#const dashattack_damage_info = DashAttack|14|70|47|110

#const mv_dashattack_weak = 1
#const dashattack_weak_xOffset = 39.42
#const dashattack_weak_yOffset = -5.39
#const dashattack_weak_xRange = 3.15
#const dashattack_weak_yRange = 2.73
#const dashattack_weak_hitFrame = 13
#const dashattack_weak_lastHitFrame = 17
#const dashattack_weak_damage_info = DashAttack|10|70|60|100

// ftilt
#const ftilt_IASA = 37
#const ftilt_xOffset = 5.55
#const ftilt_yOffset = -2.26
#const ftilt_xRange = 12.86
#const ftilt_yRange = 5.36
#const ftilt_hitFrame = 8
#const ftilt_lastHitFrame = 12
#const ftilt_damage_info = FTilt|13|60|70|361

#const mv_ftilt_weak = 1
#const ftilt_weak_xOffset = 26.56
#const ftilt_weak_yOffset = -3.01
#const ftilt_weak_xRange = 4.86
#const ftilt_weak_yRange = 3.67
#const ftilt_weak_hitFrame = 9
#const ftilt_weak_lastHitFrame = 12
#const ftilt_weak_damage_info = FTilt|9|40|80|60

// utilt
#const utilt_IASA = 33
#const utilt_xOffset = -15.05
#const utilt_yOffset = -0.89
#const utilt_xRange = 10.36
#const utilt_yRange = 16.37
#const utilt_hitFrame = 6
#const utilt_lastHitFrame = 10
#const utilt_damage_info = UTilt|12|35|100|110

#const mv_utilt_weak_start = 1
#const utilt_weak_start_xOffset = -15.05
#const utilt_weak_start_yOffset = -0.89
#const utilt_weak_start_xRange = 9.49
#const utilt_weak_start_yRange = 16.37
#const utilt_weak_start_hitFrame = 6
#const utilt_weak_start_lastHitFrame = 10
#const utilt_weak_start_damage_info = UTilt|9|35|67|100

#const mv_utilt_weak_end = 2
#const utilt_weak_end_xOffset = -3.12
#const utilt_weak_end_yOffset = -4.55
#const utilt_weak_end_xRange = 12.33
#const utilt_weak_end_yRange = 14.54
#const utilt_weak_end_hitFrame = 11
#const utilt_weak_end_lastHitFrame = 14
#const utilt_weak_end_damage_info = UTilt|9|35|67|90

#const mv_utilt_end = 3
#const utilt_end_xOffset = -3.12
#const utilt_end_yOffset = -4.55
#const utilt_end_xRange = 12.33
#const utilt_end_yRange = 14.54
#const utilt_end_hitFrame = 11
#const utilt_end_lastHitFrame = 14
#const utilt_end_damage_info = UTilt|12|35|100|85

// dtilt
#const dtilt_IASA = 19
#const dtilt_xOffset = 3.71
#const dtilt_yOffset = 1.57
#const dtilt_xRange = 8.55
#const dtilt_yRange = 5.69
#const dtilt_hitFrame = 8
#const dtilt_lastHitFrame = 10
#const dtilt_damage_info = DTilt|10|90|40|80

#const mv_dtilt_weak = 1
#const dtilt_weak_xOffset = 18.6
#const dtilt_weak_yOffset = 1.89
#const dtilt_weak_xRange = 3.58
#const dtilt_weak_yRange = 3.87
#const dtilt_weak_hitFrame = 8
#const dtilt_weak_lastHitFrame = 10
#const dtilt_weak_damage_info = DTilt|6|70|40|80

// fsmash
#const fsmash_IASA = 53
#const fsmash_xOffset = 4.02
#const fsmash_yOffset = 3.47
#const fsmash_xRange = 10.64
#const fsmash_yRange = 13.47
#const fsmash_hitFrame = 12
#const fsmash_lastHitFrame = 15
#const fsmash_damage_info = FSmash|20|80|65|361

#const mv_fsmash_weak = 1
#const fsmash_weak_xOffset = 7.93
#const fsmash_weak_yOffset = 3.18
#const fsmash_weak_xRange = 10.7
#const fsmash_weak_yRange = 15.58
#const fsmash_weak_hitFrame = 12
#const fsmash_weak_lastHitFrame = 15
#const fsmash_weak_damage_info = FSmash|13|80|20|361

// usmash
#const usmash_IASA = 45
#const usmash_xOffset = -8.32
#const usmash_yOffset = -2.5
#const usmash_xRange = 7.16
#const usmash_yRange = 15.88
#const usmash_hitFrame = 15
#const usmash_lastHitFrame = 24
#const usmash_damage_info = USmash|12|73|80|90

// dsmash
#const dsmash_IASA = 61
#const dsmash_xOffset = -8.69
#const dsmash_yOffset = -1.13
#const dsmash_xRange = 11.87
#const dsmash_yRange = 6.52
#const dsmash_hitFrame = 7
#const dsmash_lastHitFrame = 10
#const dsmash_damage_info = DSmash|18|42|85|75

#const mv_dsmash_weak = 1
#const dsmash_weak_xOffset = 12.32
#const dsmash_weak_yOffset = 0.84
#const dsmash_weak_xRange = 3.52
#const dsmash_weak_yRange = 3.52
#const dsmash_weak_hitFrame = 7
#const dsmash_weak_lastHitFrame = 10
#const dsmash_weak_damage_info = DSmash|14|15|95|361

#const mv_dsmash_hit2 = 2
#const dsmash_hit2_xOffset = -15.16
#const dsmash_hit2_yOffset = -0.83
#const dsmash_hit2_xRange = 13.79
#const dsmash_hit2_yRange = 5.87
#const dsmash_hit2_hitFrame = 11
#const dsmash_hit2_lastHitFrame = 18
#const dsmash_hit2_damage_info = DSmash|14|42|80|-75

// noochB
#const nspecial_IASA = 46
#const nspecial_xOffset = 1.27
#const nspecial_yOffset = 4.03
#const nspecial_xRange = 11.36
#const nspecial_yRange = 15.82
#const nspecial_hitFrame = 17
#const nspecial_lastHitFrame = 22
#const nspecial_damage_info = nspecial|9|40|110|361

#const nspecialair_IASA = 46
#const nspecialair_xOffset = -1.28
#const nspecialair_yOffset = 9.5
#const nspecialair_xRange = 12.09
#const nspecialair_yRange = 18.37
#const nspecialair_hitFrame = 17
#const nspecialair_lastHitFrame = 22
#const nspecialair_damage_info = nspecialair|9|40|110|361

// upB
// #const uspecial_IASA = 141
// #const uspecial_xOffset = 6.67
// #const uspecial_yOffset = -0.46
// #const uspecial_xRange = 3.91
// #const uspecial_yRange = 3.91
// #const uspecial_hitFrame = 5
// #const uspecial_lastHitFrame = 5
// #const uspecial_damage_info = USpecial|13|80|70|361

// #const uspecialair_IASA = 141
// #const uspecialair_xOffset = 3.46
// #const uspecialair_yOffset = 0.62
// #const uspecialair_xRange = 3.91
// #const uspecialair_yRange = 3.91
// #const uspecialair_hitFrame = 5
// #const uspecialair_lastHitFrame = 5
// #const uspecialair_damage_info = USpecialAir|10|60|70|74

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
#const sspecial_xOffset = -1.42
#const sspecial_yOffset = -5.66
#const sspecial_xRange = 8.53
#const sspecial_yRange = 8.11
#const sspecial_hitFrame = 6
#const sspecial_lastHitFrame = 8
#const sspecial_damage_info = SSpecial|5|50|25|60

#const sspecialair_IASA = 29
#const sspecialair_xOffset = -1.42
#const sspecialair_yOffset = -5.66
#const sspecialair_xRange = 8.53
#const sspecialair_yRange = 8.11
#const sspecialair_hitFrame = 6
#const sspecialair_lastHitFrame = 8
#const sspecialair_damage_info = SSpecialAir|5|50|25|60

// grab
#const grab_IASA = 32
#const grab_xOffset = 3.69
#const grab_yOffset = -4.11
#const grab_xRange = 7.06
#const grab_yRange = 4.33
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 33
#const fthrow_throwFrame = 13
#const fthrow_damage_info = Grab|5|70|45|50

#const dthrow_IASA = 44
#const dthrow_throwFrame = 13
#const dthrow_damage_info = Grab|6|65|60|60

#const bthrow_IASA = 46
#const bthrow_throwFrame = 11
#const bthrow_damage_info = Grab|5|70|70|-45

#const uthrow_IASA = 46
#const uthrow_throwFrame = 11
#const uthrow_damage_info = Grab|5|60|130|83

// NAir
#const nair_IASA = 48
#const nair_xOffset = -19.9
#const nair_yOffset = -1.89
#const nair_xRange = 19.71
#const nair_yRange = 8.5
#const nair_hitFrame = 13
#const nair_lastHitFrame = 25
#const nair_damage_info = NAir|10|50|80|361

#const mv_nair_weak = 1
#const nair_weak_xOffset = -19.67
#const nair_weak_yOffset = -1.44
#const nair_weak_xRange = 19.72
#const nair_weak_yRange = 9.03
#const nair_weak_hitFrame = 6
#const nair_weak_lastHitFrame = 11
#const nair_weak_damage_info = NAir|4|30|40|100

// FAir
#const fair_IASA = 32
#const fair_xOffset = -0.53
#const fair_yOffset = 2.78
#const fair_xRange = 8.63
#const fair_yRange = 11.01
#const fair_hitFrame = 5
#const fair_lastHitFrame = 8
#const fair_damage_info = FAir|12|40|50|50

#const mv_fair_weak = 1
#const fair_weak_xOffset = -0.53
#const fair_weak_yOffset = 2.78
#const fair_weak_xRange = 11.14
#const fair_weak_yRange = 12.68
#const fair_weak_hitFrame = 5
#const fair_weak_lastHitFrame = 8
#const fair_weak_damage_info = FAir|9|30|65|45

// BAir
#const bair_IASA = 40
#const bair_xOffset = -12.88
#const bair_yOffset = -2.87
#const bair_xRange = 7.62
#const bair_yRange = 6.23
#const bair_hitFrame = 7
#const bair_lastHitFrame = 10
#const bair_damage_info = BAir|16|20|100|-50

#const mv_bair_weak = 1
#const bair_weak_xOffset = -12.88
#const bair_weak_yOffset = -2.87
#const bair_weak_xRange = 7.62
#const bair_weak_yRange = 6.23
#const bair_weak_hitFrame = 7
#const bair_weak_lastHitFrame = 10
#const bair_weak_damage_info = BAir|11|20|70|-40

// UAir
#const uair_IASA = 48
#const uair_xOffset = -14.58
#const uair_yOffset = -7.54
#const uair_xRange = 13.47
#const uair_yRange = 8.96
#const uair_hitFrame = 5
#const uair_lastHitFrame = 10
#const uair_damage_info = UAir|12|45|40|80

#const mv_uair_weak = 1
#const uair_weak_xOffset = -18.83
#const uair_weak_yOffset = -3.52
#const uair_weak_xRange = 16.89
#const uair_weak_yRange = 12.91
#const uair_weak_hitFrame = 5
#const uair_weak_lastHitFrame = 10
#const uair_weak_damage_info = UAir|8|30|40|80

// DAir
#const dair_IASA = 50
#const dair_xOffset = -18.07
#const dair_yOffset = 10.61
#const dair_xRange = 16.78
#const dair_yRange = 10.87
#const dair_hitFrame = 7
#const dair_lastHitFrame = 10
#const dair_damage_info = DAir|9|30|60|37

#const mv_dair_spike = 1
#const dair_spike_xOffset = -7.12
#const dair_spike_yOffset = -0.68
#const dair_spike_xRange = 6.22
#const dair_spike_yRange = 5.27
#const dair_spike_hitFrame = 7
#const dair_spike_lastHitFrame = 10
#const dair_spike_damage_info = DAir|18|40|60|281

#const mv_dair_combo = 2
#const dair_combo_xOffset = -13.75
#const dair_combo_yOffset = 5.84
#const dair_combo_xRange = 12.32
#const dair_combo_yRange = 8.49
#const dair_combo_hitFrame = 7
#const dair_combo_lastHitFrame = 10
#const dair_combo_damage_info = DAir|12|30|60|90