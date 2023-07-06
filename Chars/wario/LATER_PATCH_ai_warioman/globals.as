#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 12.03
#const cs_jumpHeight = 40.83
#const cs_djumpHeight = 58.8
#const cs_wavedashDist = 15

#const pt_jumpiness = 0.2
#const pt_djumpiness = 0.15
#const pt_aggression = 1.6
#const pt_bait_dashAwayChance = 0.3
#const pt_bait_wdashAwayChance = 0.7
#const pt_wall_chance = 0.2
#const pt_platChance = 0.23
#const pt_baitChance = 1.01
#const pt_braveChance = 0.45
#const pt_circleCampChance = 0.25

#const cs_dashForceTurnFrame = 9
#const cs_dashDanceMinFrames = 3
#const cs_recoveryDistX = 60
#const cs_recoveryDistY = -50

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
#const jab123_IASA = 7
#const jab123_xOffset = -4
#const jab123_yOffset = 3
#const jab123_xRange = 10.5
#const jab123_yRange = 8
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 5
#const jab123_damage_info = Jab123|4|25|20|72

#const mv_jab123_2 = 1
#const jab123_2_IASA = 6
#const jab123_2_xOffset = 1
#const jab123_2_yOffset = 3
#const jab123_2_xRange = 10.5
#const jab123_2_yRange = 9.75
#const jab123_2_hitFrame = 4
#const jab123_2_lastHitFrame = 6
#const jab123_2_damage_info = Jab123|4|25|20|30

// dashattack
#const dashattack_IASA = 10
#const dashattack_xOffset = 8.93
#const dashattack_yOffset = 8
#const dashattack_xRange = 19.59
#const dashattack_yRange = 10
#const dashattack_hitFrame = 4
#const dashattack_lastHitFrame = 23
#const dashattack_damage_info = DashAttack|12|60|75|70

// ftilt
#const ftilt_IASA = 17
#const ftilt_xOffset = -1.5
#const ftilt_yOffset = -0.36
#const ftilt_xRange = 13.85
#const ftilt_yRange = 8.01
#const ftilt_hitFrame = 14
#const ftilt_lastHitFrame = 17
#const ftilt_damage_info = FTilt|16|35|100|38

// utilt
#const utilt_IASA = 18
#const utilt_xOffset = -15
#const utilt_yOffset = 0
#const utilt_xRange = 15
#const utilt_yRange = 12.5
#const utilt_hitFrame = 12
#const utilt_lastHitFrame = 27
#const utilt_damage_info = UTilt|15|65|74|90

// dtilt
#const dtilt_IASA = 9
#const dtilt_xOffset = 6
#const dtilt_yOffset = 1
#const dtilt_xRange = 10
#const dtilt_yRange = 5
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|9|30|80|30

// fsmash
#const fsmash_IASA = 34
#const fsmash_xOffset = 4.46
#const fsmash_yOffset = -3.02
#const fsmash_xRange = 12.44
#const fsmash_yRange = 7.84
#const fsmash_hitFrame = 9
#const fsmash_lastHitFrame = 23
#const fsmash_damage_info = FSmash|20|30|77|361

// usmash
#const usmash_IASA = 31
#const usmash_xOffset = -38
#const usmash_yOffset = 22
#const usmash_xRange = 38
#const usmash_yRange = 38
#const usmash_hitFrame = 12
#const usmash_lastHitFrame = 30
#const usmash_damage_info = USmash|15|60|90|50

// dsmash
#const dsmash_IASA = 31
#const dsmash_xOffset = -32
#const dsmash_yOffset = 10
#const dsmash_xRange = 32
#const dsmash_yRange = 12
#const dsmash_hitFrame = 11
#const dsmash_lastHitFrame = 14
#const dsmash_damage_info = DSmash|18|w25|80|275

// noochB
// TODO - bite
// #const nspecial_IASA = 9999.9999
// #const nspecial_xOffset = 9999.9999
// #const nspecial_yOffset = 9999.9999
// #const nspecial_xRange = 9999.9999
// #const nspecial_yRange = 9999.9999
// #const nspecial_hitFrame = 9999.9999
// #const nspecial_lastHitFrame = 9999.9999

// upB
#const uspecial_IASA = 44
#const uspecial_xOffset = -13
#const uspecial_yOffset = 2.41
#const uspecial_xRange = 13
#const uspecial_yRange = 37.74
#const uspecial_hitFrame = 2
#const uspecial_lastHitFrame = 25
#const uspecial_damage_info = USpecial|14|50|100|80

#const uspecialair_IASA = 44
#const uspecialair_xOffset = -13
#const uspecialair_yOffset = 2.41
#const uspecialair_xRange = 13
#const uspecialair_yRange = 37.74
#const uspecialair_hitFrame = 2
#const uspecialair_lastHitFrame = 25
#const uspecialair_damage_info = USpecialAir|14|50|100|80

// downB
// TODONOT - absolutely do not

// sideB
#const sspecial_IASA = 56
#const sspecial_xOffset = 69.07
#const sspecial_yOffset = 1.37
#const sspecial_xRange = 28.2
#const sspecial_yRange = 5.92
#const sspecial_hitFrame = 26
#const sspecial_lastHitFrame = 38
#const sspecial_damage_info = SSpecial|26|50|80|361

#const mv_sspecial_mid = 1
#const sspecial_mid_xOffset = 27.74
#const sspecial_mid_yOffset = 1.37
#const sspecial_mid_xRange = 48.86
#const sspecial_mid_yRange = 5.92
#const sspecial_mid_hitFrame = 6
#const sspecial_mid_lastHitFrame = 38
#const sspecial_mid_damage_info = SSpecial|21|50|85|361

#const mv_sspecial_jump = 2
#const sspecial_jump_IASA = 51
#const sspecial_jump_xOffset = -3.014
#const sspecial_jump_yOffset = 2.156
#const sspecial_jump_xRange = 56.294
#const sspecial_jump_yRange = 19.131
#const sspecial_jump_hitFrame = 1
#const sspecial_jump_lastHitFrame = 42
#const sspecial_jump_damage_info = SSpecial|15|20|100|361

#const sspecialair_IASA = 45
#const sspecialair_xOffset = 6.5
#const sspecialair_yOffset = -2.48
#const sspecialair_xRange = 21.95
#const sspecialair_yRange = 6.61
#const sspecialair_hitFrame = 11
#const sspecialair_lastHitFrame = 25
#const sspecialair_damage_info = SSpecialAir|15|50|80|361

// grab
#const grab_IASA = 32
#const grab_xOffset = 3.5
#const grab_yOffset = -2.5
#const grab_xRange = 6
#const grab_yRange = 4.5
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const mv_grab_dash = 1
#const grab_dash_xOffset = -5.250
#const grab_dash_yOffset = -1.750
#const grab_dash_xRange = 43.519
#const grab_dash_yRange = 4.750
#const grab_hitFrame = 2
#const grab_lastHitFrame = 37
#const grab_dash_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 38
#const fthrow_throwFrame = 4
#const fthrow_damage_info = Grab|3|60|100|40

#const dthrow_IASA = 48
#const dthrow_throwFrame = 22
#const dthrow_damage_info = Grab|13|130|0|90

#const bthrow_IASA = 78
#const bthrow_throwFrame = 54
#const bthrow_damage_info = Grab|15|60|100|45

#const uthrow_IASA = 46
#const uthrow_throwFrame = 24
#const uthrow_damage_info = Grab|13|60|100|90

// NAir
#const nair_IASA = 21
#const nair_xOffset = -16
#const nair_yOffset = 3
#const nair_xRange = 15.5
#const nair_yRange = 8
#const nair_hitFrame = 4
#const nair_lastHitFrame = 7
#const nair_damage_info = NAir|15|30|90|361

#const mv_nair_fall = 1
#const nair_fall_xOffset = -16
#const nair_fall_yOffset = 3
#const nair_fall_xRange = 15.5
#const nair_fall_yRange = 9
#const nair_fall_hitFrame = 4
#const nair_fall_lastHitFrame = 38
#const nair_fall_damage_info = NAir|12|20|100|361

// FAir
#const fair_IASA = 19
#const fair_xOffset = -6
#const fair_yOffset = 5
#const fair_xRange = 13.5
#const fair_yRange = 10.5
#const fair_hitFrame = 5
#const fair_lastHitFrame = 7
#const fair_damage_info = FAir|15|20|90|35

#const mv_fair_fall = 1
#const fair_fall_xOffset = -6
#const fair_fall_yOffset = 5
#const fair_fall_xRange = 13.5
#const fair_fall_yRange = 10.5
#const fair_fall_hitFrame = 5
#const fair_fall_lastHitFrame = 15
#const fair_fall_damage_info = FAir|11|15|90|35

// BAir
#const bair_IASA = 22
#const bair_xOffset = -22.65
#const bair_yOffset = 3.09
#const bair_xRange = 9.02
#const bair_yRange = 8.25
#const bair_hitFrame = 10
#const bair_lastHitFrame = 19
#const bair_damage_info = BAir|15|20|90|361

// UAir
#const uair_IASA = 9
#const uair_xOffset = -15
#const uair_yOffset = 3
#const uair_xRange = 15
#const uair_yRange = 15
#const uair_hitFrame = 8
#const uair_lastHitFrame = 9
#const uair_damage_info = UAir|18|35|80|75

// DAir
#const dair_IASA = 33
#const dair_xOffset = -6.2
#const dair_yOffset = 2.95
#const dair_xRange = 5.7
#const dair_yRange = 5.7
#const dair_hitFrame = 15
#const dair_lastHitFrame = 29
#const dair_damage_info = DAir|17|60|80|270