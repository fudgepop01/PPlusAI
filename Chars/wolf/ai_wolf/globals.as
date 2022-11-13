#const DIRY_ABOVE = 9
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = 0
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const pt_jumpiness = 0.05
#const pt_djumpiness = 0.04
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.55
#const pt_bait_wdashAwayChance = 0.15
#const pt_wall_chance = 0.45
#const pt_platChance = 0.1
#const pt_baitChance = 0.9
#const pt_braveChance = 0.85
#const pt_circleCampChance = 0.55

#const cs_recoveryDistY = -80
#const cs_recoveryDistX = 60

#const cs_dashForceTurnFrame = 9
#const cs_dashDanceMinFrames = 6

#const cs_shortHopHeight = 12.5
#const cs_jumpHeight = 32
#const cs_djumpHeight = 35.28
#const cs_wavedashDist = 25

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) 
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x11a)


// jab123
#const jab123_IASA = 14
#const jab123_xOffset = 5.44
#const jab123_yOffset = -1.02
#const jab123_xRange = 7.1
#const jab123_yRange = 5.2
#const jab123_hitFrame = 4
#const jab123_lastHitFrame = 5
#const jab123_damage_info = Jab123|4|20|53|80

// dashattack
#const dashattack_IASA = 39
#const dashattack_xOffset = 22.13
#const dashattack_yOffset = 2.1
#const dashattack_xRange = 7.77
#const dashattack_yRange = 11.07
#const dashattack_hitFrame = 11
#const dashattack_lastHitFrame = 15
#const dashattack_damage_info = DashAttack|9|35|100|-74

// ftilt
#const ftilt_IASA = 31
#const ftilt_xOffset = 2
#const ftilt_yOffset = -0.5
#const ftilt_xRange = 10
#const ftilt_yRange = 6
#const ftilt_hitFrame = 7
#const ftilt_lastHitFrame = 10
#const ftilt_damage_info = FTilt|6|25|150|50

// utilt
#const utilt_IASA = 26
#const utilt_xOffset = -2.94
#const utilt_yOffset = -0.02
#const utilt_xRange = 7.72
#const utilt_yRange = 13.37
#const utilt_hitFrame = 6
#const utilt_lastHitFrame = 10
#const utilt_damage_info = UTilt|10|30|105|85

// dtilt
#const dtilt_IASA = 26
#const dtilt_xOffset = 2.99
#const dtilt_yOffset = 1.09
#const dtilt_xRange = 10.53
#const dtilt_yRange = 5.18
#const dtilt_hitFrame = 9
#const dtilt_lastHitFrame = 10
#const dtilt_damage_info = DTilt|8|30|100|68

// fsmash
#const fsmash_IASA = 48
#const fsmash_xOffset = 0.68
#const fsmash_yOffset = 0
#const fsmash_xRange = 19.56
#const fsmash_yRange = 5
#const fsmash_hitFrame = 11
#const fsmash_lastHitFrame = 17
#const fsmash_damage_info = FSmash|15|45|86|361

// usmash
#const usmash_IASA = 50
#const usmash_xOffset = -8.37
#const usmash_yOffset = 0.97
#const usmash_xRange = 14.37
#const usmash_yRange = 13.92
#const usmash_hitFrame = 12
#const usmash_lastHitFrame = 17
#const usmash_damage_info = USmash|12|40|100|100

#const mv_usmash_late = 1
#const usmash_late_xOffset = -23.36
#const usmash_late_yOffset = 0.61
#const usmash_late_xRange = 12.18
#const usmash_late_yRange = 13.74
#const usmash_late_hitFrame = 18
#const usmash_late_lastHitFrame = 25
#const usmash_late_damage_info = USmash|11|25|100|40

// dsmash
#const dsmash_IASA = 44
#const dsmash_xOffset = 3.03
#const dsmash_yOffset = 2.24
#const dsmash_xRange = 8.87
#const dsmash_yRange = 5.22
#const dsmash_hitFrame = 9
#const dsmash_lastHitFrame = 10
#const dsmash_damage_info = DSmash|15|25|100|40

#const mv_dsmash_late = 1
#const dsmash_late_xOffset = -18.24
#const dsmash_late_yOffset = 2.25
#const dsmash_late_xRange = 8.5
#const dsmash_late_yRange = 5.35
#const dsmash_late_hitFrame = 15
#const dsmash_late_lastHitFrame = 16
#const dsmash_late_damage_info = DSmash|13|25|100|40

// noochB
#const nspecial_IASA = 40
#const nspecial_xOffset = 0
#const nspecial_yOffset = -2
#const nspecial_xRange = 200
#const nspecial_yRange = 2
#const nspecial_hitFrame = 20
#const nspecial_lastHitFrame = 30
#const nspecial_damage_info = NSpecial|0|0|0|0

#const nspecialair_IASA = 40
#const nspecialair_xOffset = 0
#const nspecialair_yOffset = -2
#const nspecialair_xRange = 60
#const nspecialair_yRange = 2
#const nspecialair_hitFrame = 10
#const nspecialair_lastHitFrame = 30
#const nspecialair_damage_info = NSpecialAir|0|0|0|0

// upB
#const uspecial_IASA = 74
#const uspecial_xOffset = -0.51
#const uspecial_yOffset = -0.45
#const uspecial_xRange = 4.2
#const uspecial_yRange = 4.99
#const uspecial_hitFrame = 44
#const uspecial_lastHitFrame = 73
// #const uspecial_damage_info = USpecial|14|60|60|80

// downB
#const dspecial_IASA = 11
#const dspecial_xOffset = -8
#const dspecial_yOffset = 1.5
#const dspecial_xRange = 8
#const dspecial_yRange = 8
#const dspecial_hitFrame = 1
#const dspecial_lastHitFrame = 1
#const dspecial_damage_info = dspecial|5|70|100|69

#const dspecialair_IASA = 11
#const dspecialair_xOffset = -8
#const dspecialair_yOffset = 1.5
#const dspecialair_xRange = 8
#const dspecialair_yRange = 8
#const dspecialair_hitFrame = 1
#const dspecialair_lastHitFrame = 1
#const dspecialair_damage_info = dspecialair|5|70|100|69


// sideB
//18 + 5 + 36
#const sspecial_IASA = 59 
#const sspecial_xOffset = 0
#const sspecial_yOffset = 0
#const sspecial_xRange = 20
#const sspecial_yRange = 14
#const sspecial_hitFrame = 19
#const sspecial_lastHitFrame = 22
#const sspecial_damage_info = SSpecial|16|60|100|30

//18 + 5 + 36
#const sspecialair_IASA = 59 
#const sspecialair_xOffset = 0
#const sspecialair_yOffset = 0
#const sspecialair_xRange = 20
#const sspecialair_yRange = 14
#const sspecialair_hitFrame = 19
#const sspecialair_lastHitFrame = 22
#const sspecialair_damage_info = SSpecialAir|16|60|100|30

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 1.3
#const grab_yOffset = -1.5
#const grab_xRange = 6
#const grab_yRange = 4.5
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 30
#const fthrow_throwFrame = 10
#const fthrow_damage_info = Grab|2|54|135|45
#const dthrow_IASA = 48
#const dthrow_throwFrame = 25
#const dthrow_damage_info = Grab|3|70|50|55
#const bthrow_IASA = 43
#const bthrow_throwFrame = 21
#const bthrow_damage_info = Grab|5|70|58|-60
#const uthrow_IASA = 44
#const uthrow_throwFrame = 16
#const uthrow_damage_info = Grab|2|70|110|77

// NAir
#const nair_IASA = 40
#const nair_xOffset = -7.79
#const nair_yOffset = 1.8
#const nair_xRange = 7.8
#const nair_yRange = 8.33
#const nair_hitFrame = 7
#const nair_lastHitFrame = 24
#const nair_damage_info = NAir|4|w20|100|0

// FAir
#const fair_IASA = 29
#const fair_xOffset = -0.91
#const fair_yOffset = 1.35
#const fair_xRange = 8.97
#const fair_yRange = 7.32
#const fair_hitFrame = 11
#const fair_lastHitFrame = 14
#const fair_damage_info = FAir|15|25|100|70

// BAir
#const bair_IASA = 28
#const bair_xOffset = -16.58
#const bair_yOffset = -1.86
#const bair_xRange = 8.84
#const bair_yRange = 4.86
#const bair_hitFrame = 7
#const bair_lastHitFrame = 10
#const bair_damage_info = BAir|14|22|102|-361

// UAir
#const uair_IASA = 29
#const uair_xOffset = -0.11
#const uair_yOffset = -3.93
#const uair_xRange = 8.18
#const uair_yRange = 5.5
#const uair_hitFrame = 7
#const uair_lastHitFrame = 7
#const uair_damage_info = UAir|11|20|100|57

#const mv_uair_late = 1
#const uair_late_xOffset = -14.58
#const uair_late_yOffset = -0.49
#const uair_late_xRange = 15.41
#const uair_late_yRange = 12.97
#const uair_late_hitFrame = 8
#const uair_late_lastHitFrame = 11
#const uair_late_damage_info = UAir|11|20|100|50

// DAir
#const dair_IASA = 36
#const dair_xOffset = -5.5
#const dair_yOffset = 10.5
#const dair_xRange = 6
#const dair_yRange = 7.5
#const dair_hitFrame = 13
#const dair_lastHitFrame = 15
#const dair_damage_info = DAir|15|30|85|290

#const mv_dair_meteor = 1
#const dair_meteor_xOffset = -5.5
#const dair_meteor_yOffset = 10.5
#const dair_meteor_xRange = 6
#const dair_meteor_yRange = 7.5
#const dair_meteor_hitFrame = 13
#const dair_meteor_lastHitFrame = 15
#const dair_meteor_damage_info = DAir|14|15|100|270
