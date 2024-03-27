#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 19.26
#const cs_jumpHeight = 36.14
#const cs_djumpHeight = 56.78
#const cs_wavedashDist = 36

#const cs_recoveryDistY = 0
#const cs_recoveryDistX = 50

#const cs_dashForceTurnFrame = 9
#const cs_dashDanceMinFrames = 3




// #const SFALL_ACTIONS = Equal CurrAction hex(0x10)
// #const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
// #const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x129)
// #const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x129) || Equal CurrAction hex(0x12b) 
// #const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x12c)

/// recovery
// #const recovery_moves = uspecial

// #const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1D6)) && !(Equal CurrSubaction hex(0x1D7))
// #const uspecial_recovery_info = common|60

// jab123
#const jab123_IASA = 17
#const jab123_xOffset = -2.29
#const jab123_yOffset = -0.46
#const jab123_xRange = 10.54
#const jab123_yRange = 7.17
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 5
#const jab123_damage_info = Jab123|4|8|38|60

#const mv_jab123_2 = 1
#const jab123_2_IASA = 21
#const jab123_2_xOffset = -2.57
#const jab123_2_yOffset = -3.36
#const jab123_2_xRange = 10.47
#const jab123_2_yRange = 8.71
#const jab123_2_hitFrame = 3
#const jab123_2_lastHitFrame = 5
#const jab123_2_damage_info = Jab123|6|25|100|361

// dashattack
#const dashattack_IASA = 36
#const dashattack_xOffset = 12.72
#const dashattack_yOffset = -0.82
#const dashattack_xRange = 11.92
#const dashattack_yRange = 5.47
#const dashattack_hitFrame = 10
#const dashattack_lastHitFrame = 13
#const dashattack_damage_info = DashAttack|11|15|100|361

#const mv_dashattack_late = 1
#const dashattack_late_xOffset = 12.72
#const dashattack_late_yOffset = -0.82
#const dashattack_late_xRange = 17.5
#const dashattack_late_yRange = 5.47
#const dashattack_late_hitFrame = 10
#const dashattack_late_lastHitFrame = 23
#const dashattack_late_damage_info = DashAttack|7|15|100|361

// ftilt
#const ftilt_IASA = 29
#const ftilt_xOffset = -1.09
#const ftilt_yOffset = -3.86
#const ftilt_xRange = 10.92
#const ftilt_yRange = 5.39
#const ftilt_hitFrame = 6
#const ftilt_lastHitFrame = 8
#const ftilt_damage_info = FTilt|12|40|80|70

// utilt
#const utilt_IASA = 29
#const utilt_xOffset = -8.8
#const utilt_yOffset = -0.67
#const utilt_xRange = 13.97
#const utilt_yRange = 13.31
#const utilt_hitFrame = 6
#const utilt_lastHitFrame = 9
#const utilt_damage_info = UTilt|9|36|112|90

// dtilt
#const dtilt_IASA = 23
#const dtilt_xOffset = 8.3
#const dtilt_yOffset = 2.99
#const dtilt_xRange = 10.92
#const dtilt_yRange = 4.86
#const dtilt_hitFrame = 8
#const dtilt_lastHitFrame = 10
#const dtilt_damage_info = DTilt|10|w100|100|28

// fsmash
#const fsmash_IASA = 44
#const fsmash_xOffset = 2.24
#const fsmash_yOffset = -0.26
#const fsmash_xRange = 10.86
#const fsmash_yRange = 5.4
#const fsmash_hitFrame = 15
#const fsmash_lastHitFrame = 17
#const fsmash_damage_info = FSmash|17|32|98|361

// usmash
#const usmash_IASA = 40
#const usmash_xOffset = -13.66
#const usmash_yOffset = -5.9
#const usmash_xRange = 14.73
#const usmash_yRange = 10.9
#const usmash_hitFrame = 12
#const usmash_lastHitFrame = 17
#const usmash_damage_info = USmash|16|26|101|75

// dsmash
#const dsmash_IASA = 52
#const dsmash_xOffset = -23.99
#const dsmash_yOffset = 2.67
#const dsmash_xRange = 24.34
#const dsmash_yRange = 6.22
#const dsmash_hitFrame = 8
#const dsmash_lastHitFrame = 23
#const dsmash_damage_info = DSmash|14|50|80|30

// noochB
// TODO - mlep pom!
// #const nspecial_IASA = 9999.9999
// #const nspecial_xOffset = 9999.9999
// #const nspecial_yOffset = 9999.9999
// #const nspecial_xRange = 9999.9999
// #const nspecial_yRange = 9999.9999
// #const nspecial_hitFrame = 9999.9999
// #const nspecial_lastHitFrame = 9999.9999

// upB
// TODO - egg throw
#const uspecial_IASA = 50
#const uspecial_xOffset = 1.200
#const uspecial_yOffset = 142.220
#const uspecial_xRange = 90.174
#const uspecial_yRange = 104.960
#const uspecial_hitFrame = 19
#const uspecial_lastHitFrame = 35
#const uspecial_damage_info = USpecial|-5|0|0|0

// downB
#const dspecial_IASA = 27
#const dspecial_xOffset = -0.96
#const dspecial_yOffset = -1.36
#const dspecial_xRange = 11.32
#const dspecial_yRange = 23.99
#const dspecial_hitFrame = 5
#const dspecial_lastHitFrame = 6
#const dspecial_damage_info = DSpecial|16|50|100|80

#const dspecialair_IASA = 21
#const dspecialair_xOffset = -6.42
#const dspecialair_yOffset = 19.39
#const dspecialair_xRange = 6.91
#const dspecialair_yRange = 14.51
#const dspecialair_hitFrame = 19
#const dspecialair_lastHitFrame = 20
#const dspecialair_damage_info = DSpecialAir|16|46|96|80

// sideB
// TODO - egg roll

// grab
#const grab_IASA = 62
#const grab_xOffset = -1.04
#const grab_yOffset = -1.26
#const grab_xRange = 14.12
#const grab_yRange = 5.74
#const grab_hitFrame = 17
#const grab_lastHitFrame = 26
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 41
#const fthrow_throwFrame = 18
#const fthrow_damage_info = Grab|7|40|66|40

#const dthrow_IASA = 36
#const dthrow_throwFrame = 13
#const dthrow_damage_info = Grab|6|90|25|80

#const bthrow_IASA = 45
#const bthrow_throwFrame = 18
#const bthrow_damage_info = Grab|7|40|66|-40

#const uthrow_IASA = 34
#const uthrow_throwFrame = 11
#const uthrow_damage_info = Grab|5|65|43|90

// NAir
#const nair_IASA = 44
#const nair_xOffset = -5.25
#const nair_yOffset = -0.43
#const nair_xRange = 8.71
#const nair_yRange = 4.68
#const nair_hitFrame = 3
#const nair_lastHitFrame = 6
#const nair_damage_info = NAir|14|15|100|361

#const mv_nair_fall = 1
#const nair_fall_xOffset = -5.25
#const nair_fall_yOffset = 0.44
#const nair_fall_xRange = 8.71
#const nair_fall_yRange = 5.11
#const nair_fall_hitFrame = 3
#const nair_fall_lastHitFrame = 33
#const nair_fall_damage_info = NAir|10|0|100|361

// FAir
#const fair_IASA = 43
#const fair_xOffset = 1.51
#const fair_yOffset = 6.59
#const fair_xRange = 7.3
#const fair_yRange = 12.15
#const fair_hitFrame = 16
#const fair_lastHitFrame = 18
#const fair_damage_info = FAir|17|30|80|270

// BAir
#const bair_IASA = 41
#const bair_xOffset = -20.24
#const bair_yOffset = 5.4
#const bair_xRange = 9.69
#const bair_yRange = 10.92
#const bair_hitFrame = 10
#const bair_lastHitFrame = 30
#const bair_damage_info = BAir|3|47|120|60

// UAir
#const uair_IASA = 38
#const uair_xOffset = -9.01
#const uair_yOffset = -5.68
#const uair_xRange = 7.92
#const uair_yRange = 10.99
#const uair_hitFrame = 5
#const uair_lastHitFrame = 6
#const uair_damage_info = UAir|13|25|100|90

// DAir
#const dair_IASA = 52
#const dair_xOffset = -8.26
#const dair_yOffset = 4.72
#const dair_xRange = 8.97
#const dair_yRange = 8.61
#const dair_hitFrame = 16
#const dair_lastHitFrame = 42
#const dair_damage_info = DAir|2|5|102|270