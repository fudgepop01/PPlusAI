#const DIRY_ABOVE = 10.5
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -2

#const cs_shortHopHeight = 11.76
#const cs_jumpHeight = 30.18
#const cs_djumpHeight = 27.84
#const cs_wavedashDist = 20

#const dashForceTurnFrame = 10
#const dashDanceMinFrames = 2
#const cs_recoveryDistX = 90
#const cs_recoveryDistY = -90

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

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x11a) || Equal CurrAction hex(0x11b) || Equal CurrAction hex(0x11c)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x11d)

// jab123
#const jab123_IASA = 16
#const jab123_xOffset = 2.51
#const jab123_yOffset = 1.62
#const jab123_xRange = 6.19
#const jab123_yRange = 4.36
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 3
#const jab123_damage_info = Jab123|2|7|50|1

// dashattack
#const dashattack_IASA = 49
#const dashattack_xOffset = 3.78
#const dashattack_yOffset = 0.36
#const dashattack_xRange = 14.18
#const dashattack_yRange = 6.02
#const dashattack_hitFrame = 5
#const dashattack_lastHitFrame = 16
#const dashattack_damage_info = DashAttack|10|40|90|40

// ftilt
#const ftilt_IASA = 29
#const ftilt_xOffset = 3.95
#const ftilt_yOffset = 0.9
#const ftilt_xRange = 7.57
#const ftilt_yRange = 6.01
#const ftilt_hitFrame = 5
#const ftilt_lastHitFrame = 14
#const ftilt_damage_info = FTilt|8|10|100|361

// utilt
#const utilt_IASA = 23
#const utilt_xOffset = -14.16
#const utilt_yOffset = 1.69
#const utilt_xRange = 14.21
#const utilt_yRange = 11.05
#const utilt_hitFrame = 7
#const utilt_lastHitFrame = 14
#const utilt_damage_info = UTilt|7|45|124|96

// dtilt
#const dtilt_IASA = 18
#const dtilt_xOffset = 6.76
#const dtilt_yOffset = 1.71
#const dtilt_xRange = 7.16
#const dtilt_yRange = 4.84
#const dtilt_hitFrame = 7
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|8|12|100|35

// fsmash
#const fsmash_IASA = 52
#const fsmash_xOffset = 3.79
#const fsmash_yOffset = 2.16
#const fsmash_xRange = 10.44
#const fsmash_yRange = 5.32
#const fsmash_hitFrame = 16
#const fsmash_lastHitFrame = 23
#const fsmash_damage_info = FSmash|19|25|95|361

// usmash
#const usmash_IASA = 46
#const usmash_xOffset = -3.88
#const usmash_yOffset = -0.76
#const usmash_xRange = 8.72
#const usmash_yRange = 12.1
#const usmash_hitFrame = 9
#const usmash_lastHitFrame = 14
#const usmash_damage_info = USmash|18|40|110|85

// dsmash
#const dsmash_IASA = 57
#const dsmash_xOffset = -11.72
#const dsmash_yOffset = 4.14
#const dsmash_xRange = 11.72
#const dsmash_yRange = 9.77
#const dsmash_hitFrame = 7
#const dsmash_lastHitFrame = 25
#const dsmash_damage_info = DSmash|3|70|170|70

// noochB
#const nspecial_IASA = 44
#const nspecial_xOffset = 0
#const nspecial_yOffset = 0
#const nspecial_xRange = 40
#const nspecial_yRange = 5
#const nspecial_hitFrame = 18
#const nspecial_lastHitFrame = 118
#const nspecial_damage_info = NSpecial|0|0|0|0

#const nspecialair_IASA = 50
#const nspecialair_xOffset = 0
#const nspecialair_yOffset = 40
#const nspecialair_xRange = 40
#const nspecialair_yRange = 45
#const nspecialair_hitFrame = 18
#const nspecialair_lastHitFrame = 118
#const nspecialair_damage_info = NSpecialAir|0|0|0|0

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
#const grab_xOffset = -0.32
#const grab_yOffset = -2.46
#const grab_xRange = 5.34
#const grab_yRange = 3.52
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 45
#const fthrow_throwFrame = 28
#const fthrow_damage_info = Grab|2|45|110|45

#const dthrow_IASA = 42
#const dthrow_throwFrame = 19
#const dthrow_damage_info = Grab|5|80|56|75

#const bthrow_IASA = 51
#const bthrow_throwFrame = 29
#const bthrow_damage_info = Grab|9|75|50|45

#const uthrow_IASA = 46
#const uthrow_throwFrame = 19
#const uthrow_damage_info = Grab|5|90|45|90

// NAir
#const nair_IASA = 41
#const nair_xOffset = -6.94
#const nair_yOffset = 1.24
#const nair_xRange = 6.11
#const nair_yRange = 6.18
#const nair_hitFrame = 3
#const nair_lastHitFrame = 28
#const nair_damage_info = NAir|12|18|100|361

// FAir
#const fair_IASA = 41
#const fair_xOffset = -7.27
#const fair_yOffset = 2.59
#const fair_xRange = 9.62
#const fair_yRange = 7.57
#const fair_hitFrame = 10
#const fair_lastHitFrame = 27
#const fair_damage_info = FAir|3|70|90|361

// BAir
#const bair_IASA = 32
#const bair_xOffset = -19.44
#const bair_yOffset = -0.86
#const bair_xRange = 8.6
#const bair_yRange = 5.03
#const bair_hitFrame = 8
#const bair_lastHitFrame = 14
#const bair_damage_info = BAir|14|25|100|-361

// UAir
#const uair_IASA = 29
#const uair_xOffset = -14.65
#const uair_yOffset = 1.48
#const uair_xRange = 7.86
#const uair_yRange = 8.31
#const uair_hitFrame = 3
#const uair_lastHitFrame = 4
#const uair_damage_info = UAir|7|100|41|80

#const mv_uair_hit = 1
#const uair_hit_xOffset = -14.65
#const uair_hit_yOffset = -4.88
#const uair_hit_xRange = 11.2
#const uair_hit_yRange = 8.78
#const uair_hit_hitFrame = 5
#const uair_hit_lastHitFrame = 6
#const uair_hit_damage_info = UAir|7|60|41|-360

#const mv_uair_semispike = 2
#const uair_semispike_xOffset = -5.44
#const uair_semispike_yOffset = -2.64
#const uair_semispike_xRange = 9.32
#const uair_semispike_yRange = 9.56
#const uair_semispike_hitFrame = 7
#const uair_semispike_lastHitFrame = 8
#const uair_semispike_damage_info = UAir|7|80|41|130

// DAir
#const dair_IASA = 42
#const dair_xOffset = -6.5
#const dair_yOffset = 8.33
#const dair_xRange = 6.15
#const dair_yRange = 9.47
#const dair_hitFrame = 14
#const dair_lastHitFrame = 26
#const dair_damage_info = DAir|12|20|100|361
