#const DIRY_ABOVE = 8.1
#const DIRY_BELOW_AIR = 0
#const DIRY_BELOW_GROUND = 0
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const pt_jumpiness = 0.05
#const pt_djumpiness = 0.03
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.30
#const pt_bait_wdashAwayChance = 0.65
#const pt_wall_chance = 0.45
#const pt_platChance = 0.23
#const pt_baitChance = 0.9
#const pt_braveChance = 0.65
#const pt_circleCampChance = 0.5

#const cs_dashForceTurnFrame = 8
#const cs_dashDanceMinFrames = 3

#const cs_shortHopHeight = 15.63
#const cs_jumpHeight = 44.17
#const cs_djumpHeight = 33.8
#const cs_wavedashDist = 80
#const cs_recoveryDistX = 40
#const cs_recoveryDistY = -40

#const recovery_moves = uspecial

#const uspecial_subaction_check = !(True)
#const uspecial_recovery_info = common|0

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118) || Equal CurrAction hex(0x119)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115)

#const sv_execute_hardfall = -100
#const sv_execute_rising = -101

// jab123
#const jab123_IASA = 15
#const jab123_xOffset = 1.96
#const jab123_yOffset = -1.87
#const jab123_xRange = 7.35
#const jab123_yRange = 4.5
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 4
#const jab123_damage_info = Jab123|3|w20|100|65

#const mv_jab1232 = 1
#const jab1232_IASA = 18
#const jab1232_xOffset = 3.35
#const jab1232_yOffset = -3.17
#const jab1232_xRange = 7.54
#const jab1232_yRange = 3.52
#const jab1232_hitFrame = 3
#const jab1232_lastHitFrame = 4
#const jab1232_damage_info = Jab123|2|w20|100|83

#const mv_jab1233 = 2
#const jab1233_IASA = 22
#const jab1233_xOffset = 7.63
#const jab1233_yOffset = -3.12
#const jab1233_xRange = 7.46
#const jab1233_yRange = 4.69
#const jab1233_hitFrame = 5
#const jab1233_lastHitFrame = 6
#const jab1233_damage_info = Jab123|5|10|100|361

// dashattack
#const dashattack_IASA = 70
#const dashattack_xOffset = 1.43
#const dashattack_yOffset = -2.18
#const dashattack_xRange = 27.3
#const dashattack_yRange = 5.75
#const dashattack_hitFrame = 4
#const dashattack_lastHitFrame = 50
#const dashattack_damage_info = DashAttack|3|48|96|361

// ftilt
#const ftilt_IASA = 31
#const ftilt_xOffset = 5.14
#const ftilt_yOffset = -2.64
#const ftilt_xRange = 9.51
#const ftilt_yRange = 4.49
#const ftilt_hitFrame = 4
#const ftilt_lastHitFrame = 8
#const ftilt_damage_info = FTilt|11|2|100|361

// utilt
#const utilt_IASA = 29
#const utilt_xOffset = -10.61
#const utilt_yOffset = 1.29
#const utilt_xRange = 11.62
#const utilt_yRange = 11.68
#const utilt_hitFrame = 4
#const utilt_lastHitFrame = 12
#const utilt_damage_info = UTilt|9|30|125|100

// dtilt
#const dtilt_IASA = 30
#const dtilt_xOffset = 1.7
#const dtilt_yOffset = 1.33
#const dtilt_xRange = 6.29
#const dtilt_yRange = 3.99
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 8
#const dtilt_damage_info = DTilt|15|w1|100|45

// fsmash
#const fsmash_IASA = 42
#const fsmash_xOffset = 3.72
#const fsmash_yOffset = -3.56
#const fsmash_xRange = 8.61
#const fsmash_yRange = 3.52
#const fsmash_hitFrame = 13
#const fsmash_lastHitFrame = 14
#const fsmash_damage_info = FSmash|13|20|135|55

// usmash
#const usmash_IASA = 42
#const usmash_xOffset = -16.63
#const usmash_yOffset = -5.98
#const usmash_xRange = 15.35
#const usmash_yRange = 9.04
#const usmash_hitFrame = 10
#const usmash_lastHitFrame = 14
#const usmash_damage_info = USmash|17|35|98|110

// dsmash
#const dsmash_IASA = 38
#const dsmash_xOffset = 5.17
#const dsmash_yOffset = -0.48
#const dsmash_xRange = 6.7
#const dsmash_yRange = 3.91
#const dsmash_hitFrame = 6
#const dsmash_lastHitFrame = 7
#const dsmash_damage_info = DSmash|17|40|80|90

#const mv_dsmashHit2 = 1
#const dsmashHit2_xOffset = -17.09
#const dsmashHit2_yOffset = -0.48
#const dsmashHit2_xRange = 6.45
#const dsmashHit2_yRange = 3.91
#const dsmashHit2_hitFrame = 15
#const dsmashHit2_lastHitFrame = 16
#const dsmashHit2_damage_info = DSmash|17|40|80|90

// noochB
#const nspecialair_IASA = 40
#const nspecialair_xOffset = 0
#const nspecialair_yOffset = 0
#const nspecialair_xRange = 60
#const nspecialair_yRange = 8
#const nspecialair_hitFrame = 25
#const nspecialair_lastHitFrame = 45
#const nspecialair_damage_info = NSpecialAir|0|0|0|0

// upB
#const uspecial_IASA = 120
#const uspecial_xOffset = 2.9
#const uspecial_yOffset = -4.79
#const uspecial_xRange = 1.96
#const uspecial_yRange = 2
#const uspecial_hitFrame = 5
#const uspecial_lastHitFrame = 6
#const uspecial_damage_info = USpecial|25|70|73|90

#const mv_uspecialLate = 1
#const uspecialLate_xOffset = -1.29
#const uspecialLate_yOffset = 2.81
#const uspecialLate_xRange = 7.46
#const uspecialLate_yRange = 32.75
#const uspecialLate_hitFrame = 7
#const uspecialLate_lastHitFrame = 22
#const uspecialLate_damage_info = USpecial|1|1|1|80

#const uspecialair_IASA = 200
#const uspecialair_xOffset = 2.9
#const uspecialair_yOffset = -4.79
#const uspecialair_xRange = 1.96
#const uspecialair_yRange = 2
#const uspecialair_hitFrame = 5
#const uspecialair_lastHitFrame = 6
#const uspecialair_damage_info = USpecialAir|25|70|73|90

// downB
#const dspecial_IASA = 82
#const dspecial_xOffset = -109.58
#const dspecial_yOffset = -2.57
#const dspecial_xRange = 59.56
#const dspecial_yRange = 16.42
#const dspecial_hitFrame = 6
#const dspecial_lastHitFrame = 29
#const dspecial_damage_info = DSpecial|8|50|80|90

#const mv_dspecialHit = 1
#const dspecialHit_xOffset = -113.69
#const dspecialHit_yOffset = 3.67
#const dspecialHit_xRange = 63.86
#const dspecialHit_yRange = 20.56
#const dspecialHit_hitFrame = 43
#const dspecialHit_lastHitFrame = 46
#const dspecialHit_damage_info = DSpecial|12|50|80|90


// sideB
#const sspecial_IASA = 45
#const sspecial_xOffset = 0.14
#const sspecial_yOffset = -0.69
#const sspecial_xRange = 20.54
#const sspecial_yRange = 3.52
#const sspecial_hitFrame = 5
#const sspecial_lastHitFrame = 44
#const sspecial_damage_info = SSpecial|10|20|80|361

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 1
#const grab_yOffset = -5.06
#const grab_xRange = 5.25
#const grab_yRange = 3
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 29
#const fthrow_throwFrame = 11
#const fthrow_damage_info = Grab|8|60|65|45

#const dthrow_IASA = 41
#const dthrow_throwFrame = 17
#const dthrow_damage_info = Grab|7|75|30|70

#const bthrow_IASA = 68
#const bthrow_throwFrame = 43
#const bthrow_damage_info = Grab|12|85|75|-45

#const uthrow_IASA = 41
#const uthrow_throwFrame = 17
#const uthrow_damage_info = Grab|7|70|72|80


// NAir
#const nair_IASA = 45
#const nair_xOffset = -5.15
#const nair_yOffset = 1.53
#const nair_xRange = 6.89
#const nair_yRange = 5.45
#const nair_hitFrame = 3
#const nair_lastHitFrame = 6
#const nair_damage_info = NAir|12|20|121|90

#const mv_nairWeak = 1
#const nairWeak_xOffset = -5.05
#const nairWeak_yOffset = 1.41
#const nairWeak_xRange = 6.76
#const nairWeak_yRange = 5.34
#const nairWeak_hitFrame = 7
#const nairWeak_lastHitFrame = 31
#const nairWeak_damage_info = NAir|8|20|100|90

// FAir
#const fair_IASA = 30
#const fair_xOffset = -1.68
#const fair_yOffset = -1.09
#const fair_xRange = 8.8
#const fair_yRange = 9.92
#const fair_hitFrame = 7
#const fair_lastHitFrame = 10
#const fair_damage_info = FAir|14|43|88|361

// BAir
#const bair_IASA = 26
#const bair_xOffset = -16.71
#const bair_yOffset = -1.73
#const bair_xRange = 9.02
#const bair_yRange = 5.02
#const bair_hitFrame = 6
#const bair_lastHitFrame = 17
#const bair_damage_info = BAir|11|12|100|-361

// UAir
#const uair_IASA = 29
#const uair_xOffset = -9.89
#const uair_yOffset = -7.48
#const uair_xRange = 11.92
#const uair_yRange = 9.29
#const uair_hitFrame = 5
#const uair_lastHitFrame = 9
#const uair_damage_info = UAir|13|0|100|70

// DAir
#const dair_IASA = 28
#const dair_xOffset = -2.11
#const dair_yOffset = 6.16
#const dair_xRange = 6.34
#const dair_yRange = 7.2
#const dair_hitFrame = 10
#const dair_lastHitFrame = 14
#const dair_damage_info = DAir|16|20|100|361

#const mv_dairMeteor = 1
#const dairMeteor_xOffset = -3.87
#const dairMeteor_yOffset = 1.34
#const dairMeteor_xRange = 5.6
#const dairMeteor_yRange = 5.23
#const dairMeteor_hitFrame = 10
#const dairMeteor_lastHitFrame = 14
#const dairMeteor_damage_info = DAir|16|20|100|270