#const DIRY_ABOVE = 20
#const DIRY_BELOW_AIR = 5
#const DIRY_BELOW_GROUND = 0
#const DIRX_FRONT = 15
#const DIRX_BACK = 0

#const pt_jumpiness = 0.1
#const pt_djumpiness = 0.04
#const pt_aggression = 1.5
#const pt_bait_dashAwayChance = 0.6
#const pt_bait_wdashAwayChance = 0.15
#const pt_wall_chance = 0.4
#const pt_platChance = 0.1
#const pt_baitChance = 0.75
#const pt_braveChance = 0.85
#const pt_circleCampChance = 0.25

#const cs_dashForceTurnFrame = 11
#const cs_dashDanceMinFrames = 4

#const cs_shortHopHeight = 22.5
#const cs_jumpHeight = 44.1
#const cs_djumpHeight = 53.36
#const cs_wavedashDist = 40
#const cs_recoveryDistX = 100
#const cs_recoveryDistY = -50

#const recovery_moves = uspecial

#const uspecial_subaction_check = !(True)
#const uspecial_recovery_info = common|0

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x11c) || Equal CurrAction hex(0x11d)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x119) || Equal CurrAction hex(0x11a) || Equal CurrAction hex(0x11b)

// jab123
#const jab123_IASA = 19
#const jab123_xOffset = -3.43
#const jab123_yOffset = 1.09
#const jab123_xRange = 24.49
#const jab123_yRange = 14.07
#const jab123_hitFrame = 8
#const jab123_lastHitFrame = 10
#const jab123_damage_info = Jab123|7|20|100|68

#const mv_jab123_2 = 1
#const jab123_2_IASA = 25
#const jab123_2_xOffset = 1.03
#const jab123_2_yOffset = 2.02
#const jab123_2_xRange = 24.85
#const jab123_2_yRange = 12.68
#const jab123_2_hitFrame = 9
#const jab123_2_lastHitFrame = 11
#const jab123_2_damage_info = Jab123|9|50|110|361

// dashattack
#const dashattack_IASA = 55
#const dashattack_xOffset = 12.25
#const dashattack_yOffset = 3.6
#const dashattack_xRange = 18.25
#const dashattack_yRange = 12
#const dashattack_hitFrame = 11
#const dashattack_lastHitFrame = 14
#const dashattack_damage_info = DashAttack|15|70|80|80

// ftilt
#const ftilt_IASA = 38
#const ftilt_xOffset = 1.2
#const ftilt_yOffset = 2.4
#const ftilt_xRange = 26.08
#const ftilt_yRange = 15.53
#const ftilt_hitFrame = 12
#const ftilt_lastHitFrame = 17
#const ftilt_damage_info = FTilt|20|45|80|70

// utilt
#const utilt_IASA = 44
#const utilt_xOffset = 12.46
#const utilt_yOffset = -5.03
#const utilt_xRange = 13.01
#const utilt_yRange = 15.44
#const utilt_hitFrame = 8
#const utilt_lastHitFrame = 9
#const utilt_damage_info = UTilt|17|95|80|80

#const mv_utilt_late = 1
#const utilt_late_xOffset = -35.84
#const utilt_late_yOffset = 2.64
#const utilt_late_xRange = 37.16
#const utilt_late_yRange = 32.98
#const utilt_late_hitFrame = 10
#const utilt_late_lastHitFrame = 18
#const utilt_late_damage_info = UTilt|10|85|80|80

// dtilt
#const dtilt_IASA = 55
#const dtilt_xOffset = -3.6
#const dtilt_yOffset = 4.13
#const dtilt_xRange = 22.07
#const dtilt_yRange = 9.87
#const dtilt_hitFrame = 13
#const dtilt_lastHitFrame = 16
#const dtilt_damage_info = DTilt|12|50|70|361

#const mv_dtilt_hit2 = 1
#const dtilt_hit2_xOffset = -3.6
#const dtilt_hit2_yOffset = 3.6
#const dtilt_hit2_xRange = 20.17
#const dtilt_hit2_yRange = 10.62
#const dtilt_hit2_hitFrame = 27
#const dtilt_hit2_lastHitFrame = 30
#const dtilt_hit2_damage_info = DTilt|13|40|80|361

// fsmash
#const fsmash_IASA = 63
#const fsmash_xOffset = 1.67
#const fsmash_yOffset = 4.5
#const fsmash_xRange = 34.34
#const fsmash_yRange = 18.1
#const fsmash_hitFrame = 31
#const fsmash_lastHitFrame = 35
#const fsmash_damage_info = FSmash|28|50|100|361

// usmash
#const usmash_IASA = 53
#const usmash_xOffset = -16.7
#const usmash_yOffset = 5.04
#const usmash_xRange = 18.03
#const usmash_yRange = 34.02
#const usmash_hitFrame = 18
#const usmash_lastHitFrame = 22
#const usmash_damage_info = USmash|24|65|70|90

#const mv_usmash_land = 1
#const usmash_land_xOffset = -39.5
#const usmash_land_yOffset = 7.5
#const usmash_land_xRange = 42
#const usmash_land_yRange = 12.75
#const usmash_land_hitFrame = 32
#const usmash_land_lastHitFrame = 36
#const usmash_land_damage_info = USmash|12|60|100|270

// dsmash
#const dsmash_IASA = 63
#const dsmash_xOffset = -34.5
#const dsmash_yOffset = 11.28
#const dsmash_xRange = 34.5
#const dsmash_yRange = 18
#const dsmash_hitFrame = 10
#const dsmash_lastHitFrame = 31
#const dsmash_damage_info = DSmash|13|100|40|90

// noochB
// #const nspecial_IASA = 69
// #const nspecial_xOffset = -9.83
// #const nspecial_yOffset = 9.08
// #const nspecial_xRange = 12.56
// #const nspecial_yRange = 22.88
// #const nspecial_hitFrame = 27
// #const nspecial_lastHitFrame = 37
// #const nspecial_damage_info = NSpecial|20|80|81|85

// upB
// #const uspecial_IASA = 81
// #const uspecial_xOffset = -7.5
// #const uspecial_yOffset = 0.94
// #const uspecial_xRange = 8.5
// #const uspecial_yRange = 8.5
// #const uspecial_hitFrame = 5
// #const uspecial_lastHitFrame = 7
// #const uspecial_damage_info = USpecial|13|70|80|80

// downB
#const dspecial_IASA = 110
#const dspecial_xOffset = 30.6
#const dspecial_yOffset = -44.34
#const dspecial_xRange = 14.42
#const dspecial_yRange = 20.79
#const dspecial_hitFrame = 38
#const dspecial_lastHitFrame = 40
#const dspecial_damage_info = DSpecial|29|60|81|90

#const dspecialair_IASA = 80
#const dspecialair_xOffset = -20
#const dspecialair_yOffset = -2
#const dspecialair_xRange = 20
#const dspecialair_yRange = 20
#const dspecialair_hitFrame = 32
#const dspecialair_lastHitFrame = 32
#const dspecialair_damage_info = DSpecialAir|17|30|120|290

#const mv_dspecialair_landing = 1
#const dspecialair_landing_IASA = 62
#const dspecialair_landing_xOffset = -24
#const dspecialair_landing_yOffset = 6
#const dspecialair_landing_xRange = 24
#const dspecialair_landing_yRange = 12
#const dspecialair_landing_hitFrame = 1
#const dspecialair_landing_lastHitFrame = 2
#const dspecialair_landing_damage_info = DSpecialAir|12|90|130|305

// sideB
#const sspecial_IASA = 49
#const sspecial_xOffset = 11.43
#const sspecial_yOffset = -2
#const sspecial_xRange = 15.93
#const sspecial_yRange = 9
#const sspecial_hitFrame = 16
#const sspecial_lastHitFrame = 16
#const sspecial_damage_info = SSpecial|0|0|0|0

#const mv_sspecial_hit = 1
#const sspecial_hit_xOffset = 14.18
#const sspecial_hit_yOffset = -3.98
#const sspecial_hit_xRange = 18.66
#const sspecial_hit_yRange = 9.63
#const sspecial_hit_hitFrame = 17
#const sspecial_hit_lastHitFrame = 18
#const sspecial_hit_damage_info = SSpecial|14|80|90|70

#const mv_sspecial_throwb = 2
#const sspecial_throwb_damage_info = SSpecial|15|90|75|-361

#const mv_sspecial_throwf = 3
#const sspecial_throwf_damage_info = SSpecial|23|70|90|65

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 43
#const grab_xOffset = 2.1
#const grab_yOffset = 4.8
#const grab_xRange = 15.45
#const grab_yRange = 9
#const grab_hitFrame = 11
#const grab_lastHitFrame = 11
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 61
#const fthrow_throwFrame = 35
#const fthrow_damage_info = Grab|18|50|70|45

#const dthrow_IASA = 55
#const dthrow_throwFrame = 26
#const dthrow_damage_info = Grab|3|75|0|75

#const bthrow_IASA = 41
#const bthrow_throwFrame = 18
#const bthrow_damage_info = Grab|18|70|50|45

#const uthrow_IASA = 71
#const uthrow_throwFrame = 50
#const uthrow_damage_info = Grab|1|30|300|70

// NAir
#const nair_IASA = 51
#const nair_xOffset = -27
#const nair_yOffset = 1.93
#const nair_xRange = 27
#const nair_yRange = 16.5
#const nair_hitFrame = 6
#const nair_lastHitFrame = 23
#const nair_damage_info = NAir|10|100|50|361

// FAir
#const fair_IASA = 35
#const fair_xOffset = -0.34
#const fair_yOffset = 2.35
#const fair_xRange = 20.75
#const fair_yRange = 20.94
#const fair_hitFrame = 11
#const fair_lastHitFrame = 15
#const fair_damage_info = FAir|18|40|75|37

// BAir
#const bair_IASA = 51
#const bair_xOffset = -29.82
#const bair_yOffset = -1.02
#const bair_xRange = 15.5
#const bair_yRange = 15.5
#const bair_hitFrame = 9
#const bair_lastHitFrame = 11
#const bair_damage_info = BAir|19|25|72|-24

#const mv_bair_weak = 1
#const bair_weak_xOffset = -29.82
#const bair_weak_yOffset = -0.43
#const bair_weak_xRange = 16.25
#const bair_weak_yRange = 16.03
#const bair_weak_hitFrame = 12
#const bair_weak_lastHitFrame = 25
#const bair_weak_damage_info = BAir|14|25|72|-361

// UAir
#const uair_IASA = 49
#const uair_xOffset = -32.33
#const uair_yOffset = -16.95
#const uair_xRange = 28.79
#const uair_yRange = 20.82
#const uair_hitFrame = 22
#const uair_lastHitFrame = 26
#const uair_damage_info = UAir|20|50|90|75

// DAir
#const dair_IASA = 81
#const dair_xOffset = -16.19
#const dair_yOffset = 7.8
#const dair_xRange = 16.2
#const dair_yRange = 15.9
#const dair_hitFrame = 14
#const dair_lastHitFrame = 45
#const dair_damage_info = DAir|4|50|50|270

#const mv_dair_land = 1
#const dair_land_xOffset = -24
#const dair_land_yOffset = 6
#const dair_land_xRange = 24
#const dair_land_yRange = 12
#const dair_land_hitFrame = 1
#const dair_land_lastHitFrame = 3
#const dair_land_damage_info = DAir|10|60|80|361