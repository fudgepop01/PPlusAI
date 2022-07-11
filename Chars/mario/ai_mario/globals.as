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

#const cs_shortHopHeight = 11.76
#const cs_jumpHeight = 30.18
#const cs_djumpHeight = 27.84
#const cs_wavedashDist = 20

#const cs_recoveryDistX = 40
#const cs_recoveryDistY = -40

#const recovery_moves = uspecial

#const uspecial_subaction_check = !(True)
#const uspecial_recovery_info = common|0

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115)

#const sv_execute_hardfall = -100
#const sv_execute_rising = -101

// jab123
#const jab123_IASA = 15
#const jab123_xOffset = 1.67
#const jab123_yOffset = -1.45
#const jab123_xRange = 6.99
#const jab123_yRange = 4.54
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 3
#const jab123_damage_info = Jab123|3|w20|100|83

#const mv_jab1232 = 1
#const jab1232_IASA = 23
#const jab1232_xOffset = 2.04
#const jab1232_yOffset = -1.93
#const jab1232_xRange = 6.58
#const jab1232_yRange = 3.58
#const jab1232_hitFrame = 2
#const jab1232_lastHitFrame = 9
#const jab1232_damage_info = Jab123|2|w20|100|83

#const mv_jab1233 = 2
#const jab1233_IASA = 33
#const jab1233_xOffset = 3.48
#const jab1233_yOffset = -4.12
#const jab1233_xRange = 7.69
#const jab1233_yRange = 5.61
#const jab1233_hitFrame = 7
#const jab1233_lastHitFrame = 23
#const jab1233_damage_info = Jab123|5|10|100|361

// dashattack
#const dashattack_IASA = 37
#const dashattack_xOffset = 5.67
#const dashattack_yOffset = 1.37
#const dashattack_xRange = 8.09
#const dashattack_yRange = 3.52
#const dashattack_hitFrame = 6
#const dashattack_lastHitFrame = 9
#const dashattack_damage_info = DashAttack|9|70|30|80

#const mv_dashattack_late = 1
#const dashattack_late_xOffset = 12.68
#const dashattack_late_yOffset = 1.37
#const dashattack_late_xRange = 10.9
#const dashattack_late_yRange = 3.52
#const dashattack_late_hitFrame = 10
#const dashattack_late_lastHitFrame = 25
#const dashattack_late_damage_info = DashAttack|9|70|30|80

// ftilt
#const ftilt_IASA = 24
#const ftilt_xOffset = 3.86
#const ftilt_yOffset = -2.15
#const ftilt_xRange = 8.31
#const ftilt_yRange = 4.18
#const ftilt_hitFrame = 5
#const ftilt_lastHitFrame = 7
#const ftilt_damage_info = FTilt|9|6|100|361

// utilt
#const utilt_IASA = 29
#const utilt_xOffset = 0.46
#const utilt_yOffset = -0.24
#const utilt_xRange = 6.66
#const utilt_yRange = 11.67
#const utilt_hitFrame = 5
#const utilt_lastHitFrame = 11
#const utilt_damage_info = UTilt|8|26|125|96

// dtilt
#const dtilt_IASA = 24
#const dtilt_xOffset = 3.54
#const dtilt_yOffset = 2.03
#const dtilt_xRange = 7.56
#const dtilt_yRange = 4.33
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 8
#const dtilt_damage_info = DTilt|9|30|80|80

// fsmash
#const fsmash_IASA = 43
#const fsmash_xOffset = 5.44
#const fsmash_yOffset = -4.6
#const fsmash_xRange = 9.49
#const fsmash_yRange = 3.94
#const fsmash_hitFrame = 14
#const fsmash_lastHitFrame = 18
#const fsmash_damage_info = FSmash|19|30|97|361

// usmash
#const usmash_IASA = 40
#const usmash_xOffset = -14.37
#const usmash_yOffset = -2.57
#const usmash_xRange = 14.95
#const usmash_yRange = 8.34
#const usmash_hitFrame = 10
#const usmash_lastHitFrame = 13
#const usmash_damage_info = USmash|16|32|97|83

// dsmash
#const dsmash_IASA = 37
#const dsmash_xOffset = 4.17
#const dsmash_yOffset = 0.04
#const dsmash_xRange = 6.32
#const dsmash_yRange = 3.91
#const dsmash_hitFrame = 3
#const dsmash_lastHitFrame = 4
#const dsmash_damage_info = DSmash|16|45|75|361

#const mv_dsmash_hit2 = 1
#const dsmash_hit2_xOffset = -15.51
#const dsmash_hit2_yOffset = 0.04
#const dsmash_hit2_xRange = 6.1
#const dsmash_hit2_yRange = 3.91
#const dsmash_hit2_hitFrame = 12
#const dsmash_hit2_lastHitFrame = 13
#const dsmash_hit2_damage_info = DSmash|12|40|75|361

// noochB
#const nspecialair_IASA = 40
#const nspecialair_xOffset = 0
#const nspecialair_yOffset = 40
#const nspecialair_xRange = 60
#const nspecialair_yRange = 30
#const nspecialair_hitFrame = 25
#const nspecialair_lastHitFrame = 45
#const nspecialair_damage_info = NSpecialAir|0|0|0|0

// upB
#const uspecialair_IASA = 70
#const uspecialair_xOffset = -1.43
#const uspecialair_yOffset = 2.67
#const uspecialair_xRange = 11.82
#const uspecialair_yRange = 28.04
#const uspecialair_hitFrame = 3
#const uspecialair_lastHitFrame = 15
#const uspecialair_damage_info = USpecialAir|3|40|140|50

// downB
#const dspecial_IASA = 82
#const dspecial_xOffset = -10
#const dspecial_yOffset = 3
#const dspecial_xRange = 10
#const dspecial_yRange = 10
#const dspecial_hitFrame = 8
#const dspecial_lastHitFrame = 45
#const dspecial_damage_info = DSpecial|5|60|115|80


// sideB
#const sspecial_IASA = 37
#const sspecial_xOffset = 1
#const sspecial_yOffset = 4
#const sspecial_xRange = 8
#const sspecial_yRange = 9.5
#const sspecial_hitFrame = 12
#const sspecial_lastHitFrame = 14
#const sspecial_damage_info = SSpecial|10|30|80|110

#const sspecialair_IASA = 37
#const sspecialair_xOffset = 1
#const sspecialair_yOffset = 4
#const sspecialair_xRange = 8
#const sspecialair_yRange = 9.5
#const sspecialair_hitFrame = 12
#const sspecialair_lastHitFrame = 14
#const sspecialair_damage_info = SSpecialAir|10|30|80|110

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 1.37
#const grab_yOffset = -4.16
#const grab_xRange = 4.98
#const grab_yRange = 2.93
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 29
#const fthrow_throwFrame = 11
#const fthrow_damage_info = Grab|9|60|72|45

#const dthrow_IASA = 41
#const dthrow_throwFrame = 16
#const dthrow_damage_info = Grab|6|75|50|90

#const bthrow_IASA = 68
#const bthrow_throwFrame = 43
#const bthrow_damage_info = Grab|12|85|78|-45

#const uthrow_IASA = 41
#const uthrow_throwFrame = 17
#const uthrow_damage_info = Grab|8|70|80|90


// NAir
#const nair_IASA = 47
#const nair_xOffset = -4.07
#const nair_yOffset = 0.27
#const nair_xRange = 5.61
#const nair_yRange = 4.28
#const nair_hitFrame = 3
#const nair_lastHitFrame = 6
#const nair_damage_info = NAir|12|20|100|361

#const mv_nairWeak = 1
#const nairWeak_xOffset = -4.07
#const nairWeak_yOffset = 0.27
#const nairWeak_xRange = 5.61
#const nairWeak_yRange = 4.28
#const nairWeak_hitFrame = 3
#const nairWeak_lastHitFrame = 30
#const nairWeak_damage_info = NAir|9|20|100|361

// FAir
#const fair_IASA = 44
#const fair_xOffset = -1.98
#const fair_yOffset = -5.03
#const fair_xRange = 6.6
#const fair_yRange = 6.33
#const fair_hitFrame = 16
#const fair_lastHitFrame = 17
#const fair_damage_info = FAir|17|45|100|60

#const mv_fairMeteor = 1
#const fairMeteor_xOffset = -0.07
#const fairMeteor_yOffset = -1.22
#const fairMeteor_xRange = 6.73
#const fairMeteor_yRange = 7.72
#const fairMeteor_hitFrame = 18
#const fairMeteor_lastHitFrame = 22
#const fairMeteor_damage_info = FAir|15|30|70|280

// BAir
#const bair_IASA = 28
#const bair_xOffset = -12.95
#const bair_yOffset = -1.55
#const bair_xRange = 7.01
#const bair_yRange = 4.73
#const bair_hitFrame = 6
#const bair_lastHitFrame = 8
#const bair_damage_info = BAir|11|43|65|-28

#const mv_bairWeak = 1
#const bairWeak_xOffset = -12.95
#const bairWeak_yOffset = -1.12
#const bairWeak_xRange = 7.09
#const bairWeak_yRange = 4.94
#const bairWeak_hitFrame = 6
#const bairWeak_lastHitFrame = 17
#const bairWeak_damage_info = BAir|9|20|100|-361

// UAir
#const uair_IASA = 27
#const uair_xOffset = -11.29
#const uair_yOffset = -3.43
#const uair_xRange = 11.86
#const uair_yRange = 8.63
#const uair_hitFrame = 4
#const uair_lastHitFrame = 9
#const uair_damage_info = UAir|11|0|100|55

// DAir
#const dair_IASA = 34
#const dair_xOffset = -4.63
#const dair_yOffset = 4.02
#const dair_xRange = 6.85
#const dair_yRange = 7.37
#const dair_hitFrame = 7
#const dair_lastHitFrame = 27
#const dair_damage_info = DAir|3|w55|160|85