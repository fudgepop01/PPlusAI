#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 18
#const cs_jumpHeight = 39.01
#const cs_djumpHeight = 39.01
#const cs_wavedashDist = 35

#const _pt_jumpiness = 0.1
#const _pt_djumpiness = 0.1
#const _pt_aggression = 0.75
#const _pt_bait_dashAwayChance = 0.35
#const _pt_bait_wdashAwayChance = 0.7
#const _pt_wall_chance = 0.7
#const _pt_platChance = 0.23
#const _pt_baitChance = 1.5
#const _pt_braveChance = 0.3
#const _pt_circleCampChance = 0.9

#const cs_dashForceTurnFrame = 9
#const cs_dashDanceMinFrames = 3
#const cs_recoveryDistX = 60
#const cs_recoveryDistY = -45

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
#const jab123_xOffset = 0.1
#const jab123_yOffset = -6
#const jab123_xRange = 10.05
#const jab123_yRange = 4.3
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 4
#const jab123_damage_info = Jab123|3|0|100|361

#const mv_jab123_2 = 1
#const jab123_2_IASA = 29
#const jab123_2_xOffset = 5.21
#const jab123_2_yOffset = 0.02
#const jab123_2_xRange = 7.71
#const jab123_2_yRange = 8.5
#const jab123_2_hitFrame = 4
#const jab123_2_lastHitFrame = 6
#const jab123_2_damage_info = Jab123|7|15|100|361

// dashattack
#const dashattack_IASA = 37
#const dashattack_xOffset = 6.32
#const dashattack_yOffset = -3.02
#const dashattack_xRange = 15.71
#const dashattack_yRange = 6.22
#const dashattack_hitFrame = 7
#const dashattack_lastHitFrame = 16
#const dashattack_damage_info = DashAttack|13|22|105|60

// ftilt
#const ftilt_IASA = 29
#const ftilt_xOffset = 5.03
#const ftilt_yOffset = -6.2
#const ftilt_xRange = 11.64
#const ftilt_yRange = 4.56
#const ftilt_hitFrame = 6
#const ftilt_lastHitFrame = 8
#const ftilt_damage_info = FTilt|10|10|100|361

// utilt
#const utilt_IASA = 34
#const utilt_xOffset = 0.92
#const utilt_yOffset = 4.09
#const utilt_xRange = 11.87
#const utilt_yRange = 16.09
#const utilt_hitFrame = 14
#const utilt_lastHitFrame = 17
#const utilt_damage_info = UTilt|12|40|100|361

#const mv_utilt_spike = 1
#const utilt_spike_xOffset = 0.92
#const utilt_spike_yOffset = 4.09
#const utilt_spike_xRange = 11.87
#const utilt_spike_yRange = 16.09
#const utilt_spike_hitFrame = 14
#const utilt_spike_lastHitFrame = 17
#const utilt_spike_damage_info = UTilt|13|40|100|270

// dtilt
#const dtilt_IASA = 41
#const dtilt_xOffset = 5.03
#const dtilt_yOffset = 4.48
#const dtilt_xRange = 8.66
#const dtilt_yRange = 6.03
#const dtilt_hitFrame = 6
#const dtilt_lastHitFrame = 8
#const dtilt_damage_info = DTilt|14|80|60|100

// fsmash
#const fsmash_IASA = 43
#const fsmash_xOffset = 2.04
#const fsmash_yOffset = -5.78
#const fsmash_xRange = 10.02
#const fsmash_yRange = 4.77
#const fsmash_hitFrame = 10
#const fsmash_lastHitFrame = 13
#const fsmash_damage_info = FSmash|14|30|104|361

// usmash
#const usmash_IASA = 51
#const usmash_xOffset = -16.57
#const usmash_yOffset = -7.91
#const usmash_xRange = 17.79
#const usmash_yRange = 12.03
#const usmash_hitFrame = 13
#const usmash_lastHitFrame = 31
#const usmash_damage_info = USmash|6|45|145|83

// #const mv_usmash_ice = 1
// #const usmash_ice_IASA = 49
// #const usmash_ice_xOffset = -12.8
// #const usmash_ice_yOffset = -3.21
// #const usmash_ice_xRange = 15.21
// #const usmash_ice_yRange = 18.21
// #const usmash_ice_hitFrame = 12
// #const usmash_ice_lastHitFrame = 22
// #const usmash_ice_damage_info = USmash|17|45|90|80

// dsmash
#const dsmash_IASA = 44
#const dsmash_xOffset = -16.76
#const dsmash_yOffset = 3.93
#const dsmash_xRange = 18.13
#const dsmash_yRange = 6.1
#const dsmash_hitFrame = 6
#const dsmash_lastHitFrame = 16
#const dsmash_damage_info = DSmash|16|110|50|120

// noochB
// TODO - projectile thingy
#const nspecial_IASA = 45
#const nspecial_xOffset = -2.972
#const nspecial_yOffset = -3.326
#const nspecial_xRange = 118.200
#const nspecial_yRange = 6.000
#const nspecial_hitFrame = 15
#const nspecial_lastHitFrame = 35
#const nspecial_damage_info = NSpecial|-8|20|50|361

#const mv_nspecial_full = 1
#const nspecial_full_IASA = 45
#const nspecial_full_xOffset = -2.972
#const nspecial_full_yOffset = -3.326
#const nspecial_full_xRange = 118.200
#const nspecial_full_yRange = 6.000
#const nspecial_full_hitFrame = 15
#const nspecial_full_lastHitFrame = 35
#const nspecial_full_damage_info = NSpecial|-25|32|70|361

#const nspecialair_IASA = 45
#const nspecialair_xOffset = -2.972
#const nspecialair_yOffset = -3.326
#const nspecialair_xRange = 118.200
#const nspecialair_yRange = 6.000
#const nspecialair_hitFrame = 15
#const nspecialair_lastHitFrame = 35
#const nspecialair_damage_info = NSpecialAir|-25|32|70|361

// upB
#const uspecial_IASA = 90
#const uspecial_xOffset = -8.29
#const uspecial_yOffset = 4.16
#const uspecial_xRange = 8.74
#const uspecial_yRange = 30.37
#const uspecial_hitFrame = 1
#const uspecial_lastHitFrame = 29
#const uspecial_damage_info = USpecial|2|128|40|95

// downB
#const dspecial_IASA = 54
#const dspecial_xOffset = -40.380
#const dspecial_yOffset = 4.292
#const dspecial_xRange = 40.380
#const dspecial_yRange = 10.186
#const dspecial_hitFrame = 11
#const dspecial_lastHitFrame = 25
#const dspecial_damage_info = DSpecial|-8|10|30|361

#const dspecialair_IASA = 54
#const dspecialair_xOffset = -40.380
#const dspecialair_yOffset = 37.764
#const dspecialair_xRange = 40.380
#const dspecialair_yRange = 25.990
#const dspecialair_hitFrame = 11
#const dspecialair_lastHitFrame = 25
#const dspecialair_damage_info = DSpecial|-8|10|30|361

// sideB
// TODO - bullet thingies
#const sspecial_IASA = 49
#const sspecial_xOffset = 8.554
#const sspecial_yOffset = -1.929
#const sspecial_xRange = 76.300
#const sspecial_yRange = 35.500
#const sspecial_hitFrame = 22
#const sspecial_lastHitFrame = 49
#const sspecial_damage_info = SSpecial|-15|40|110|80

#const sspecialair_IASA = 25
#const sspecialair_xOffset = 8.554
#const sspecialair_yOffset = -1.929
#const sspecialair_xRange = 76.300
#const sspecialair_yRange = 10.500
#const sspecialair_hitFrame = 22
#const sspecialair_lastHitFrame = 49
#const sspecialair_damage_info = SSpecialAir|-15|40|110|80

// #const mv_sspecial_smissile = 1
// #const sspecial_IASA = 59
// #const sspecial_xOffset = 15.380
// #const sspecial_yOffset = -12.649
// #const sspecial_xRange = 56.362
// #const sspecial_yRange = 2.400
// #const sspecial_hitFrame = 22
// #const sspecial_lastHitFrame = 49

// ice
// 10:00:699 Core\HW\EXI\EXI_DeviceIPL.cpp:343 N[OSREPORT]: xOffset = 8.554
// 10:00:699 Core\HW\EXI\EXI_DeviceIPL.cpp:343 N[OSREPORT]: yOffset = -8.929
// 10:00:699 Core\HW\EXI\EXI_DeviceIPL.cpp:343 N[OSREPORT]: xRange = 61.930
// 10:00:699 Core\HW\EXI\EXI_DeviceIPL.cpp:343 N[OSREPORT]: yRange = 2.500

// grab
#const grab_IASA = 74
#const grab_xOffset = 2
#const grab_yOffset = -3.04
#const grab_xRange = 16
#const grab_yRange = 4
#const grab_hitFrame = 14
#const grab_lastHitFrame = 23
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 43
#const fthrow_throwFrame = 14
#const fthrow_damage_info = Grab|9|60|55|42

#const dthrow_IASA = 43
#const dthrow_throwFrame = 20
#const dthrow_damage_info = Grab|6|80|25|80

#const bthrow_IASA = 43
#const bthrow_throwFrame = 11
#const bthrow_damage_info = Grab|8|60|55|-40

#const uthrow_IASA = 43
#const uthrow_throwFrame = 30
#const uthrow_damage_info = Grab|3|80|80|90

// NAir
#const nair_IASA = 39
#const nair_xOffset = -3.79
#const nair_yOffset = 1.5
#const nair_xRange = 7.82
#const nair_yRange = 6.7
#const nair_hitFrame = 5
#const nair_lastHitFrame = 8
#const nair_damage_info = NAir|14|10|100|361

#const mv_nair_weak = 1
#const nair_weak_xOffset = -3.83
#const nair_weak_yOffset = 1.5
#const nair_weak_xRange = 7.86
#const nair_weak_yRange = 6.7
#const nair_weak_hitFrame = 5
#const nair_weak_lastHitFrame = 29
#const nair_weak_damage_info = NAir|10|10|100|361

// FAir
#const fair_IASA = 49
#const fair_xOffset = -2.83
#const fair_yOffset = 5.81
#const fair_xRange = 9.95
#const fair_yRange = 13.1
#const fair_hitFrame = 5
#const fair_lastHitFrame = 29
#const fair_damage_info = FAir|5|20|100|361

// BAir
#const bair_IASA = 36
#const bair_xOffset = -16.22
#const bair_yOffset = -1.35
#const bair_xRange = 7.61
#const bair_yRange = 5.75
#const bair_hitFrame = 9
#const bair_lastHitFrame = 12
#const bair_damage_info = BAir|14|42|100|361

// UAir
#const uair_IASA = 38
#const uair_xOffset = -5.7
#const uair_yOffset = -1.88
#const uair_xRange = 7.54
#const uair_yRange = 9.45
#const uair_hitFrame = 5
#const uair_lastHitFrame = 21
#const uair_damage_info = UAir|4|40|120|361

// DAir
#const dair_IASA = 42
#const dair_xOffset = -11.91
#const dair_yOffset = 8.84
#const dair_xRange = 12.29
#const dair_yRange = 7.97
#const dair_hitFrame = 13
#const dair_lastHitFrame = 17
#const dair_damage_info = DAir|16|30|100|270