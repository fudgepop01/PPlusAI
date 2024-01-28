#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 18
#const cs_jumpHeight = 39.01
#const cs_djumpHeight = 39.01
#const cs_wavedashDist = 36

#const pt_jumpiness = 0.2
#const pt_djumpiness = 0.15
#const pt_aggression = 1.2
#const pt_bait_dashAwayChance = 0.3
#const pt_bait_wdashAwayChance = 0.7
#const pt_wall_chance = 0.3
#const pt_platChance = 0.23
#const pt_baitChance = 1.01
#const pt_braveChance = 0.45
#const pt_circleCampChance = 0.35

#const cs_dashForceTurnFrame = 9
#const cs_dashDanceMinFrames = 3
#const cs_recoveryDistX = 110
#const cs_recoveryDistY = -150

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
#const jab123_IASA = 20
#const jab123_xOffset = -0.73
#const jab123_yOffset = -6.25
#const jab123_xRange = 10.58
#const jab123_yRange = 3.81
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 6
#const jab123_damage_info = Jab123|3|20|70|361

#const mv_jab123_2 = 1
#const jab123_2_IASA = 20
#const jab123_2_xOffset = -0.82
#const jab123_2_yOffset = -4.01
#const jab123_2_xRange = 10.25
#const jab123_2_yRange = 4.72
#const jab123_2_hitFrame = 3
#const jab123_2_lastHitFrame = 6
#const jab123_2_damage_info = Jab123|3|32|120|361

// dashattack
#const dashattack_IASA = 35
#const dashattack_xOffset = 9.01
#const dashattack_yOffset = 1.16
#const dashattack_xRange = 13.56
#const dashattack_yRange = 6.06
#const dashattack_hitFrame = 7
#const dashattack_lastHitFrame = 14
#const dashattack_damage_info = DashAttack|8|41|81|50

// ftilt
#const ftilt_IASA = 34
#const ftilt_xOffset = 6.35
#const ftilt_yOffset = -4.99
#const ftilt_xRange = 11.07
#const ftilt_yRange = 4.16
#const ftilt_hitFrame = 7
#const ftilt_lastHitFrame = 9
#const ftilt_damage_info = FTilt|8|30|100|361

// utilt
#const utilt_IASA = 26
#const utilt_xOffset = -10.02
#const utilt_yOffset = -3.28
#const utilt_xRange = 10.01
#const utilt_yRange = 16.79
#const utilt_hitFrame = 4
#const utilt_lastHitFrame = 8
#const utilt_damage_info = UTilt|5|55|120|90

// dtilt
#const dtilt_IASA = 17
#const dtilt_xOffset = 2.46
#const dtilt_yOffset = 2.06
#const dtilt_xRange = 11.69
#const dtilt_yRange = 6.27
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 6
#const dtilt_damage_info = DTilt|6|73|18|35

// fsmash
#const fsmash_IASA = 43
#const fsmash_xOffset = 5.08
#const fsmash_yOffset = -7.3
#const fsmash_xRange = 10.6
#const fsmash_yRange = 4.92
#const fsmash_hitFrame = 16
#const fsmash_lastHitFrame = 20
#const fsmash_damage_info = FSmash|15|30|100|361

// usmash
#const usmash_IASA = 46
#const usmash_xOffset = -7.48
#const usmash_yOffset = -9.21
#const usmash_xRange = 7.5
#const usmash_yRange = 13.47
#const usmash_hitFrame = 13
#const usmash_lastHitFrame = 17
#const usmash_damage_info = USmash|16|40|100|80

// dsmash
#const dsmash_IASA = 38
#const dsmash_xOffset = -15.5
#const dsmash_yOffset = -1.08
#const dsmash_xRange = 15.5
#const dsmash_yRange = 3.69
#const dsmash_hitFrame = 6
#const dsmash_lastHitFrame = 16
#const dsmash_damage_info = DSmash|4|80|120|70

// noochB
// TODO - laser
#const nspecial_IASA = 38
#const nspecial_xOffset = 7.732
#const nspecial_yOffset = -3.218
#const nspecial_xRange = 5.997
#const nspecial_yRange = 5.815
#const nspecial_hitFrame = 24
#const nspecial_lastHitFrame = 26
#const nspecial_damageInfo = NSpecial|7|40|100|361

#const mv_nspecialair_laser = 1
#const nspecialair_laser_IASA = 38
#const nspecialair_laser_xOffset = 7.472
#const nspecialair_laser_yOffset = 38.110
#const nspecialair_laser_xRange = 162.022
#const nspecialair_laser_yRange = 60.459
#const nspecialair_laser_hitFrame = 24
#const nspecialair_laser_lastHitFrame = 26
#const nspecialair_laser_damageInfo = NSpecialAir|5|30|30|361

#const mv_nspecialair_lasermax = 1
#const nspecialair_lasermax_IASA = 38
#const nspecialair_lasermax_xOffset = 7.472
#const nspecialair_lasermax_yOffset = 38.110
#const nspecialair_lasermax_xRange = 162.022
#const nspecialair_lasermax_yRange = 60.459
#const nspecialair_lasermax_hitFrame = 24
#const nspecialair_lasermax_lastHitFrame = 26
#const nspecialair_lasermax_damageInfo = NSpecialAir|13|50|52|361

// upB
// TODO - boost thingy
// #const uspecial_IASA = 52
// #const uspecial_xOffset = 23.1
// #const uspecial_yOffset = -54.27
// #const uspecial_xRange = 10.85
// #const uspecial_yRange = 11.64
// #const uspecial_hitFrame = 30
// #const uspecial_lastHitFrame = 32
// #const uspecial_damage_info = USpecial|9|60|103|83

#const uspecialair_IASA = 4
#const uspecialair_xOffset = -17.338
#const uspecialair_yOffset = 1.960
#const uspecialair_xRange = 17.374
#const uspecialair_yRange = 29.523
#const uspecialair_hitFrame = 10
#const uspecialair_lastHitFrame = 20
#const uspecialair_damage_info = USpecialAir|0|0|0|0

// downB
// TODO - top thingy
// #const dspecial_IASA = 37
// #const dspecial_xOffset = 4.16
// #const dspecial_yOffset = -0.33
// #const dspecial_xRange = 15.51
// #const dspecial_yRange = 4.43
// #const dspecial_hitFrame = 11
// #const dspecial_lastHitFrame = 25
// #const dspecial_damage_info = DSpecial|3|w80|100|360

// #const dspecialair_IASA = 51
// #const dspecialair_xOffset = 3.49
// #const dspecialair_yOffset = 3.37
// #const dspecialair_xRange = 10.35
// #const dspecialair_yRange = 10.34
// #const dspecialair_hitFrame = 11
// #const dspecialair_lastHitFrame = 22
// #const dspecialair_damage_info = DSpecialAir|3|20|100|35

// sideB
#const sspecial_IASA = 52
#const sspecial_xOffset = -3.91
#const sspecial_yOffset = 3.48
#const sspecial_xRange = 26.75
#const sspecial_yRange = 11.69
#const sspecial_hitFrame = 14
#const sspecial_lastHitFrame = 29
#const sspecial_damage_info = SSpecial|10|30|90|361

#const sspecialair_IASA = 4
#const sspecialair_xOffset = 32.594
#const sspecialair_yOffset = 34.152
#const sspecialair_xRange = 28.315
#const sspecialair_yRange = 21.145
#const sspecialair_hitFrame = 10
#const sspecialair_lastHitFrame = 20
#const sspecialair_damage_info = SSpecialAir|0|0|0|0

// grab
#const grab_IASA = 32
#const grab_xOffset = 2.77
#const grab_yOffset = -3.83
#const grab_xRange = 6.1
#const grab_yRange = 4.22
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 35
#const fthrow_throwFrame = 11
#const fthrow_damage_info = Grab|10|60|65|45

#const dthrow_IASA = 69
#const dthrow_throwFrame = 49
#const dthrow_damage_info = Grab|1|56|213|80

#const bthrow_IASA = 35
#const bthrow_throwFrame = 11
#const bthrow_damage_info = Grab|10|60|65|-45

#const uthrow_IASA = 81
#const uthrow_throwFrame = 64
#const uthrow_damage_info = Grab|10|70|100|80

// NAir
#const nair_IASA = 46
#const nair_xOffset = -17.3
#const nair_yOffset = 9.41
#const nair_xRange = 17.36
#const nair_yRange = 17
#const nair_hitFrame = 15
#const nair_lastHitFrame = 29
#const nair_damage_info = NAir|14|50|90|80

// FAir
#const fair_IASA = 33
#const fair_xOffset = 0.95
#const fair_yOffset = 1.22
#const fair_xRange = 9.48
#const fair_yRange = 6.98
#const fair_hitFrame = 7
#const fair_lastHitFrame = 8
#const fair_damage_info = FAir|10|40|90|50

#const mv_fair_weak = 1
#const fair_weak_xOffset = 0.84
#const fair_weak_yOffset = 1.22
#const fair_weak_xRange = 9.53
#const fair_weak_yRange = 7.36
#const fair_weak_hitFrame = 7
#const fair_weak_lastHitFrame = 19
#const fair_weak_damage_info = FAir|6|30|60|361

// BAir
#const bair_IASA = 41
#const bair_xOffset = -13.94
#const bair_yOffset = 0.1
#const bair_xRange = 14.35
#const bair_yRange = 5.74
#const bair_hitFrame = 11
#const bair_lastHitFrame = 18
#const bair_damage_info = BAir|13|30|96|35

// UAir
#const uair_IASA = 44
#const uair_xOffset = -16.76
#const uair_yOffset = -5.27
#const uair_xRange = 19.41
#const uair_yRange = 10.9
#const uair_hitFrame = 8
#const uair_lastHitFrame = 18
#const uair_damage_info = UAir|7|12|174|361

// DAir
#const dair_IASA = 38
#const dair_xOffset = -6.97
#const dair_yOffset = 8.99
#const dair_xRange = 7.16
#const dair_yRange = 9.89
#const dair_hitFrame = 13
#const dair_lastHitFrame = 17
#const dair_damage_info = DAir|11|40|100|280