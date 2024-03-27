#const DIRY_ABOVE = 15
#const DIRY_BELOW_AIR = 2
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -1

#const cs_shortHopHeight = 9.66
#const cs_jumpHeight = 36.53
#const cs_djumpHeight = 36.53
#const cs_wavedashDist = 35

#const cs_dashForceTurnFrame = 17
#const cs_dashDanceMinFrames = 8

#const _pt_jumpiness = 0.1
#const _pt_djumpiness = 0.04
#const _pt_aggression = 1.25
#const _pt_bait_dashAwayChance = 0.05
#const _pt_bait_wdashAwayChance = 0.45
#const _pt_wall_chance = 0.4
#const _pt_platChance = 0.1
#const _pt_baitChance = 0.9
#const _pt_braveChance = 0.65
#const _pt_circlecampChancce = 0.15

// the following is the data that I give the AI that allows it to determine
// where it should be before performing an attack.
// it will attempt to a point with these parameters in
// 1.as, and if it does, it'll perform the action provided

// this works because it's used exclusively in 1.as and aerial attacks
// where it's used IMMEDIATELY before being modified
#let shouldFastFall = var2

// function stuff
/// recovery
#const recovery_moves = uspecial|sspecial

#const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1D6)) && !(Equal CurrSubaction hex(0x1D7))
#const uspecial_recovery_info = common|60

#const sspecial_subaction_check = !(Equal CurrSubaction hex(0x1D4)) && !(Equal CurrSubaction hex(0x1D5))
#const sspecial_recovery_info = custom

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118) || Equal CurrAction hex(0x119) || Equal CurrAction hex(0x11E)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x11A)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x11F) || Equal CurrAction hex(0x11C) || Equal CurrAction hex(0x11b) || Equal CurrAction hex(0x120)

// jab123
#const jab123_IASA = 20
#const jab123_xOffset = 4.96
#const jab123_yOffset = -2.34
#const jab123_xRange = 11.75
#const jab123_yRange = 6.26
#const jab123_hitFrame = 4
#const jab123_lastHitFrame = 6
#const jab123_damage_info = Jab123|4|w20|100|60

#const jab1232_IASA = 30
#const jab1232_xOffset = 7.43
#const jab1232_yOffset = -2.42
#const jab1232_xRange = 12.15
#const jab1232_yRange = 5.23
#const jab1232_hitFrame = 11
#const jab1232_lastHitFrame = 14
#const jab1232_damage_info = Jab123|4|w40|100|55

#const jab1233_IASA = 48
#const jab1233_xOffset = 1.91
#const jab1233_yOffset = -6.43
#const jab1233_xRange = 15.56
#const jab1233_yRange = 7.98
#const jab1233_hitFrame = 25
#const jab1233_lastHitFrame = 28
#const jab1233_damage_info = Jab123|5|40|120|361

// dashattack
#const dashattack_IASA = 40
#const dashattack_xOffset = 26.55
#const dashattack_yOffset = 2.65
#const dashattack_xRange = 19.18
#const dashattack_yRange = 18.56
#const dashattack_hitFrame = 11
#const dashattack_lastHitFrame = 14
#const dashattack_damage_info = DashAttack|12|40|85|70

// ftilt
#const ftilt_IASA = 40
#const ftilt_xOffset = -2.41
#const ftilt_yOffset = -4.4
#const ftilt_xRange = 15.13
#const ftilt_yRange = 8.05
#const ftilt_hitFrame = 13
#const ftilt_lastHitFrame = 16
#const ftilt_damage_info = FTilt|9|30|95|361

#const mv_ftilt_sweet = 1
#const ftilt_sweet_xOffset = 21.1
#const ftilt_sweet_yOffset = -3.24
#const ftilt_sweet_xRange = 7.65
#const ftilt_sweet_yRange = 12.37
#const ftilt_sweet_hitFrame = 13
#const ftilt_sweet_lastHitFrame = 16
#const ftilt_sweet_damage_info = FTilt|12|40|90|60

// utilt
#const utilt_IASA = 37
#const utilt_xOffset = 1.26
#const utilt_yOffset = 2.65
#const utilt_xRange = 13.05
#const utilt_yRange = 14.81
#const utilt_hitFrame = 10
#const utilt_lastHitFrame = 13
#const utilt_damage_info = UTilt|10|50|100|86

#const mv_utilt_late = 1
#const utilt_late_IASA = 37
#const utilt_late_xOffset = -25.28
#const utilt_late_yOffset = -1.4
#const utilt_late_xRange = 26.32
#const utilt_late_yRange = 21.96
#const utilt_late_hitFrame = 14
#const utilt_late_lastHitFrame = 24
#const utilt_late_damage_info = UTilt|6|50|120|86

// dtilt
#const dtilt_IASA = 30
#const dtilt_xOffset = -0.95
#const dtilt_yOffset = -0.71
#const dtilt_xRange = 15.03
#const dtilt_yRange = 5.1
#const dtilt_hitFrame = 10
#const dtilt_lastHitFrame = 12
#const dtilt_damage_info = DTilt|8|40|90|75

#const mv_dtilt_sweet = 1
#const dtilt_sweet_xOffset = 28.56
#const dtilt_sweet_yOffset = 1.5
#const dtilt_sweet_xRange = 4.5
#const dtilt_sweet_yRange = 4.5
#const dtilt_sweet_hitFrame = 10
#const dtilt_sweet_lastHitFrame = 12
#const dtilt_sweet_damage_info = DTilt|11|60|65|110

// fsmash, 4
#const fsmash_IASA = 67
#const fsmash_xOffset = 1.13
#const fsmash_yOffset = -5.2
#const fsmash_xRange = 16.89
#const fsmash_yRange = 4.84
#const fsmash_hitFrame = 31
#const fsmash_lastHitFrame = 34
#const fsmash_damage_info = FSmash|16|40|83|361

#const mv_fsmash_sweet = 1
#const fsmash_sweet_xOffset = 32.08
#const fsmash_sweet_yOffset = -2.79
#const fsmash_sweet_xRange = 5.94
#const fsmash_sweet_yRange = 7.17
#const fsmash_sweet_hitFrame = 31
#const fsmash_sweet_lastHitFrame = 34
#const fsmash_sweet_damage_info = FSmash|23|30|84|45

// usmash, 3
#const usmash_IASA = 65
#const usmash_xOffset = -8
#const usmash_yOffset = -26
#const usmash_xRange = 8
#const usmash_yRange = 8
#const usmash_hitFrame = 22
#const usmash_lastHitFrame = 24
#const usmash_damage_info = USmash|16|50|90|90

// dsmash, 3
#const dsmash_IASA = 65
#const dsmash_xOffset = -32.99
#const dsmash_yOffset = 3.03
#const dsmash_xRange = 39.15
#const dsmash_yRange = 9.31
#const dsmash_hitFrame = 11
#const dsmash_lastHitFrame = 19
#const dsmash_damage_info = DSmash|11|40|90|361

#const mv_dsmash_late = 1
#const dsmash_late_xOffset = -20.07
#const dsmash_late_yOffset = 3.03
#const dsmash_late_xRange = 35.02
#const dsmash_late_yRange = 9.31
#const dsmash_late_hitFrame = 15
#const dsmash_late_lastHitFrame = 37
#const dsmash_late_damage_info = DSmash|12|40|70|30

// noochB
// #const nspecial_IASA = 80
// #const nspecial_xOffset = 5
// #const nspecial_yOffset = 5
// #const nspecial_xRange = 10
// #const nspecial_yRange = 1
// #const nspecial_hitFrame = 20
// #const nspecial_lastHitFrame = 30
// #const nspecial_damage_info = NSpecial|3|0|0|0

// #const nspecialair_IASA = 80
// #const nspecialair_xOffset = 5
// #const nspecialair_yOffset = 5
// #const nspecialair_xRange = 80
// #const nspecialair_yRange = 10
// #const nspecialair_hitFrame = 13
// #const nspecialair_lastHitFrame = 30
// #const nspecialair_damage_info = NSpecialAir|3|0|0|0

// upB
#const uspecial_IASA = 69
#const uspecial_xOffset = -11.85
#const uspecial_yOffset = -0.15
#const uspecial_xRange = 19.99
#const uspecial_yRange = 33.37
#const uspecial_hitFrame = 17
#const uspecial_lastHitFrame = 30
#const uspecial_damage_info = USpecial|13|32|100|70

// downB
#const dspecial_IASA = 67
#const dspecial_xOffset = -1.61
#const dspecial_yOffset = -4.07
#const dspecial_xRange = 20.26
#const dspecial_yRange = 8.82
#const dspecial_hitFrame = 31
#const dspecial_lastHitFrame = 35
#const dspecial_damage_info = DSpecial|21|50|70|361

#const mv_dspecial_late = 1
#const dspecial_late_xOffset = 19.25
#const dspecial_late_yOffset = -4.55
#const dspecial_late_xRange = 24.34
#const dspecial_late_yRange = 8.58
#const dspecial_late_hitFrame = 36
#const dspecial_late_lastHitFrame = 42
#const dspecial_late_damage_info = DSpecial|13|50|78|361

#const dspecialair_IASA = 60
#const dspecialair_xOffset = -9.5
#const dspecialair_yOffset = -14
#const dspecialair_xRange = 9.5
#const dspecialair_yRange = 29.5
#const dspecialair_hitFrame = 28
#const dspecialair_lastHitFrame = 50
#const dspecialair_damage_info = DSpecialAir|17|50|85|50

// sideB
// #const sspecial_IASA = 48
// #const sspecial_xOffset = 8.92
// #const sspecial_yOffset = -13.5
// #const sspecial_xRange = 6.37
// #const sspecial_yRange = 7.95
// #const sspecial_hitFrame = 12
// #const sspecial_lastHitFrame = 13
// #const sspecial_damage_info = SSpecial|10|65|64|87

// #const sspecialair_IASA = 48
// #const sspecialair_xOffset = 8.92
// #const sspecialair_yOffset = -13.5
// #const sspecialair_xRange = 6.37
// #const sspecialair_yRange = 7.95
// #const sspecialair_hitFrame = 12
// #const sspecialair_lastHitFrame = 13
// #const sspecialair_damage_info = SSpecialAir|10|65|64|87
// // #const sspecialair_damage_info = SSpecialAir|7|72|38|270

// grab
#const grab_IASA = 31
#const grab_xOffset = 1.5
#const grab_yOffset = -1
#const grab_xRange = 10.75
#const grab_yRange = 7
#const grab_hitFrame = 8
#const grab_lastHitFrame = 8
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 51
#const fthrow_throwFrame = 34
#const fthrow_damage_info = Grab|6|80|90|361

#const dthrow_IASA = 83
#const dthrow_throwFrame = 64
#const dthrow_damage_info = Grab|3|80|64|50

#const bthrow_IASA = 56
#const bthrow_throwFrame = 29
#const bthrow_damage_info = Grab|6|80|90|-361

#const uthrow_IASA = 65
#const uthrow_throwFrame = 51
#const uthrow_damage_info = Grab|5|60|90|70

// NAir
#const nair_IASA = 33
#const nair_xOffset = -13
#const nair_yOffset = 1
#const nair_xRange = 13
#const nair_yRange = 13
#const nair_hitFrame = 7
#const nair_lastHitFrame = 23
#const nair_damage_info = NAir|2|w50|110|225

#const mv_nair_final = 1
#const nair_final_xOffset = -13
#const nair_final_yOffset = 1
#const nair_final_xRange = 13
#const nair_final_yRange = 13
#const nair_final_hitFrame = 22
#const nair_final_lastHitFrame = 23
#const nair_final_damage_info = NAir|3|50|115|361

// FAir
#const fair_IASA = 34
#const fair_xOffset = -4.26
#const fair_yOffset = 2.25
#const fair_xRange = 17.92
#const fair_yRange = 16.56
#const fair_hitFrame = 10
#const fair_lastHitFrame = 13
#const fair_damage_info = FAir|13|25|95|60

// BAir
#const bair_IASA = 33
#const bair_xOffset = -29.14
#const bair_yOffset = 4.55
#const bair_xRange = 15.33
#const bair_yRange = 18.09
#const bair_hitFrame = 11
#const bair_lastHitFrame = 18
#const bair_damage_info = BAir|6|50|95|-70

#const mv_bair_sweet = 1
#const bair_sweet_xOffset = -36.75
#const bair_sweet_yOffset = 10.42
#const bair_sweet_xRange = 16
#const bair_sweet_yRange = 20.61
#const bair_sweet_hitFrame = 11
#const bair_sweet_lastHitFrame = 18
#const bair_sweet_damage_info = BAir|9|50|72|-110

// UAir
#const uair_IASA = 35
#const uair_xOffset = -25.45
#const uair_yOffset = -10
#const uair_xRange = 24.29
#const uair_yRange = 17.89
#const uair_hitFrame = 9
#const uair_lastHitFrame = 15
#const uair_damage_info = UAir|10|40|102|80

// DAir
#const dair_IASA = 83
#const dair_xOffset = -4.82
#const dair_yOffset = 133.08
#const dair_xRange = 4.71
#const dair_yRange = 78.22
#const dair_hitFrame = 38
#const dair_lastHitFrame = 61
#const dair_damage_info = DAir|10|50|80|90

#const mv_dair_meteor = 1
#const dair_meteor_xOffset = -4.76
#const dair_meteor_yOffset = 4.91
#const dair_meteor_xRange = 4.63
#const dair_meteor_yRange = 19.88
#const dair_meteor_hitFrame = 36
#const dair_meteor_lastHitFrame = 37
#const dair_meteor_damage_info = DAir|12|30|82|270