#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 11.78
#const cs_jumpHeight = 33.87
#const cs_djumpHeight = 24.16
#const cs_wavedashDist = 20

#const pt_jumpiness = 0.2
#const pt_djumpiness = 0.15
#const pt_aggression = 1.6
#const pt_bait_dashAwayChance = 0.3
#const pt_bait_wdashAwayChance = 0.7
#const pt_wall_chance = 0.2
#const pt_platChance = 0.23
#const pt_baitChance = 1.01
#const pt_braveChance = 0.45
#const pt_circleCampChance = 0.25

#const cs_dashForceTurnFrame = 9
#const cs_dashDanceMinFrames = 3
#const cs_recoveryDistX = 60
#const cs_recoveryDistY = -50

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
#const jab123_IASA = 17
#const jab123_xOffset = 0.3
#const jab123_yOffset = -0.25
#const jab123_xRange = 8.61
#const jab123_yRange = 4.54
#const jab123_hitFrame = 4
#const jab123_lastHitFrame = 6
#const jab123_damage_info = Jab123|2|w33|100|55

#const mv_jab123_2 = 1
#const jab123_2_IASA = 16
#const jab123_2_xOffset = 7.55
#const jab123_2_yOffset = 0.09
#const jab123_2_xRange = 5.53
#const jab123_2_yRange = 3.89
#const jab123_2_hitFrame = 6
#const jab123_2_lastHitFrame = 7
#const jab123_2_damage_info = Jab123|3|w33|100|55

#const mv_jab123_3 = 1
#const jab123_3_IASA = 30
#const jab123_3_xOffset = 2.13
#const jab123_3_yOffset = 2.49
#const jab123_3_xRange = 8.35
#const jab123_3_yRange = 9.17
#const jab123_3_hitFrame = 6
#const jab123_3_lastHitFrame = 12
#const jab123_3_damage_info = Jab123|5|40|100|361

// dashattack
#const dashattack_IASA = 43
#const dashattack_xOffset = 17.14
#const dashattack_yOffset = -0.81
#const dashattack_xRange = 12.3
#const dashattack_yRange = 4.61
#const dashattack_hitFrame = 9
#const dashattack_lastHitFrame = 23
#const dashattack_damage_info = DashAttack|10|35|80|35

// ftilt
#const ftilt_IASA = 29
#const ftilt_xOffset = -4.68
#const ftilt_yOffset = 1.82
#const ftilt_xRange = 12.03
#const ftilt_yRange = 10.81
#const ftilt_hitFrame = 9
#const ftilt_lastHitFrame = 11
#const ftilt_damage_info = FTilt|11|20|100|361

// utilt
#const utilt_IASA = 29
#const utilt_xOffset = -14.35
#const utilt_yOffset = -0.03
#const utilt_xRange = 13.51
#const utilt_yRange = 10.53
#const utilt_hitFrame = 8
#const utilt_lastHitFrame = 13
#const utilt_damage_info = UTilt|9|40|95|95

// dtilt
#const dtilt_IASA = 25
#const dtilt_xOffset = 2.01
#const dtilt_yOffset = 0.67
#const dtilt_xRange = 8.88
#const dtilt_yRange = 4.05
#const dtilt_hitFrame = 9
#const dtilt_lastHitFrame = 11
#const dtilt_damage_info = DTilt|9|70|45|70

// fsmash
#const fsmash_IASA = 54
#const fsmash_xOffset = -5.17
#const fsmash_yOffset = 3.47
#const fsmash_xRange = 19.45
#const fsmash_yRange = 14.19
#const fsmash_hitFrame = 18
#const fsmash_lastHitFrame = 25
#const fsmash_damage_info = FSmash|16|50|85|40

// usmash
#const usmash_IASA = 44
#const usmash_xOffset = -15.3
#const usmash_yOffset = -2.77
#const usmash_xRange = 14.08
#const usmash_yRange = 10.59
#const usmash_hitFrame = 12
#const usmash_lastHitFrame = 17
#const usmash_damage_info = USmash|15|40|90|100

// dsmash
#const dsmash_IASA = 40
#const dsmash_xOffset = 1.31
#const dsmash_yOffset = 1.96
#const dsmash_xRange = 8.92
#const dsmash_yRange = 4.79
#const dsmash_hitFrame = 9
#const dsmash_lastHitFrame = 11
#const dsmash_damage_info = DSmash|15|30|90|30

#const mv_dsmash_late = 1
#const dsmash_late_xOffset = -19.47
#const dsmash_late_yOffset = 1.1
#const dsmash_late_xRange = 9.18
#const dsmash_late_yRange = 3.99
#const dsmash_late_hitFrame = 17
#const dsmash_late_lastHitFrame = 19
#const dsmash_late_damage_info = DSmash|12|25|90|30

// noochB
// TODO - arrow
// #const nspecial_IASA = 9999.9999
// #const nspecial_xOffset = 9999.9999
// #const nspecial_yOffset = 9999.9999
// #const nspecial_xRange = 9999.9999
// #const nspecial_yRange = 9999.9999
// #const nspecial_hitFrame = 9999.9999
// #const nspecial_lastHitFrame = 9999.9999

// upB
// #const uspecial_IASA = 52
// #const uspecial_xOffset = 23.1
// #const uspecial_yOffset = -54.27
// #const uspecial_xRange = 10.85
// #const uspecial_yRange = 11.64
// #const uspecial_hitFrame = 30
// #const uspecial_lastHitFrame = 32
// #const uspecial_damage_info = USpecial|9|60|103|83

#const uspecialair_IASA = 56
#const uspecialair_xOffset = -9.5
#const uspecialair_yOffset = -27.6
#const uspecialair_xRange = 12.63
#const uspecialair_yRange = 7.08
#const uspecialair_hitFrame = 8
#const uspecialair_lastHitFrame = 10
#const uspecialair_damage_info = USpecialAir|17|20|100|361

// downB
// TODO - Bombs?

// sideB
// TODO - rang
// #const sspecial_IASA = 88
// #const sspecial_xOffset = -2.73
// #const sspecial_yOffset = -0.59
// #const sspecial_xRange = 2.72
// #const sspecial_yRange = 2.75
// #const sspecial_hitFrame = 5
// #const sspecial_lastHitFrame = 7
// #const sspecial_damage_info = SSpecial|15|40|110|80

// grab
#const grab_IASA = 53
#const grab_xOffset = 0.52
#const grab_yOffset = -3.49
#const grab_xRange = 4
#const grab_yRange = 4.02
#const grab_hitFrame = 9
#const grab_lastHitFrame = 14
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 38
#const fthrow_throwFrame = 12
#const fthrow_damage_info = Grab|4|40|110|42

#const dthrow_IASA = 50
#const dthrow_throwFrame = 27
#const dthrow_damage_info = Grab|4|55|45|90

#const bthrow_IASA = 38
#const bthrow_throwFrame = 12
#const bthrow_damage_info = Grab|4|40|110|-37

#const uthrow_IASA = 50
#const uthrow_throwFrame = 27
#const uthrow_damage_info = Grab|2|45|230|90

// NAir
#const nair_IASA = 31
#const nair_xOffset = -17.24
#const nair_yOffset = 3.09
#const nair_xRange = 17.48
#const nair_yRange = 6.25
#const nair_hitFrame = 5
#const nair_lastHitFrame = 14
#const nair_damage_info = NAir|12|22|100|361

// FAir
#const fair_IASA = 38
#const fair_xOffset = 6.81
#const fair_yOffset = 1.24
#const fair_xRange = 5.09
#const fair_yRange = 4.12
#const fair_hitFrame = 10
#const fair_lastHitFrame = 13
#const fair_damage_info = FAir|14|22|100|361

#const mv_fair_weak = 1
#const fair_weak_xOffset = -2.68
#const fair_weak_yOffset = -0.13
#const fair_weak_xRange = 6.19
#const fair_weak_yRange = 5.72
#const fair_weak_hitFrame = 10
#const fair_weak_lastHitFrame = 13
#const fair_weak_damage_info = FAir|11|15|100|361

// BAir
#const bair_IASA = 29
#const bair_xOffset = -15.32
#const bair_yOffset = 3.18
#const bair_xRange = 9.24
#const bair_yRange = 10.88
#const bair_hitFrame = 6
#const bair_lastHitFrame = 10
#const bair_damage_info = BAir|10|18|117|65

// UAir
#const uair_IASA = 52
#const uair_xOffset = -5.29
#const uair_yOffset = 0.64
#const uair_xRange = 6.44
#const uair_yRange = 11.14
#const uair_hitFrame = 5
#const uair_lastHitFrame = 40
#const uair_damage_info = UAir|15|25|95|80

// DAir
#const dair_IASA = 69
#const dair_xOffset = -4.1
#const dair_yOffset = 4.42
#const dair_xRange = 4.1
#const dair_yRange = 5.2
#const dair_hitFrame = 12
#const dair_lastHitFrame = 54
#const dair_damage_info = DAir|17|45|100|70

#const mv_dair_spike = 1
#const dair_spike_xOffset = -3.53
#const dair_spike_yOffset = -3.05
#const dair_spike_xRange = 3.53
#const dair_spike_yRange = 3.53
#const dair_spike_hitFrame = 12
#const dair_spike_lastHitFrame = 54
#const dair_spike_damage_info = DAir|18|22|92|281

