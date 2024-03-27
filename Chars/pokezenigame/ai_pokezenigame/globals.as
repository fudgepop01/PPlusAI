#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 15.87
#const cs_jumpHeight = 31.11
#const cs_djumpHeight = 37.64
#const cs_wavedashDist = 80



#const cs_dashForceTurnFrame = 9
#const cs_dashDanceMinFrames = 3
#const cs_recoveryDistX = 60
#const cs_recoveryDistY = -60

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
#const jab123_IASA = 15
#const jab123_xOffset = 3.06
#const jab123_yOffset = -0.32
#const jab123_xRange = 5.33
#const jab123_yRange = 3.44
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 3
#const jab123_damage_info = Jab123|3|w20|100|70

#const mv_jab123_2 = 1
#const jab123_2_IASA = 24
#const jab123_2_xOffset = 1.19
#const jab123_2_yOffset = -2.7
#const jab123_2_xRange = 8.42
#const jab123_2_yRange = 3.88
#const jab123_2_hitFrame = 4
#const jab123_2_lastHitFrame = 8
#const jab123_2_damage_info = Jab123|2|w20|100|65

#const mv_jab123_3 = 2
#const jab123_3_IASA = 25
#const jab123_3_xOffset = 1.72
#const jab123_3_yOffset = 1.62
#const jab123_3_xRange = 9.57
#const jab123_3_yRange = 13.47
#const jab123_3_hitFrame = 4
#const jab123_3_lastHitFrame = 6
#const jab123_3_damage_info = Jab123|6|40|80|361

// dashattack
#const dashattack_IASA = 41
#const dashattack_xOffset = 2.66
#const dashattack_yOffset = -0.78
#const dashattack_xRange = 8.08
#const dashattack_yRange = 5.49
#const dashattack_hitFrame = 5
#const dashattack_lastHitFrame = 8
#const dashattack_damage_info = DashAttack|9|40|100|361

#const mv_dashattack_weak = 1
#const dashattack_weak_xOffset = 2.66
#const dashattack_weak_yOffset = -0.78
#const dashattack_weak_xRange = 17.13
#const dashattack_weak_yRange = 5.87
#const dashattack_weak_hitFrame = 5
#const dashattack_weak_lastHitFrame = 22
#const dashattack_weak_damage_info = DashAttack|7|25|100|60

// ftilt
#const ftilt_IASA = 19
#const ftilt_xOffset = -1.64
#const ftilt_yOffset = -0.67
#const ftilt_xRange = 10.23
#const ftilt_yRange = 4.14
#const ftilt_hitFrame = 4
#const ftilt_lastHitFrame = 6
#const ftilt_damage_info = FTilt|8|10|120|361

// utilt
#const utilt_IASA = 17
#const utilt_xOffset = -6.37
#const utilt_yOffset = -5.22
#const utilt_xRange = 7.24
#const utilt_yRange = 9.88
#const utilt_hitFrame = 5
#const utilt_lastHitFrame = 8
#const utilt_damage_info = UTilt|6|25|100|86

// dtilt
#const dtilt_IASA = 21
#const dtilt_xOffset = 0.02
#const dtilt_yOffset = 1.05
#const dtilt_xRange = 8.11
#const dtilt_yRange = 3.73
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 12
#const dtilt_damage_info = DTilt|7|43|112|75

// fsmash
#const fsmash_IASA = 49
#const fsmash_xOffset = -0.39
#const fsmash_yOffset = -1.3
#const fsmash_xRange = 12.5
#const fsmash_yRange = 6.03
#const fsmash_hitFrame = 13
#const fsmash_lastHitFrame = 16
#const fsmash_damage_info = FSmash|16|25|104|361

// usmash
#const usmash_IASA = 64
#const usmash_xOffset = -13.14
#const usmash_yOffset = 1.06
#const usmash_xRange = 13.14
#const usmash_yRange = 21.36
#const usmash_hitFrame = 15
#const usmash_lastHitFrame = 19
#const usmash_damage_info = USmash|14|75|95|95

// dsmash
#const dsmash_IASA = 52
#const dsmash_xOffset = -16.7
#const dsmash_yOffset = 0.5
#const dsmash_xRange = 16.9
#const dsmash_yRange = 4.33
#const dsmash_hitFrame = 17
#const dsmash_lastHitFrame = 36
#const dsmash_damage_info = DSmash|6|55|125|110

// noochB
#const nspecialair_IASA = 34
#const nspecialair_xOffset = 6.626
#const nspecialair_yOffset = 2.948
#const nspecialair_xRange = 35.254
#const nspecialair_yRange = 9.997
#const nspecialair_hitFrame = 18
#const nspecialair_lastHitFrame = 26
#const nspecialair_damage_info = NSpecialair|-2|0|100|20

// upB
#const uspecial_IASA = 52
#const uspecial_xOffset = 23.1
#const uspecial_yOffset = -54.27
#const uspecial_xRange = 10.85
#const uspecial_yRange = 11.64
#const uspecial_hitFrame = 30
#const uspecial_lastHitFrame = 32
#const uspecial_damage_info = USpecial|9|60|103|83

#const uspecialair_IASA = 117
#const uspecialair_xOffset = 23.26
#const uspecialair_yOffset = -57.15
#const uspecialair_xRange = 10.82
#const uspecialair_yRange = 11.64
#const uspecialair_hitFrame = 35
#const uspecialair_lastHitFrame = 37
#const uspecialair_damage_info = USpecialAir|9|60|103|83

// downB
// TODO - bubble
#const dspecial_IASA = 37
#const dspecial_xOffset = 4.16
#const dspecial_yOffset = -0.33
#const dspecial_xRange = 15.51
#const dspecial_yRange = 4.43
#const dspecial_hitFrame = 11
#const dspecial_lastHitFrame = 25
#const dspecial_damage_info = DSpecial|3|w80|100|360

#const dspecialair_IASA = 51
#const dspecialair_xOffset = 3.49
#const dspecialair_yOffset = 3.37
#const dspecialair_xRange = 10.35
#const dspecialair_yRange = 10.34
#const dspecialair_hitFrame = 11
#const dspecialair_lastHitFrame = 22
#const dspecialair_damage_info = DSpecialAir|3|20|100|35

// sideB
#const sspecial_IASA = 44
#const sspecial_xOffset = -2.73
#const sspecial_yOffset = -0.59
#const sspecial_xRange = 2.72
#const sspecial_yRange = 2.75
#const sspecial_hitFrame = 5
#const sspecial_lastHitFrame = 7
#const sspecial_damage_info = SSpecial|15|40|110|80

#const sspecialair_IASA = 44
#const sspecialair_xOffset = -2.73
#const sspecialair_yOffset = -0.59
#const sspecialair_xRange = 2.72
#const sspecialair_yRange = 2.75
#const sspecialair_hitFrame = 5
#const sspecialair_lastHitFrame = 7
#const sspecialair_damage_info = SSpecialAir|15|40|110|80

// grab
#const grab_IASA = 32
#const grab_xOffset = 2.61
#const grab_yOffset = -2.6
#const grab_xRange = 5.65
#const grab_yRange = 3.7
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 31
#const fthrow_throwFrame = 13
#const fthrow_damage_info = Grab|4|76|42|55

#const dthrow_IASA = 50
#const dthrow_throwFrame = 18
#const dthrow_damage_info = Grab|12|60|100|55

#const bthrow_IASA = 43
#const bthrow_throwFrame = 15
#const bthrow_damage_info = Grab|5|60|100|-45

#const uthrow_IASA = 58
#const uthrow_throwFrame = 12
#const uthrow_damage_info = Grab|5|64|80|75

// NAir
#const nair_IASA = 31
#const nair_xOffset = -6.91
#const nair_yOffset = 3.18
#const nair_xRange = 6.49
#const nair_yRange = 6.86
#const nair_hitFrame = 5
#const nair_lastHitFrame = 19
#const nair_damage_info = NAir|11|0|100|30

// FAir
#const fair_IASA = 33
#const fair_xOffset = -0.78
#const fair_yOffset = -0.3
#const fair_xRange = 5.91
#const fair_yRange = 4.96
#const fair_hitFrame = 5
#const fair_lastHitFrame = 6
#const fair_damage_info = FAir|13|35|100|361

#const mv_fair_weak = 1
#const fair_weak_xOffset = -0.78
#const fair_weak_yOffset = -0.3
#const fair_weak_xRange = 5.91
#const fair_weak_yRange = 4.96
#const fair_weak_hitFrame = 5
#const fair_weak_lastHitFrame = 11
#const fair_weak_damage_info = FAir|7|35|100|361

// BAir
#const bair_IASA = 38
#const bair_xOffset = -13.75
#const bair_yOffset = 1.17
#const bair_xRange = 7.23
#const bair_yRange = 4.94
#const bair_hitFrame = 5
#const bair_lastHitFrame = 8
#const bair_damage_info = BAir|12|16|100|361

#const mv_bair_weak = 1
#const bair_weak_xOffset = -13.75
#const bair_weak_yOffset = 1.17
#const bair_weak_xRange = 7.23
#const bair_weak_yRange = 4.94
#const bair_weak_hitFrame = 5
#const bair_weak_lastHitFrame = 22
#const bair_weak_damage_info = BAir|8|16|100|361

// UAir
#const uair_IASA = 24
#const uair_xOffset = -8.01
#const uair_yOffset = -3.6
#const uair_xRange = 9.75
#const uair_yRange = 8.39
#const uair_hitFrame = 5
#const uair_lastHitFrame = 8
#const uair_damage_info = UAir|11|40|100|77

#const mv_uair_weak = 1
#const uair_weak_xOffset = -9.88
#const uair_weak_yOffset = -3.6
#const uair_weak_xRange = 10.68
#const uair_weak_yRange = 8.39
#const uair_weak_hitFrame = 5
#const uair_weak_lastHitFrame = 12
#const uair_weak_damage_info = UAir|6|50|60|90

// DAir
#const dair_IASA = 38
#const dair_xOffset = -4.48
#const dair_yOffset = 6.47
#const dair_xRange = 6.29
#const dair_yRange = 7.4
#const dair_hitFrame = 25
#const dair_lastHitFrame = 27
#const dair_damage_info = DAir|5|45|100|67