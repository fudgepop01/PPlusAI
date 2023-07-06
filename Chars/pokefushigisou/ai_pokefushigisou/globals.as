#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 15.24
#const cs_jumpHeight = 31.1
#const cs_djumpHeight = 31.1
#const cs_wavedashDist = 20

#const pt_jumpiness = 0.2
#const pt_djumpiness = 0.15
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.3
#const pt_bait_wdashAwayChance = 0.5
#const pt_wall_chance = 1.25
#const pt_platChance = 0.23
#const pt_baitChance = 1.01
#const pt_braveChance = 0.45
#const pt_circleCampChance = 0.55

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
#const jab123_xOffset = 2.66
#const jab123_yOffset = 3.23
#const jab123_xRange = 9.53
#const jab123_yRange = 7.44
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 4
#const jab123_damage_info = Jab123|3|w20|100|97

#const mv_jab123_2 = 1
#const jab123_2_IASA = 24
#const jab123_2_xOffset = 0.71
#const jab123_2_yOffset = 3.41
#const jab123_2_xRange = 10.57
#const jab123_2_yRange = 7.72
#const jab123_2_hitFrame = 6
#const jab123_2_lastHitFrame = 8
#const jab123_2_damage_info = Jab123|4|35|140|361

// dashattack
#const dashattack_IASA = 34
#const dashattack_xOffset = 3.94
#const dashattack_yOffset = 1.26
#const dashattack_xRange = 13.83
#const dashattack_yRange = 7.42
#const dashattack_hitFrame = 4
#const dashattack_lastHitFrame = 20
#const dashattack_damage_info = DashAttack|12|80|70|70

// ftilt
#const ftilt_IASA = 35
#const ftilt_xOffset = 2.43
#const ftilt_yOffset = -0.48
#const ftilt_xRange = 14.68
#const ftilt_yRange = 5.18
#const ftilt_hitFrame = 5
#const ftilt_lastHitFrame = 14
#const ftilt_damage_info = FTilt|5|20|130|361

// utilt
#const utilt_IASA = 28
#const utilt_xOffset = -12.38
#const utilt_yOffset = -1.2
#const utilt_xRange = 14.19
#const utilt_yRange = 14.6
#const utilt_hitFrame = 9
#const utilt_lastHitFrame = 15
#const utilt_damage_info = UTilt|9|40|105|90

// dtilt
#const dtilt_IASA = 31
#const dtilt_xOffset = 0.58
#const dtilt_yOffset = 1.23
#const dtilt_xRange = 16.29
#const dtilt_yRange = 6.41
#const dtilt_hitFrame = 8
#const dtilt_lastHitFrame = 14
#const dtilt_damage_info = DTilt|5|50|100|100

// fsmash
#const fsmash_IASA = 60
#const fsmash_xOffset = -6.69
#const fsmash_yOffset = 0.75
#const fsmash_xRange = 20.66
#const fsmash_yRange = 6.8
#const fsmash_hitFrame = 16
#const fsmash_lastHitFrame = 20
#const fsmash_damage_info = FSmash|15|30|100|361

// usmash
#const usmash_IASA = 49
#const usmash_xOffset = -12
#const usmash_yOffset = -1.25
#const usmash_xRange = 12
#const usmash_yRange = 13.63
#const usmash_hitFrame = 14
#const usmash_lastHitFrame = 20
#const usmash_damage_info = USmash|12|50|100|70

// dsmash
#const dsmash_IASA = 46
#const dsmash_xOffset = -23.93
#const dsmash_yOffset = 2.57
#const dsmash_xRange = 24.83
#const dsmash_yRange = 5.89
#const dsmash_hitFrame = 7
#const dsmash_lastHitFrame = 8
#const dsmash_damage_info = DSmash|14|40|65|22

// noochB
// TODO
// #const nspecial_IASA = 9999.9999
// #const nspecial_xOffset = 9999.9999
// #const nspecial_yOffset = 9999.9999
// #const nspecial_xRange = 9999.9999
// #const nspecial_yRange = 9999.9999
// #const nspecial_hitFrame = 9999.9999
// #const nspecial_lastHitFrame = 9999.9999

// upB
#const uspecial_IASA = 49
#const uspecial_xOffset = 21.85
#const uspecial_yOffset = -28.24
#const uspecial_xRange = 5.97
#const uspecial_yRange = 6.98
#const uspecial_hitFrame = 21
#const uspecial_lastHitFrame = 25
#const uspecial_damage_info = USpecial|15|80|80|50

#const uspecialair_IASA = 49
#const uspecialair_xOffset = 12.87
#const uspecialair_yOffset = -22.37
#const uspecialair_xRange = 12.62
#const uspecialair_yRange = 9.27
#const uspecialair_hitFrame = 21
#const uspecialair_lastHitFrame = 25
#const uspecialair_damage_info = USpecialAir|15|80|80|50

// downB
// TODO - recharge

// sideB
// TODO - razor leaf

// grab
#const grab_IASA = 44
#const grab_xOffset = 1.5
#const grab_yOffset = -2.5
#const grab_xRange = 12.5
#const grab_yRange = 3.5
#const grab_hitFrame = 12
#const grab_lastHitFrame = 13
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 35
#const fthrow_throwFrame = 15
#const fthrow_damage_info = Grab|10|60|60|40

#const dthrow_IASA = 36
#const dthrow_throwFrame = 18
#const dthrow_damage_info = Grab|10|83|61|80

#const bthrow_IASA = 43
#const bthrow_throwFrame = 17
#const bthrow_damage_info = Grab|11|40|97|45

#const uthrow_IASA = 52
#const uthrow_throwFrame = 18
#const uthrow_damage_info = Grab|6|50|120|90

// NAir
#const nair_IASA = 43
#const nair_xOffset = -6.96
#const nair_yOffset = 4
#const nair_xRange = 7.67
#const nair_yRange = 7.99
#const nair_hitFrame = 28
#const nair_lastHitFrame = 29
#const nair_damage_info = NAir|4|10|190|361

#const mv_nair_weak = 1
#const nair_weak_xOffset = -8
#const nair_weak_yOffset = 3.5
#const nair_weak_xRange = 7.75
#const nair_weak_yRange = 7.75
#const nair_weak_hitFrame = 4
#const nair_weak_lastHitFrame = 27
#const nair_weak_damage_info = NAir|2|w40|110|225

// FAir
#const fair_IASA = 35
#const fair_xOffset = -7.9
#const fair_yOffset = 15.57
#const fair_xRange = 15.5
#const fair_yRange = 19.72
#const fair_hitFrame = 15
#const fair_lastHitFrame = 19
#const fair_damage_info = FAir|13|60|50|80

// BAir
#const bair_IASA = 40
#const bair_xOffset = -22.31
#const bair_yOffset = 8.5
#const bair_xRange = 14.39
#const bair_yRange = 14.82
#const bair_hitFrame = 17
#const bair_lastHitFrame = 19
#const bair_damage_info = BAir|8|20|145|361

// UAir
#const uair_IASA = 38
#const uair_xOffset = -9.25
#const uair_yOffset = 0.25
#const uair_xRange = 9.25
#const uair_yRange = 9.25
#const uair_hitFrame = 10
#const uair_lastHitFrame = 10
#const uair_damage_info = UAir|10|32|110|70

#const mv_uair_spike = 1
#const uair_spike_xOffset = -9.25
#const uair_spike_yOffset = 17
#const uair_spike_xRange = 9.25
#const uair_spike_yRange = 17.63
#const uair_spike_hitFrame = 11
#const uair_spike_lastHitFrame = 14
#const uair_spike_damage_info = UAir|6|25|80|281

#const mv_uair_fall = 2
#const uair_fall_xOffset = -8.5
#const uair_fall_yOffset = 58.25
#const uair_fall_xRange = 8.25
#const uair_fall_yRange = 25.63
#const uair_fall_hitFrame = 15
#const uair_fall_lastHitFrame = 28
#const uair_fall_damage_info = UAir|6|25|80|270

// DAir
#const dair_IASA = 38
#const dair_xOffset = -8.5
#const dair_yOffset = 14.18
#const dair_xRange = 8.5
#const dair_yRange = 8.58
#const dair_hitFrame = 9
#const dair_lastHitFrame = 10
#const dair_damage_info = DAir|10|32|92|50

#const mv_dair_meteor = 1
#const dair_meteor_xOffset = -3.5
#const dair_meteor_yOffset = 7.34
#const dair_meteor_xRange = 3.5
#const dair_meteor_yRange = 3.5
#const dair_meteor_hitFrame = 8
#const dair_meteor_lastHitFrame = 8
#const dair_meteor_damage_info = DAir|7|50|149|270