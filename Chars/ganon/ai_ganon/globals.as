#const DIRY_ABOVE = 13.5
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -2

#const cs_shortHopHeight = 17.44
#const cs_jumpHeight = 28.66
#const cs_djumpHeight = 23.46
#const cs_wavedashDist = 15

#const dashForceTurnFrame = 10
#const dashDanceMinFrames = 2

#const pt_jumpiness = 0.05
#const pt_djumpiness = 0.02
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.55
#const pt_bait_wdashAwayChance = 0.08
#const pt_wall_chance = 0.9
#const pt_platChance = 0.1
#const pt_baitChance = 0.7
#const pt_braveChance = 0.7
#const pt_circleCampChance = 0.25

#const recovery_moves = uspecial|sspecial

#const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1D9)) && !(Equal CurrSubaction hex(0x1DA))
#const uspecial_recovery_info = common|60

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x11e)

// jab123
#const jab123_IASA = 18
#const jab123_xOffset = -0.62
#const jab123_yOffset = -8.11
#const jab123_xRange = 8.38
#const jab123_yRange = 4.46
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 5
#const jab123_damage_info = Jab123|8|30|100|361

// dashattack
#const dashattack_IASA = 37
#const dashattack_xOffset = 15.63
#const dashattack_yOffset = -3.14
#const dashattack_xRange = 7.92
#const dashattack_yRange = 5.86
#const dashattack_hitFrame = 7
#const dashattack_lastHitFrame = 9
#const dashattack_damage_info = DashAttack|15|60|80|105

#const mv_dashattack_late = 1
#const dashattack_late_xOffset = 21.39
#const dashattack_late_yOffset = -3.14
#const dashattack_late_xRange = 9.92
#const dashattack_late_yRange = 5.86
#const dashattack_late_hitFrame = 10
#const dashattack_late_lastHitFrame = 18
#const dashattack_late_damage_info = DashAttack|10|45|60|100

// ftilt
#const ftilt_IASA = 29
#const ftilt_xOffset = 8.06
#const ftilt_yOffset = -6.03
#const ftilt_xRange = 10.42
#const ftilt_yRange = 5.22
#const ftilt_hitFrame = 9
#const ftilt_lastHitFrame = 11
#const ftilt_damage_info = FTilt|13|20|100|40

// utilt
#const utilt_IASA = 60
#const utilt_xOffset = 4.43
#const utilt_yOffset = 3.58
#const utilt_xRange = 11.64
#const utilt_yRange = 8
#const utilt_hitFrame = 25
#const utilt_lastHitFrame = 28
#const utilt_damage_info = UTilt|22|50|78|361

// dtilt
#const dtilt_IASA = 32
#const dtilt_xOffset = 4.53
#const dtilt_yOffset = 0.86
#const dtilt_xRange = 12.09
#const dtilt_yRange = 4.68
#const dtilt_hitFrame = 9
#const dtilt_lastHitFrame = 11
#const dtilt_damage_info = DTilt|12|30|100|70

// fsmash
#const fsmash_IASA = 60
#const fsmash_xOffset = 7.4
#const fsmash_yOffset = -3.18
#const fsmash_xRange = 10.79
#const fsmash_yRange = 5.56
#const fsmash_hitFrame = 21
#const fsmash_lastHitFrame = 26
#const fsmash_damage_info = FSmash|22|40|90|65

// usmash
#const usmash_IASA = 45
#const usmash_xOffset = -2.09
#const usmash_yOffset = -9.89
#const usmash_xRange = 7.54
#const usmash_yRange = 11.55
#const usmash_hitFrame = 22
#const usmash_lastHitFrame = 24
#const usmash_damage_info = USmash|22|50|80|80

#const mv_usmash_hit2 = 1
#const usmash_hit2_xOffset = -1.98
#const usmash_hit2_yOffset = -10.69
#const usmash_hit2_xRange = 6.49
#const usmash_hit2_yRange = 11.58
#const usmash_hit2_hitFrame = 27
#const usmash_hit2_lastHitFrame = 30
#const usmash_hit2_damage_info = USmash|19|40|80|80

// dsmash
#const dsmash_IASA = 47
#const dsmash_xOffset = 6.65
#const dsmash_yOffset = -3.46
#const dsmash_xRange = 8.65
#const dsmash_yRange = 6
#const dsmash_hitFrame = 20
#const dsmash_lastHitFrame = 23
#const dsmash_damage_info = DSmash|8|115|0|160

#const mv_dsmash_hit2 = 1
#const dsmash_hit2_xOffset = -23.18
#const dsmash_hit2_yOffset = -6.81
#const dsmash_hit2_xRange = 12.56
#const dsmash_hit2_yRange = 4.87
#const dsmash_hit2_hitFrame = 30
#const dsmash_hit2_lastHitFrame = 33
#const dsmash_hit2_damage_info = DSmash|14|60|110|120

// noochB
#const nspecial_IASA = 44
#const nspecial_xOffset = -17.53
#const nspecial_yOffset = -0.63
#const nspecial_xRange = 24.76
#const nspecial_yRange = 10.45
#const nspecial_hitFrame = 17
#const nspecial_lastHitFrame = 21
// #const nspecial_damage_info = NSpecial|10|30|80|361

// upB
#const uspecial_IASA = 63
#const uspecial_xOffset = -3.02
#const uspecial_yOffset = -4.38
#const uspecial_xRange = 11.2
#const uspecial_yRange = 35.99
#const uspecial_hitFrame = 10
#const uspecial_lastHitFrame = 33
#const uspecial_damage_info = USpecial|10|40|115|361

// downB
#const dspecial_IASA = 41
#const dspecial_xOffset = 1.41
#const dspecial_yOffset = -2.7
#const dspecial_xRange = 31.43
#const dspecial_yRange = 5.49
#const dspecial_hitFrame = 14
#const dspecial_lastHitFrame = 34
#const dspecial_damage_info = DSpecial|17|60|76|361

// sideB
#const sspecial_IASA = 41
#const sspecial_xOffset = -2.99
#const sspecial_yOffset = -22.07
#const sspecial_xRange = 4
#const sspecial_yRange = 4
#const sspecial_hitFrame = 30
#const sspecial_lastHitFrame = 30
#const sspecial_damage_info = SSpecial|1|80|0|270

#const sspecial_IASA = 61
#const sspecial_xOffset = 5.24
#const sspecial_yOffset = 0.87
#const sspecial_xRange = 24.02
#const sspecial_yRange = 6.64
#const sspecial_hitFrame = 16
#const sspecial_lastHitFrame = 31
#const sspecial_damage_info = SSpecial|12|60|100|25

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 0.05
#const grab_yOffset = -4.85
#const grab_xRange = 6.95
#const grab_yRange = 5.44
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 35
#const fthrow_throwFrame = 14
#const fthrow_damage_info = Grab|8|45|105|45

#const dthrow_IASA = 41
#const dthrow_throwFrame = 18
#const dthrow_damage_info = Grab|7|75|45|80

#const bthrow_IASA = 30
#const bthrow_throwFrame = 17
#const bthrow_damage_info = Grab|4|30|130|58

#const uthrow_IASA = 39
#const uthrow_throwFrame = 11
#const uthrow_damage_info = Grab|3|70|120|90

// NAir
#const nair_IASA = 37
#const nair_xOffset = -1.56
#const nair_yOffset = -1.77
#const nair_xRange = 10.75
#const nair_yRange = 5.26
#const nair_hitFrame = 5
#const nair_lastHitFrame = 8
#const nair_damage_info = NAir|10|20|100|65

#const mv_nair_hit2 = 1
#const nair_hit2_xOffset = -3.75
#const nair_hit2_yOffset = -2.52
#const nair_hit2_xRange = 9.53
#const nair_hit2_yRange = 7.76
#const nair_hit2_hitFrame = 18
#const nair_hit2_lastHitFrame = 21
#const nair_hit2_damage_info = NAir|12|50|100|55

// FAir
#const fair_IASA = 34
#const fair_xOffset = -2.04
#const fair_yOffset = 5.77
#const fair_xRange = 11.88
#const fair_yRange = 15.03
#const fair_hitFrame = 14
#const fair_lastHitFrame = 19
#const fair_damage_info = FAir|17|60|80|361

// BAir
#const bair_IASA = 28
#const bair_xOffset = -21.67
#const bair_yOffset = 0.59
#const bair_xRange = 9.11
#const bair_yRange = 8.13
#const bair_hitFrame = 10
#const bair_lastHitFrame = 15
#const bair_damage_info = BAir|16|10|100|-361

// UAir
#const uair_IASA = 29
#const uair_xOffset = -6.57
#const uair_yOffset = -4.22
#const uair_xRange = 12.52
#const uair_yRange = 12.87
#const uair_hitFrame = 6
#const uair_lastHitFrame = 10
#const uair_damage_info = UAir|12|35|100|361

#const mv_uair_mid = 1
#const uair_mid_xOffset = -19.48
#const uair_mid_yOffset = -8.82
#const uair_mid_xRange = 11.29
#const uair_mid_yRange = 10.57
#const uair_mid_hitFrame = 11
#const uair_mid_lastHitFrame = 13
#const uair_mid_damage_info = UAir|10|30|80|30

#const mv_uair_tipman = 2
#const uair_tipman_xOffset = -19.57
#const uair_tipman_yOffset = 2.77
#const uair_tipman_xRange = 8.96
#const uair_tipman_yRange = 10.81
#const uair_tipman_hitFrame = 14
#const uair_tipman_lastHitFrame = 16
#const uair_tipman_damage_info = UAir|6|20|70|-360

// DAir
#const dair_IASA = 37
#const dair_xOffset = -6.84
#const dair_yOffset = 12.04
#const dair_xRange = 6.95
#const dair_yRange = 13.47
#const dair_hitFrame = 16
#const dair_lastHitFrame = 20
#const dair_damage_info = DAir|22|50|100|270