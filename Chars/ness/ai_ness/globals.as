#const DIRY_ABOVE = 8.1
#const DIRY_BELOW_AIR = 0
#const DIRY_BELOW_GROUND = 0
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const pt_jumpiness = 0.05
#const pt_djumpiness = 0.03
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.30
#const pt_bait_wdashAwayChance = 0.65
#const pt_wall_chance = 0.45
#const pt_platChance = 0.23
#const pt_baitChance = 0.9
#const pt_braveChance = 0.65
#const pt_circleCampChance = 0.5

#const cs_dashForceTurnFrame = 8
#const cs_dashDanceMinFrames = 3

#const cs_shortHopHeight = 14.04
#const cs_jumpHeight = 37.26
#const cs_djumpHeight = 25.08
#const cs_wavedashDist = 25

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x11a) || Equal CurrAction hex(0x11b) || Equal CurrAction hex(0x11c)
#const DSPECIAL_ACTIONS = Equal CurrAction hex(0x115) || Equal CurrAction hex(0x11e) || Equal CurrAction hex(0x120)

#const sv_execute_hardfall = -100
#const sv_execute_rising = -101

// jab123
#const jab123_IASA = 21
#const jab123_xOffset = -2.34
#const jab123_yOffset = -0.4
#const jab123_xRange = 8.44
#const jab123_yRange = 3.57
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 4
#const jab123_damage_info = Jab123|3|8|50|361

#const mv_jab123_2 = 1
#const jab123_2_IASA = 26
#const jab123_2_xOffset = 7.79
#const jab123_2_yOffset = -1.02
#const jab123_2_xRange = 3.85
#const jab123_2_yRange = 3.37
#const jab123_2_hitFrame = 8
#const jab123_2_lastHitFrame = 9
#const jab123_2_damage_info = Jab123|2|8|50|70

#const mv_jab123_3 = 2
#const jab123_3_IASA = 41
#const jab123_3_xOffset = 5.49
#const jab123_3_yOffset = -0.86
#const jab123_3_xRange = 6.27
#const jab123_3_yRange = 4.79
#const jab123_3_hitFrame = 16
#const jab123_3_lastHitFrame = 19
#const jab123_3_damage_info = Jab123|4|40|100|361

// dashattack
#const dashattack_IASA = 39
#const dashattack_xOffset = 9.89
#const dashattack_yOffset = 2.03
#const dashattack_xRange = 21.47
#const dashattack_yRange = 6.35
#const dashattack_hitFrame = 8
#const dashattack_lastHitFrame = 25
#const dashattack_damage_info = DashAttack|4|80|90|100

// ftilt
#const ftilt_IASA = 27
#const ftilt_xOffset = 0.97
#const ftilt_yOffset = -0.77
#const ftilt_xRange = 7.76
#const ftilt_yRange = 4.23
#const ftilt_hitFrame = 7
#const ftilt_lastHitFrame = 11
#const ftilt_damage_info = FTilt|11|10|100|34

// utilt
#const utilt_IASA = 24
#const utilt_xOffset = -4.24
#const utilt_yOffset = -5.43
#const utilt_xRange = 6.03
#const utilt_yRange = 7.24
#const utilt_hitFrame = 5
#const utilt_lastHitFrame = 9
#const utilt_damage_info = UTilt|7|55|110|96

#const art_ness_uspecial = 2

// dtilt
#const dtilt_IASA = 13
#const dtilt_xOffset = -0.92
#const dtilt_yOffset = 2.48
#const dtilt_xRange = 6.89
#const dtilt_yRange = 3.71
#const dtilt_hitFrame = 3
#const dtilt_lastHitFrame = 4
#const dtilt_damage_info = DTilt|3|10|135|83

// fsmash
#const fsmash_IASA = 50
#const fsmash_xOffset = 3.06
#const fsmash_yOffset = -0.22
#const fsmash_xRange = 7.85
#const fsmash_yRange = 3.13
#const fsmash_hitFrame = 17
#const fsmash_lastHitFrame = 18
#const fsmash_damage_info = FSmash|20|50|70|361

#const mv_fsmash_strong = 1
#const fsmash_strong_xOffset = 18.17
#const fsmash_strong_yOffset = 0.12
#const fsmash_strong_xRange = 3.32
#const fsmash_strong_yRange = 3.33
#const fsmash_strong_hitFrame = 17
#const fsmash_strong_lastHitFrame = 18
#const fsmash_strong_damage_info = FSmash|24|50|75|361

// usmash
#const usmash_IASA = 48
#const usmash_xOffset = -9
#const usmash_yOffset = 0.5
#const usmash_xRange = 9.75
#const usmash_yRange = 5.75
#const usmash_hitFrame = 13
#const usmash_lastHitFrame = 31
#const usmash_damage_info = USmash|12|40|100|85

// dsmash
#const dsmash_IASA = 50
#const dsmash_xOffset = -7
#const dsmash_yOffset = 2
#const dsmash_xRange = 10.5
#const dsmash_yRange = 3.25
#const dsmash_hitFrame = 12
#const dsmash_lastHitFrame = 38
#const dsmash_damage_info = DSmash|12|70|67|361

// noochB
#const nspecial_IASA = 87
#const nspecial_xOffset = -20
#const nspecial_yOffset = 4
#const nspecial_xRange = 20
#const nspecial_yRange = 15
#const nspecial_hitFrame = 76
#const nspecial_lastHitFrame = 86
#const nspecial_damage_info = NSpecial|12|100|64|70

#const nspecialair_IASA = 87
#const nspecialair_xOffset = -20
#const nspecialair_yOffset = 4
#const nspecialair_xRange = 20
#const nspecialair_yRange = 15
#const nspecialair_hitFrame = 76
#const nspecialair_lastHitFrame = 86
#const nspecialair_damage_info = NSpecialAir|12|100|64|70

// upB
#const uspecial_IASA = 100
#const uspecial_xOffset = -50
#const uspecial_yOffset = 30
#const uspecial_xRange = 50
#const uspecial_yRange = 50
#const uspecial_hitFrame = 20
#const uspecial_lastHitFrame = 80
#const uspecial_damage_info = USpecial|14|60|60|80

#const uspecialair_IASA = 100
#const uspecialair_xOffset = -50
#const uspecialair_yOffset = 30
#const uspecialair_xRange = 50
#const uspecialair_yRange = 50
#const uspecialair_hitFrame = 20
#const uspecialair_lastHitFrame = 80
#const uspecialair_damage_info = USpecialAir|14|60|60|80

#const mv_uspecial_pkt2 = 1
#const uspecial_pkt2_IASA = 170
#const uspecial_pkt2_xOffset = -20
#const uspecial_pkt2_yOffset = 20
#const uspecial_pkt2_xRange = 20
#const uspecial_pkt2_yRange = 20
#const uspecial_pkt2_hitFrame = 80
#const uspecial_pkt2_lastHitFrame = 120
#const uspecial_pkt2_damage_info = USpecial|25|60|80|361

#const mv_uspecialair_pkt2 = 1
#const uspecialair_pkt2_IASA = 170
#const uspecialair_pkt2_xOffset = -20
#const uspecialair_pkt2_yOffset = 20
#const uspecialair_pkt2_xRange = 20
#const uspecialair_pkt2_yRange = 20
#const uspecialair_pkt2_hitFrame = 80
#const uspecialair_pkt2_lastHitFrame = 120
#const uspecialair_pkt2_damage_info = USpecialAir|25|60|80|361

// downB
#const dspecial_IASA = 22
#const dspecial_xOffset = -8.5
#const dspecial_yOffset = 2
#const dspecial_xRange = 8.5
#const dspecial_yRange = 8.5
#const dspecial_hitFrame = 1
#const dspecial_lastHitFrame = 10
#const dspecial_damage_info = DSpecial|6|27|90|55

#const dspecialair_IASA = 22
#const dspecialair_xOffset = -8.5
#const dspecialair_yOffset = 2
#const dspecialair_xRange = 8.5
#const dspecialair_yRange = 8.5
#const dspecialair_hitFrame = 1
#const dspecialair_lastHitFrame = 10
#const dspecialair_damage_info = DSpecialAir|6|27|90|55


// sideB
#const sspecial_IASA = 49
#const sspecial_xOffset = 0
#const sspecial_yOffset = 0
#const sspecial_xRange = 40
#const sspecial_yRange = 8
#const sspecial_hitFrame = 25
#const sspecial_lastHitFrame = 44
#const sspecial_damage_info = SSpecial|0|0|0|0

#const sspecialair_IASA = 54
#const sspecialair_xOffset = 0
#const sspecialair_yOffset = 25
#const sspecialair_xRange = 15
#const sspecialair_yRange = 15
#const sspecialair_hitFrame = 20
#const sspecialair_lastHitFrame = 44
#const sspecialair_damage_info = SSpecialAir|0|0|0|0

// grab
#const grab_IASA = 32
#const grab_xOffset = -0.3
#const grab_yOffset = -1.2
#const grab_xRange = 5.55
#const grab_yRange = 4
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 54
#const fthrow_throwFrame = 26
#const fthrow_damage_info = Grab|11|120|10|45

#const dthrow_IASA = 54
#const dthrow_throwFrame = 29
#const dthrow_damage_info = Grab|4|80|68|-80

#const bthrow_IASA = 54
#const bthrow_throwFrame = 26
#const bthrow_damage_info = Grab|11|15|135|-45

#const uthrow_IASA = 57
#const uthrow_throwFrame = 35
#const uthrow_damage_info = Grab|10|105|40|90

// NAir
#const nair_IASA = 35
#const nair_xOffset = -5.17
#const nair_yOffset = 2.54
#const nair_xRange = 7.09
#const nair_yRange = 7.53
#const nair_hitFrame = 4
#const nair_lastHitFrame = 23
#const nair_damage_info = NAir|11|25|100|361

// FAir
#const fair_IASA = 39
#const fair_xOffset = 2.74
#const fair_yOffset = 1.98
#const fair_xRange = 6.64
#const fair_yRange = 6.64
#const fair_hitFrame = 8
#const fair_lastHitFrame = 21
#const fair_damage_info = FAir|3|24|108|361

// BAir
#const bair_IASA = 35
#const bair_xOffset = -11.82
#const bair_yOffset = 3.03
#const bair_xRange = 7.15
#const bair_yRange = 5.21
#const bair_hitFrame = 10
#const bair_lastHitFrame = 18
#const bair_damage_info = BAir|16|16|109|-361

// UAir
#const uair_IASA = 41
#const uair_xOffset = -8.96
#const uair_yOffset = -0.19
#const uair_xRange = 9.72
#const uair_yRange = 7.47
#const uair_hitFrame = 8
#const uair_lastHitFrame = 11
#const uair_damage_info = UAir|13|13|118|85

// DAir
#const dair_IASA = 37
#const dair_xOffset = -4.89
#const dair_yOffset = 5.65
#const dair_xRange = 5.34
#const dair_yRange = 5.38
#const dair_hitFrame = 5
#const dair_lastHitFrame = 13
#const dair_damage_info = DAir|14|40|90|270
