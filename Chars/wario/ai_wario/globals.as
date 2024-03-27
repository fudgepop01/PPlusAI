#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 12.15
#const cs_jumpHeight = 29.02
#const cs_djumpHeight = 32
#const cs_wavedashDist = 24
#const cs_recoveryDistX = 50
#const cs_recoveryDistY = -50



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
#const jab123_IASA = 19
#const jab123_xOffset = 0
#const jab123_yOffset = -1
#const jab123_xRange = 6.5
#const jab123_yRange = 4
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 7
#const jab123_damage_info = Jab123|3|21|66|76

#const mv_jab123_2 = 1
#const jab123_2_IASA = 27
#const jab123_2_xOffset = 1.5
#const jab123_2_yOffset = -1.5
#const jab123_2_xRange = 5.88
#const jab123_2_yRange = 6
#const jab123_2_hitFrame = 4
#const jab123_2_lastHitFrame = 6
#const jab123_2_damage_info = Jab123|6|60|45|83

// dashattack
#const dashattack_IASA = 43
#const dashattack_xOffset = -1
#const dashattack_yOffset = 2.5
#const dashattack_xRange = 5.75
#const dashattack_yRange = 4.5
#const dashattack_hitFrame = 4
#const dashattack_lastHitFrame = 7
#const dashattack_damage_info = DashAttack|7|60|75|75

#const mv_dashattack_weak = 1
#const dashattack_weak_xOffset = -1
#const dashattack_weak_yOffset = 2.5
#const dashattack_weak_xRange = 5.75
#const dashattack_weak_yRange = 4.5
#const dashattack_weak_hitFrame = 4
#const dashattack_weak_lastHitFrame = 23
#const dashattack_weak_damage_info = DashAttack|5|60|52|120

// ftilt
#const ftilt_IASA = 35
#const ftilt_xOffset = 11.780
#const ftilt_yOffset = -4.673
#const ftilt_xRange = 6.658
#const ftilt_yRange = 3.731
#const ftilt_hitFrame = 13
#const ftilt_lastHitFrame = 16
#const ftilt_damage_info = FTilt|14|35|107|38

#const mv_ftilt_2 = 1
#const ftilt_IASA = 35
#const ftilt_xOffset = 11.780
#const ftilt_yOffset = -4.673
#const ftilt_xRange = 6.658
#const ftilt_yRange = 3.731
#const ftilt_hitFrame = 22
#const ftilt_lastHitFrame = 25
#const ftilt_damage_info = FTilt|14|40|107|38

#const mv_ftilt_3 = 2
#const ftilt_IASA = 35
#const ftilt_xOffset = 11.780
#const ftilt_yOffset = -4.673
#const ftilt_xRange = 6.658
#const ftilt_yRange = 3.731
#const ftilt_hitFrame = 31
#const ftilt_lastHitFrame = 34
#const ftilt_damage_info = FTilt|16|45|107|38

// utilt
#const utilt_IASA = 38
#const utilt_xOffset = -12.5
#const utilt_yOffset = -1
#const utilt_xRange = 12.5
#const utilt_yRange = 9.5
#const utilt_hitFrame = 12
#const utilt_lastHitFrame = 14
#const utilt_damage_info = UTilt|10|65|89|90

#const mv_utilt_weak = 1
#const utilt_weak_xOffset = -12.5
#const utilt_weak_yOffset = -1
#const utilt_weak_xRange = 12.5
#const utilt_weak_yRange = 9.5
#const utilt_weak_hitFrame = 12
#const utilt_weak_lastHitFrame = 27
#const utilt_weak_damage_info = UTilt|6|45|50|90

// dtilt
#const dtilt_IASA = 25
#const dtilt_xOffset = 7.97
#const dtilt_yOffset = 1.96
#const dtilt_xRange = 8.31
#const dtilt_yRange = 5.08
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 8
#const dtilt_damage_info = DTilt|8|50|45|65

// fsmash
#const fsmash_IASA = 49
#const fsmash_xOffset = 4.46
#const fsmash_yOffset = -3.02
#const fsmash_xRange = 10.83
#const fsmash_yRange = 7.03
#const fsmash_hitFrame = 9
#const fsmash_lastHitFrame = 16
#const fsmash_damage_info = FSmash|16|30|80|30

// usmash
#const usmash_IASA = 49
#const usmash_xOffset = -9
#const usmash_yOffset = 0
#const usmash_xRange = 8.75
#const usmash_yRange = 11.25
#const usmash_hitFrame = 12
#const usmash_lastHitFrame = 22
#const usmash_damage_info = USmash|8|50|120|90

// dsmash
#const dsmash_IASA = 45
#const dsmash_xOffset = -24
#const dsmash_yOffset = 8
#const dsmash_xRange = 24
#const dsmash_yRange = 10
#const dsmash_hitFrame = 11
#const dsmash_lastHitFrame = 13
#const dsmash_damage_info = DSmash|12|w25|90|275

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
#const uspecial_IASA = 108
#const uspecial_xOffset = -8
#const uspecial_yOffset = 1.5
#const uspecial_xRange = 9
#const uspecial_yRange = 9.25
#const uspecial_hitFrame = 1
#const uspecial_lastHitFrame = 24
#const uspecial_damage_info = USpecial|4|60|130|80

#const uspecialair_IASA = 108
#const uspecialair_xOffset = -8
#const uspecialair_yOffset = 1.5
#const uspecialair_xRange = 9
#const uspecialair_yRange = 9.25
#const uspecialair_hitFrame = 1
#const uspecialair_lastHitFrame = 24
#const uspecialair_damage_info = USpecialAir|4|60|130|80

// downB
// TODONOT - absolutely do not

// sideB
#const sspecial_IASA = 59
#const sspecial_xOffset = 37.3
#const sspecial_yOffset = 1.06
#const sspecial_xRange = 20.17
#const sspecial_yRange = 5.44
#const sspecial_hitFrame = 27
#const sspecial_lastHitFrame = 41
#const sspecial_damage_info = SSpecial|18|50|80|361

#const mv_sspecial_mid = 1
#const sspecial_mid_xOffset = 3.87
#const sspecial_mid_yOffset = 1.06
#const sspecial_mid_xRange = 36.88
#const sspecial_mid_yRange = 5.44
#const sspecial_mid_hitFrame = 9
#const sspecial_mid_lastHitFrame = 41
#const sspecial_mid_damage_info = SSpecial|15|50|90|361

// #const mv_sspecial_jump = 2
// #const sspecial_jump_IASA = 51
// #const sspecial_jump_xOffset = -2.85
// #const sspecial_jump_yOffset = -4.54
// #const sspecial_jump_xRange = 40.49
// #const sspecial_jump_yRange = 55.79
// #const sspecial_jump_hitFrame = 1
// #const sspecial_jump_lastHitFrame = 42
// #const sspecial_jump_damage_info = SSpecial|15|20|100|361

#const sspecialair_IASA = 36
#const sspecialair_xOffset = 4.9
#const sspecialair_yOffset = -1.48
#const sspecialair_xRange = 17.15
#const sspecialair_yRange = 7.11
#const sspecialair_hitFrame = 11
#const sspecialair_lastHitFrame = 25
#const sspecialair_damage_info = SSpecialAir|15|20|100|361

// grab
#const grab_IASA = 32
#const grab_xOffset = 1
#const grab_yOffset = -2.5
#const grab_xRange = 7.25
#const grab_yRange = 4.5
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 27
#const fthrow_throwFrame = 12
#const fthrow_damage_info = Grab|3|60|100|40

#const dthrow_IASA = 39
#const dthrow_throwFrame = 20
#const dthrow_damage_info = Grab|4|55|65|50

#const bthrow_IASA = 78
#const bthrow_throwFrame = 54
#const bthrow_damage_info = Grab|9|60|65|45

#const uthrow_IASA = 46
#const uthrow_throwFrame = 24
#const uthrow_damage_info = Grab|6|60|72|90

// NAir
#const nair_IASA = 39
#const nair_xOffset = -11.1
#const nair_yOffset = 1.16
#const nair_xRange = 11.73
#const nair_yRange = 5.81
#const nair_hitFrame = 4
#const nair_lastHitFrame = 12
#const nair_damage_info = NAir|9|30|100|361

#const mv_nair_fall = 1
#const nair_fall_xOffset = -11.1
#const nair_fall_yOffset = 2.5
#const nair_fall_xRange = 11.73
#const nair_fall_yRange = 7
#const nair_fall_hitFrame = 4
#const nair_fall_lastHitFrame = 30
#const nair_fall_damage_info = NAir|6|20|100|45


// FAir
#const fair_IASA = 26
#const fair_xOffset = 1.75
#const fair_yOffset = 0
#const fair_xRange = 5.38
#const fair_yRange = 4.7
#const fair_hitFrame = 5
#const fair_lastHitFrame = 7
#const fair_damage_info = FAir|11|20|80|55

#const mv_fair_fall = 1
#const fair_fall_xOffset = 1.75
#const fair_fall_yOffset = 0
#const fair_fall_xRange = 5.38
#const fair_fall_yRange = 4.7
#const fair_fall_hitFrame = 5
#const fair_fall_lastHitFrame = 15
#const fair_fall_damage_info = FAir|6|20|80|55

// BAir
#const bair_IASA = 42
#const bair_xOffset = -16.65
#const bair_yOffset = -2.81
#const bair_xRange = 8.35
#const bair_yRange = 4.23
#const bair_hitFrame = 10
#const bair_lastHitFrame = 14
#const bair_damage_info = BAir|16|20|90|361

#const mv_bair_fall = 1
#const bair_fall_xOffset = -16.65
#const bair_fall_yOffset = -2.81
#const bair_fall_xRange = 8.35
#const bair_fall_yRange = 4.23
#const bair_fall_hitFrame = 10
#const bair_fall_lastHitFrame = 19
#const bair_fall_damage_info = BAir|9|20|105|361

// UAir
#const uair_IASA = 30
#const uair_xOffset = -14.88
#const uair_yOffset = -2.44
#const uair_xRange = 13.58
#const uair_yRange = 8.66
#const uair_hitFrame = 7
#const uair_lastHitFrame = 9
#const uair_damage_info = UAir|14|45|100|80

// DAir
#const dair_IASA = 55
#const dair_xOffset = -6.2
#const dair_yOffset = 53.95
#const dair_xRange = 5.7
#const dair_yRange = 29.5
#const dair_hitFrame = 15
#const dair_lastHitFrame = 29
#const dair_damage_info = DAir|10|59|106|270
