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
#const pt_wall_chance = 0.4
#const pt_platChance = 0.1
#const pt_baitchance = 0.9
#const pt_braveChance = 0.85
#const pt_circleCampChance = 0.55

#const cs_dashForceTurnFrame = 9
#const cs_dashDanceMinFrames = 6

#const cs_shortHopHeight = 14.28
#const cs_jumpHeight = 35.43
#const cs_djumpHeight = 35.43
#const cs_wavedashDist = 32
#const cs_recoveryDistX = 90
#const cs_recoveryDistY = -60

#const SFALL_ACTIONS = Equal CurrAction hex(0x10) || Equal CurrAction hex(0xe)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x125) || Equal CurrAction hex(0x19) 
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x117)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x11d) || Equal CurrAction hex(0x123)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x124) || Equal CurrAction hex(0x11e)

// jab123
#const jab123_IASA = 14
#const jab123_xOffset = 0
#const jab123_yOffset = -3.5
#const jab123_xRange = 8.5
#const jab123_yRange = 3.5
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 5
#const jab123_damage_info = Jab123|3|10|80|80

#const mv_jab123_2 = 1
#const jab123_2_xOffset = 1.56
#const jab123_2_yOffset = -5.69
#const jab123_2_xRange = 8.03
#const jab123_2_yRange = 4.72
#const jab123_2_hitFrame = 6
#const jab123_2_lastHitFrame = 10
#const jab123_2_damage_info = Jab123|4|w35|100|72

#const mv_jab123_3 = 2
#const jab123_3_xOffset = 0.79
#const jab123_3_yOffset = -0.63
#const jab123_3_xRange = 9.77
#const jab123_3_yRange = 11.03
#const jab123_3_hitFrame = 7
#const jab123_3_lastHitFrame = 10
#const jab123_3_damage_info = Jab123|5|35|110|35

// dashattack
#const dashattack_IASA = 51
#const dashattack_xOffset = 19.99
#const dashattack_yOffset = -5.67
#const dashattack_xRange = 10.1
#const dashattack_yRange = 5.53
#const dashattack_hitFrame = 16
#const dashattack_lastHitFrame = 19
#const dashattack_damage_info = DashAttack|12|43|87|40

#const mv_dashattack_late = 1
#const dashattack_late_xOffset = 23.88
#const dashattack_late_yOffset = -3.54
#const dashattack_late_xRange = 8.64
#const dashattack_late_yRange = 6.2
#const dashattack_late_hitFrame = 20
#const dashattack_late_lastHitFrame = 23
#const dashattack_late_damage_info = DashAttack|7|30|65|24

// ftilt
#const ftilt_IASA = 31
#const ftilt_xOffset = 6.39
#const ftilt_yOffset = -4.43
#const ftilt_xRange = 8.76
#const ftilt_yRange = 4.39
#const ftilt_hitFrame = 8
#const ftilt_lastHitFrame = 11
#const ftilt_damage_info = FTilt|10|10|90|361

// utilt
#const utilt_IASA = 24
#const utilt_xOffset = -0.39
#const utilt_yOffset = 0.03
#const utilt_xRange = 7.85
#const utilt_yRange = 12.43
#const utilt_hitFrame = 8
#const utilt_lastHitFrame = 12
#const utilt_damage_info = UTilt|9|34|111|85

// dtilt
#const dtilt_IASA = 24
#const dtilt_xOffset = 3.27
#const dtilt_yOffset = 1.92
#const dtilt_xRange = 6.85
#const dtilt_yRange = 4.74
#const dtilt_hitFrame = 6
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|10|60|60|80

// fsmash
#const fsmash_IASA = 52
#const fsmash_xOffset = 15.9
#const fsmash_yOffset = -2.82
#const fsmash_xRange = 10.42
#const fsmash_yRange = 3.92
#const fsmash_hitFrame = 24
#const fsmash_lastHitFrame = 29
#const fsmash_damage_info = FSmash|19|40|80|40

// usmash
#const usmash_IASA = 49
#const usmash_xOffset = -6.89
#const usmash_yOffset = -2.53
#const usmash_xRange = 10.7
#const usmash_yRange = 15.56
#const usmash_hitFrame = 15
#const usmash_lastHitFrame = 23
#const usmash_damage_info = USmash|17|40|100|85

// dsmash
#const dsmash_IASA = 31
#const dsmash_xOffset = -5.23
#const dsmash_yOffset = -2.16
#const dsmash_xRange = 5.21
#const dsmash_yRange = 12.92
#const dsmash_hitFrame = 6
#const dsmash_lastHitFrame = 26
#const dsmash_damage_info = DSmash|12|40|80|90

// noochB
#const nspecial_IASA = 69
#const nspecial_xOffset = -9.83
#const nspecial_yOffset = 9.08
#const nspecial_xRange = 12.56
#const nspecial_yRange = 22.88
#const nspecial_hitFrame = 27
#const nspecial_lastHitFrame = 37
#const nspecial_damage_info = NSpecial|20|80|81|85

#const nspecialair_IASA = 55
#const nspecialair_xOffset = -7
#const nspecialair_yOffset = 30
#const nspecialair_xRange = 12
#const nspecialair_yRange = 15
#const nspecialair_hitFrame = 21
#const nspecialair_lastHitFrame = 23
#const nspecialair_damage_info = NSpecialAir|5|80|100|290

#const mv_nspecialair_dig = 1
#const nspecialair_dig_IASA = 69
#const nspecialair_dig_xOffset = -9.83
#const nspecialair_dig_yOffset = 9.08
#const nspecialair_dig_xRange = 12.56
#const nspecialair_dig_yRange = 22.88
#const nspecialair_dig_hitFrame = 27
#const nspecialair_dig_lastHitFrame = 37
#const nspecialair_dig_damage_info = NSpecialAir|20|80|81|85

// upB
// #const uspecial_IASA = 74
// #const uspecial_xOffset = -0.51
// #const uspecial_yOffset = -0.45
// #const uspecial_xRange = 4.2
// #const uspecial_yRange = 4.99
// #const uspecial_hitFrame = 44
// #const uspecial_lastHitFrame = 73
// #const uspecial_damage_info = USpecial|14|60|60|80

// downB
// #const dspecial_IASA = 62
// #const dspecial_xOffset = -3.12
// #const dspecial_yOffset = -1.28
// #const dspecial_xRange = 3.12
// #const dspecial_yRange = 3.12
// #const dspecial_hitFrame = 6
// #const dspecial_lastHitFrame = 15
// #const dspecial_damage_info = DSpecial|8|87|30|50

// #const dspecialair_IASA = 8
// #const dspecialair_xOffset = -8
// #const dspecialair_yOffset = 1.5
// #const dspecialair_xRange = 8
// #const dspecialair_yRange = 8
// #const dspecialair_hitFrame = 1
// #const dspecialair_lastHitFrame = 1
// #const dspecialair_damage_info = DSpecialAir|5|55|35|20


// sideB
#const sspecial_IASA = 53
#const sspecial_xOffset = 1.3
#const sspecial_yOffset = 37.18
#const sspecial_xRange = 11.41
#const sspecial_yRange = 18.76
#const sspecial_hitFrame = 45
#const sspecial_lastHitFrame = 52
#const sspecial_damage_info = SSpecial|16|60|30|295

#const sspecialair_IASA = 29
#const sspecialair_xOffset = 1.3
#const sspecialair_yOffset = 37.18
#const sspecialair_xRange = 11.41
#const sspecialair_yRange = 18.76
#const sspecialair_hitFrame = 21
#const sspecialair_lastHitFrame = 28
#const sspecialair_damage_info = SSpecialAir|16|60|30|295

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 1.4
#const grab_yOffset = -3.4
#const grab_xRange = 6.17
#const grab_yRange = 3.86
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 38
#const fthrow_throwFrame = 22
#const fthrow_damage_info = Grab|4|65|65|45

#const dthrow_IASA = 62
#const dthrow_throwFrame = 53
#const dthrow_damage_info = Grab|6|80|38|66

#const bthrow_IASA = 74
#const bthrow_throwFrame = 55
#const bthrow_damage_info = Grab|10|74|79|-37

#const uthrow_IASA = 61
#const uthrow_throwFrame = 42
#const uthrow_damage_info = Grab|8|80|70|85

// NAir
#const nair_IASA = 35
#const nair_xOffset = -4.96
#const nair_yOffset = 1.43
#const nair_xRange = 7.72
#const nair_yRange = 4.95
#const nair_hitFrame = 6
#const nair_lastHitFrame = 9
#const nair_damage_info = NAir|12|20|100|361

#const mv_nair_weak = 1
#const nair_weak_xOffset = -4.96
#const nair_weak_yOffset = 1.35
#const nair_weak_xRange = 7.71
#const nair_weak_yRange = 4.79
#const nair_weak_hitFrame = 10
#const nair_weak_lastHitFrame = 27
#const nair_weak_damage_info = NAir|8|15|100|361

// FAir
#const fair_IASA = 44
#const fair_xOffset = -3.19
#const fair_yOffset = -7.57
#const fair_xRange = 10.4
#const fair_yRange = 8.16
#const fair_hitFrame = 13
#const fair_lastHitFrame = 15
#const fair_damage_info = FAir|15|35|80|40

#const mv_fair_meteor = 1
#const fair_meteor_xOffset = -0.08
#const fair_meteor_yOffset = 9.85
#const fair_meteor_xRange = 8.85
#const fair_meteor_yRange = 13.21
#const fair_meteor_hitFrame = 16
#const fair_meteor_lastHitFrame = 17
#const fair_meteor_damage_info = FAir|15|70|60|270

// BAir
#const bair_IASA = 32
#const bair_xOffset = -15.63
#const bair_yOffset = 2.59
#const bair_xRange = 3.79
#const bair_yRange = 3.89
#const bair_hitFrame = 12
#const bair_lastHitFrame = 14
#const bair_damage_info = BAir|15|21|101|-361

#const mv_bair_weak = 1
#const bair_weak_xOffset = -15.06
#const bair_weak_yOffset = 1.82
#const bair_weak_xRange = 4.37
#const bair_weak_yRange = 3.99
#const bair_weak_hitFrame = 15
#const bair_weak_lastHitFrame = 21
#const bair_weak_damage_info = BAir|8|10|85|-361

// UAir
#const uair_IASA = 32
#const uair_xOffset = -7.91
#const uair_yOffset = 1.56
#const uair_xRange = 9.3
#const uair_yRange = 10.42
#const uair_hitFrame = 7
#const uair_lastHitFrame = 10
#const uair_damage_info = UAir|11|30|100|85

// DAir
#const dair_IASA = 36
#const dair_xOffset = -3.2
#const dair_yOffset = 10.66
#const dair_xRange = 5.19
#const dair_yRange = 8.63
#const dair_hitFrame = 14
#const dair_lastHitFrame = 18
#const dair_damage_info = DAir|11|71|59|270