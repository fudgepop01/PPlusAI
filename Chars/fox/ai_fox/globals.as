#const DIRY_ABOVE = 15
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = 0

#const pt_jumpiness = 0.1
#const pt_djumpiness = 0.04
#const pt_aggression = 0.8
#const pt_bait_dashAwayChance = 0.6
#const pt_bait_wdashAwayChance = 0.15
#const pt_wall_chance = 0.4
#const pt_platChance = 0.1
#const pt_baitChance = 0.75
#const pt_braveChance = 0.85
#const pt_circleCampChance = 0.55

#const cs_dashForceTurnFrame = 9
#const cs_dashDanceMinFrames = 6

#const cs_shortHopHeight = 11.8
#const cs_jumpHeight = 33.23
#const cs_djumpHeight = 42.39
#const cs_wavedashDist = 32
#const cs_recoveryDistX = 90
#const cs_recoveryDistY = -90

#const SFALL_ACTIONS = Equal CurrAction hex(0x10) || Equal CurrSubaction hex(0x1de)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x129)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118) 
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x11a)

// jab123
#const jab123_IASA = 17
#const jab123_xOffset = 3.46
#const jab123_yOffset = -3
#const jab123_xRange = 6.83
#const jab123_yRange = 3.98
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 3
#const jab123_damage_info = Jab123|4|0|100|70

// dashattack
#const dashattack_IASA = 35
#const dashattack_xOffset = 9.63
#const dashattack_yOffset = -0.29
#const dashattack_xRange = 10.3
#const dashattack_yRange = 5.4
#const dashattack_hitFrame = 4
#const dashattack_lastHitFrame = 17
#const dashattack_damage_info = DashAttack|7|35|90|72

// ftilt
#const ftilt_IASA = 26
#const ftilt_xOffset = -0.84
#const ftilt_yOffset = -3.69
#const ftilt_xRange = 8.9
#const ftilt_yRange = 3.76
#const ftilt_hitFrame = 5
#const ftilt_lastHitFrame = 8
#const ftilt_damage_info = FTilt|9|0|100|361

// utilt
#const utilt_IASA = 24
#const utilt_xOffset = -10.86
#const utilt_yOffset = 1.44
#const utilt_xRange = 10.16
#const utilt_yRange = 9.97
#const utilt_hitFrame = 5
#const utilt_lastHitFrame = 11
#const utilt_damage_info = UTilt|12|18|140|110

// dtilt
#const dtilt_IASA = 27
#const dtilt_xOffset = 7.74
#const dtilt_yOffset = 1.43
#const dtilt_xRange = 6.46
#const dtilt_yRange = 3.51
#const dtilt_hitFrame = 7
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|10|25|125|80

// fsmash
#const fsmash_IASA = 36
#const fsmash_xOffset = 12.37
#const fsmash_yOffset = -3.48
#const fsmash_xRange = 8.75
#const fsmash_yRange = 6.92
#const fsmash_hitFrame = 9
#const fsmash_lastHitFrame = 13
#const fsmash_damage_info = FSmash|15|10|105|361

// usmash
#const usmash_IASA = 39
#const usmash_xOffset = 2.22
#const usmash_yOffset = -0.72
#const usmash_xRange = 6.04
#const usmash_yRange = 9.82
#const usmash_hitFrame = 5
#const usmash_lastHitFrame = 7
#const usmash_damage_info = USmash|17|26|108|80

// dsmash
#const dsmash_IASA = 46
#const dsmash_xOffset = -13.68
#const dsmash_yOffset = 3.73
#const dsmash_xRange = 12.51
#const dsmash_yRange = 5.35
#const dsmash_hitFrame = 7
#const dsmash_lastHitFrame = 11
#const dsmash_damage_info = DSmash|15|20|65|25

// noochB
#const nspecial_IASA = 80
#const nspecial_xOffset = 5
#const nspecial_yOffset = -2
#const nspecial_xRange = 200
#const nspecial_yRange = 2
#const nspecial_hitFrame = 20
#const nspecial_lastHitFrame = 30
#const nspecial_damage_info = NSpecial|3|0|0|0

#const nspecialair_IASA = 80
#const nspecialair_xOffset = 0
#const nspecialair_yOffset = 5
#const nspecialair_xRange = 200
#const nspecialair_yRange = 10
#const nspecialair_hitFrame = 10
#const nspecialair_lastHitFrame = 30
#const nspecialair_damage_info = NSpecialAir|3|0|0|0

#const mv_nspecial_air1 = 1
#const nspecialair_xOffset = 40
#const nspecialair_hitFrame = 30

#const mv_nspecial_air2 = 2
#const nspecialair_xOffset = 60
#const nspecialair_hitFrame = 40

#const mv_nspecial_air4 = 3
#const nspecialair_xOffset = 80
#const nspecialair_hitFrame = 50

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
#const dspecial_IASA = 8
#const dspecial_xOffset = -8
#const dspecial_yOffset = 1.5
#const dspecial_xRange = 8
#const dspecial_yRange = 8
#const dspecial_hitFrame = 1
#const dspecial_lastHitFrame = 1
#const dspecial_damage_info = DSpecial|5|w80|100|1

#const dspecialair_IASA = 8
#const dspecialair_xOffset = -8
#const dspecialair_yOffset = 1.5
#const dspecialair_xRange = 8
#const dspecialair_yRange = 8
#const dspecialair_hitFrame = 1
#const dspecialair_lastHitFrame = 1
#const dspecialair_damage_info = DSpecialAir|5|55|35|20


// sideB
// #const sspecial_IASA = 26
// #const sspecial_xOffset = -1.56
// #const sspecial_yOffset = -1.41
// #const sspecial_xRange = 11.08
// #const sspecial_yRange = 13.11
// #const sspecial_hitFrame = 4
// #const sspecial_lastHitFrame = 8
// #const sspecial_damage_info = SSpecial|7|78|80|90

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 1.77
#const grab_yOffset = -2.84
#const grab_xRange = 5.2
#const grab_yRange = 3.91
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 35
#const fthrow_throwFrame = 10
#const fthrow_damage_info = Grab|3|35|130|45

#const dthrow_IASA = 45
#const dthrow_throwFrame = 32
#const dthrow_damage_info = Grab|1|150|40|270

#const bthrow_IASA = 40
#const bthrow_throwFrame = 8
#const bthrow_damage_info = Grab|2|80|85|56

#const uthrow_IASA = 40
#const uthrow_throwFrame = 6
#const uthrow_damage_info = Grab|2|75|110|90

// NAir
#const nair_IASA = 41
#const nair_xOffset = -3.77
#const nair_yOffset = -0.08
#const nair_xRange = 6.62
#const nair_yRange = 4.45
#const nair_hitFrame = 4
#const nair_lastHitFrame = 7
#const nair_damage_info = NAir|12|10|100|361

#const mv_nair_weak = 1
#const nair_weak_xOffset = -3.75
#const nair_weak_yOffset = -0.03
#const nair_weak_xRange = 6.66
#const nair_weak_yRange = 4.77
#const nair_weak_hitFrame = 8
#const nair_weak_lastHitFrame = 31
#const nair_weak_damage_info = NAir|9|0|100|361

// FAir
#const fair_IASA = 52
#const fair_xOffset = -0.95
#const fair_yOffset = -3.34
#const fair_xRange = 7.98
#const fair_yRange = 5.59
#const fair_hitFrame = 6
#const fair_lastHitFrame = 8
#const fair_damage_info = FAir|7|10|100|361

// BAir
#const bair_IASA = 37
#const bair_xOffset = -13.41
#const bair_yOffset = -1.38
#const bair_xRange = 9.53
#const bair_yRange = 6.72
#const bair_hitFrame = 4
#const bair_lastHitFrame = 7
#const bair_damage_info = BAir|15|0|100|-361

#const mv_bair_weak = 1
#const bair_weak_xOffset = -13.34
#const bair_weak_yOffset = -1.15
#const bair_weak_xRange = 9.54
#const bair_weak_yRange = 6.8
#const bair_weak_hitFrame = 8
#const bair_weak_lastHitFrame = 19
#const bair_weak_damage_info = BAir|9|0|100|361

// UAir
#const uair_IASA = 35
#const uair_xOffset = -5.05
#const uair_yOffset = -4.33
#const uair_xRange = 5.88
#const uair_yRange = 8.25
#const uair_hitFrame = 11
#const uair_lastHitFrame = 14
#const uair_damage_info = UAir|13|40|116|85

#const mv_uair_weak = 1
#const uair_weak_IASA = 35
#const uair_weak_xOffset = -4.33
#const uair_weak_yOffset = -5.6
#const uair_weak_xRange = 5.11
#const uair_weak_yRange = 7.12
#const uair_weak_hitFrame = 8
#const uair_weak_lastHitFrame = 9
#const uair_weak_damage_info = UAir|4|w30|120|92

// DAir
#const dair_IASA = 51
#const dair_xOffset = -4.34
#const dair_yOffset = 2.33
#const dair_xRange = 6.96
#const dair_yRange = 7.08
#const dair_hitFrame = 5
#const dair_lastHitFrame = 24
#const dair_damage_info = DAir|2|w30|100|290