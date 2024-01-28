#const DIRY_ABOVE = 12
#const DIRY_BELOW_AIR = 2
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 7
#const DIRX_BACK = 0

#const pt_jumpiness = 0.1
#const pt_djumpiness = 0.04
#const pt_aggression = 1.5
#const pt_bait_dashAwayChance = 0.6
#const pt_bait_wdashAwayChance = 0.15
#const pt_wall_chance = 0.4
#const pt_platChance = 0.1
#const pt_baitChance = 0.9
#const pt_braveChance = 0.85
#const pt_circleCampChance = 0.25

#const cs_dashForceTurnFrame = 11
#const cs_dashDanceMinFrames = 4

#const cs_shortHopHeight = 17.53
#const cs_jumpHeight = 32.34
#const cs_djumpHeight = 26.19
#const cs_wavedashDist = 25
#const cs_recoveryDistX = 80
#const cs_recoveryDistY = -80

#const recovery_moves = uspecial

#const uspecial_subaction_check = !(True)
#const uspecial_recovery_info = common|0

#const SFALL_ACTIONS = Equal CurrAction hex(0x10) || Equal CurrAction hex(0x11a)
#const NSPECIAL_ACTIONS = Equal CurrAction hex(0x112) 
#const SSPECIAL_ACTIONS = Equal CurrAction hex(0x113) || Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
#const USPECIAL_ACTIONS = Equal CurrAction hex(0x114) || Equal CurrAction hex(0x119)
#const DSPECIAL_ACTIONS = !(True)

// jab123
#const jab123_IASA = 21
#const jab123_xOffset = 2
#const jab123_yOffset = -5.13
#const jab123_xRange = 9.02
#const jab123_yRange = 6.17
#const jab123_hitFrame = 9
#const jab123_lastHitFrame = 13
#const jab123_damage_info = Jab123|3|35|110|361

// dashattack
#const dashattack_IASA = 35
#const dashattack_xOffset = 9.4
#const dashattack_yOffset = -4.17
#const dashattack_xRange = 12.63
#const dashattack_yRange = 5.92
#const dashattack_hitFrame = 6
#const dashattack_lastHitFrame = 17
#const dashattack_damage_info = DashAttack|13|70|70|88

// ftilt
#const ftilt_IASA = 31
#const ftilt_xOffset = -5.15
#const ftilt_yOffset = -6.23
#const ftilt_xRange = 14.18
#const ftilt_yRange = 4.81
#const ftilt_hitFrame = 10
#const ftilt_lastHitFrame = 16
#const ftilt_damage_info = FTilt|13|50|80|110

// utilt
#const utilt_IASA = 39
#const utilt_xOffset = 0.7
#const utilt_yOffset = -4.42
#const utilt_xRange = 6.66
#const utilt_yRange = 9.25
#const utilt_hitFrame = 8
#const utilt_lastHitFrame = 11
#const utilt_damage_info = UTilt|15|40|110|75

#const mv_utilt_late = 1
#const utilt_late_xOffset = -14.57
#const utilt_late_yOffset = -0.06
#const utilt_late_xRange = 13.57
#const utilt_late_yRange = 13.04
#const utilt_late_hitFrame = 12
#const utilt_late_lastHitFrame = 28
#const utilt_late_damage_info = UTilt|13|30|120|85

// dtilt
#const dtilt_IASA = 24
#const dtilt_xOffset = -1.03
#const dtilt_yOffset = 5.04
#const dtilt_xRange = 8.92
#const dtilt_yRange = 5.95
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 8
#const dtilt_damage_info = DTilt|10|30|55|80

// fsmash
#const fsmash_IASA = 48
#const fsmash_xOffset = 1.76
#const fsmash_yOffset = -3.13
#const fsmash_xRange = 9.62
#const fsmash_yRange = 5.73
#const fsmash_hitFrame = 17
#const fsmash_lastHitFrame = 25
#const fsmash_damage_info = FSmash|13|35|120|361

// usmash
#const usmash_IASA = 51
#const usmash_xOffset = -9.57
#const usmash_yOffset = -3.95
#const usmash_xRange = 9.57
#const usmash_yRange = 9.6
#const usmash_hitFrame = 6
#const usmash_lastHitFrame = 35
#const usmash_damage_info = USmash|4|20|240|88

// dsmash
#const dsmash_IASA = 32
#const dsmash_xOffset = 4.03
#const dsmash_yOffset = 2.42
#const dsmash_xRange = 5.55
#const dsmash_yRange = 5.44
#const dsmash_hitFrame = 5
#const dsmash_lastHitFrame = 6
#const dsmash_damage_info = DSmash|12|20|90|30

#const mv_dsmash_hit2 = 1
#const dsmash_hit2_xOffset = -12.49
#const dsmash_hit2_yOffset = 0.55
#const dsmash_hit2_xRange = 6.25
#const dsmash_hit2_yRange = 5.59
#const dsmash_hit2_hitFrame = 12
#const dsmash_hit2_lastHitFrame = 15
#const dsmash_hit2_damage_info = DSmash|13|20|90|25

// noochB
#const nspecial_IASA = 57
#const nspecial_xOffset = -19.05
#const nspecial_yOffset = 0.77
#const nspecial_xRange = 19.05
#const nspecial_yRange = 8.15
#const nspecial_hitFrame = 9
#const nspecial_lastHitFrame = 24
#const nspecial_damage_info = NSpecial|4|50|130|361

#const nspecialAir_IASA = 57
#const nspecialAir_xOffset = -19.05
#const nspecialAir_yOffset = 0.77
#const nspecialAir_xRange = 19.05
#const nspecialAir_yRange = 8.15
#const nspecialAir_hitFrame = 9
#const nspecialAir_lastHitFrame = 24
#const nspecialAir_damage_info = NSpecialAir|4|50|130|361

// upB
// #const uspecial_IASA = 81
// #const uspecial_xOffset = -7.5
// #const uspecial_yOffset = 0.94
// #const uspecial_xRange = 8.5
// #const uspecial_yRange = 8.5
// #const uspecial_hitFrame = 5
// #const uspecial_lastHitFrame = 7
// #const uspecial_damage_info = USpecial|13|70|80|80

// downB
// #const dspecial_IASA = 110
// #const dspecial_xOffset = 30.6
// #const dspecial_yOffset = -44.34
// #const dspecial_xRange = 14.42
// #const dspecial_yRange = 20.79
// #const dspecial_hitFrame = 38
// #const dspecial_lastHitFrame = 40
// #const dspecial_damage_info = DSpecial|29|60|81|90

// #const dspecialair_IASA = 80
// #const dspecialair_xOffset = -20
// #const dspecialair_yOffset = -2
// #const dspecialair_xRange = 20
// #const dspecialair_yRange = 20
// #const dspecialair_hitFrame = 32
// #const dspecialair_lastHitFrame = 32
// #const dspecialair_damage_info = DSpecialAir|17|30|120|290

// #const mv_dspecialair_landing = 1
// #const dspecialair_landing_IASA = 62
// #const dspecialair_landing_xOffset = -24
// #const dspecialair_landing_yOffset = 6
// #const dspecialair_landing_xRange = 24
// #const dspecialair_landing_yRange = 12
// #const dspecialair_landing_hitFrame = 1
// #const dspecialair_landing_lastHitFrame = 2
// #const dspecialair_landing_damage_info = DSpecialAir|12|90|130|305

// sideB
#const sspecial_IASA = 50
#const sspecial_xOffset = 20
#const sspecial_yOffset = -40
#const sspecial_xRange = 80
#const sspecial_yRange = 40
#const sspecial_hitFrame = 50
#const sspecial_lastHitFrame = 50
#const sspecial_damage_info = SSpecial|-7|50|90|80

#const sspecialair_IASA = 50
#const sspecialair_xOffset = 20
#const sspecialair_yOffset = -40
#const sspecialair_xRange = 80
#const sspecialair_yRange = 40
#const sspecialair_hitFrame = 50
#const sspecialair_lastHitFrame = 50
#const sspecialair_damage_info = SSpecialAir|-7|50|90|80

// grab
// when I want to techchase using grab, i'll set move_variant to this value
#const mv_techChase = 1

#const grab_IASA = 32
#const grab_xOffset = 0
#const grab_yOffset = -4
#const grab_xRange = 7.25
#const grab_yRange = 5
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 49
#const fthrow_throwFrame = 17
#const fthrow_damage_info = Grab|10|60|50|60

#const dthrow_IASA = 64
#const dthrow_throwFrame = 48
#const dthrow_damage_info = Grab|2|80|42|-60

#const bthrow_IASA = 51
#const bthrow_throwFrame = 27
#const bthrow_damage_info = Grab|11|80|87|-45

#const uthrow_IASA = 51
#const uthrow_throwFrame = 28
#const uthrow_damage_info = Grab|8|80|66|90

// NAir
#const nair_IASA = 41
#const nair_xOffset = -11
#const nair_yOffset = 4.5
#const nair_xRange = 11
#const nair_yRange = 11
#const nair_hitFrame = 6
#const nair_lastHitFrame = 27
#const nair_damage_info = NAir|5|15|175|361

// FAir
#const fair_IASA = 35
#const fair_xOffset = 5.59
#const fair_yOffset = 1.11
#const fair_xRange = 5.69
#const fair_yRange = 5.16
#const fair_hitFrame = 8
#const fair_lastHitFrame = 11
#const fair_damage_info = FAir|19|25|100|40

#const mv_fair_weak = 1
#const fair_weak_xOffset = -2.75
#const fair_weak_yOffset = -0.59
#const fair_weak_xRange = 6.37
#const fair_weak_yRange = 4.03
#const fair_weak_hitFrame = 8
#const fair_weak_lastHitFrame = 11
#const fair_weak_damage_info = FAir|8|0|95|361


// BAir
#const bair_IASA = 32
#const bair_xOffset = -16.61
#const bair_yOffset = 0.14
#const bair_xRange = 5.84
#const bair_yRange = 5.27
#const bair_hitFrame = 5
#const bair_lastHitFrame = 8
#const bair_damage_info = BAir|18|30|105|-361

#const mv_bair_weak = 1
#const bair_weak_xOffset = -9.85
#const bair_weak_yOffset = -1.2
#const bair_weak_xRange = 6.55
#const bair_weak_yRange = 3.92
#const bair_weak_hitFrame = 5
#const bair_weak_lastHitFrame = 8
#const bair_weak_damage_info = BAir|8|0|95|-361

// UAir
#const uair_IASA = 48
#const uair_xOffset = -6
#const uair_yOffset = -2.18
#const uair_xRange = 7.5
#const uair_yRange = 13.53
#const uair_hitFrame = 10
#const uair_lastHitFrame = 17
#const uair_damage_info = UAir|17|32|105|90

// DAir
#const dair_IASA = 39
#const dair_xOffset = -2.85
#const dair_yOffset = 10.4
#const dair_xRange = 4.73
#const dair_yRange = 4.71
#const dair_hitFrame = 14
#const dair_lastHitFrame = 15
#const dair_damage_info = DAir|16|50|117|275

#const mv_dair_weak = 1
#const dair_weak_xOffset = -3.07
#const dair_weak_yOffset = 10.33
#const dair_weak_xRange = 4.86
#const dair_weak_yRange = 7.71
#const dair_weak_hitFrame = 14
#const dair_weak_lastHitFrame = 17
#const dair_weak_damage_info = DAir|9|10|85|275