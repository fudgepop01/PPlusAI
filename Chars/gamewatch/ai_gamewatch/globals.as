#const DIRY_ABOVE = 13.5
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -2

#const cs_shortHopHeight = 11.76
#const cs_jumpHeight = 30.18
#const cs_djumpHeight = 27.84
#const cs_wavedashDist = 35

#const dashForceTurnFrame = 10
#const dashDanceMinFrames = 2
#const cs_recoveryDistX = 95
#const cs_recoveryDistY = -75

#const pt_jumpiness = 0.05
#const pt_djumpiness = 0.02
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.55
#const pt_bait_wdashAwayChance = 0.08
#const pt_wall_chance = 0.65
#const pt_platChance = 0.1
#const pt_baitChance = 0.9
#const pt_braveChance = 0.7
#const pt_circleCampChance = 0.2

// #const recovery_moves = uspecial

// #const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1F1))
// #const uspecial_recovery_info = common|60

// #const SFALL_ACTIONS = Equal CurrAction hex(0x10)
// #const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112)
// #const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113)
// #const USPECIAL_ACTIONS = Equal CurrAction hex(0x114)
// #const DSPECIAL_ACTIONS = Equal CurrAction hex(0x119) || Equal CurrAction hex(0x11c)

// jab123
#const jab123_IASA = 15
#const jab123_xOffset = 2
#const jab123_yOffset = -0.87
#const jab123_xRange = 7.29
#const jab123_yRange = 4.69
#const jab123_hitFrame = 4
#const jab123_lastHitFrame = 6
#const jab123_damage_info = Jab123|3|w20|100|83

// dashattack
#const dashattack_IASA = 34
#const dashattack_xOffset = 6.15
#const dashattack_yOffset = 3.09
#const dashattack_xRange = 11.81
#const dashattack_yRange = 5.08
#const dashattack_hitFrame = 3
#const dashattack_lastHitFrame = 28
#const dashattack_damage_info = DashAttack|10|60|50|50

#const mv_dashattack_late = 1
#const dashattack_late_xOffset = 6.15
#const dashattack_late_yOffset = 3.09
#const dashattack_late_xRange = 11.81
#const dashattack_late_yRange = 5.08
#const dashattack_late_hitFrame = 7
#const dashattack_late_lastHitFrame = 28
#const dashattack_late_damage_info = DashAttack|9|60|50|120

// ftilt
#const ftilt_IASA = 39
#const ftilt_xOffset = 0.79
#const ftilt_yOffset = 0.01
#const ftilt_xRange = 9.43
#const ftilt_yRange = 5.5
#const ftilt_hitFrame = 10
#const ftilt_lastHitFrame = 13
#const ftilt_damage_info = FTilt|13|10|100|361

#const mv_ftilt_late = 1
#const ftilt_late_xOffset = 0.79
#const ftilt_late_yOffset = 0.01
#const ftilt_late_xRange = 9.43
#const ftilt_late_yRange = 5.5
#const ftilt_late_hitFrame = 10
#const ftilt_late_lastHitFrame = 28
#const ftilt_late_damage_info = FTilt|8|10|100|65

// utilt
#const utilt_IASA = 31
#const utilt_xOffset = -11.09
#const utilt_yOffset = -5.5
#const utilt_xRange = 10.92
#const utilt_yRange = 8.07
#const utilt_hitFrame = 7
#const utilt_lastHitFrame = 24
#const utilt_damage_info = UTilt|12|30|110|100

// dtilt
#const dtilt_IASA = 25
#const dtilt_xOffset = 8.99
#const dtilt_yOffset = 2.29
#const dtilt_xRange = 6.25
#const dtilt_yRange = 4.61
#const dtilt_hitFrame = 6
#const dtilt_lastHitFrame = 13
#const dtilt_damage_info = DTilt|10|80|60|361

// fsmash
#const fsmash_IASA = 41
#const fsmash_xOffset = 3.59
#const fsmash_yOffset = -2.48
#const fsmash_xRange = 8.52
#const fsmash_yRange = 4.69
#const fsmash_hitFrame = 14
#const fsmash_lastHitFrame = 15
#const fsmash_damage_info = FSmash|16|35|108|361

#const mv_fsmash_late = 1
#const fsmash_late_xOffset = 3.59
#const fsmash_late_yOffset = -2.48
#const fsmash_late_xRange = 8.52
#const fsmash_late_yRange = 4.69
#const fsmash_late_hitFrame = 16
#const fsmash_late_lastHitFrame = 28
#const fsmash_late_damage_info = FSmash|10|40|100|55

// usmash
#const usmash_IASA = 52
#const usmash_xOffset = -11.34
#const usmash_yOffset = -3.07
#const usmash_xRange = 11.57
#const usmash_yRange = 5.91
#const usmash_hitFrame = 25
#const usmash_lastHitFrame = 27
#const usmash_damage_info = USmash|20|40|95|83

// dsmash
#const dsmash_IASA = 28
#const dsmash_xOffset = -16.23
#const dsmash_yOffset = 1.88
#const dsmash_xRange = 16.23
#const dsmash_yRange = 5.47
#const dsmash_hitFrame = 8
#const dsmash_lastHitFrame = 12
#const dsmash_damage_info = DSmash|17|52|132|280

// noochB
#const nspecialair_IASA = 8
#const nspecialair_xOffset = 3.280
#const nspecialair_yOffset = 0.830
#const nspecialair_xRange = 50
#const nspecialair_yRange = 22
#const nspecialair_hitFrame = 8
#const nspecialair_lastHitFrame = 50
#const nspecialair_damage_info = NSpecialAir|-5|20|50|70

// upB
#const uspecial_IASA = 29
#const uspecial_xOffset = -4.69
#const uspecial_yOffset = 1.5
#const uspecial_xRange = 7.39
#const uspecial_yRange = 32.58
#const uspecial_hitFrame = 3
#const uspecial_lastHitFrame = 20
#const uspecial_damage_info = USpecial|6|60|80|80

// TODO: implement bucket absorb
// downB
#const dspecial_IASA = 63
#const dspecial_xOffset = -20.8
#const dspecial_yOffset = 7
#const dspecial_xRange = 27
#const dspecial_yRange = 9
#const dspecial_hitFrame = 21
#const dspecial_lastHitFrame = 33
// #const dspecial_damage_info = dspecial|12|110|45|270

// TODO: implement RNGesus reader
// sideB
#const sspecial_IASA = 51
#const sspecial_xOffset = 3.86
#const sspecial_yOffset = -5.07
#const sspecial_xRange = 4.76
#const sspecial_yRange = 4.86
#const sspecial_hitFrame = 16
#const sspecial_lastHitFrame = 29
// #const sspecial_damage_info = SSpecial|0|0|0|0

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = -0.14
#const grab_yOffset = -1.49
#const grab_xRange = 6.6
#const grab_yRange = 5.08
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 59
#const fthrow_throwFrame = 45
#const fthrow_damage_info = Grab|8|100|40|68

#const dthrow_IASA = 54
#const dthrow_throwFrame = 45
#const dthrow_damage_info = Grab|10|90|0|270

#const bthrow_IASA = 59
#const bthrow_throwFrame = 45
#const bthrow_damage_info = Grab|8|100|40|68

#const uthrow_IASA = 59
#const uthrow_throwFrame = 45
#const uthrow_damage_info = Grab|8|65|80|88

// NAir
#const nair_IASA = 43
#const nair_xOffset = -11.72
#const nair_yOffset = -0.63
#const nair_xRange = 11.72
#const nair_yRange = 11.72
#const nair_hitFrame = 20
#const nair_lastHitFrame = 29
#const nair_damage_info = NAir|15|20|104|361

// FAir
#const fair_IASA = 46
#const fair_xOffset = -13
#const fair_yOffset = -2.06
#const fair_xRange = 7.47
#const fair_yRange = 7.85
#const fair_hitFrame = 9
#const fair_lastHitFrame = 9
#const fair_damage_info = FAir|16|10|100|50

#const mv_fair_mid = 1
#const fair_mid_xOffset = -13
#const fair_mid_yOffset = 1.87
#const fair_mid_xRange = 16
#const fair_mid_yRange = 9.81
#const fair_mid_hitFrame = 10
#const fair_mid_lastHitFrame = 12
#const fair_mid_damage_info = FAir|16|10|100|361

#const mv_fair_late = 2
#const fair_late_xOffset = 1.69
#const fair_late_yOffset = 1.87
#const fair_late_xRange = 8.66
#const fair_late_yRange = 6.25
#const fair_late_hitFrame = 13
#const fair_late_lastHitFrame = 32
#const fair_late_damage_info = FAir|7|10|90|361

// BAir
#const bair_IASA = 41
#const bair_xOffset = -19.85
#const bair_yOffset = 2.3
#const bair_xRange = 8.29
#const bair_yRange = 4.69
#const bair_hitFrame = 10
#const bair_lastHitFrame = 21
#const bair_damage_info = BAir|3|48|72|-68

#const mv_bair_late = 1
#const bair_late_xOffset = -19.85
#const bair_late_yOffset = 2.3
#const bair_late_xRange = 8.29
#const bair_late_yRange = 4.69
#const bair_late_hitFrame = 22
#const bair_late_lastHitFrame = 22
#const bair_late_damage_info = BAir|4|60|60|-68

// UAir
#const uair_IASA = 17
#const uair_xOffset = -4.68
#const uair_yOffset = -8.43
#const uair_xRange = 5.08
#const uair_yRange = 6.3
#const uair_hitFrame = 3
#const uair_lastHitFrame = 8
#const uair_damage_info = UAir|9|45|95|80

// DAir
#const dair_IASA = 41
#const dair_xOffset = -4.28
#const dair_yOffset = 9.46
#const dair_xRange = 5.08
#const dair_yRange = 6.49
#const dair_hitFrame = 12
#const dair_lastHitFrame = 12
#const dair_damage_info = DAir|15|20|100|270

#const mv_dair_mid = 1
#const dair_mid_xOffset = -4.28
#const dair_mid_yOffset = 9.46
#const dair_mid_xRange = 5.08
#const dair_mid_yRange = 6.49
#const dair_mid_hitFrame = 13
#const dair_mid_lastHitFrame = 27
#const dair_mid_damage_info = DAir|14|20|100|60

#const mv_dair_late = 2
#const dair_late_xOffset = -4.28
#const dair_late_yOffset = 9.46
#const dair_late_xRange = 5.08
#const dair_late_yRange = 6.49
#const dair_late_hitFrame = 28
#const dair_late_lastHitFrame = 38
#const dair_late_damage_info = DAir|8|20|100|60