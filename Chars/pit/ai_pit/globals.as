#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 10.31
#const cs_jumpHeight = 35.57
#const cs_djumpHeight = 35.57
#const cs_wavedashDist = 32

#const pt_jumpiness = 0.2
#const pt_djumpiness = 0.15
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.3
#const pt_bait_wdashAwayChance = 0.5
#const pt_wall_chance = 0.6
#const pt_platChance = 0.23
#const pt_baitChance = 1.01
#const pt_braveChance = 0.45
#const pt_circleCampChance = 0.45

#const cs_dashForceTurnFrame = 10
#const cs_dashDanceMinFrames = 3
#const cs_recoveryDistX = 110
#const cs_recoveryDistY = -30

// #const SFALL_ACTIONS = Equal CurrAction hex(0x10)
// #const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
// #const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x129)
// #const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x129) || Equal CurrAction hex(0x12b) 
// #const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x12c)

/// recovery
#const recovery_moves = uspecial|sspecial

#const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1D6)) && !(Equal CurrSubaction hex(0x1D7))
#const uspecial_recovery_info = common|60

#const sspecial_subaction_check = !(Equal CurrSubaction hex(0x1D4)) && !(Equal CurrSubaction hex(0x1D5))
#const sspecial_recovery_info = custom

#const art_pit_nspecial = 2

// jab123
#const jab123_IASA = 19
#const jab123_xOffset = 2.83
#const jab123_yOffset = -0.28
#const jab123_xRange = 8.13
#const jab123_yRange = 6.48
#const jab123_hitFrame = 5
#const jab123_lastHitFrame = 6
#const jab123_damage_info = Jab123|0|0|0|0

#const mv_jab123_2 = 1
#const jab123_2_IASA = 20
#const jab123_2_xOffset = 6.7
#const jab123_2_yOffset = -4.41
#const jab123_2_xRange = 7.13
#const jab123_2_yRange = 3.54
#const jab123_2_hitFrame = 5
#const jab123_2_lastHitFrame = 6
#const jab123_2_damage_info = Jab123|3|w70|40|60

#const mv_jab123_3 = 2
#const jab123_3_IASA = 31
#const jab123_3_xOffset = -0.33
#const jab123_3_yOffset = -2.68
#const jab123_3_xRange = 9.3
#const jab123_3_yRange = 10.58
#const jab123_3_hitFrame = 3
#const jab123_3_lastHitFrame = 7
#const jab123_3_damage_info = Jab123|5|50|70|361

// dashattack
#const dashattack_IASA = 33
#const dashattack_xOffset = 14.82
#const dashattack_yOffset = -2.33
#const dashattack_xRange = 5.8
#const dashattack_yRange = 4.18
#const dashattack_hitFrame = 7
#const dashattack_lastHitFrame = 9
#const dashattack_damage_info = DashAttack|12|20|100|70

// ftilt
#const ftilt_IASA = 30
#const ftilt_xOffset = 4
#const ftilt_yOffset = -0.33
#const ftilt_xRange = 9.63
#const ftilt_yRange = 7.22
#const ftilt_hitFrame = 10
#const ftilt_lastHitFrame = 13
#const ftilt_damage_info = FTilt|13|45|70|361

// utilt
#const utilt_IASA = 26
#const utilt_xOffset = -4.79
#const utilt_yOffset = -5.82
#const utilt_xRange = 5.86
#const utilt_yRange = 11.65
#const utilt_hitFrame = 5
#const utilt_lastHitFrame = 14
#const utilt_damage_info = UTilt|7|40|100|90

// dtilt
#const dtilt_IASA = 25
#const dtilt_xOffset = 3.89
#const dtilt_yOffset = 0.38
#const dtilt_xRange = 8
#const dtilt_yRange = 4.2
#const dtilt_hitFrame = 7
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|12|50|70|80

// fsmash
#const fsmash_IASA = 34
#const fsmash_xOffset = 0.05
#const fsmash_yOffset = -1.82
#const fsmash_xRange = 9.82
#const fsmash_yRange = 7.44
#const fsmash_hitFrame = 11
#const fsmash_lastHitFrame = 13
#const fsmash_damage_info = FSmash|9|50|0|80

#const mv_fsmash2 = 1
#const fsmash2_IASA = 46
#const fsmash2_xOffset = -3.41
#const fsmash2_yOffset = -1.7
#const fsmash2_xRange = 13.36
#const fsmash2_yRange = 7.44
#const fsmash2_hitFrame = 10
#const fsmash2_lastHitFrame = 13
#const fsmash2_damage_info = FSmash|12|30|125|361

// usmash
#const usmash_IASA = 54
#const usmash_xOffset = -13.05
#const usmash_yOffset = -8.21
#const usmash_xRange = 14.22
#const usmash_yRange = 9.4
#const usmash_hitFrame = 20
#const usmash_lastHitFrame = 26
#const usmash_damage_info = USmash|10|55|120|80

// dsmash
#const dsmash_IASA = 42
#const dsmash_xOffset = 0.3
#const dsmash_yOffset = 1.36
#const dsmash_xRange = 9.32
#const dsmash_yRange = 5.4
#const dsmash_hitFrame = 7
#const dsmash_lastHitFrame = 9
#const dsmash_damage_info = DSmash|13|40|94|361

#const mv_dsmash_hit2 = 1
#const dsmash_hit2_xOffset = -18.4
#const dsmash_hit2_yOffset = -0.5
#const dsmash_hit2_xRange = 9.29
#const dsmash_hit2_yRange = 5.03
#const dsmash_hit2_hitFrame = 20
#const dsmash_hit2_lastHitFrame = 22
#const dsmash_hit2_damage_info = DSmash|13|20|94|361

// noochB
#const nspecial_IASA = 45
#const nspecial_xOffset = -500
#const nspecial_yOffset = 200
#const nspecial_xRange = 1000
#const nspecial_yRange = 1000
#const nspecial_hitFrame = 14
#const nspecial_lastHitFrame = 35
#const nspecial_damage_info = NSpecial|-3|5|65|361

#const nspecialair_IASA = 45
#const nspecialair_xOffset = -500
#const nspecialair_yOffset = 200
#const nspecialair_xRange = 1000
#const nspecialair_yRange = 1000
#const nspecialair_hitFrame = 14
#const nspecialair_lastHitFrame = 35
#const nspecialair_damage_info = NSpecialAir|-3|5|65|361

// upB
#const uspecial_IASA = 49
#const uspecial_xOffset = -4.72
#const uspecial_yOffset = -26.35
#const uspecial_xRange = 4.49
#const uspecial_yRange = 6.73
#const uspecial_hitFrame = 8
#const uspecial_lastHitFrame = 9
#const uspecial_damage_info = USpecial|14|50|100|100

#const uspecialair_IASA = 49
#const uspecialair_xOffset = -7.9
#const uspecialair_yOffset = -23.1
#const uspecialair_xRange = 6.87
#const uspecialair_yRange = 29.35
#const uspecialair_hitFrame = 8
#const uspecialair_lastHitFrame = 16
#const uspecialair_damage_info = USpecialAir|14|50|100|100

// downB
// TODO

// sideB
#const sspecial_IASA = 17
#const sspecial_xOffset = 3.381
#const sspecial_yOffset = 13.795
#const sspecial_xRange = 17.708
#const sspecial_yRange = 16.180
#const sspecial_hitFrame = 20
#const sspecial_lastHitFrame = 25
#const sspecial_damage_info = SSpecial|0|0|0|0

#const sspecialair_IASA = 17
#const sspecialair_xOffset = 3.381
#const sspecialair_yOffset = 13.795
#const sspecialair_xRange = 17.708
#const sspecialair_yRange = 16.180
#const sspecialair_hitFrame = 20
#const sspecialair_lastHitFrame = 25
#const sspecialair_damage_info = SSpecialAir|0|0|0|0


// grab
#const grab_IASA = 32
#const grab_xOffset = 1.63
#const grab_yOffset = -4.24
#const grab_xRange = 6.56
#const grab_yRange = 3.92
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 33
#const fthrow_throwFrame = 12
#const fthrow_damage_info = Grab|4|30|150|45

#const dthrow_IASA = 37
#const dthrow_throwFrame = 15
#const dthrow_damage_info = Grab|4|65|70|67

#const bthrow_IASA = 46
#const bthrow_throwFrame = 23
#const bthrow_damage_info = Grab|8|50|60|-45

#const uthrow_IASA = 44
#const uthrow_throwFrame = 12
#const uthrow_damage_info = Grab|7|70|65|80

// NAir
#const nair_IASA = 41
#const nair_xOffset = -5.97
#const nair_yOffset = 0.96
#const nair_xRange = 9.87
#const nair_yRange = 10.09
#const nair_hitFrame = 4
#const nair_lastHitFrame = 21
#const nair_damage_info = NAir|3|40|100|361

#const mv_nair_strong = 1
#const nair_strong_IASA = 41
#const nair_strong_xOffset = -5.54
#const nair_strong_yOffset = 0.69
#const nair_strong_xRange = 8.1
#const nair_strong_yRange = 8.12
#const nair_strong_hitFrame = 19
#const nair_strong_lastHitFrame = 21
#const nair_strong_damage_info = Nair|3|40|100|361

// FAir
#const fair_IASA = 30
#const fair_xOffset = -3.65
#const fair_yOffset = -2.38
#const fair_xRange = 11.02
#const fair_yRange = 4.84
#const fair_hitFrame = 9
#const fair_lastHitFrame = 11
#const fair_damage_info = FAir|15|0|90|361

// BAir
#const bair_IASA = 40
#const bair_xOffset = -17.92
#const bair_yOffset = -3.34
#const bair_xRange = 9.31
#const bair_yRange = 4.12
#const bair_hitFrame = 9
#const bair_lastHitFrame = 10
#const bair_damage_info = BAir|14|25|100|37

#const mv_bair_weak = 1
#const bair_weak_xOffset = -17.92
#const bair_weak_yOffset = -2.79
#const bair_weak_xRange = 9.31
#const bair_weak_yRange = 4.54
#const bair_weak_hitFrame = 9
#const bair_weak_lastHitFrame = 22
#const bair_weak_damage_info = BAir|6|15|85|361

// UAir
#const uair_IASA = 35
#const uair_xOffset = -8.86
#const uair_yOffset = -10.25
#const uair_xRange = 9.86
#const uair_yRange = 5.84
#const uair_hitFrame = 9
#const uair_lastHitFrame = 20
#const uair_damage_info = UAir|11|15|100|75

// DAir
#const dair_IASA = 38
#const dair_xOffset = -13.03
#const dair_yOffset = 9.21
#const dair_xRange = 12.96
#const dair_yRange = 10.17
#const dair_hitFrame = 9
#const dair_lastHitFrame = 13
#const dair_damage_info = DAir|12|35|99|75

#const mv_dair_spike = 1
#const dair_spike_xOffset = 2.92
#const dair_spike_yOffset = 3.36
#const dair_spike_xRange = 5.26
#const dair_spike_yRange = 8.71
#const dair_spike_hitFrame = 12
#const dair_spike_lastHitFrame = 13
#const dair_spike_damage_info = DAir|12|40|50|300