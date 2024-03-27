#const DIRY_ABOVE = 10.5
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -2

// use fudge in-game hitbox tools to figure out ranges for the following
// - fsmash
// - usmash
// - nair
// - uspecial & air

#const cs_shortHopHeight = 14.81
#const cs_jumpHeight = 37.92
#const cs_djumpHeight = 30.72
#const cs_wavedashDist = 33

#const dashForceTurnFrame = 11
#const dashDanceMinFrames = 2
#const cs_recoveryDistX = 60
#const cs_recoveryDistY = -60

#const _pt_jumpiness = 0.05
#const _pt_djumpiness = 0.02
#const _pt_aggression = 1.25
#const _pt_bait_dashAwayChance = 0.55
#const _pt_bait_wdashAwayChance = 0.08
#const _pt_wall_chance = 0.65
#const _pt_platChance = 0.1
#const _pt_baitChance = 0.9
#const _pt_braveChance = 0.7
#const _pt_circleCampChance = 0.2

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x7a) || Equal CurrAction hex(0x80) || Equal CurrAction hex(0x81) || Equal CurrAction hex(0x82)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x11d) || Equal CurrAction hex(0x11b) || Equal CurrAction hex(0x11f)

// jab123
#const jab123_IASA = 16
#const jab123_xOffset = 0.5
#const jab123_yOffset = -5.5
#const jab123_xRange = 6.5
#const jab123_yRange = 4.15
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 3
#const jab123_damage_info = Jab123|3|0|100|70

#const mv_jab1232 = 1
#const jab1232_IASA = 26
#const jab1232_xOffset = 5.9
#const jab1232_yOffset = -6.15
#const jab1232_xRange = 5.35
#const jab1232_yRange = 3.85
#const jab1232_hitFrame = 10
#const jab1232_lastHitFrame = 11
#const jab1232_damage_info = Jab123|3|0|100|70

#const mv_jab1233 = 2
#const jab1233_IASA = 33
#const jab1233_xOffset = 5.73
#const jab1233_yOffset = -6.25
#const jab1233_xRange = 5.61
#const jab1233_yRange = 4.8
#const jab1233_hitFrame = 17
#const jab1233_lastHitFrame = 18
#const jab1233_damage_info = Jab123|5|50|70|361

// dashattack
#const dashattack_IASA = 35
#const dashattack_xOffset = 6.22
#const dashattack_yOffset = -4.94
#const dashattack_xRange = 12.74
#const dashattack_yRange = 4.31
#const dashattack_hitFrame = 6
#const dashattack_lastHitFrame = 15
#const dashattack_damage_info = DashAttack|10|50|64|361

// ftilt
#const ftilt_IASA = 28
#const ftilt_xOffset = 1.38
#const ftilt_yOffset = -5.47
#const ftilt_xRange = 7.8
#const ftilt_yRange = 4.48
#const ftilt_hitFrame = 6
#const ftilt_lastHitFrame = 8
#const ftilt_damage_info = FTilt|9|18|100|35

// utilt
#const utilt_IASA = 38
#const utilt_xOffset = -11.3
#const utilt_yOffset = -5.77
#const utilt_xRange = 11.3
#const utilt_yRange = 10.12
#const utilt_hitFrame = 3
#const utilt_lastHitFrame = 12
#const utilt_damage_info = UTilt|8|50|100|90

// dtilt
#const dtilt_IASA = 25
#const dtilt_xOffset = 5.06
#const dtilt_yOffset = 0.89
#const dtilt_xRange = 6.89
#const dtilt_yRange = 3.48
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 7
#const dtilt_damage_info = DTilt|7|30|110|85

// fsmash
#const fsmash_IASA = 69
#const fsmash_xOffset = -4.8
#const fsmash_yOffset = -3.5
#const fsmash_xRange = 16.78
#const fsmash_yRange = 5.75
#const fsmash_hitFrame = 22
#const fsmash_lastHitFrame = 26
#const fsmash_damage_info = FSmash|13|25|110|40

// usmash
#const usmash_IASA = 53
#const usmash_xOffset = -7.017
#const usmash_yOffset = -9.499
#const usmash_xRange = 11.126
#const usmash_yRange = 13.935
#const usmash_hitFrame = 8
#const usmash_lastHitFrame = 31
#const usmash_damage_info = USmash|1|65|221|75

// dsmash
#const dsmash_IASA = 39
#const dsmash_xOffset = 3.65
#const dsmash_yOffset = 1.35
#const dsmash_xRange = 9.85
#const dsmash_yRange = 5.35
#const dsmash_hitFrame = 21
#const dsmash_lastHitFrame = 25
#const dsmash_damage_info = DSmash|11|75|20|70

// noochB
#const nspecial_IASA = 58
#const nspecial_xOffset = 9
#const nspecial_yOffset = -7.85
#const nspecial_xRange = 45
#const nspecial_yRange = 2
#const nspecial_hitFrame = 21
#const nspecial_lastHitFrame = 90
#const nspecial_damage_info = NSpecial|-6|w26|100|361

#const nspecialair_IASA = 58
#const nspecialair_xOffset = 9
#const nspecialair_yOffset = -7.85
#const nspecialair_xRange = 45
#const nspecialair_yRange = 2
#const nspecialair_hitFrame = 21
#const nspecialair_lastHitFrame = 90
#const nspecialair_damage_info = NSpecialAir|-6|w26|100|361

// upB
#const uspecial_IASA = 41
#const uspecial_xOffset = -4.75
#const uspecial_yOffset = -3.5
#const uspecial_xRange = 9.774
#const uspecial_yRange = 29.759
#const uspecial_hitFrame = 7
#const uspecial_lastHitFrame = 24
#const uspecial_damage_info = USpecial|6|60|45|281

#const uspecialair_IASA = 41
#const uspecialair_xOffset = -4.75
#const uspecialair_yOffset = -32.5
#const uspecialair_xRange = 9.774
#const uspecialair_yRange = 15.216
#const uspecialair_hitFrame = 16
#const uspecialair_lastHitFrame = 24
#const uspecialair_damage_info = USpecialAir|6|60|45|281

// downB
#const dspecial_IASA = 67
#const dspecial_xOffset = -5
#const dspecial_yOffset = 3.455
#const dspecial_xRange = 13.359
#const dspecial_yRange = 18.949
#const dspecial_hitFrame = 24
#const dspecial_lastHitFrame = 39
#const dspecial_damage_info = DSpecial|13|50|100|361

#const dspecialair_IASA = 95
#const dspecialair_xOffset = -5
#const dspecialair_yOffset = 41.3
#const dspecialair_xRange = 27.466
#const dspecialair_yRange = 37.872
#const dspecialair_hitFrame = 24
#const dspecialair_lastHitFrame = 39
#const dspecialair_damage_info = DSpecialAir|13|50|100|361

// sideB
#const sspecial_IASA = 52
#const sspecial_xOffset = 7.5
#const sspecial_yOffset = -5.5
#const sspecial_xRange = 9
#const sspecial_yRange = 2.5
#const sspecial_hitFrame = 24
#const sspecial_lastHitFrame = 25
#const sspecial_damage_info = SSpecial|4|69|0|20

#const mv_sspecial_pull = 1
#const sspecial_pull_xOffset = 26.5
#const sspecial_pull_yOffset = -3
#const sspecial_pull_xRange = 5.5
#const sspecial_pull_yRange = 5.5
#const sspecial_pull_hitFrame = 30
#const sspecial_pull_lastHitFrame = 33
#const sspecial_pull_damage_info = SSpecial|9|80|50|110

#const sspecialair_IASA = 45
#const sspecialair_xOffset = 7.5
#const sspecialair_yOffset = -5.5
#const sspecialair_xRange = 9
#const sspecialair_yRange = 2.5
#const sspecialair_hitFrame = 24
#const sspecialair_lastHitFrame = 25
#const sspecialair_damage_info = SSpecialAir|4|69|0|20

#const mv_sspecialair_pull = 1
#const sspecialair_pull_xOffset = 26.5
#const sspecialair_pull_yOffset = -3
#const sspecialair_pull_xRange = 5.5
#const sspecialair_pull_yRange = 5.5
#const sspecialair_pull_hitFrame = 30
#const sspecialair_pull_lastHitFrame = 33
#const sspecialair_pull_damage_info = SSpecialAir|9|80|50|110

// grab
#const grab_IASA = 29
#const grab_xOffset = 2.75
#const grab_yOffset = -6.25
#const grab_xRange = 5.88
#const grab_yRange = 3.75
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 36
#const fthrow_throwFrame = 15
#const fthrow_damage_info = Grab|7|63|50|40

#const dthrow_IASA = 55
#const dthrow_throwFrame = 31
#const dthrow_damage_info = Grab|2|68|78|65

#const bthrow_IASA = 33
#const bthrow_throwFrame = 11
#const bthrow_damage_info = Grab|4|70|60|-45

#const uthrow_IASA = 39
#const uthrow_throwFrame = 7
#const uthrow_damage_info = Grab|4|65|115|85

// NAir
#const nair_IASA = 33
#const nair_xOffset = -21.324
#const nair_yOffset = 1.664
#const nair_xRange = 19.871
#const nair_yRange = 6.823
#const nair_hitFrame = 6
#const nair_lastHitFrame = 9
#const nair_damage_info = NAir|12|25|80|55

#const mv_nair_back = 1
#const nair_back_xOffset = -21.324
#const nair_back_yOffset = -8.664
#const nair_back_xRange = 19.871
#const nair_back_yRange = 7.823
#const nair_back_hitFrame = 10
#const nair_back_lastHitFrame = 14
#const nair_back_damage_info = NAir|12|25|80|-55

// FAir
#const fair_IASA = 39
#const fair_xOffset = -2.86
#const fair_yOffset = -3.31
#const fair_xRange = 8.43
#const fair_yRange = 4.59
#const fair_hitFrame = 6
#const fair_lastHitFrame = 20
#const fair_damage_info = FAir|10|40|105|40

// BAir
#const bair_IASA = 39
#const bair_xOffset = -16.81
#const bair_yOffset = -2.94
#const bair_xRange = 8.38
#const bair_yRange = 4.22
#const bair_hitFrame = 7
#const bair_lastHitFrame = 11
#const bair_damage_info = BAir|13|33|110|-361

// UAir
#const uair_IASA = 33
#const uair_xOffset = -12.98
#const uair_yOffset = -3.12
#const uair_xRange = 14.23
#const uair_yRange = 11.95
#const uair_hitFrame = 4
#const uair_lastHitFrame = 12
#const uair_damage_info = UAir|10|30|110|60

// DAir
#const dair_IASA = 31
#const dair_xOffset = -4.94
#const dair_yOffset = 5.61
#const dair_xRange = 4.35
#const dair_yRange = 6.79
#const dair_hitFrame = 12
#const dair_lastHitFrame = 17
#const dair_damage_info = DAir|12|70|35|90
