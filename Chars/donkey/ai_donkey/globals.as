#const DIRY_ABOVE = 13.5
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 8
#const DIRX_BACK = -6

#const cs_shortHopHeight = 14.44
#const cs_jumpHeight = 39.19
#const cs_djumpHeight = 30.18
#const cs_wavedashDist = 27
#const cs_recoveryDistX = 115
#const cs_recoveryDistY = -30

#const dashForceTurnFrame = 14
#const dashDanceMinFrames = 2

#const pt_jumpiness = 0.05
#const pt_djumpiness = 0.02
#const pt_bait_dashAwayChance = 0.85
#const pt_bait_wdashAwayChance = 0.15
#const pt_wall_chance = 0.8
#const pt_platChance = 0.1
#const pt_braveChance = 0.55
#const pt_circleCampChance = 0.2

#const recovery_moves = uspecial|sspecial

#const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1F1))
#const uspecial_recovery_info = common|60

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x12e) || Equal CurrAction hex(0x130)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115)

// jab123
#const jab123_IASA = 17
#const jab123_xOffset = -0.32
#const jab123_yOffset = -2.75
#const jab123_xRange = 11.24
#const jab123_yRange = 6.59
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 6
#const jab123_damage_info = Jab123|4|w20|100|65

#const mv_jab123_2 = 1
#const jab123_2_IASA = 28
#const jab123_2_xOffset = 1.78
#const jab123_2_yOffset = -2.33
#const jab123_2_xRange = 10.74
#const jab123_2_yRange = 13.49
#const jab123_2_hitFrame = 6
#const jab123_2_lastHitFrame = 11
#const jab123_2_damage_info = Jab123|6|40|100|75

// dashattack
#const dashattack_IASA = 38
#const dashattack_xOffset = 26.39
#const dashattack_yOffset = -0.4
#const dashattack_xRange = 17.96
#const dashattack_yRange = 7.68
#const dashattack_hitFrame = 9
#const dashattack_lastHitFrame = 13
#const dashattack_damage_info = DashAttack|10|60|73|70

#const mv_dashattack_late = 1
#const dashattack_late_xOffset = 53.55
#const dashattack_late_yOffset = 0
#const dashattack_late_xRange = 18.77
#const dashattack_late_yRange = 6.8
#const dashattack_late_hitFrame = 14
#const dashattack_late_lastHitFrame = 20
#const dashattack_late_damage_info = DashAttack|7|20|90|361

// ftilt
#const ftilt_IASA = 33
#const ftilt_xOffset = 3.06
#const ftilt_yOffset = -2.46
#const ftilt_xRange = 14.08
#const ftilt_yRange = 6.13
#const ftilt_hitFrame = 8
#const ftilt_lastHitFrame = 11
#const ftilt_damage_info = FTilt|11|10|100|361

// utilt
#const utilt_IASA = 35
#const utilt_xOffset = -25.19
#const utilt_yOffset = -0.38
#const utilt_xRange = 19.77
#const utilt_yRange = 16.79
#const utilt_hitFrame = 6
#const utilt_lastHitFrame = 11
#const utilt_damage_info = UTilt|10|40|110|100

// dtilt
#const dtilt_IASA = 22
#const dtilt_xOffset = 7.04
#const dtilt_yOffset = 1.03
#const dtilt_xRange = 10.89
#const dtilt_yRange = 5.6
#const dtilt_hitFrame = 6
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|9|25|95|40

// fsmash
#const fsmash_IASA = 56
#const fsmash_xOffset = 3.91
#const fsmash_yOffset = -0.78
#const fsmash_xRange = 12.89
#const fsmash_yRange = 5.47
#const fsmash_hitFrame = 24
#const fsmash_lastHitFrame = 25
#const fsmash_damage_info = FSmash|20|30|94|361

// usmash
#const usmash_IASA = 49
#const usmash_xOffset = -9.16
#const usmash_yOffset = -7.45
#const usmash_xRange = 8.55
#const usmash_yRange = 11.78
#const usmash_hitFrame = 16
#const usmash_lastHitFrame = 18
#const usmash_damage_info = USmash|18|40|98|90

// dsmash
#const dsmash_IASA = 56
#const dsmash_xOffset = -16.34
#const dsmash_yOffset = 3.25
#const dsmash_xRange = 19.43
#const dsmash_yRange = 13.63
#const dsmash_hitFrame = 12
#const dsmash_lastHitFrame = 15
#const dsmash_damage_info = DSmash|17|35|100|115

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
#const uspecial_IASA = 86
#const uspecial_xOffset = -11.69
#const uspecial_yOffset = -14.56
#const uspecial_xRange = 7.35
#const uspecial_yRange = 6.51
#const uspecial_hitFrame = 3
#const uspecial_lastHitFrame = 5
#const uspecial_damage_info = USpecial|12|60|100|361

#const mv_uspecial_spin = 1
#const uspecial_spin_xOffset = -18.74
#const uspecial_spin_yOffset = -0.59
#const uspecial_spin_xRange = 16.29
#const uspecial_spin_yRange = 11.07
#const uspecial_spin_hitFrame = 19
#const uspecial_spin_lastHitFrame = 58
#const uspecial_spin_damage_info = USpecial|5|50|70|45

// downB
#const dspecial_IASA = 63
#const dspecial_xOffset = -20.8
#const dspecial_yOffset = 7
#const dspecial_xRange = 27
#const dspecial_yRange = 9
#const dspecial_hitFrame = 21
#const dspecial_lastHitFrame = 33
#const dspecial_damage_info = dspecial|12|110|45|270

#const dspecialair_IASA = 33
#const dspecialair_xOffset = 5.5
#const dspecialair_yOffset = 12.25
#const dspecialair_xRange = 9.24
#const dspecialair_yRange = 9.99
#const dspecialair_hitFrame = 15
#const dspecialair_lastHitFrame = 18
#const dspecialair_damage_info = DSpecialAir|12|55|60|361

// sideB
#const sspecial_IASA = 54
#const sspecial_xOffset = 4
#const sspecial_yOffset = 0
#const sspecial_xRange = 11
#const sspecial_yRange = 10.5
#const sspecial_hitFrame = 20
#const sspecial_lastHitFrame = 21
#const sspecial_damage_info = SSpecial|10|20|55|300

#const sspecialair_IASA = 48
#const sspecialair_xOffset = 4.04
#const sspecialair_yOffset = 1.75
#const sspecialair_xRange = 10.86
#const sspecialair_yRange = 11.53
#const sspecialair_hitFrame = 20
#const sspecialair_lastHitFrame = 21
#const sspecialair_damage_info = SSpecialAir|14|36|55|300

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 31
#const grab_xOffset = 2.5
#const grab_yOffset = -1.6
#const grab_xRange = 8.5
#const grab_yRange = 4
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

// TODO: implement cargo throw
#const fthrow_IASA = 32
#const fthrow_throwFrame = 13
// #const fthrow_damage_info = Grab|7|90|30|90

#const dthrow_IASA = 61
#const dthrow_throwFrame = 40
#const dthrow_damage_info = Grab|7|60|45|361

#const bthrow_IASA = 41
#const bthrow_throwFrame = 13
#const bthrow_damage_info = Grab|11|60|78|45

#const uthrow_IASA = 45
#const uthrow_throwFrame = 12
#const uthrow_damage_info = Grab|9|70|50|90

// NAir
#const nair_IASA = 36
#const nair_xOffset = -13.06
#const nair_yOffset = -1.75
#const nair_xRange = 17.27
#const nair_yRange = 9.11
#const nair_hitFrame = 7
#const nair_lastHitFrame = 10
#const nair_damage_info = NAir|14|20|100|361

#const mv_nair_late = 1
#const nair_late_xOffset = -17.43
#const nair_late_yOffset = 1.75
#const nair_late_xRange = 19.23
#const nair_late_yRange = 14.15
#const nair_late_hitFrame = 11
#const nair_late_lastHitFrame = 24
#const nair_late_damage_info = NAir|10|10|100|50

// FAir
#const fair_IASA = 48
#const fair_xOffset = 1.6
#const fair_yOffset = -5.76
#const fair_xRange = 11.03
#const fair_yRange = 12.46
#const fair_hitFrame = 23
#const fair_lastHitFrame = 24
#const fair_damage_info = FAir|17|20|100|361

#const mv_fair_late = 1
#const fair_late_xOffset = -2.55
#const fair_late_yOffset = 7.84
#const fair_late_xRange = 13.1
#const fair_late_yRange = 14.48
#const fair_late_hitFrame = 25
#const fair_late_lastHitFrame = 27
#const fair_late_damage_info = FAir|17|50|73|290

// BAir
#const bair_IASA = 31
#const bair_xOffset = -23.86
#const bair_yOffset = -2.09
#const bair_xRange = 10.76
#const bair_yRange = 6.22
#const bair_hitFrame = 7
#const bair_lastHitFrame = 8
#const bair_damage_info = BAir|13|20|100|361

#const mv_bair_late = 1
#const bair_late_xOffset = -23.86
#const bair_late_yOffset = -2.09
#const bair_late_xRange = 10.76
#const bair_late_yRange = 6.22
#const bair_late_hitFrame = 7
#const bair_late_lastHitFrame = 20
#const bair_late_damage_info = BAir|9|10|100|361

// UAir
#const uair_IASA = 37
#const uair_xOffset = -13.94
#const uair_yOffset = -0.69
#const uair_xRange = 13.67
#const uair_yRange = 12.88
#const uair_hitFrame = 6
#const uair_lastHitFrame = 9
#const uair_damage_info = UAir|12|31|103|90

// DAir
#const dair_IASA = 42
#const dair_xOffset = -10.09
#const dair_yOffset = 10.96
#const dair_xRange = 10.33
#const dair_yRange = 12.62
#const dair_hitFrame = 18
#const dair_lastHitFrame = 23
#const dair_damage_info = DAir|16|38|90|270