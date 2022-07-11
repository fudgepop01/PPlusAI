#const DIRY_ABOVE = 13.5
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 15.84
#const cs_jumpHeight = 40.12
#const cs_djumpHeight = 29.93
#const cs_wavedashDist = 20

#const dashForceTurnFrame = 14
#const dashDanceMinFrames = 2

#const pt_jumpiness = 0.05
#const pt_djumpiness = 0.02
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.55
#const pt_bait_wdashAwayChance = 0.08
#const pt_wall_chance = 0.95
#const pt_platChance = 0.1
#const pt_baitChance = 0.9
#const pt_braveChance = 0.7
#const pt_circleCampChance = 0.4

// #const pt_jumpiness = 0.05
// #const pt_djumpiness = 0.02
// #const pt_aggression = 0.0
// #const pt_bait_dashAwayChance = 5.55
// #const pt_bait_wdashAwayChance = 0.08
// #const pt_wall_chance = 0.0
// #const pt_platChance = 0.1
// #const pt_baitChance = 0.9
// #const pt_braveChance = 0.0
// #const pt_circleCampChance = 0.0

#const recovery_moves = uspecial|sspecial

#const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1D6)) && !(Equal CurrSubaction hex(0x1D7))
#const uspecial_recovery_info = common|60

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x119) || Equal CurrAction hex(0x11a) || Equal CurrAction hex(0x129) || Equal CurrAction hex(0x12b) 
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x11b)


// jab123
#const mv_gentlemen = 0
#const mv_jabReset = 1

#const jab123_IASA = 14
#const jab123_xOffset = 1.54
#const jab123_yOffset = -5.71
#const jab123_xRange = 9.03
#const jab123_yRange = 5.16
#const jab123_hitFrame = 6
#const jab123_lastHitFrame = 12
// #const jab123_damage_info = Jab123|8|20|100|55

// dashattack
#const dashattack_IASA = 37
#const dashattack_xOffset = 9.31
#const dashattack_yOffset = -2.79
#const dashattack_xRange = 10.78
#const dashattack_yRange = 6.41
#const dashattack_hitFrame = 7
#const dashattack_lastHitFrame = 16
#const dashattack_damage_info = DashAttack|10|22|90|361

// ftilt
#const ftilt_IASA = 29
#const ftilt_xOffset = 2.35
#const ftilt_yOffset = -8.15
#const ftilt_xRange = 9.53
#const ftilt_yRange = 4.39
#const ftilt_hitFrame = 9
#const ftilt_lastHitFrame = 11
#const ftilt_damage_info = FTilt|11|10|100|361

// utilt
#const utilt_IASA = 37
#const utilt_xOffset = -0.24
#const utilt_yOffset = 3.79
#const utilt_xRange = 10.77
#const utilt_yRange = 15.57
#const utilt_hitFrame = 17
#const utilt_lastHitFrame = 22
#const utilt_damage_info = UTilt|13|50|80|361

// dtilt
#const dtilt_IASA = 34
#const dtilt_xOffset = 0.59
#const dtilt_yOffset = 1.61
#const dtilt_xRange = 11.23
#const dtilt_yRange = 5.23
#const dtilt_hitFrame = 10
#const dtilt_lastHitFrame = 15
#const dtilt_damage_info = DTilt|12|25|75|70

// fsmash
#const fsmash_IASA = 60
#const fsmash_xOffset = 5.73
#const fsmash_yOffset = -5.3
#const fsmash_xRange = 10.91
#const fsmash_yRange = 4.24
#const fsmash_hitFrame = 19
#const fsmash_lastHitFrame = 21
#const fsmash_damage_info = FSmash|20|24|100|361

// usmash
#const usmash_IASA = 40
#const usmash_xOffset = -2.55
#const usmash_yOffset = -2.89
#const usmash_xRange = 8.37
#const usmash_yRange = 13.9
#const usmash_hitFrame = 22
#const usmash_lastHitFrame = 29
#const usmash_damage_info = USmash|13|30|126|90

// dsmash
#const dsmash_IASA = 44
#const dsmash_xOffset = 4.7
#const dsmash_yOffset = -6.99
#const dsmash_xRange = 7.9
#const dsmash_yRange = 4.79
#const dsmash_hitFrame = 20
#const dsmash_lastHitFrame = 23
#const dsmash_damage_info = DSmash|18|30|100|361

#const mv_dsmash_late = 1
#const dsmash_late_xOffset = -19.56
#const dsmash_late_yOffset = -3.95
#const dsmash_late_xRange = 7.05
#const dsmash_late_yRange = 4.37
#const dsmash_late_hitFrame = 30
#const dsmash_late_lastHitFrame = 32
#const dsmash_late_damage_info = DSmash|16|20|100|361

// noochB
#const nspecial_IASA = 101
#const nspecial_xOffset = 4.05
#const nspecial_yOffset = -4.98
#const nspecial_xRange = 11.32
#const nspecial_yRange = 4.93
#const nspecial_hitFrame = 53
#const nspecial_lastHitFrame = 57
// #const nspecial_damage_info = NSpecial|25|30|102|361

// upB
#const uspecial_IASA = 9999.9999
#const uspecial_xOffset = 9999.9999
#const uspecial_yOffset = 9999.9999
#const uspecial_xRange = 9999.9999
#const uspecial_yRange = 9999.9999
#const uspecial_hitFrame = 9999.9999
#const uspecial_lastHitFrame = 9999.9999

// downB
#const dspecial_IASA = 41
#const dspecial_xOffset = 3.29
#const dspecial_yOffset = -2.64
#const dspecial_xRange = 34.64
#const dspecial_yRange = 4.37
#const dspecial_hitFrame = 15
#const dspecial_lastHitFrame = 33
// #const dspecial_damage_info = DSpecial|0|0|0|0

#const dspecialair_IASA = 31
#const dspecialair_xOffset = -1
#const dspecialair_yOffset = 5.84
#const dspecialair_xRange = 6.86
#const dspecialair_yRange = 10.21
#const dspecialair_hitFrame = 16
#const dspecialair_lastHitFrame = 18
// #const dspecialair_damage_info = DSpecialAir|15|40|70|361

// sideB
#const sspecial_IASA = 60
#const sspecial_xOffset = -1.56
#const sspecial_yOffset = -1.41
#const sspecial_xRange = 11.08
#const sspecial_yRange = 9.11
#const sspecial_hitFrame = 4
#const sspecial_lastHitFrame = 8
#const sspecial_damage_info = SSpecial|7|78|80|90

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = -0.91
#const grab_yOffset = -5.94
#const grab_xRange = 5.82
#const grab_yRange = 3.91
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 34
#const fthrow_throwFrame = 11
#const fthrow_damage_info = Grab|4|45|105|45

#const dthrow_IASA = 41
#const dthrow_throwFrame = 18
#const dthrow_damage_info = Grab|7|75|34|65

#const bthrow_IASA = 43
#const bthrow_throwFrame = 12
#const bthrow_damage_info = Grab|4|30|130|45

#const uthrow_IASA = 45
#const uthrow_throwFrame = 13
#const uthrow_damage_info = Grab|3|70|105|85

// NAir
#const nair_IASA = 44
#const nair_xOffset = -3.17
#const nair_yOffset = -0.82
#const nair_xRange = 9.96
#const nair_yRange = 6.11
#const nair_hitFrame = 7
#const nair_lastHitFrame = 12
#const nair_damage_info = NAir|6|w40|100|74

#const mv_nair_hit2 = 1
#const nair_hit2_yRange = 8.49
#const nair_hitFrame = 7
#const nair_hit2_lastHitFrame = 29
#const nair_hit2_damage_info = NAir|7|40|100|361

// FAir
#const fair_IASA = 35
#const fair_xOffset = 0.39
#const fair_yOffset = -0.84
#const fair_xRange = 5.95
#const fair_yRange = 5.77
#const fair_hitFrame = 14
#const fair_lastHitFrame = 16
#const fair_damage_info = FAir|18|24|100|32

#const mv_fair_weak = 1
#const fair_weak_xOffset = 1.09
#const fair_weak_yOffset = -0.77
#const fair_weak_xRange = 5.65
#const fair_weak_yRange = 5.78
#const fair_weak_hitFrame = 17
#const fair_weak_lastHitFrame = 30
#const fair_weak_damage_info = FAir|6|35|80|361

// BAir
#const bair_IASA = 28
#const bair_xOffset = -16.52
#const bair_yOffset = -1.13
#const bair_xRange = 7.83
#const bair_yRange = 6.24
#const bair_hitFrame = 10
#const bair_lastHitFrame = 13
#const bair_damage_info = BAir|14|0|100|-361

// UAir
#const uair_IASA = 29
#const uair_xOffset = -5.5
#const uair_yOffset = -2.37
#const uair_xRange = 11.48
#const uair_yRange = 12.13
#const uair_hitFrame = 6
#const uair_lastHitFrame = 10
#const uair_damage_info = UAir|12|10|100|361

#const mv_uair_tipman = 1
#const uair_tipman_xOffset = -16.75
#const uair_tipman_yOffset = -6.93
#const uair_tipman_xRange = 10.32
#const uair_tipman_yRange = 9.85
#const uair_tipman_hitFrame = 11
#const uair_tipman_lastHitFrame = 13
#const uair_tipman_damage_info = UAir|10|8|80|-30

// DAir
#const dair_IASA = 37
#const dair_xOffset = -5.76
#const dair_yOffset = 10.97
#const dair_xRange = 6.75
#const dair_yRange = 12.8
#const dair_hitFrame = 16
#const dair_lastHitFrame = 20
#const dair_damage_info = DAir|16|40|100|270

#const mv_dair_spike = 1
#const dair_spike_xOffset = -5.4
#const dair_spike_yOffset = -3.01
#const dair_spike_xRange = 5.49
#const dair_spike_yRange = 5.81
#const dair_spike_damage_info = DAir|16|40|100|290