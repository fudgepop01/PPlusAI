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

#const cs_dashForceTurnFrame = 10
#const cs_dashDanceMinFrames = 3

#const cs_shortHopHeight = 15.21
#const cs_jumpHeight = 38.44
#const cs_djumpHeight = 34.69
#const cs_wavedashDist = 24
#const cs_recoveryDistX = 75
#const cs_recoveryDistY = -75

#const recovery_moves = uspecial

#const uspecial_subaction_check = !(True)
#const uspecial_recovery_info = common|0

#const SFALL_ACTIONS = Equal CurrAction hex(0x10) || Equal CurrAction hex(0x11c)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118) || Equal CurrAction hex(0x119)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrSubaction hex(0x66)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x11b)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115)

// jab123
#const jab123_IASA = 18
#const jab123_xOffset = 0.43
#const jab123_yOffset = -3.6
#const jab123_xRange = 7.37
#const jab123_yRange = 4.13
#const jab123_hitFrame = 6
#const jab123_lastHitFrame = 7
#const jab123_damage_info = Jab123|3|w30|100|60

#const mv_jab1232 = 1
#const jab1232_IASA = 22
#const jab1232_xOffset = 3.13
#const jab1232_yOffset = -3.59
#const jab1232_xRange = 7.72
#const jab1232_yRange = 4.14
#const jab1232_hitFrame = 8
#const jab1232_lastHitFrame = 9
#const jab1232_damage_info = Jab123|2|w36|100|50

#const mv_jab1233 = 2
#const jab1233_IASA = 40
#const jab1233_xOffset = 2.3
#const jab1233_yOffset = -6.9
#const jab1233_xRange = 8.18
#const jab1233_yRange = 5.57
#const jab1233_hitFrame = 8
#const jab1233_lastHitFrame = 11
#const jab1233_damage_info = Jab123|5|30|120|55

// dashattack
#const dashattack_IASA = 37
#const dashattack_xOffset = 3.04
#const dashattack_yOffset = -4.04
#const dashattack_xRange = 8.49
#const dashattack_yRange = 4.25
#const dashattack_hitFrame = 6
#const dashattack_lastHitFrame = 6
#const dashattack_damage_info = DashAttack|10|45|55|55

#const mv_dashattack_late = 1
#const dashattack_late_xOffset = 4.67
#const dashattack_late_yOffset = -3.68
#const dashattack_late_xRange = 13.45
#const dashattack_late_yRange = 4.34
#const dashattack_late_hitFrame = 7
#const dashattack_late_lastHitFrame = 15
#const dashattack_late_damage_info = DashAttack|7|30|55|75

// ftilt
#const ftilt_IASA = 26
#const ftilt_xOffset = 8.48
#const ftilt_yOffset = -5.4
#const ftilt_xRange = 7.76
#const ftilt_yRange = 4.33
#const ftilt_hitFrame = 10
#const ftilt_lastHitFrame = 14
#const ftilt_damage_info = FTilt|10|40|35|37

// utilt
#const utilt_IASA = 27
#const utilt_xOffset = -14.81
#const utilt_yOffset = 2.18
#const utilt_xRange = 14.81
#const utilt_yRange = 14.6
#const utilt_hitFrame = 5
#const utilt_lastHitFrame = 14
#const utilt_damage_info = UTilt|7|35|90|85

// dtilt
#const dtilt_IASA = 25
#const dtilt_xOffset = 1.25
#const dtilt_yOffset = 1.81
#const dtilt_xRange = 8.61
#const dtilt_yRange = 4.6
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 8
#const dtilt_damage_info = DTilt|6|35|100|80

// fsmash
#const fsmash_IASA = 50
#const fsmash_xOffset = 6
#const fsmash_yOffset = -1.5
#const fsmash_xRange = 10.75
#const fsmash_yRange = 6.5
#const fsmash_hitFrame = 20
#const fsmash_lastHitFrame = 24
#const fsmash_damage_info = FSmash|14|20|100|361

// usmash
#const usmash_IASA = 26
#const usmash_xOffset = -1.87
#const usmash_yOffset = 0.3
#const usmash_xRange = 7.98
#const usmash_yRange = 19.82
#const usmash_hitFrame = 11
#const usmash_lastHitFrame = 24
#const usmash_damage_info = USmash|6|45|175|83

#const mv_usmashStart = 1
#const usmashStart_xOffset = -0.9
#const usmashStart_yOffset = 0.3
#const usmashStart_xRange = 7.49
#const usmashStart_yRange = 8.65
#const usmashStart_hitFrame = 11
#const usmashStart_lastHitFrame = 12
#const usmashStart_damage_info = USmash|6|w40|100|112

// dsmash
#const dsmash_IASA = 51
#const dsmash_xOffset = -18
#const dsmash_yOffset = -1
#const dsmash_xRange = 17
#const dsmash_yRange = 5
#const dsmash_hitFrame = 13
#const dsmash_lastHitFrame = 18
#const dsmash_damage_info = DSmash|14|25|100|361

// noochB
#const nspecial_IASA = 48
#const nspecial_xOffset = 0
#const nspecial_yOffset = 5
#const nspecial_xRange = 100
#const nspecial_yRange = 10
#const nspecial_hitFrame = 18
#const nspecial_lastHitFrame = 40
#const nspecial_damage_info = NSpecial|0|0|0|0

#const mv_asc = 1
#const asc_damage_info = NSpecial|0|0|0|0

#const nspecialair_IASA = 48
#const nspecialair_xOffset = 0
#const nspecialair_yOffset = 5
#const nspecialair_xRange = 100
#const nspecialair_yRange = 10
#const nspecialair_hitFrame = 18
#const nspecialair_lastHitFrame = 40
#const nspecialair_damage_info = NSpecialAir|0|0|0|0

// upB
// #const uspecial_IASA = 81
// #const _xOffset = -19.42
// #const uspecial_yOffset = -2.02
// #const uspecial_xRange = 21.41
// #const uspecial_yRange = 7.04
// #const uspecial_hitFrame = 8
// #const uspecial_lastHitFrame = 14
// #const uspecial_damage_info = USpecial|15|32|95|361

// #const mv_uspecial_late = 1
// #const uspecial_late_xOffset = -20.78
// #const uspecial_late_yOffset = -2.02
// #const uspecial_late_xRange = 22.09
// #const uspecial_late_yRange = 7.04
// #const uspecial_late_hitFrame = 8
// #const uspecial_late_lastHitFrame = 47
// #const uspecial_late_damage_info = USpecial|5|60|100|-360

// #const uspecialair_IASA = 140
// #const uspecialair_xOffset = -17.92
// #const uspecialair_yOffset = -3.84
// #const uspecialair_xRange = 19.02
// #const uspecialair_yRange = 24.51
// #const uspecialair_hitFrame = 8
// #const uspecialair_lastHitFrame = 51
// #const uspecialair_damage_info = USpecialAir|6|40|123|45

// downB
#const dspecial_IASA = 9999
#const dspecial_xOffset = 1
#const dspecial_yOffset = 1
#const dspecial_xRange = 1
#const dspecial_yRange = 1
#const dspecial_hitFrame = 999
#const dspecial_lastHitFrame = 999
#const dspecial_damage_info = DSpecial|0|0|0|0

// #const dspecialair_IASA = 75
// #const dspecialair_xOffset = 20
// #const dspecialair_yOffset = 50
// #const dspecialair_xRange = 50
// #const dspecialair_yRange = 50
// #const dspecialair_hitFrame = 49
// #const dspecialair_lastHitFrame = 60
// #const dspecialair_damage_info = DSpecialAir|11|0|0|0

// sideB
#const sspecial_IASA = 37
#const sspecial_xOffset = 3.13
#const sspecial_yOffset = -4.47
#const sspecial_xRange = 6.17
#const sspecial_yRange = 4.18
#const sspecial_hitFrame = 12
#const sspecial_lastHitFrame = 14
#const sspecial_damage_info = SSpecial|3|40|212|65

// #const sspecialair_IASA = 58
// #const sspecial_xOffset = 3.13
// #const sspecial_yOffset = -4.47
// #const sspecial_xRange = 6.17
// #const sspecial_yRange = 4.18
// #const sspecialair_hitFrame = 25
// #const sspecialair_lastHitFrame = 51 // just a dummy
// #const sspecialair_damage_info = SSpecialAir|8|10|100|90

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 30
#const grab_xOffset = 0.37
#const grab_yOffset = -4.34
#const grab_xRange = 5.52
#const grab_yRange = 3.91
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 29
#const fthrow_throwFrame = 11
#const fthrow_damage_info = Grab|10|20|90|45

#const dthrow_IASA = 54
#const dthrow_throwFrame = 20
#const dthrow_damage_info = Grab|7|80|44|70

#const bthrow_IASA = 35
#const bthrow_throwFrame = 13
#const bthrow_damage_info = Grab|10|35|75|-45

#const uthrow_IASA = 34
#const uthrow_throwFrame = 16
#const uthrow_damage_info = Grab|5|60|105|-75


// NAir
#const nair_IASA = 53
#const nair_xOffset = -11.23
#const nair_yOffset = -1.35
#const nair_xRange = 11.45
#const nair_yRange = 4.57
#const nair_hitFrame = 9
#const nair_lastHitFrame = 15
#const nair_damage_info = NAir|15|20|100|361

#const mv_nair_late = 1
#const nair_late_xOffset = -11.23
#const nair_late_yOffset = -0.5
#const nair_late_xRange = 10.89
#const nair_late_yRange = 4.57
#const nair_late_hitFrame = 16
#const nair_late_lastHitFrame = 28
#const nair_late_damage_info = NAir|12|15|100|50

#const mv_nair_superlate = 2
#const nair_superlate_xOffset = -10.24
#const nair_superlate_yOffset = -0.74
#const nair_superlate_xRange = 10.2
#const nair_superlate_yRange = 4.23
#const nair_superlate_hitFrame = 29
#const nair_superlate_lastHitFrame = 41
#const nair_superlate_damage_info = NAir|9|10|100|60

// FAir
#const fair_IASA = 30
#const fair_xOffset = -0.47
#const fair_yOffset = 4.91
#const fair_xRange = 8.2
#const fair_yRange = 8.89
#const fair_hitFrame = 4
#const fair_lastHitFrame = 12
#const fair_damage_info = FAir|12|40|70|60

// BAir
#const bair_IASA = 32
#const bair_xOffset = -15.73
#const bair_yOffset = 0.26
#const bair_xRange = 6.93
#const bair_yRange = 5.29
#const bair_hitFrame = 10
#const bair_lastHitFrame = 13
#const bair_damage_info = BAir|15|30|100|-361

// UAir
#const uair_IASA = 28
#const uair_xOffset = -3.6
#const uair_yOffset = -5.08
#const uair_xRange = 7
#const uair_yRange = 7.38
#const uair_hitFrame = 7
#const uair_lastHitFrame = 10
#const uair_damage_info = UAir|12|40|100|90

// DAir
#const dair_IASA = 28
#const dair_xOffset = -4.5
#const dair_yOffset = 8.3
#const dair_xRange = 5.25
#const dair_yRange = 8.35
#const dair_hitFrame = 4
#const dair_lastHitFrame = 12
#const dair_damage_info = DAir|8|50|110|361