#const DIRY_ABOVE = 8.1
#const DIRY_BELOW_AIR = 0
#const DIRY_BELOW_GROUND = 0
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const pt_jumpiness = 0.05
#const pt_djumpiness = 0.03
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.30
#const pt_bait_wdashAwayChance = 0.65
#const pt_wall_chance = 0.45
#const pt_platChance = 0.23
#const pt_baitChance = 0.9
#const pt_braveChance = 0.65
#const pt_circleCampChance = 0.5

#const cs_dashForceTurnFrame = 8
#const cs_dashDanceMinFrames = 3

#const cs_shortHopHeight = 12.25
#const cs_jumpHeight = 49
#const cs_djumpHeight = 35.4
#const cs_wavedashDist = 50

#const cs_recoveryDistX = 85
#const cs_recoveryDistY = -75

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x11a) || Equal CurrAction hex(0x11b) || Equal CurrAction hex(0x11c) || Equal CurrAction hex(0x11e)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x11f) || Equal CurrAction hex(0x121)

#const sv_execute_hardfall = -100
#const sv_execute_rising = -101

// jab123
#const jab123_IASA = 15
#const jab123_xOffset = 1.96
#const jab123_yOffset = -1.87
#const jab123_xRange = 7.35
#const jab123_yRange = 4.5
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 4
#const jab123_damage_info = Jab123|3|w20|100|65

#const mv_jab123_2 = 1
#const jab123_2_IASA = 30
#const jab123_2_xOffset = 6.76
#const jab123_2_yOffset = -1.42
#const jab123_2_xRange = 8.09
#const jab123_2_yRange = 4.02
#const jab123_2_hitFrame = 10
#const jab123_2_lastHitFrame = 12
#const jab123_2_damage_info = Jab123|3|35|100|51

// dashattack
#const dashattack_IASA = 38
#const dashattack_xOffset = 9.1
#const dashattack_yOffset = -0.5
#const dashattack_xRange = 9.16
#const dashattack_yRange = 5.8
#const dashattack_hitFrame = 6
#const dashattack_lastHitFrame = 8
#const dashattack_damage_info = DashAttack|10|70|68|83

#const mv_dashattack_weak = 1
#const dashattack_weak_xOffset = 14.94
#const dashattack_weak_yOffset = -0.5
#const dashattack_weak_xRange = 11.72
#const dashattack_weak_yRange = 5.8
#const dashattack_weak_hitFrame = 9
#const dashattack_weak_lastHitFrame = 16
#const dashattack_weak_damage_info = DashAttack|7|45|90|361

// ftilt
#const ftilt_IASA = 28
#const ftilt_xOffset = 2.08
#const ftilt_yOffset = -0.61
#const ftilt_xRange = 9.63
#const ftilt_yRange = 3.8
#const ftilt_hitFrame = 6
#const ftilt_lastHitFrame = 9
#const ftilt_damage_info = FTilt|11|16|100|361

// utilt
#const utilt_IASA = 30
#const utilt_xOffset = -1.45
#const utilt_yOffset = -0.08
#const utilt_xRange = 7.11
#const utilt_yRange = 7.63
#const utilt_hitFrame = 7
#const utilt_lastHitFrame = 8
#const utilt_damage_info = UTilt|11|60|85|95

#const mv_utilt_weak = 1
#const utilt_weak_xOffset = -10.11
#const utilt_weak_yOffset = -6.32
#const utilt_weak_xRange = 11.63
#const utilt_weak_yRange = 9.81
#const utilt_weak_hitFrame = 9
#const utilt_weak_lastHitFrame = 12
#const utilt_weak_damage_info = UTilt|9|50|100|85

#const art_lucas_uspecial = 2

// dtilt
#const dtilt_IASA = 14
#const dtilt_xOffset = 3.66
#const dtilt_yOffset = 0.53
#const dtilt_xRange = 6.38
#const dtilt_yRange = 3.71
#const dtilt_hitFrame = 3
#const dtilt_lastHitFrame = 4
#const dtilt_damage_info = DTilt|4|w40|100|361

// fsmash
#const fsmash_IASA = 47
#const fsmash_xOffset = -1.82
#const fsmash_yOffset = -0.06
#const fsmash_xRange = 10.65
#const fsmash_yRange = 5.35
#const fsmash_hitFrame = 15
#const fsmash_lastHitFrame = 17
#const fsmash_damage_info = FSmash|16|60|77|361

#const mv_fsmash_strong = 1
#const fsmash_strong_damage_info = FSmash|16|60|85|361

// usmash
#const usmash_IASA = 83
#const usmash_IASA = 78
#const usmash_xOffset = -10
#const usmash_yOffset = -7
#const usmash_xRange = 10
#const usmash_yRange = 14.5
#const usmash_hitFrame = 17
#const usmash_lastHitFrame = 28
#const usmash_damage_info = USmash|20|50|84|95

#const mv_usmash_strong = 1
#const usmash_strong_damage_info = USmash|24|53|75|95


// dsmash
#const dsmash_IASA = 38
#const dsmash_xOffset = 1.52
#const dsmash_yOffset = 3
#const dsmash_xRange = 6
#const dsmash_yRange = 6
#const dsmash_hitFrame = 21
#const dsmash_lastHitFrame = 26
#const dsmash_damage_info = DSmash|17|40|90|361

#const mv_dsmash_strong = 1
#const dsmash_strong_damage_info = DSmash|21|42|77|361

#const mv_dsmash2 = 2
#const dsmash2_IASA = 46
#const dsmash2_xOffset = 1.52
#const dsmash2_yOffset = 3
#const dsmash2_xRange = 6
#const dsmash2_yRange = 6
#const dsmash2_hitFrame = 29
#const dsmash2_lastHitFrame = 33
#const dsmash2_damage_info = DSmash|14|30|90|361

#const mv_dsmash2_strong = 3
#const dsmash2_IASA = 46
#const dsmash2_xOffset = 1.52
#const dsmash2_yOffset = 3
#const dsmash2_xRange = 6
#const dsmash2_yRange = 6
#const dsmash2_hitFrame = 29
#const dsmash2_lastHitFrame = 33
#const dsmash_damage_info = DSmash|18|30|73|361

// noochB
#const nspecial_IASA = 41
#const nspecial_xOffset = -6.45
#const nspecial_yOffset = -2.62
#const nspecial_xRange = 7.03
#const nspecial_yRange = 7.7
#const nspecial_hitFrame = 2
#const nspecial_lastHitFrame = 3
#const nspecial_damage_info = NSpecial|10|50|100|60

#const mv_nspecial_charge = 1
#const nspecial_charge_IASA = 140
#const nspecial_charge_xOffset = -20
#const nspecial_charge_yOffset = -20
#const nspecial_charge_xRange = 20
#const nspecial_charge_yRange = 20
#const nspecial_charge_hitFrame = 10
#const nspecial_charge_lastHitFrame = 10
#const nspecial_charge_damage_info = NSpecial|0|0|0|0

#const nspecialair_IASA = 41
#const nspecialair_xOffset = -6.45
#const nspecialair_yOffset = -2.62
#const nspecialair_xRange = 7.03
#const nspecialair_yRange = 7.7
#const nspecialair_hitFrame = 2
#const nspecialair_lastHitFrame = 3
#const nspecialair_damage_info = NSpecialAir|10|50|100|60

// upB
#const uspecial_IASA = 74
#const uspecial_xOffset = -0.51
#const uspecial_yOffset = -0.45
#const uspecial_xRange = 4.2
#const uspecial_yRange = 4.99
#const uspecial_hitFrame = 44
#const uspecial_lastHitFrame = 73
// #const uspecial_damage_info = USpecial|14|60|60|80

// downB
#const dspecial_IASA = 9
#const dspecial_xOffset = -0.05
#const dspecial_yOffset = -2.2
#const dspecial_xRange = 6.67
#const dspecial_yRange = 4.1
#const dspecial_hitFrame = 6
#const dspecial_lastHitFrame = 8
#const dspecial_damage_info = DSpecial|4|77|80|127

#const dspecialair_IASA = 9
#const dspecialair_xOffset = -0.05
#const dspecialair_yOffset = -2.2
#const dspecialair_xRange = 6.67
#const dspecialair_yRange = 4.1
#const dspecialair_hitFrame = 6
#const dspecialair_lastHitFrame = 8
#const dspecialair_damage_info = DSpecial|4|77|80|127


// sideB
#const sspecial_IASA = 43
#const sspecial_xOffset = 0
#const sspecial_yOffset = 0
#const sspecial_xRange = 60
#const sspecial_yRange = 8
#const sspecial_hitFrame = 25
#const sspecial_lastHitFrame = 45
// #const sspecial_damage_info = SSpecial|0|0|0|0
#const sspecial_damage_info = SSpecial|-5|45|29|70

#const sspecialair_IASA = 25
#const sspecialair_xOffset = 0
#const sspecialair_yOffset = 0
#const sspecialair_xRange = 60
#const sspecialair_yRange = 8
#const sspecialair_hitFrame = 25
#const sspecialair_lastHitFrame = 45
// #const sspecialair_damage_info = SSpecialAir|0|0|0|0
#const sspecialair_damage_info = SSpecialAir|-5|45|29|70

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 55
#const grab_xOffset = 3.92
#const grab_yOffset = -1.31
#const grab_xRange = 10.74
#const grab_yRange = 3.59
#const grab_hitFrame = 11
#const grab_lastHitFrame = 13
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 47
#const fthrow_throwFrame = 16
#const fthrow_damage_info = Grab|10|65|50|45

#const dthrow_IASA = 42
#const dthrow_throwFrame = 20
#const dthrow_damage_info = Grab|7|85|50|75

#const bthrow_IASA = 52
#const bthrow_throwFrame = 19
#const bthrow_damage_info = Grab|10|70|75|45

#const uthrow_IASA = 63
#const uthrow_throwFrame = 40
#const uthrow_damage_info = Grab|8|75|110|90

// NAir
#const nair_IASA = 43
#const nair_xOffset = -7.25
#const nair_yOffset = 2.5
#const nair_xRange = 7.53
#const nair_yRange = 7.5
#const nair_hitFrame = 4
#const nair_lastHitFrame = 19
#const nair_damage_info = NAir|2|w20|130|110

// FAir
#const fair_IASA = 32
#const fair_xOffset = -2.09
#const fair_yOffset = 1.09
#const fair_xRange = 8.15
#const fair_yRange = 4.52
#const fair_hitFrame = 5
#const fair_lastHitFrame = 10
#const fair_damage_info = FAir|12|36|95|55

// BAir
#const bair_IASA = 43
#const bair_xOffset = -13.52
#const bair_yOffset = 10.23
#const bair_xRange = 4.97
#const bair_yRange = 10.6
#const bair_hitFrame = 14
#const bair_lastHitFrame = 16
#const bair_damage_info = BAir|15|20|80|-300

// UAir
#const uair_IASA = 27
#const uair_xOffset = -12.14
#const uair_yOffset = 2.13
#const uair_xRange = 10.33
#const uair_yRange = 10.48
#const uair_hitFrame = 5
#const uair_lastHitFrame = 9
#const uair_damage_info = UAir|10|20|100|70

// DAir
#const dair_IASA = 42
#const dair_xOffset = -4.84
#const dair_yOffset = 8.6
#const dair_xRange = 5.5
#const dair_yRange = 8.05
#const dair_hitFrame = 4
#const dair_lastHitFrame = 21
#const dair_damage_info = DAir|5|35|150|270

#const mv_dair_spike = 1
#const dair_spike_xOffset = -4.84
#const dair_spike_yOffset = 8.6
#const dair_spike_xRange = 5.5
#const dair_spike_yRange = 8.05
#const dair_spike_hitFrame = 19
#const dair_spike_lastHitFrame = 21
#const dair_spike_damage_info = DAir|5|35|150|270
