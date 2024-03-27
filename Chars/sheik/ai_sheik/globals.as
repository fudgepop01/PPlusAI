#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 21.28
#const cs_jumpHeight = 35.52
#const cs_djumpHeight = 39.52
#const cs_wavedashDist = 28



#const cs_dashForceTurnFrame = 9
#const cs_dashDanceMinFrames = 3
#const cs_recoveryDistX = 70
#const cs_recoveryDistY = -70

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x129)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x129) || Equal CurrAction hex(0x12b) 
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x12c)

/// recovery
#const recovery_moves = uspecial

#const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1D6)) && !(Equal CurrSubaction hex(0x1D7))
#const uspecial_recovery_info = common|60

// jab123
#const jab123_IASA = 15
#const jab123_xOffset = 0.61
#const jab123_yOffset = -5.2
#const jab123_xRange = 9.58
#const jab123_yRange = 4.37
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 3
#const jab123_damage_info = Jab123|4|0|100|70

#const mv_jab123_2 = 1
#const jab123_2_IASA = 16
#const jab123_2_xOffset = 0.35
#const jab123_2_yOffset = -3.23
#const jab123_2_xRange = 8.52
#const jab123_2_yRange = 4.45
#const jab123_2_hitFrame = 3
#const jab123_2_lastHitFrame = 5
#const jab123_2_damage_info = Jab123|3|0|100|70

// dashattack
#const dashattack_IASA = 35
#const dashattack_xOffset = 15.38
#const dashattack_yOffset = -1.25
#const dashattack_xRange = 6.54
#const dashattack_yRange = 5.16
#const dashattack_hitFrame = 6
#const dashattack_lastHitFrame = 6
#const dashattack_damage_info = DashAttack|10|34|100|80

#const mv_dashattack_late = 1
#const dashattack_late_xOffset = 17.53
#const dashattack_late_yOffset = -0.7
#const dashattack_late_xRange = 8.85
#const dashattack_late_yRange = 5.44
#const dashattack_late_hitFrame = 7
#const dashattack_late_lastHitFrame = 12
#const dashattack_late_damage_info = DashAttack|7|15|100|361

// ftilt
#const ftilt_IASA = 26
#const ftilt_xOffset = 0.55
#const ftilt_yOffset = -1.54
#const ftilt_xRange = 10.02
#const ftilt_yRange = 10.2
#const ftilt_hitFrame = 5
#const ftilt_lastHitFrame = 10
#const ftilt_damage_info = FTilt|7|40|100|74

// utilt
#const utilt_IASA = 25
#const utilt_xOffset = -6.69
#const utilt_yOffset = -0.89
#const utilt_xRange = 11.63
#const utilt_yRange = 13.4
#const utilt_hitFrame = 5
#const utilt_lastHitFrame = 24
#const utilt_damage_info = UTilt|8|10|120|80

// dtilt
#const dtilt_IASA = 27
#const dtilt_xOffset = 0.4
#const dtilt_yOffset = 2.63
#const dtilt_xRange = 8.6
#const dtilt_yRange = 5.4
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 8
#const dtilt_damage_info = DTilt|8|35|80|90

// fsmash
#const fsmash_IASA = 43
#const fsmash_xOffset = 8.63
#const fsmash_yOffset = -1.99
#const fsmash_xRange = 14.33
#const fsmash_yRange = 6.67
#const fsmash_hitFrame = 13
#const fsmash_lastHitFrame = 29
#const fsmash_damage_info = FSmash|9|65|58|58

// usmash
#const usmash_IASA = 40
#const usmash_xOffset = -14.09
#const usmash_yOffset = -2.26
#const usmash_xRange = 13.54
#const usmash_yRange = 11.35
#const usmash_hitFrame = 13
#const usmash_lastHitFrame = 17
#const usmash_damage_info = USmash|16|50|102|90

// dsmash
#const dsmash_IASA = 47
#const dsmash_xOffset = -14.42
#const dsmash_yOffset = 1.86
#const dsmash_xRange = 14.3
#const dsmash_yRange = 6.89
#const dsmash_hitFrame = 7
#const dsmash_lastHitFrame = 26
#const dsmash_damage_info = DSmash|13|35|80|40

// noochB
#const nspecial_IASA = 48
#const nspecial_xOffset = 0.707
#const nspecial_yOffset = -5.797
#const nspecial_xRange = 63.293
#const nspecial_yRange = 2.453
#const nspecial_hitFrame = 10
#const nspecial_lastHitFrame = 30
#const nspecial_damage_info = NSpecial|-3|24|34|70

#const nspecialair_IASA = 48
#const nspecialair_xOffset = 0.271
#const nspecialair_yOffset = 53.507
#const nspecialair_xRange = 42.825
#const nspecialair_yRange = 37.812
#const nspecialair_hitFrame = 10
#const nspecialair_lastHitFrame = 30
#const nspecialair_damage_info = NSpecial|-3|24|34|70

// upB
// #const uspecial_IASA = 52
// #const uspecial_xOffset = 23.1
// #const uspecial_yOffset = -54.27
// #const uspecial_xRange = 10.85
// #const uspecial_yRange = 11.64
// #const uspecial_hitFrame = 30
// #const uspecial_lastHitFrame = 32
// #const uspecial_damage_info = USpecial|9|60|103|83

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
// TODO - chain go brr lmao
// #const sspecial_IASA = 88
// #const sspecial_xOffset = -2.73
// #const sspecial_yOffset = -0.59
// #const sspecial_xRange = 2.72
// #const sspecial_yRange = 2.75
// #const sspecial_hitFrame = 5
// #const sspecial_lastHitFrame = 7
// #const sspecial_damage_info = SSpecial|15|40|110|80

// grab
#const grab_IASA = 32
#const grab_xOffset = 1.95
#const grab_yOffset = -5.23
#const grab_xRange = 6.26
#const grab_yRange = 3.52
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 41
#const fthrow_throwFrame = 20
#const fthrow_damage_info = Grab|2|45|160|45

#const dthrow_IASA = 38
#const dthrow_throwFrame = 15
#const dthrow_damage_info = Grab|3|70|65|62

#const bthrow_IASA = 32
#const bthrow_throwFrame = 15
#const bthrow_damage_info = Grab|2|70|75|-62

#const uthrow_IASA = 57
#const uthrow_throwFrame = 19
#const uthrow_damage_info = Grab|2|90|40|88

// NAir
#const nair_IASA = 41
#const nair_xOffset = -6.06
#const nair_yOffset = 0
#const nair_xRange = 8.8
#const nair_yRange = 6.16
#const nair_hitFrame = 3
#const nair_lastHitFrame = 30
#const nair_damage_info = NAir|14|0|100|361

// FAir
#const fair_IASA = 33
#const fair_xOffset = -1.74
#const fair_yOffset = 3.19
#const fair_xRange = 8.92
#const fair_yRange = 11.39
#const fair_hitFrame = 5
#const fair_lastHitFrame = 7
#const fair_damage_info = FAir|13|0|100|25

// BAir
#const bair_IASA = 38
#const bair_xOffset = -20.65
#const bair_yOffset = 3.51
#const bair_xRange = 12.68
#const bair_yRange = 10.13
#const bair_hitFrame = 4
#const bair_lastHitFrame = 19
#const bair_damage_info = BAir|10|5|100|361

#const mv_bair_strong = 1
#const bair_strong_xOffset = -20.65
#const bair_strong_yOffset = -6.66
#const bair_strong_xRange = 6.19
#const bair_strong_yRange = 5.05
#const bair_strong_hitFrame = 4
#const bair_strong_lastHitFrame = 7
#const bair_strong_damage_info = BAir|14|12|100|361

// UAir
#const uair_IASA = 36
#const uair_xOffset = -4.2
#const uair_yOffset = -8.34
#const uair_xRange = 5.78
#const uair_yRange = 6.57
#const uair_hitFrame = 5
#const uair_lastHitFrame = 20
#const uair_damage_info = UAir|12|15|120|80

// DAir
#const dair_IASA = 49
#const dair_xOffset = -6.98
#const dair_yOffset = 5.62
#const dair_xRange = 6.27
#const dair_yRange = 8.74
#const dair_hitFrame = 15
#const dair_lastHitFrame = 33
#const dair_damage_info = DAir|11|30|90|80
