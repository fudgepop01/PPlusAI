#const DIRY_ABOVE = 14
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 17.63
#const cs_jumpHeight = 32.48
#const cs_djumpHeight = 33.00
#const cs_wavedashDist = 10
#const cs_recoveryDistY = -36
#const cs_recoveryDistX = 140

#const cs_dashForceTurnFrame = 12
#const cs_dashDanceMinFrames = 3

#const pt_jumpiness = 0.3
#const pt_djumpiness = 0.08
#const pt_aggression = 0.9
#const pt_bait_dashAwayChance = 0.15
#const pt_bait_wdashAwayChance = 0.75
#const pt_wall_chance = 0.8
#const pt_platChance = 0.1
#const pt_baitChance = 1.25
#const pt_braveChance = 0.55
#const pt_circlecampChancce = 0.45

// the following is the data that I give the AI that allows it to determine
// where it should be before performing an attack.
// it will attempt to a point with these parameters in
// 1.as, and if it does, it'll perform the action provided

// this works because it's used exclusively in 1.as and aerial attacks
// where it's used IMMEDIATELY before being modified
#let shouldFastFall = var2

// function stuff
/// recovery
// #const recovery_moves = uspecial|sspecial

// #const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1D6)) && !(Equal CurrSubaction hex(0x1D7))
// #const uspecial_recovery_info = common|60

// #const sspecial_subaction_check = !(Equal CurrSubaction hex(0x1D4)) && !(Equal CurrSubaction hex(0x1D5))
// #const sspecial_recovery_info = custom

// #const SFALL_ACTIONS = Equal CurrAction hex(0x10)
// #const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112)
// #const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118) || Equal CurrAction hex(0x119)
// #const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x11a) || Equal CurrAction hex(0x11b) || Equal CurrAction hex(0x11c)
// #const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115)

// hover
#const mv_hover = 1
#const hover_IASA = 4
#const hover_xOffset = -50
#const hover_yOffset = 50
#const hover_xRange = 100
#const hover_yRange = 50
#const hover_hitFrame = 10
#const hover_lastHitFrame = 40
#const hover_damage_info = NAir|0|0|0|0

// jab123
#const jab123_IASA = 15
#const jab123_xOffset = 1.96
#const jab123_yOffset = -5.07
#const jab123_xRange = 7.79
#const jab123_yRange = 4.16
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 3
#const jab123_damage_info = Jab123|3|w20|100|78

#const mv_jab123_2 = 1
#const jab123_2_IASA = 16
#const jab123_2_xOffset = 2.95
#const jab123_2_yOffset = -5.44
#const jab123_2_xRange = 8.06
#const jab123_2_yRange = 3.99
#const jab123_2_hitFrame = 2
#const jab123_2_lastHitFrame = 3
#const jab123_2_damage_info = Jab123|2|30|100|361

// dashattack
#const dashattack_IASA = 35
#const dashattack_xOffset = 12.07
#const dashattack_yOffset = -4.29
#const dashattack_xRange = 7.22
#const dashattack_yRange = 4.69
#const dashattack_hitFrame = 6
#const dashattack_lastHitFrame = 8
#const dashattack_damage_info = DashAttack|9|50|70|361

#const mv_dashattack_late = 1
#const dashattack_late_xOffset = 12.07
#const dashattack_late_yOffset = -4.29
#const dashattack_late_xRange = 12.64
#const dashattack_late_yRange = 4.69
#const dashattack_late_hitFrame = 6
#const dashattack_late_lastHitFrame = 20
#const dashattack_late_damage_info = DashAttack|7|20|70|361

// ftilt
#const ftilt_IASA = 33
#const ftilt_xOffset = -1.8
#const ftilt_yOffset = 2.78
#const ftilt_xRange = 9.4
#const ftilt_yRange = 11.67
#const ftilt_hitFrame = 5
#const ftilt_lastHitFrame = 14
#const ftilt_damage_info = FTilt|11|35|85|100

// utilt
#const utilt_IASA = 34
#const utilt_xOffset = -8
#const utilt_yOffset = -9.9
#const utilt_xRange = 8
#const utilt_yRange = 9.95
#const utilt_hitFrame = 9
#const utilt_lastHitFrame = 13
#const utilt_damage_info = UTilt|12|50|66|80

// dtilt
#const dtilt_IASA = 25
#const dtilt_xOffset = 1.94
#const dtilt_yOffset = 3.14
#const dtilt_xRange = 7.95
#const dtilt_yRange = 6.61
#const dtilt_hitFrame = 12
#const dtilt_lastHitFrame = 13
#const dtilt_damage_info = DTilt|12|60|100|270

// fsmash, 4
#const fsmash_IASA = 40
#const fsmash_xOffset = -5
#const fsmash_yOffset = -2
#const fsmash_xRange = 12.5
#const fsmash_yRange = 16
#const fsmash_hitFrame = 15
#const fsmash_lastHitFrame = 20
#const fsmash_damage_info = FSmash|13|50|60|29

// usmash, 3
#const usmash_IASA = 47
#const usmash_xOffset = -5.6
#const usmash_yOffset = -11.54
#const usmash_xRange = 5.02
#const usmash_yRange = 7.01
#const usmash_hitFrame = 14
#const usmash_lastHitFrame = 23
#const usmash_damage_info = USmash|15|40|100|90

// dsmash, 3
#const dsmash_IASA = 42
#const dsmash_xOffset = -12.5
#const dsmash_yOffset = 1.72
#const dsmash_xRange = 12.5
#const dsmash_yRange = 3.74
#const dsmash_hitFrame = 6
#const dsmash_lastHitFrame = 23
#const dsmash_damage_info = DSmash|20|40|99|140

// noochB
// COUNTER NOT-YET-IMPLEMENTED

// upB
#const uspecial_IASA = 9999.9999
#const uspecial_xOffset = -8.5
#const uspecial_yOffset = 0
#const uspecial_xRange = 8
#const uspecial_yRange = 8
#const uspecial_hitFrame = 44
#const uspecial_lastHitFrame = 66
// #const uspecial_damage_info = USpecial|16|80|60|80

// downB
#const dspecial_IASA = 23
#const dspecial_xOffset = -4.52
#const dspecial_yOffset = 3.22
#const dspecial_xRange = 4.11
#const dspecial_yRange = 4.25
#const dspecial_hitFrame = 2
#const dspecial_lastHitFrame = 4
#const dspecial_damage_info = DSpecial|0|0|0|0

#const dspecialair_IASA = 18
#const dspecialair_xOffset = -4.56
#const dspecialair_yOffset = 3.77
#const dspecialair_xRange = 4.58
#const dspecialair_yRange = 10.4
#const dspecialair_hitFrame = 2
#const dspecialair_lastHitFrame = 4
#const dspecialair_damage_info = DSpecialAir|8|106|0|45

// sideB
#const sspecial_IASA = 52
#const sspecial_xOffset = -4.77
#const sspecial_yOffset = 2.38
#const sspecial_xRange = 17.77
#const sspecial_yRange = 8.08
#const sspecial_hitFrame = 33
#const sspecial_lastHitFrame = 35
#const sspecial_damage_info = SSpecial|16|25|83|32

#const sspecialair_IASA = 52
#const sspecialair_xOffset = -4.77
#const sspecialair_yOffset = 2.38
#const sspecialair_xRange = 17.77
#const sspecialair_yRange = 8.08
#const sspecialair_hitFrame = 33
#const sspecialair_lastHitFrame = 35
#const sspecialair_damage_info = SSpecialAir|16|25|83|32


// grab
#const grab_IASA = 32
#const grab_xOffset = -1.33
#const grab_yOffset = -6.87
#const grab_xRange = 6.67
#const grab_yRange = 3.91
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 35
#const fthrow_throwFrame = 14
#const fthrow_damage_info = Grab|8|10|160|45

#const dthrow_IASA = 66
#const dthrow_throwFrame = 42
#const dthrow_damage_info = Grab|7|60|30|72

#const bthrow_IASA = 51
#const bthrow_throwFrame = 20
#const bthrow_damage_info = Grab|9|80|40|-45

#const uthrow_IASA = 51
#const uthrow_throwFrame = 24
#const uthrow_damage_info = Grab|6|70|56|88

// NAir
#const nair_IASA = 43
#const nair_xOffset = -5.1
#const nair_yOffset = -0.37
#const nair_xRange = 8.16
#const nair_yRange = 6.44
#const nair_hitFrame = 3
#const nair_lastHitFrame = 6
#const nair_damage_info = NAir|14|20|100|361

#const mv_nair_weak = 1
#const nair_weak_xOffset = -5.1
#const nair_weak_yOffset = -0.37
#const nair_weak_xRange = 8.32
#const nair_weak_yRange = 7.49
#const nair_weak_hitFrame = 3
#const nair_weak_lastHitFrame = 23
#const nair_weak_damage_info = NAir|10|0|100|361

// FAir
#const fair_IASA = 53
#const fair_xOffset = -3.96
#const fair_yOffset = 3.32
#const fair_xRange = 9.09
#const fair_yRange = 9.89
#const fair_hitFrame = 16
#const fair_lastHitFrame = 20
#const fair_damage_info = FAir|16|60|70|361

// BAir
#const bair_IASA = 39
#const bair_xOffset = -10.21
#const bair_yOffset = 0.18
#const bair_xRange = 6.23
#const bair_yRange = 5.15
#const bair_hitFrame = 6
#const bair_lastHitFrame = 22
#const bair_damage_info = BAir|14|0|100|361

// UAir
#const uair_IASA = 35
#const uair_xOffset = -2.14
#const uair_yOffset = -1.57
#const uair_xRange = 4.42
#const uair_yRange = 7.47
#const uair_hitFrame = 7
#const uair_lastHitFrame = 11
#const uair_damage_info = UAir|14|0|120|80

// DAir
#const dair_IASA = 37
#const dair_xOffset = -3.69
#const dair_yOffset = 8.28
#const dair_xRange = 6.59
#const dair_yRange = 7.54
#const dair_hitFrame = 12
#const dair_lastHitFrame = 31
#const dair_damage_info = DAir|6|16|50|90