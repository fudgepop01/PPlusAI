#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 12.89
#const cs_jumpHeight = 29.87
#const cs_djumpHeight = 29.87
#const cs_wavedashDist = 25



#const cs_dashForceTurnFrame = 9
#const cs_dashDanceMinFrames = 3
#const cs_recoveryDistX = 105
#const cs_recoveryDistY = -69

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x129)
// #const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x129) || Equal CurrAction hex(0x12b) 
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x12c)

/// recovery
// #const recovery_moves = uspecial

// #const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1D6)) && !(Equal CurrSubaction hex(0x1D7))
// #const uspecial_recovery_info = common|60

// jab123
#const jab123_IASA = 15
#const jab123_xOffset = 0.52
#const jab123_yOffset = -6.77
#const jab123_xRange = 8.1
#const jab123_yRange = 4.51
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 4
#const jab123_damage_info = Jab123|4|w30|60|80

#const mv_jab123_2 = 1
#const jab123_2_IASA = 26
#const jab123_2_xOffset = 1.15
#const jab123_2_yOffset = -5.74
#const jab123_2_xRange = 8.58
#const jab123_2_yRange = 4.82
#const jab123_2_hitFrame = 4
#const jab123_2_lastHitFrame = 5
#const jab123_2_damage_info = Jab123|3|w20|100|50

#const mv_jab123_3 = 1
#const jab123_3_IASA = 40
#const jab123_3_xOffset = 0.37
#const jab123_3_yOffset = -7.15
#const jab123_3_xRange = 9.7
#const jab123_3_yRange = 5.51
#const jab123_3_hitFrame = 8
#const jab123_3_lastHitFrame = 10
#const jab123_3_damage_info = Jab123|8|70|80|361

// dashattack
#const dashattack_IASA = 41
#const dashattack_xOffset = 9.04
#const dashattack_yOffset = -6.25
#const dashattack_xRange = 6.84
#const dashattack_yRange = 3.92
#const dashattack_hitFrame = 6
#const dashattack_lastHitFrame = 8
#const dashattack_damage_info = DashAttack|11|60|80|65

#const mv_dashattack_weak = 1
#const dashattack_weak_xOffset = 9.04
#const dashattack_weak_yOffset = 0.57
#const dashattack_weak_xRange = 9.63
#const dashattack_weak_yRange = 7.33
#const dashattack_weak_hitFrame = 6
#const dashattack_weak_lastHitFrame = 16
#const dashattack_weak_damage_info = DashAttack|8|40|100|110

// ftilt
#const ftilt_IASA = 27
#const ftilt_xOffset = 6.1
#const ftilt_yOffset = -5.24
#const ftilt_xRange = 5.63
#const ftilt_yRange = 5.09
#const ftilt_hitFrame = 4
#const ftilt_lastHitFrame = 6
#const ftilt_damage_info = FTilt|8|30|45|70

#const mv_ftilt_2 = 1
#const ftilt_2_IASA = 38
#const ftilt_2_xOffset = 2.76
#const ftilt_2_yOffset = -3.85
#const ftilt_2_xRange = 8.5
#const ftilt_2_yRange = 9.38
#const ftilt_2_hitFrame = 5
#const ftilt_2_lastHitFrame = 7
#const ftilt_2_damage_info = FTilt|10|35|90|25

// utilt
#const utilt_IASA = 34
#const utilt_xOffset = -0.76
#const utilt_yOffset = -7.63
#const utilt_xRange = 8.45
#const utilt_yRange = 10.47
#const utilt_hitFrame = 5
#const utilt_lastHitFrame = 9
#const utilt_damage_info = UTilt|12|50|103|87

// dtilt
#const dtilt_IASA = 28
#const dtilt_xOffset = 3.46
#const dtilt_yOffset = -0.68
#const dtilt_xRange = 9.65
#const dtilt_yRange = 3.5
#const dtilt_hitFrame = 8
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|11|35|80|85

// fsmash
#const fsmash_IASA = 48
#const fsmash_xOffset = 4.69
#const fsmash_yOffset = 0.31
#const fsmash_xRange = 13.6
#const fsmash_yRange = 10.64
#const fsmash_hitFrame = 13
#const fsmash_lastHitFrame = 26
#const fsmash_damage_info = FSmash|8|30|148|361

#const mv_fsmash_2 = 1
#const fsmash_2_IASA = 49
#const fsmash_2_xOffset = 5.27
#const fsmash_2_yOffset = -6.4
#const fsmash_2_xRange = 13.29
#const fsmash_2_yRange = 11.92
#const fsmash_2_hitFrame = 20
#const fsmash_2_lastHitFrame = 24
#const fsmash_2_damage_info = FSmash|12|40|110|37

// usmash
#const usmash_IASA = 54
#const usmash_xOffset = -31.756
#const usmash_yOffset = 10.000
#const usmash_xRange = 31.900
#const usmash_yRange = 13.000
#const usmash_hitFrame = 38
#const usmash_lastHitFrame = 42
#const usmash_damage_info = USmash|14|50|102|90

// dsmash
#const dsmash_IASA = 34
#const dsmash_xOffset = -7.125
#const dsmash_yOffset = 8.500
#const dsmash_xRange = 14.250
#const dsmash_yRange = 5.25
#const dsmash_hitFrame = 17
#const dsmash_lastHitFrame = 36
#const dsmash_damage_info = DSmash|13|35|80|40

// noochB
#const nspecial_IASA = 33
#const nspecial_xOffset = 12.757
#const nspecial_yOffset = 1.080
#const nspecial_xRange = 40.345
#const nspecial_yRange = 13.937
#const nspecial_hitFrame = 26
#const nspecial_lastHitFrame = 30
#const nspecial_damage_info = NSpecial|-14|90|75|88

#const nspecialair_IASA = 33
#const nspecialair_xOffset = 8.375
#const nspecialair_yOffset = 14.271
#const nspecialair_xRange = 42.655
#const nspecialair_yRange = 34.300
#const nspecialair_hitFrame = 26
#const nspecialair_lastHitFrame = 30
#const nspecialair_damage_info = NSpecialAir|-14|90|75|88



// upB
#const uspecial_IASA = 13
#const uspecial_xOffset = -7.500
#const uspecial_yOffset = 0.195
#const uspecial_xRange = 7.500
#const uspecial_yRange = 10.633
#const uspecial_hitFrame = 5
#const uspecial_lastHitFrame = 12
#const uspecial_damage_info = USpecial|6|43|37|169

// #const uspecialair_IASA = 117
// #const uspecialair_xOffset = 23.26
// #const uspecialair_yOffset = -57.15
// #const uspecialair_xRange = 10.82
// #const uspecialair_yRange = 11.64
// #const uspecialair_hitFrame = 35
// #const uspecialair_lastHitFrame = 37
// #const uspecialair_damage_info = USpecialAir|9|60|103|83

// downB
// TODONOT - absolutely do not

// sideB
#const sspecial_IASA = 53
#const sspecial_xOffset = 9.611
#const sspecial_yOffset = -7.954
#const sspecial_xRange = 39.000
#const sspecial_yRange = 3.000
#const sspecial_hitFrame = 17
#const sspecial_lastHitFrame = 37
#const sspecial_damage_info = SSpecial|0|0|0|0

// grab
#const grab_IASA = 32
#const grab_xOffset = 5.4
#const grab_yOffset = -5.17
#const grab_xRange = 5.76
#const grab_yRange = 3.6
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 46
#const fthrow_throwFrame = 25
#const fthrow_damage_info = Grab|9|80|20|40

#const dthrow_IASA = 42
#const dthrow_throwFrame = 39
#const dthrow_damage_info = Grab|10|75|30|270

#const bthrow_IASA = 33
#const bthrow_throwFrame = 16
#const bthrow_damage_info = Grab|9|80|20|40

#const uthrow_IASA = 40
#const uthrow_throwFrame = 20
#const uthrow_damage_info = Grab|10|45|105|90

// NAir
#const nair_IASA = 47
#const nair_xOffset = -4.05
#const nair_yOffset = -4.3
#const nair_xRange = 9.73
#const nair_yRange = 5.54
#const nair_hitFrame = 6
#const nair_lastHitFrame = 30
#const nair_damage_info = NAir|7|40|145|40

// FAir
#const fair_IASA = 43
#const fair_xOffset = 0.85
#const fair_yOffset = 5.67
#const fair_xRange = 9.11
#const fair_yRange = 14.7
#const fair_hitFrame = 20
#const fair_lastHitFrame = 23
#const fair_damage_info = FAir|15|42|98|37

#const mv_fair_meteor = 1
#const fair_meteor_xOffset = 0.85
#const fair_meteor_yOffset = 0.91
#const fair_meteor_xRange = 5.01
#const fair_meteor_yRange = 4.41
#const fair_meteor_hitFrame = 23
#const fair_meteor_lastHitFrame = 23
#const fair_meteor_damage_info = FAir|14|20|100|270

// BAir
#const bair_IASA = 41
#const bair_xOffset = -15.29
#const bair_yOffset = -2.91
#const bair_xRange = 9.94
#const bair_yRange = 5.81
#const bair_hitFrame = 8
#const bair_lastHitFrame = 24
#const bair_damage_info = BAir|14|20|100|50

// UAir
#const uair_IASA = 42
#const uair_xOffset = -6.06
#const uair_yOffset = -2.33
#const uair_xRange = 5.53
#const uair_yRange = 10.48
#const uair_hitFrame = 10
#const uair_lastHitFrame = 23
#const uair_damage_info = UAir|14|35|100|80

// DAir
#const dair_IASA = 58
#const dair_xOffset = -4.5
#const dair_yOffset = 5.5
#const dair_xRange = 6.88
#const dair_yRange = 11.12
#const dair_hitFrame = 4
#const dair_lastHitFrame = 37
#const dair_damage_info = DAir|4|50|160|270
