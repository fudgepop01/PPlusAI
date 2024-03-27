#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 9.69
#const cs_jumpHeight = 21.63
#const cs_djumpHeight = 21.63
#const cs_wavedashDist = 23

#const _pt_jumpiness = 0.5
#const _pt_djumpiness = 0.8
#const _pt_aggression = 1.6
#const _pt_bait_dashAwayChance = 0.3
#const _pt_bait_wdashAwayChance = 0.7
#const _pt_wall_chance = 0.2
#const _pt_platChance = 0.23
#const _pt_baitChance = 1.01
#const _pt_braveChance = 0.45
#const _pt_circleCampChance = 0.25

#const cs_dashForceTurnFrame = 10
#const cs_dashDanceMinFrames = 3
#const cs_recoveryDistX = 140
#const cs_recoveryDistY = 10

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x129)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x129) || Equal CurrAction hex(0x12b) 
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x12c)

/// recovery

// jab123
#const jab123_IASA = 15
#const jab123_xOffset = 2.95
#const jab123_yOffset = -1.13
#const jab123_xRange = 5.21
#const jab123_yRange = 3.6
#const jab123_hitFrame = 5
#const jab123_lastHitFrame = 6
#const jab123_damage_info = Jab123|3|8|50|44

#const mv_jab123_2 = 1
#const jab123_2_IASA = 15
#const jab123_2_xOffset = 3.45
#const jab123_2_yOffset = -0.44
#const jab123_2_xRange = 5.26
#const jab123_2_yRange = 3.59
#const jab123_2_hitFrame = 6
#const jab123_2_lastHitFrame = 7
#const jab123_2_damage_info = Jab123|3|30|90|361

// dashattack
#const dashattack_IASA = 38
#const dashattack_xOffset = 9.57
#const dashattack_yOffset = -3.56
#const dashattack_xRange = 7.24
#const dashattack_yRange = 4.81
#const dashattack_hitFrame = 4
#const dashattack_lastHitFrame = 8
#const dashattack_damage_info = DashAttack|12|16|100|361

#const mv_dashattack_weak = 1
#const dashattack_weak_xOffset = 9.57
#const dashattack_weak_yOffset = -2.86
#const dashattack_weak_xRange = 11
#const dashattack_weak_yRange = 5.16
#const dashattack_weak_hitFrame = 4
#const dashattack_weak_lastHitFrame = 14
#const dashattack_weak_damage_info = DashAttack|8|8|100|361

// ftilt
#const ftilt_IASA = 27
#const ftilt_xOffset = 0.46
#const ftilt_yOffset = -0.28
#const ftilt_xRange = 6.92
#const ftilt_yRange = 3.73
#const ftilt_hitFrame = 6
#const ftilt_lastHitFrame = 9
#const ftilt_damage_info = FTilt|10|24|100|361

// utilt
#const utilt_IASA = 25
#const utilt_xOffset = -12.21
#const utilt_yOffset = 5.23
#const utilt_xRange = 8.87
#const utilt_yRange = 12.39
#const utilt_hitFrame = 8
#const utilt_lastHitFrame = 14
#const utilt_damage_info = UTilt|9|40|120|96

// dtilt
#const dtilt_IASA = 26
#const dtilt_xOffset = 1.82
#const dtilt_yOffset = 0.25
#const dtilt_xRange = 7.24
#const dtilt_yRange = 4.27
#const dtilt_hitFrame = 7
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|10|40|30|20

// fsmash
#const fsmash_IASA = 45
#const fsmash_xOffset = 7.47
#const fsmash_yOffset = -0.64
#const fsmash_xRange = 6.85
#const fsmash_yRange = 5.14
#const fsmash_hitFrame = 13
#const fsmash_lastHitFrame = 16
#const fsmash_damage_info = FSmash|17|10|118|361

#const mv_fsmash_weak = 1
#const fsmash_weak_xOffset = 7.47
#const fsmash_weak_yOffset = -0.64
#const fsmash_weak_xRange = 7.75
#const fsmash_weak_yRange = 5.14
#const fsmash_weak_hitFrame = 13
#const fsmash_weak_lastHitFrame = 21
#const fsmash_weak_damage_info = FSmash|13|6|105|361

// usmash
#const usmash_IASA = 45
#const usmash_xOffset = -11.8
#const usmash_yOffset = -2.01
#const usmash_xRange = 10.85
#const usmash_yRange = 9.39
#const usmash_hitFrame = 8
#const usmash_lastHitFrame = 11
#const usmash_damage_info = USmash|15|20|110|90

// dsmash
#const dsmash_IASA = 48
#const dsmash_xOffset = -12.26
#const dsmash_yOffset = 3.22
#const dsmash_xRange = 12.46
#const dsmash_yRange = 4.82
#const dsmash_hitFrame = 10
#const dsmash_lastHitFrame = 11
#const dsmash_damage_info = DSmash|12|34|66|-360

// noochB
// TODO - rollout
// #const nspecial_IASA = 9999.9999
// #const nspecial_xOffset = 9999.9999
// #const nspecial_yOffset = 9999.9999
// #const nspecial_xRange = 9999.9999
// #const nspecial_yRange = 9999.9999
// #const nspecial_hitFrame = 9999.9999
// #const nspecial_lastHitFrame = 9999.9999

// upB
// TODO - sing
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
#const dspecial_IASA = 251
#const dspecial_xOffset = -1.82
#const dspecial_yOffset = -3.15
#const dspecial_xRange = 1.95
#const dspecial_yRange = 1.95
#const dspecial_hitFrame = 1
#const dspecial_lastHitFrame = 1
#const dspecial_damage_info = DSpecial|28|78|120|361

#const dspecialair_IASA = 251
#const dspecialair_xOffset = -1.27
#const dspecialair_yOffset = -3.14
#const dspecialair_xRange = 1.95
#const dspecialair_yRange = 1.95
#const dspecialair_hitFrame = 1
#const dspecialair_lastHitFrame = 1
#const dspecialair_damage_info = DSpecialAir|28|78|120|361

// sideB
#const sspecial_IASA = 47
#const sspecial_xOffset = 2.03
#const sspecial_yOffset = -0.17
#const sspecial_xRange = 9.85
#const sspecial_yRange = 4.06
#const sspecial_hitFrame = 12
#const sspecial_lastHitFrame = 27
#const sspecial_damage_info = SSpecial|13|52|75|120

#const sspecialair_IASA = 47
#const sspecialair_xOffset = 0.15
#const sspecialair_yOffset = 0.53
#const sspecialair_xRange = 5.92
#const sspecialair_yRange = 4.41
#const sspecialair_hitFrame = 12
#const sspecialair_lastHitFrame = 27
#const sspecialair_damage_info = SSpecialAir|13|52|75|120

// grab
#const grab_IASA = 32
#const grab_xOffset = 1.64
#const grab_yOffset = -0.86
#const grab_xRange = 6.28
#const grab_yRange = 3.91
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 37
#const fthrow_throwFrame = 9
#const fthrow_damage_info = Grab|7|40|110|361

#const dthrow_IASA = 86
#const dthrow_throwFrame = 62
#const dthrow_damage_info = Grab|2|100|45|80

#const bthrow_IASA = 51
#const bthrow_throwFrame = 24
#const bthrow_damage_info = Grab|10|90|25|-45

#const uthrow_IASA = 43
#const uthrow_throwFrame = 7
#const uthrow_damage_info = Grab|11|130|25|90

// NAir
#const nair_IASA = 49
#const nair_xOffset = -4.58
#const nair_yOffset = 2.16
#const nair_xRange = 8.56
#const nair_yRange = 5.64
#const nair_hitFrame = 6
#const nair_lastHitFrame = 7
#const nair_damage_info = NAir|12|10|70|361

#const mv_nair_weak = 1
#const nair_weak_xOffset = -4.58
#const nair_weak_yOffset = 2.16
#const nair_weak_xRange = 8.56
#const nair_weak_yRange = 5.64
#const nair_weak_hitFrame = 6
#const nair_weak_lastHitFrame = 28
#const nair_weak_damage_info = NAir|9|10|80|361

// FAir
#const fair_IASA = 34
#const fair_xOffset = -2.85
#const fair_yOffset = 2.85
#const fair_xRange = 8.08
#const fair_yRange = 5.06
#const fair_hitFrame = 7
#const fair_lastHitFrame = 8
#const fair_damage_info = FAir|12|10|100|361

#const mv_fair_weak = 1
#const fair_weak_xOffset = -2.85
#const fair_weak_yOffset = 2.85
#const fair_weak_xRange = 8.08
#const fair_weak_yRange = 5.07
#const fair_weak_hitFrame = 7
#const fair_weak_lastHitFrame = 22
#const fair_weak_damage_info = FAir|7|10|80|361

// BAir
#const bair_IASA = 30
#const bair_xOffset = -19.14
#const bair_yOffset = 1.04
#const bair_xRange = 9.8
#const bair_yRange = 4.59
#const bair_hitFrame = 9
#const bair_lastHitFrame = 12
#const bair_damage_info = BAir|12|10|100|361

// UAir
#const uair_IASA = 37
#const uair_xOffset = -9.7
#const uair_yOffset = -4.91
#const uair_xRange = 8.98
#const uair_yRange = 6.35
#const uair_hitFrame = 9
#const uair_lastHitFrame = 12
#const uair_damage_info = UAir|12|30|100|90

// DAir
#const dair_IASA = 51
#const dair_xOffset = -2.42
#const dair_yOffset = 7.28
#const dair_xRange = 5.32
#const dair_yRange = 5.79
#const dair_hitFrame = 5
#const dair_lastHitFrame = 27
#const dair_damage_info = DAir|2|20|100|270