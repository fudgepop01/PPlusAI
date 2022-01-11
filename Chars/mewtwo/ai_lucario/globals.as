#const DIRY_ABOVE = 14
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 25
#const cs_djumpHeight = 36
#const cs_wavedashDist = 35

#const cs_dashForceTurnFrame = 17
#const cs_dashDanceMinFrames = 8

#const pt_jumpiness = 0.1
#const pt_djumpiness = 0.04
#const pt_aggression = 1.5
#const pt_bait_dashAwayChance = 0.05
#const pt_bait_wdashAwayChance = 0.45
#const pt_wall_chance = 0.4
#const pt_platChance = 0.1
#const pt_baitChance = 0.75
#const pt_braveChance = 0.65
#const pt_circlecampChancce = 0.15

// the following is the data that I give the AI that allows it to determine
// where it should be before performing an attack.
// it will attempt to a point with these parameters in
// 1.as, and if it does, it'll perform the action provided

// this works because it's used exclusively in 1.as and aerial attacks
// where it's used IMMEDIATELY before being modified
#let shouldFastFall = var2

// function stuff
/// recovery
#const recovery_moves = uspecial|sspecial

#const uspecial_subaction_check = !(Equal CurrSubaction hex(0x1D6)) && !(Equal CurrSubaction hex(0x1D7))
#const uspecial_recovery_info = common|60

#const sspecial_subaction_check = !(Equal CurrSubaction hex(0x1D4)) && !(Equal CurrSubaction hex(0x1D5))
#const sspecial_recovery_info = custom

// jab123
#const jab123_IASA = 17
#const jab123_xOffset = 3.3
#const jab123_yOffset = -5.29
#const jab123_xRange = 6.78
#const jab123_yRange = 5.1
#const jab123_hitFrame = 8
#const jab123_lastHitFrame = 9
#const jab123_damage_info = Jab123|6|w35|100|83

// dashattack
#const dashattack_IASA = 37
#const dashattack_xOffset = 6.15
#const dashattack_yOffset = -3.82
#const dashattack_xRange = 11.44
#const dashattack_yRange = 4.68
#const dashattack_hitFrame = 10
#const dashattack_lastHitFrame = 14
#const dashattack_damage_info = DashAttack|9|80|60|80

#const mv_dashattack_weak = 1
#const dashattack_weak_xOffset = 11.79
#const dashattack_weak_yOffset = -3.76
#const dashattack_weak_xRange = 13.15
#const dashattack_weak_yRange = 4.75
#const dashattack_weak_hitFrame = 15
#const dashattack_weak_lastHitFrame = 29
#const dashattack_weak_damage_info = DashAttack|6|40|60|80

// ftilt
#const ftilt_IASA = 28
#const ftilt_xOffset = 5.35
#const ftilt_yOffset = -2.93
#const ftilt_xRange = 6.89
#const ftilt_yRange = 4.71
#const ftilt_hitFrame = 6
#const ftilt_lastHitFrame = 8
#const ftilt_damage_info = FTilt|8|10|100|361

// utilt
#const utilt_IASA = 27
#const utilt_xOffset = -1.73
#const utilt_yOffset = -0.72
#const utilt_xRange = 10.93
#const utilt_yRange = 7.9
#const utilt_hitFrame = 6
#const utilt_lastHitFrame = 6
#const utilt_damage_info = UTilt|8|25|134|85

#const mv_utilt_late = 1
#const utilt_late_xOffset = -17.06
#const utilt_late_yOffset = -0.72
#const utilt_late_xRange = 19.16
#const utilt_late_yRange = 17.31
#const utilt_late_hitFrame = 7
#const utilt_late_lastHitFrame = 13
#const utilt_late_damage_info = UTilt|8|25|134|78

// dtilt
#const dtilt_IASA = 19
#const dtilt_xOffset = 3.11
#const dtilt_yOffset = 0.54
#const dtilt_xRange = 10.75
#const dtilt_yRange = 4.43
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 7
#const dtilt_damage_info = DTilt|8|40|80|80

// fsmash, 4
#const fsmash_IASA = 52
#const fsmash_xOffset = 19.43
#const fsmash_yOffset = -2.97
#const fsmash_xRange = 6
#const fsmash_yRange = 6
#const fsmash_hitFrame = 5
#const fsmash_lastHitFrame = 8
#const fsmash_damage_info = FSmash|20|30|80|361

#const mv_fsmash_weak = 1
#const fsmash_weak_xOffset = 6.27
#const fsmash_weak_yOffset = -3.92
#const fsmash_weak_xRange = 3.92
#const fsmash_weak_yRange = 3.92
#const fsmash_weak_hitFrame = 5
#const fsmash_weak_lastHitFrame = 8
#const fsmash_weak_damage_info = FSmash|12|30|80|361

// usmash, 3
#const usmash_IASA = 62
#const usmash_xOffset = -13.53
#const usmash_yOffset = -4.9
#const usmash_xRange = 13.53
#const usmash_yRange = 11.87
#const usmash_hitFrame = 32
#const usmash_lastHitFrame = 33
#const usmash_damage_info = USmash|10|40|118|90

// dsmash, 3
#const dsmash_IASA = 43
#const dsmash_xOffset = 6.81
#const dsmash_yOffset = 4.13
#const dsmash_xRange = 6.86
#const dsmash_yRange = 6.86
#const dsmash_hitFrame = 4
#const dsmash_lastHitFrame = 14
#const dsmash_damage_info = DSmash|17|30|103|361

// noochB
// #const nspecial_IASA = 80
// #const nspecial_xOffset = 5
// #const nspecial_yOffset = 5
// #const nspecial_xRange = 10
// #const nspecial_yRange = 1
// #const nspecial_hitFrame = 20
// #const nspecial_lastHitFrame = 30
// #const nspecial_damage_info = NSpecial|3|0|0|0

// #const nspecialair_IASA = 80
// #const nspecialair_xOffset = 5
// #const nspecialair_yOffset = 5
// #const nspecialair_xRange = 80
// #const nspecialair_yRange = 10
// #const nspecialair_hitFrame = 13
// #const nspecialair_lastHitFrame = 30
// #const nspecialair_damage_info = NSpecialAir|3|0|0|0

// upB
#const uspecial_IASA = 9999.9999
#const uspecial_xOffset = -8.5
#const uspecial_yOffset = 0
#const uspecial_xRange = 8
#const uspecial_yRange = 8
#const uspecial_hitFrame = 44
#const uspecial_lastHitFrame = 66
// #const uspecial_damage_info = USpecial|16|80|60|80

// downB
#const dspecial_IASA = 41
#const dspecial_xOffset = 3.71
#const dspecial_yOffset = -9.58
#const dspecial_xRange = 11.95
#const dspecial_yRange = 3.5
#const dspecial_hitFrame = 15
#const dspecial_lastHitFrame = 21
#const dspecial_damage_info = DSpecial|1|w64|100|361

// sideB
#const sspecial_IASA = 48
#const sspecial_xOffset = 8.92
#const sspecial_yOffset = -13.5
#const sspecial_xRange = 6.37
#const sspecial_yRange = 7.95
#const sspecial_hitFrame = 12
#const sspecial_lastHitFrame = 13
#const sspecial_damage_info = SSpecial|10|65|64|87

#const sspecialair_IASA = 48
#const sspecialair_xOffset = 8.92
#const sspecialair_yOffset = -13.5
#const sspecialair_xRange = 6.37
#const sspecialair_yRange = 7.95
#const sspecialair_hitFrame = 12
#const sspecialair_lastHitFrame = 13
#const sspecialair_damage_info = SSpecialAir|10|65|64|87
// #const sspecialair_damage_info = SSpecialAir|7|72|38|270

// grab
#const grab_IASA = 29
#const grab_xOffset = 1.21
#const grab_yOffset = -2.92
#const grab_xRange = 6.63
#const grab_yRange = 6.16
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 97
#const fthrow_throwFrame = 70
#const fthrow_damage_info = Grab|8|70|80|45

#const dthrow_IASA = 51
#const dthrow_throwFrame = 24
#const dthrow_damage_info = Grab|6|65|50|69

#const bthrow_IASA = 51
#const bthrow_throwFrame = 28
#const bthrow_damage_info = Grab|11|70|80|-45

#const uthrow_IASA = 71
#const uthrow_throwFrame = 41
#const uthrow_damage_info = Grab|12|100|67|90

// NAir
#const nair_IASA = 41
#const nair_xOffset = -12.95
#const nair_yOffset = 3.97
#const nair_xRange = 11
#const nair_yRange = 11
#const nair_hitFrame = 37
#const nair_lastHitFrame = 38
#const nair_damage_info = NAir|4|70|80|361

#const mv_nair_multihit = 1
#const nair_multihit_xOffset = -12.95
#const nair_multihit_yOffset = 3.97
#const nair_multihit_xRange = 11
#const nair_multihit_yRange = 11
#const nair_multihit_hitFrame = 5
#const nair_multihit_lastHitFrame = 38
#const nair_multihit_damage_info = NAir|1|w40|100|110

// FAir
#const fair_IASA = 36
#const fair_xOffset = 2.3
#const fair_yOffset = 2.42
#const fair_xRange = 6.22
#const fair_yRange = 6.35
#const fair_hitFrame = 6
#const fair_lastHitFrame = 8
#const fair_damage_info = FAir|14|40|100|84

// BAir
#const bair_IASA = 29
#const bair_xOffset = -24.03
#const bair_yOffset = 5.62
#const bair_xRange = 10.73
#const bair_yRange = 14.13
#const bair_hitFrame = 8
#const bair_lastHitFrame = 11
#const bair_damage_info = BAir|13|20|100|361

// UAir
#const uair_IASA = 29
#const uair_xOffset = -4.93
#const uair_yOffset = -4.01
#const uair_xRange = 12.84
#const uair_yRange = 10.87
#const uair_hitFrame = 8
#const uair_lastHitFrame = 9
#const uair_damage_info = UAir|12|0|100|55

#const mv_uair_late = 1
#const uair_late_xOffset = -22.91
#const uair_late_yOffset = -6.86
#const uair_late_xRange = 19.04
#const uair_late_yRange = 11.67
#const uair_late_hitFrame = 10
#const uair_late_lastHitFrame = 12
#const uair_late_damage_info = UAir|11|0|100|65

// DAir
#const dair_IASA = 43
#const dair_xOffset = -5.71
#const dair_yOffset = 12.15
#const dair_xRange = 7.13
#const dair_yRange = 10.9
#const dair_hitFrame = 15
#const dair_lastHitFrame = 19
#const dair_damage_info = DAir|15|20|100|270