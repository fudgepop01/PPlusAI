#const DIRY_ABOVE = 10.5
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -2

#const cs_shortHopHeight = 14.59
#const cs_jumpHeight = 37.35
#const cs_djumpHeight = 37.35
#const cs_wavedashDist = 20

#const dashForceTurnFrame = 13
#const dashDanceMinFrames = 2
#const cs_recoveryDistX = 150
#const cs_recoveryDistY = -80

// #const recovery_moves = uspecial|sspecial

// #const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1F1))
// #const uspecial_recovery_info = common|60

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

// jab123
#const jab123_IASA = 14
#const jab123_xOffset = 1.35
#const jab123_yOffset = -3.78
#const jab123_xRange = 6.56
#const jab123_yRange = 3.28
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 3
#const jab123_damage_info = Jab123|3|w20|100|83

#const mv_jab123_2 = 1
#const jab123_2_IASA = 14
#const jab123_2_xOffset = 1.72
#const jab123_2_yOffset = -2.76
#const jab123_2_xRange = 8.87
#const jab123_2_yRange = 4.09
#const jab123_2_hitFrame = 2
#const jab123_2_lastHitFrame = 3
#const jab123_2_damage_info = jab123|3|w10|5|50

#const mv_jab123_3 = 2
#const jab123_3_IASA = 30
#const jab123_3_xOffset = 3.72
#const jab123_3_yOffset = -4.57
#const jab123_3_xRange = 8.36
#const jab123_3_yRange = 4.13
#const jab123_3_hitFrame = 4
#const jab123_3_lastHitFrame = 6
#const jab123_3_damage_info = Jab123|4|24|100|30

// dashattack
#const dashattack_IASA = 39
#const dashattack_xOffset = -1.43
#const dashattack_yOffset = -0.16
#const dashattack_xRange = 9.1
#const dashattack_yRange = 4.52
#const dashattack_hitFrame = 2
#const dashattack_lastHitFrame = 5
#const dashattack_damage_info = DashAttack|8|70|56|38

#const mv_dashattack_weak = 1
#const dashattack_weak_xOffset = 10.28
#const dashattack_weak_yOffset = -0.2
#const dashattack_weak_xRange = 13.51
#const dashattack_weak_yRange = 4.5
#const dashattack_weak_hitFrame = 6
#const dashattack_weak_lastHitFrame = 22
#const dashattack_weak_damage_info = DashAttack|4|55|40|70

// ftilt
#const ftilt_IASA = 31
#const ftilt_xOffset = 3.5
#const ftilt_yOffset = 0.17
#const ftilt_xRange = 9.48
#const ftilt_yRange = 5.71
#const ftilt_hitFrame = 7
#const ftilt_lastHitFrame = 11
#const ftilt_damage_info = FTilt|11|10|90|361

// utilt
#const utilt_IASA = 29
#const utilt_xOffset = -10.1
#const utilt_yOffset = -2.02
#const utilt_xRange = 11.96
#const utilt_yRange = 10.14
#const utilt_hitFrame = 6
#const utilt_lastHitFrame = 10
#const utilt_damage_info = UTilt|11|33|100|80

// dtilt
#const dtilt_IASA = 28
#const dtilt_xOffset = 2.95
#const dtilt_yOffset = 2.58
#const dtilt_xRange = 9.06
#const dtilt_yRange = 4.23
#const dtilt_hitFrame = 6
#const dtilt_lastHitFrame = 10
#const dtilt_damage_info = DTilt|6|37|119|100

// fsmash
#const fsmash_IASA = 41
#const fsmash_xOffset = 2.41
#const fsmash_yOffset = -2.12
#const fsmash_xRange = 10.71
#const fsmash_yRange = 4.39
#const fsmash_hitFrame = 16
#const fsmash_lastHitFrame = 19
#const fsmash_damage_info = FSmash|16|30|100|361

// usmash
#const usmash_IASA = 45
#const usmash_xOffset = -8
#const usmash_yOffset = -2.5
#const usmash_xRange = 8.5
#const usmash_yRange = 13.32
#const usmash_hitFrame = 13
#const usmash_lastHitFrame = 19
#const usmash_damage_info = USmash|14|37|102|75

// dsmash
#const dsmash_IASA = 52
#const dsmash_xOffset = -11.59
#const dsmash_yOffset = 1.98
#const dsmash_xRange = 14.35
#const dsmash_yRange = 6.81
#const dsmash_hitFrame = 11
#const dsmash_lastHitFrame = 31
#const dsmash_damage_info = DSmash|15|25|91|361

// noochB
#const nspecial_IASA = 40
#const nspecial_xOffset = -3.82
#const nspecial_yOffset = -0.54
#const nspecial_xRange = 3.83
#const nspecial_yRange = 3.83
#const nspecial_hitFrame = 6
#const nspecial_lastHitFrame = 10
#const nspecial_damage_info = NSpecial|8|15|120|72

// upB
// TODO: pikachu offensive UpB
// #const uspecial_IASA = 29
// #const uspecial_xOffset = -4.69
// #const uspecial_yOffset = 1.5
// #const uspecial_xRange = 7.39
// #const uspecial_yRange = 32.58
// #const uspecial_hitFrame = 3
// #const uspecial_lastHitFrame = 20
// #const uspecial_damage_info = USpecial|6|60|80|80

// downB
#const dspecial_IASA = 79
#const dspecial_xOffset = -11.72
#const dspecial_yOffset = 2.72
#const dspecial_xRange = 11.72
#const dspecial_yRange = 11.72
#const dspecial_hitFrame = 42
#const dspecial_lastHitFrame = 44
#const dspecial_damage_info = DSpecial|17|100|60|361

#const dspecial_IASA = 79
#const dspecial_xOffset = -3.5
#const dspecial_yOffset = 3.5
#const dspecial_xRange = 7
#const dspecial_yRange = 212
#const dspecial_hitFrame = 15
#const dspecial_lastHitFrame = 41
#const dspecial_damage_info = DSpecial|14|100|38|70

// sideB
// #const sspecial_IASA = 51
// #const sspecial_xOffset = 3.86
// #const sspecial_yOffset = -5.07
// #const sspecial_xRange = 4.76
// #const sspecial_yRange = 4.86
// #const sspecial_hitFrame = 16
// #const sspecial_lastHitFrame = 29
// #const sspecial_damage_info = SSpecial|0|0|0|0

// grab
#const grab_IASA = 32
#const grab_xOffset = -0.31
#const grab_yOffset = -2.51
#const grab_xRange = 4.89
#const grab_yRange = 3.36
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 32
#const fthrow_throwFrame = 10
#const fthrow_damage_info = Grab|6|65|65|45

#const dthrow_IASA = 53
#const dthrow_throwFrame = 32
#const dthrow_damage_info = Grab|5|80|30|40

#const bthrow_IASA = 68
#const bthrow_throwFrame = 42
#const bthrow_damage_info = Grab|8|70|60|-45

#const uthrow_IASA = 44
#const uthrow_throwFrame = 24
#const uthrow_damage_info = Grab|5|95|60|76

// NAir
#const nair_IASA = 33
#const nair_xOffset = -2.52
#const nair_yOffset = -1.54
#const nair_xRange = 2.93
#const nair_yRange = 2.93
#const nair_hitFrame = 4
#const nair_lastHitFrame = 8
#const nair_damage_info = NAir|15|15|100|361

#const mv_nair_mid = 1
#const nair_mid_xOffset = -5.62
#const nair_mid_yOffset = 1.56
#const nair_mid_xRange = 6.03
#const nair_mid_yRange = 6.03
#const nair_mid_hitFrame = 4
#const nair_mid_lastHitFrame = 21
#const nair_mid_damage_info = NAir|8|15|105|361

// FAir
#const fair_IASA = 37
#const fair_xOffset = -6.83
#const fair_yOffset = -3.67
#const fair_xRange = 9.48
#const fair_yRange = 7.82
#const fair_hitFrame = 8
#const fair_lastHitFrame = 9
#const fair_damage_info = FAir|11|45|90|361

#const mv_fair_meteor = 1
#const fair_meteor_xOffset = -1.81
#const fair_meteor_yOffset = 6.22
#const fair_meteor_xRange = 8.75
#const fair_meteor_yRange = 12.45
#const fair_meteor_hitFrame = 10
#const fair_meteor_lastHitFrame = 13
#const fair_meteor_damage_info = FAir|11|50|76|280

// BAir
#const bair_IASA = 33
#const bair_xOffset = -16.59
#const bair_yOffset = -1.38
#const bair_xRange = 9.05
#const bair_yRange = 4.92
#const bair_hitFrame = 13
#const bair_lastHitFrame = 15
#const bair_damage_info = BAir|16|40|90|-361

#const mv_bair_weak = 1
#const bair_weak_xOffset = -16.19
#const bair_weak_yOffset = -1.42
#const bair_weak_xRange = 8.85
#const bair_weak_yRange = 5.25
#const bair_weak_hitFrame = 16
#const bair_weak_lastHitFrame = 21
#const bair_weak_damage_info = BAir|9|20|90|-361

// UAir
#const uair_IASA = 37
#const uair_xOffset = -8.69
#const uair_yOffset = -5.62
#const uair_xRange = 7.69
#const uair_yRange = 7.66
#const uair_hitFrame = 10
#const uair_lastHitFrame = 14
#const uair_damage_info = UAir|13|25|100|90

// DAir
#const dair_IASA = 35
#const dair_xOffset = -3.5
#const dair_yOffset = -0.5
#const dair_xRange = 4.5
#const dair_yRange = 4.5
#const dair_hitFrame = 9
#const dair_lastHitFrame = 11
#const dair_damage_info = DAir|10|30|92|287
