#const DIRY_ABOVE = 15
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -0.25

#const pt_jumpiness = 0.1
#const pt_djumpiness = 0.04
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.6
#const pt_bait_wdashAwayChance = 0.15
#const pt_wall_chance = 0.4
#const pt_platChance = 0.1
#const pt_baitChance = 0.9
#const pt_braveChance = 0.85
#const pt_circleCampChance = 0.55

#const cs_dashForceTurnFrame = 9
#const cs_dashDanceMinFrames = 6

#const cs_shortHopHeight = 16.61
#const cs_jumpHeight = 34.08
#const cs_djumpHeight = 26.39
#const cs_wavedashDist = 27
#const cs_recoveryDistX = 70
#const cs_recoveryDistY = -50

//=========================================
// RECOVERY ACTIONS MOVED TO RECOVERY HUB
//=========================================

// jab123
#const jab123_IASA = 16
#const jab123_xOffset = 2.77
#const jab123_yOffset = -5.85
#const jab123_xRange = 8.03
#const jab123_yRange = 3.42
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 4
#const jab123_damage_info = Jab123|4|w20|100|65

// dashattack
#const dashattack_IASA = 44
#const dashattack_xOffset = 27.92
#const dashattack_yOffset = -3.89
#const dashattack_xRange = 14
#const dashattack_yRange = 9.12
#const dashattack_hitFrame = 16
#const dashattack_lastHitFrame = 22
#const dashattack_damage_info = DashAttack|14|50|75|361

// ftilt
#const ftilt_IASA = 35
#const ftilt_xOffset = 2.14
#const ftilt_yOffset = -2.57
#const ftilt_xRange = 13.72
#const ftilt_yRange = 5.44
#const ftilt_hitFrame = 11
#const ftilt_lastHitFrame = 13
#const ftilt_damage_info = FTilt|15|35|95|361

// utilt
#const utilt_IASA = 34
#const utilt_xOffset = -4.6
#const utilt_yOffset = 2.44
#const utilt_xRange = 9.68
#const utilt_yRange = 16.9
#const utilt_hitFrame = 9
#const utilt_lastHitFrame = 21
#const utilt_damage_info = UTilt|12|40|110|85

// dtilt
#const dtilt_IASA = 26
#const dtilt_xOffset = 1.1
#const dtilt_yOffset = 2.93
#const dtilt_xRange = 10.65
#const dtilt_yRange = 5.33
#const dtilt_hitFrame = 14
#const dtilt_lastHitFrame = 16
#const dtilt_damage_info = DTilt|12|20|95|70

// fsmash
#const fsmash_IASA = 77
#const fsmash_xOffset = -6.12
#const fsmash_yOffset = 4.14
#const fsmash_xRange = 17.48
#const fsmash_yRange = 17.74
#const fsmash_hitFrame = 31
#const fsmash_lastHitFrame = 36
#const fsmash_damage_info = FSmash|25|45|100|361

// usmash
#const usmash_IASA = 68
#const usmash_xOffset = -20.95
#const usmash_yOffset = 2.85
#const usmash_xRange = 22.83
#const usmash_yRange = 19.88
#const usmash_hitFrame = 26
#const usmash_lastHitFrame = 32
#const usmash_damage_info = USmash|22|50|90|70

// dsmash
#const dsmash_IASA = 40
#const dsmash_xOffset = -3.99
#const dsmash_yOffset = 0.85
#const dsmash_xRange = 12.66
#const dsmash_yRange = 7.02
#const dsmash_hitFrame = 13
#const dsmash_lastHitFrame = 16
#const dsmash_damage_info = DSmash|16|30|100|140

#const mv_dsmash_hit2 = 1
#const dsmash_hit2_xOffset = -18.36
#const dsmash_hit2_yOffset = 0.65
#const dsmash_hit2_xRange = 10.87
#const dsmash_hit2_yRange = 6.36
#const dsmash_hit2_hitFrame = 16
#const dsmash_hit2_lastHitFrame = 20
#const dsmash_hit2_damage_info = DSmash|15|35|115|40

// noochB
// #const nspecial_IASA = 80
// #const nspecial_xOffset = 5
// #const nspecial_yOffset = -2
// #const nspecial_xRange = 200
// #const nspecial_yRange = 2
// #const nspecial_hitFrame = 20
// #const nspecial_lastHitFrame = 30
// #const nspecial_damage_info = NSpecial|3|0|0|0

// #const nspecialair_IASA = 80
// #const nspecialair_xOffset = 0
// #const nspecialair_yOffset = 5
// #const nspecialair_xRange = 200
// #const nspecialair_yRange = 10
// #const nspecialair_hitFrame = 10
// #const nspecialair_lastHitFrame = 30
// #const nspecialair_damage_info = NSpecialAir|3|0|0|0

// upB
// #const uspecial_IASA = 74
// #const uspecial_xOffset = -0.51
// #const uspecial_yOffset = -0.45
// #const uspecial_xRange = 4.2
// #const uspecial_yRange = 4.99
// #const uspecial_hitFrame = 44
// #const uspecial_lastHitFrame = 73
// #const uspecial_damage_info = USpecial|14|60|60|80

// downB
// #const dspecial_IASA = 8
// #const dspecial_xOffset = -8
// #const dspecial_yOffset = 1.5
// #const dspecial_xRange = 8
// #const dspecial_yRange = 8
// #const dspecial_hitFrame = 1
// #const dspecial_lastHitFrame = 1
// #const dspecial_damage_info = DSpecial|5|w80|100|1

// #const dspecialair_IASA = 8
// #const dspecialair_xOffset = -8
// #const dspecialair_yOffset = 1.5
// #const dspecialair_xRange = 8
// #const dspecialair_yRange = 8
// #const dspecialair_hitFrame = 1
// #const dspecialair_lastHitFrame = 1
// #const dspecialair_damage_info = DSpecialAir|5|55|35|20


// sideB
#const sspecial_IASA = 43
#const sspecial_xOffset = -1.28
#const sspecial_yOffset = -5.3
#const sspecial_xRange = 12.03
#const sspecial_yRange = 4.1
#const sspecial_hitFrame = 11
#const sspecial_lastHitFrame = 12
#const sspecial_damage_info = SSpecial|0|40|130|70

// #const sspecialair_IASA = 43
// #const sspecialair_xOffset = 0.9
// #const sspecialair_yOffset = -2.17
// #const sspecialair_xRange = 12.07
// #const sspecialair_yRange = 5.12
// #const sspecialair_hitFrame = 11
// #const sspecialair_lastHitFrame = 12
// #const sspecialair_damage_info = SSpecialAir|7|40|130|70

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 0.59
#const grab_yOffset = -3.29
#const grab_xRange = 6.66
#const grab_yRange = 4.81
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 21
#const fthrow_throwFrame = 8
#const fthrow_damage_info = Grab|4|55|105|55

#const dthrow_IASA = 61
#const dthrow_throwFrame = 39
#const dthrow_damage_info = Grab|4|70|60|60

#const bthrow_IASA = 30
#const bthrow_throwFrame = 16
#const bthrow_damage_info = Grab|4|60|100|48

#const uthrow_IASA = 50
#const uthrow_throwFrame = 26
#const uthrow_damage_info = Grab|4|70|135|88

// NAir
#const nair_IASA = 39
#const nair_xOffset = -19.57
#const nair_yOffset = 9.49
#const nair_xRange = 20.56
#const nair_yRange = 18.94
#const nair_hitFrame = 7
#const nair_lastHitFrame = 18
#const nair_damage_info = NAir|14|40|90|65

// FAir
#const fair_IASA = 46
#const fair_xOffset = -8.69
#const fair_yOffset = 11.65
#const fair_xRange = 18.53
#const fair_yRange = 21.56
#const fair_hitFrame = 17
#const fair_lastHitFrame = 20
#const fair_damage_info = FAir|15|20|105|361

// BAir
#const bair_IASA = 35
#const bair_xOffset = -21.34
#const bair_yOffset = -3.49
#const bair_xRange = 12.75
#const bair_yRange = 5.57
#const bair_hitFrame = 7
#const bair_lastHitFrame = 9
#const bair_damage_info = BAir|17|30|100|361

// UAir
#const uair_IASA = 40
#const uair_xOffset = -18.35
#const uair_yOffset = -7.56
#const uair_xRange = 18.21
#const uair_yRange = 7.76
#const uair_hitFrame = 9
#const uair_lastHitFrame = 24
#const uair_damage_info = UAir|15|40|100|70

// DAir
#const dair_IASA = 43
#const dair_xOffset = -4.66
#const dair_yOffset = 14.13
#const dair_xRange = 5.08
#const dair_yRange = 12.49
#const dair_hitFrame = 16
#const dair_lastHitFrame = 30
#const dair_damage_info = DAir|17|25|100|285