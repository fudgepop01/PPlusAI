#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 11.25
#const cs_jumpHeight = 36.45
#const cs_djumpHeight = 33.8
#const cs_wavedashDist = 55

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
#const jab123_IASA = 15
#const jab123_xOffset = 0.72
#const jab123_yOffset = -0.7
#const jab123_xRange = 7.49
#const jab123_yRange = 4.66
#const jab123_hitFrame = 4
#const jab123_lastHitFrame = 7
#const jab123_damage_info = Jab123|2|0|100|45

#const mv_jab123_2 = 1
#const jab123_2_IASA = 17
#const jab123_2_xOffset = 0.51
#const jab123_2_yOffset = -2.36
#const jab123_2_xRange = 8.1
#const jab123_2_yRange = 3.47
#const jab123_2_hitFrame = 3
#const jab123_2_lastHitFrame = 5
#const jab123_2_damage_info = Jab123|4|w30|100|45

// dashattack
#const dashattack_IASA = 37
#const dashattack_xOffset = 13.16
#const dashattack_yOffset = -4.55
#const dashattack_xRange = 8.44
#const dashattack_yRange = 3.78
#const dashattack_hitFrame = 11
#const dashattack_lastHitFrame = 13
#const dashattack_damage_info = DashAttack|9|90|40|80

// ftilt
#const ftilt_IASA = 27
#const ftilt_xOffset = 5.72
#const ftilt_yOffset = -2.91
#const ftilt_xRange = 6.35
#const ftilt_yRange = 3.28
#const ftilt_hitFrame = 6
#const ftilt_lastHitFrame = 9
#const ftilt_damage_info = FTilt|8|8|100|361

// utilt
#const utilt_IASA = 41
#const utilt_xOffset = -5.47
#const utilt_yOffset = 0.02
#const utilt_xRange = 7.99
#const utilt_yRange = 11.2
#const utilt_hitFrame = 7
#const utilt_lastHitFrame = 26
#const utilt_damage_info = UTilt|3|27|183|90

// dtilt
#const dtilt_IASA = 26
#const dtilt_xOffset = 5.68
#const dtilt_yOffset = 1.31
#const dtilt_xRange = 7.5
#const dtilt_yRange = 3.64
#const dtilt_hitFrame = 6
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|5|30|100|70

// fsmash
#const fsmash_IASA = 52
#const fsmash_xOffset = -6.78
#const fsmash_yOffset = 2.8
#const fsmash_xRange = 12.4
#const fsmash_yRange = 11.33
#const fsmash_hitFrame = 14
#const fsmash_lastHitFrame = 16
#const fsmash_damage_info = FSmash|14|40|105|361

// usmash
#const usmash_IASA = 51
#const usmash_xOffset = -13.53
#const usmash_yOffset = -7.28
#const usmash_xRange = 11.92
#const usmash_yRange = 8.54
#const usmash_hitFrame = 15
#const usmash_lastHitFrame = 20
#const usmash_damage_info = USmash|11|50|128|83

// dsmash
#const dsmash_IASA = 38
#const dsmash_xOffset = -14.89
#const dsmash_yOffset = 1.06
#const dsmash_xRange = 15.27
#const dsmash_yRange = 4.67
#const dsmash_hitFrame = 7
#const dsmash_lastHitFrame = 12
#const dsmash_damage_info = DSmash|12|50|110|361

// noochB
// TODO - ice thing
// #const nspecial_IASA = 9999.9999
// #const nspecial_xOffset = 9999.9999
// #const nspecial_yOffset = 9999.9999
// #const nspecial_xRange = 9999.9999
// #const nspecial_yRange = 9999.9999
// #const nspecial_hitFrame = 9999.9999
// #const nspecial_lastHitFrame = 9999.9999

// upB
// TODO - maybe nana yeet?

// downB
// TODO - wind frost thing

// sideB
#const sspecial_IASA = 91
#const sspecial_xOffset = -14.57
#const sspecial_yOffset = -5.82
#const sspecial_xRange = 14.65
#const sspecial_yRange = 3.31
#const sspecial_hitFrame = 12
#const sspecial_lastHitFrame = 60
#const sspecial_damage_info = SSpecial|2|5|80|30

// grab
#const grab_IASA = 32
#const grab_xOffset = -1.48
#const grab_yOffset = -1.09
#const grab_xRange = 6.45
#const grab_yRange = 5.34
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 51
#const fthrow_throwFrame = 27
#const fthrow_damage_info = Grab|5|70|60|45

#const dthrow_IASA = 49
#const dthrow_throwFrame = 34
#const dthrow_damage_info = Grab|6|70|40|80

#const bthrow_IASA = 51
#const bthrow_throwFrame = 16
#const bthrow_damage_info = Grab|7|80|30|60

#const uthrow_IASA = 55
#const uthrow_throwFrame = 25
#const uthrow_damage_info = Grab|5|110|28|88

// NAir
#const nair_IASA = 45
#const nair_xOffset = -10.03
#const nair_yOffset = 0.63
#const nair_xRange = 12.12
#const nair_yRange = 6.7
#const nair_hitFrame = 6
#const nair_lastHitFrame = 23
#const nair_damage_info = NAir|8|20|100|361

// FAir
#const fair_IASA = 54
#const fair_xOffset = -5.55
#const fair_yOffset = 8.94
#const fair_xRange = 9.7
#const fair_yRange = 14.72
#const fair_hitFrame = 19
#const fair_lastHitFrame = 22
#const fair_damage_info = FAir|13|40|100|70

#const mv_fair_spike = 1
#const fair_spike_xOffset = -1.84
#const fair_spike_yOffset = 4.31
#const fair_spike_xRange = 5.39
#const fair_spike_yRange = 10
#const fair_spike_hitFrame = 19
#const fair_spike_lastHitFrame = 22
#const fair_spike_damage_info = FAir|11|50|70|285


// BAir
#const bair_IASA = 35
#const bair_xOffset = -14.99
#const bair_yOffset = -1.95
#const bair_xRange = 5.83
#const bair_yRange = 3.28
#const bair_hitFrame = 8
#const bair_lastHitFrame = 11
#const bair_damage_info = BAir|12|30|110|361

// UAir
#const uair_IASA = 29
#const uair_xOffset = -4.31
#const uair_yOffset = -8.22
#const uair_xRange = 4.54
#const uair_yRange = 7.43
#const uair_hitFrame = 6
#const uair_lastHitFrame = 23
#const uair_damage_info = UAir|9|10|140|70

// DAir
#const dair_IASA = 63
#const dair_xOffset = -5.47
#const dair_yOffset = 2.17
#const dair_xRange = 5.79
#const dair_yRange = 5.89
#const dair_hitFrame = 3
#const dair_lastHitFrame = 52
#const dair_damage_info = DAir|9|w36|110|361
