#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 18.48
#const cs_jumpHeight = 44.26
#const cs_djumpHeight = 24.9
#const cs_wavedashDist = 20

#const pt_jumpiness = 0.4
#const pt_djumpiness = 0.3
#const pt_aggression = 1.25
#const pt_bait_dashAwayChance = 0.6
#const pt_bait_wdashAwayChance = 0.2
#const pt_wall_chance = 1.25
#const pt_platChance = 0.23
#const pt_baitChance = 1.01
#const pt_braveChance = 0.7
#const pt_circleCampChance = 0.25

#const cs_dashForceTurnFrame = 8
#const cs_dashDanceMinFrames = 3
#const cs_recoveryDistX = 70
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
#const jab123_IASA = 30
#const jab123_xOffset = 0.39
#const jab123_yOffset = -0.4
#const jab123_xRange = 12.63
#const jab123_yRange = 14.85
#const jab123_hitFrame = 5
#const jab123_lastHitFrame = 9
#const jab123_damage_info = Jab123|9|65|85|75

// dashattack
#const dashattack_IASA = 36
#const dashattack_xOffset = 6.88
#const dashattack_yOffset = -2.2
#const dashattack_xRange = 15.38
#const dashattack_yRange = 5.5
#const dashattack_hitFrame = 9
#const dashattack_lastHitFrame = 19
#const dashattack_damage_info = DashAttack|11|45|80|361

// ftilt
#const ftilt_IASA = 30
#const ftilt_xOffset = 9.31
#const ftilt_yOffset = 0.1
#const ftilt_xRange = 12.97
#const ftilt_yRange = 10.95
#const ftilt_hitFrame = 9
#const ftilt_lastHitFrame = 12
#const ftilt_damage_info = FTilt|12|35|100|361

// utilt
#const utilt_IASA = 33
#const utilt_xOffset = -7.87
#const utilt_yOffset = -4.35
#const utilt_xRange = 10.21
#const utilt_yRange = 15.38
#const utilt_hitFrame = 8
#const utilt_lastHitFrame = 20
#const utilt_damage_info = UTilt|10|64|85|96

// dtilt
#const dtilt_IASA = 34
#const dtilt_xOffset = 4.71
#const dtilt_yOffset = 5
#const dtilt_xRange = 14.32
#const dtilt_yRange = 8.41
#const dtilt_hitFrame = 8
#const dtilt_lastHitFrame = 14
#const dtilt_damage_info = DTilt|10|35|100|75

#const mv_dtilt_sweetspot = 1
#const dtilt_sweetspot_xOffset = 19.41
#const dtilt_sweetspot_yOffset = 5
#const dtilt_sweetspot_xRange = 6.97
#const dtilt_sweetspot_yRange = 6.16
#const dtilt_sweetspot_hitFrame = 8
#const dtilt_sweetspot_lastHitFrame = 14
#const dtilt_sweetspot_damage_info = DTilt|12|30|90|45

// fsmash
#const fsmash_IASA = 55
#const fsmash_xOffset = 11
#const fsmash_yOffset = 0.34
#const fsmash_xRange = 13.83
#const fsmash_yRange = 9.44
#const fsmash_hitFrame = 10
#const fsmash_lastHitFrame = 15
#const fsmash_damage_info = FSmash|22|40|91|35

// usmash
#const usmash_IASA = 45
#const usmash_xOffset = -10.71
#const usmash_yOffset = -2.35
#const usmash_xRange = 16.09
#const usmash_yRange = 17.64
#const usmash_hitFrame = 2
#const usmash_lastHitFrame = 16
#const usmash_damage_info = USmash|11|60|90|83

// dsmash
#const dsmash_IASA = 39
#const dsmash_xOffset = -19.5
#const dsmash_yOffset = 2.9
#const dsmash_xRange = 21
#const dsmash_yRange = 7.2
#const dsmash_hitFrame = 12
#const dsmash_lastHitFrame = 16
#const dsmash_damage_info = DSmash|14|45|70|89

// noochB
#const nspecial_IASA = 68
#const nspecial_xOffset = 10.34
#const nspecial_yOffset = 1
#const nspecial_xRange = 28.13
#const nspecial_yRange = 6
#const nspecial_hitFrame = 22
#const nspecial_lastHitFrame = 35
#const nspecial_damage_info = NSpecial|18|50|82|361

#const nspecialair_IASA = 78
#const nspecialair_xOffset = -1.41
#const nspecialair_yOffset = 18.34
#const nspecialair_xRange = 8
#const nspecialair_yRange = 10
#const nspecialair_hitFrame = 77
#const nspecialair_lastHitFrame = 77
#const nspecialair_damage_info = NSpecialAir|15|50|95|55

// upB
#const uspecial_IASA = 63
#const uspecial_xOffset = -9.5
#const uspecial_yOffset = 2
#const uspecial_xRange = 11.75
#const uspecial_yRange = 37.36
#const uspecial_hitFrame = 4
#const uspecial_lastHitFrame = 30
#const uspecial_damage_info = USpecial|11|70|75|50

#const uspecialair_IASA = 63
#const uspecialair_xOffset = -8.68
#const uspecialair_yOffset = 2
#const uspecialair_xRange = 10.97
#const uspecialair_yRange = 38.37
#const uspecialair_hitFrame = 9
#const uspecialair_lastHitFrame = 30
#const uspecialair_damage_info = USpecialAir|12|70|95|90

// downB
// TODO - JUMP

// sideB
#const sspecial_IASA = 59
#const sspecial_xOffset = -3
#const sspecial_yOffset = 1.25
#const sspecial_xRange = 15
#const sspecial_yRange = 14.25
#const sspecial_hitFrame = 21
#const sspecial_lastHitFrame = 33
#const sspecial_damage_info = SSpecial|13|20|80|40

#const sspecialair_IASA = 59
#const sspecialair_xOffset = -3
#const sspecialair_yOffset = 1.25
#const sspecialair_xRange = 15
#const sspecialair_yRange = 14.25
#const sspecialair_hitFrame = 21
#const sspecialair_lastHitFrame = 33
#const sspecialair_damage_info = SSpecialAir|13|20|80|40

// grab
#const grab_IASA = 30
#const grab_xOffset = 3.49
#const grab_yOffset = -4
#const grab_xRange = 8.96
#const grab_yRange = 4
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 45
#const fthrow_throwFrame = 23
#const fthrow_damage_info = Grab|10|90|60|48

#const dthrow_IASA = 75
#const dthrow_throwFrame = 51
#const dthrow_damage_info = Grab|2|80|0|280

#const bthrow_IASA = 37
#const bthrow_throwFrame = 15
#const bthrow_damage_info = Grab|10|85|30|-60

#const uthrow_IASA = 112
#const uthrow_throwFrame = 85
#const uthrow_damage_info = Grab|4|99|155|60

// NAir
#const nair_IASA = 41
#const nair_xOffset = -28.81
#const nair_yOffset = 18.36
#const nair_xRange = 24.21
#const nair_yRange = 18.27
#const nair_hitFrame = 16
#const nair_lastHitFrame = 25
#const nair_damage_info = NAir|9|30|100|60

#const mv_nair_start = 1
#const nair_start_xOffset = -29.93
#const nair_start_yOffset = -3.58
#const nair_start_xRange = 21.02
#const nair_start_yRange = 11.66
#const nair_start_hitFrame = 5
#const nair_start_lastHitFrame = 11
#const nair_start_damage_info = NAir|11|40|90|80

#const mv_nair_mid = 2
#const nair_mid_xOffset = -10.8
#const nair_mid_yOffset = 3.63
#const nair_mid_xRange = 14.84
#const nair_mid_yRange = 15.26
#const nair_mid_hitFrame = 12
#const nair_mid_lastHitFrame = 15
#const nair_mid_damage_info = NAir|13|35|100|60

// FAir
#const fair_IASA = 36
#const fair_xOffset = -1.89
#const fair_yOffset = 4.88
#const fair_xRange = 11.61
#const fair_yRange = 8.21
#const fair_hitFrame = 10
#const fair_lastHitFrame = 15
#const fair_damage_info = FAir|16|40|100|60

// BAir
#const bair_IASA = 37
#const bair_xOffset = -29.91
#const bair_yOffset = 5.91
#const bair_xRange = 16.95
#const bair_yRange = 9.13
#const bair_hitFrame = 9
#const bair_lastHitFrame = 14
#const bair_damage_info = BAir|15|20|100|-361

// UAir
#const uair_IASA = 33
#const uair_xOffset = -7.46
#const uair_yOffset = -3.76
#const uair_xRange = 7.57
#const uair_yRange = 13.27
#const uair_hitFrame = 10
#const uair_lastHitFrame = 15
#const uair_damage_info = UAir|13|20|100|85

// DAir
#const dair_IASA = 40
#const dair_xOffset = -6.73
#const dair_yOffset = 10.01
#const dair_xRange = 7.98
#const dair_yRange = 9.34
#const dair_hitFrame = 13
#const dair_lastHitFrame = 17
#const dair_damage_info = DAir|15|20|112|270