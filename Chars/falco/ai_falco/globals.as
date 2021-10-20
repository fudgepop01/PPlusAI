#const pt_shortHopHeight = 16
#const pt_djumpHeight = 38

#const pt_bait_dashAwayChance = 0.25
#const pt_braveChance = 0.85
#const pt_baitChance = 0.8
#const pt_aggression = 0.6
#const pt_wall_chance = 0.45
#const pt_bait_wdashAwayChance = 0.15
#const pt_circleCampChance = 0.15
#const pt_jumpiness = 0.15
#const pt_djumpiness = 0.03

#const pt_dashForceTurnFrame = 9
#const pt_dashDanceMinFrames = 6

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
#const jab123_IASA = 15
#const jab123_xOffset = 7.72
#const jab123_yOffset = -4.33
#const jab123_xRange = 5.68
#const jab123_yRange = 3.59
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 3
#const jab123_damage_info = Jab123|4|0|100|70

// dashattack
#const dashattack_IASA = 35
#const dashattack_xOffset = 8.24
#const dashattack_yOffset = -3.91
#const dashattack_xRange = 5.94
#const dashattack_yRange = 4.7
#const dashattack_hitFrame = 4
#const dashattack_lastHitFrame = 7
#const dashattack_damage_info = DashAttack|9|35|90|72

#const mv_dashattack_weak = 1
#const dashattack_weak_xOffset = 12.67
#const dashattack_weak_yOffset = -3.9
#const dashattack_weak_xRange = 9.09
#const dashattack_weak_yRange = 4.7
#const dashattack_weak_hitFrame = 8
#const dashattack_weak_lastHitFrame = 17
#const dashattack_weak_damage_info = DashAttack|6|20|90|72

// ftilt
#const ftilt_IASA = 26
#const ftilt_xOffset = 0.64
#const ftilt_yOffset = -5.66
#const ftilt_xRange = 10.65
#const ftilt_yRange = 3.56
#const ftilt_hitFrame = 5
#const ftilt_lastHitFrame = 9
#const ftilt_damage_info = FTilt|9|0|100|361

// utilt
#const utilt_IASA = 22
#const utilt_xOffset = -10.36
#const utilt_yOffset = 0.66
#const utilt_xRange = 10.45
#const utilt_yRange = 11.47
#const utilt_hitFrame = 5
#const utilt_lastHitFrame = 11
#const utilt_damage_info = UTilt|9|30|120|90

// dtilt
#const dtilt_IASA = 27
#const dtilt_xOffset = 2.06
#const dtilt_yOffset = -0.27
#const dtilt_xRange = 7.93
#const dtilt_yRange = 3.13
#const dtilt_hitFrame = 7
#const dtilt_lastHitFrame = 9
#const dtilt_damage_info = DTilt|13|25|125|75

// fsmash, 4
#const fsmash_IASA = 42
#const fsmash_xOffset = 11.62
#const fsmash_yOffset = -1.21
#const fsmash_xRange = 11.42
#const fsmash_yRange = 8.98
#const fsmash_hitFrame = 13
#const fsmash_lastHitFrame = 22
#const fsmash_damage_info = FSmash|17|40|90|361

// usmash, 3
#const usmash_IASA = 46
#const usmash_xOffset = 1.16
#const usmash_yOffset = -1.07
#const usmash_xRange = 6.3
#const usmash_yRange = 11.06
#const usmash_hitFrame = 8
#const usmash_lastHitFrame = 11
#const usmash_damage_info = USmash|14|25|100|95

#const mv_usmash_back = 1
#const usmash_back_xOffset = -12.26
#const usmash_back_yOffset = -12.54
#const usmash_back_xRange = 12.27
#const usmash_back_yRange = 7.86
#const usmash_back_hitFrame = 12
#const usmash_back_lastHitFrame = 17
#const usmash_back_damage_info = USmash|12|10|100|-361

// dsmash, 3
#const dsmash_IASA = 46
#const dsmash_xOffset = -14.66
#const dsmash_yOffset = 4.08
#const dsmash_xRange = 13.37
#const dsmash_yRange = 5.19
#const dsmash_hitFrame = 7
#const dsmash_lastHitFrame = 11
#const dsmash_damage_info = DSmash|16|20|70|25

// noochB
#const nspecial_IASA = 80
#const nspecial_xOffset = 5
#const nspecial_yOffset = -1
#const nspecial_xRange = 200
#const nspecial_yRange = 1
#const nspecial_hitFrame = 20
#const nspecial_lastHitFrame = 30
#const nspecial_damage_info = NSpecial|3|0|0|0

#const nspecialair_IASA = 80
#const nspecialair_xOffset = 5
#const nspecialair_yOffset = 0
#const nspecialair_xRange = 60
#const nspecialair_yRange = 8
#const nspecialair_hitFrame = 13
#const nspecialair_lastHitFrame = 30
#const nspecialair_damage_info = NSpecialAir|3|0|0|0

#const mv_nspecial_air1 = 1
#const nspecialair_xOffset = 40
#const nspecialair_hitFrame = 15

#const mv_nspecial_air2 = 2
#const nspecialair_xOffset = 60
#const nspecialair_hitFrame = 16

#const mv_nspecial_air4 = 3
#const nspecialair_xOffset = 80
#const nspecialair_hitFrame = 17

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
#const dspecial_IASA = 5
#const dspecial_xOffset = -6
#const dspecial_yOffset = -1
#const dspecial_xRange = 6
#const dspecial_yRange = 6
#const dspecial_hitFrame = 1
#const dspecial_lastHitFrame = 1
#const dspecial_damage_info = DSpecial|8|110|50|84

#const dspecialair_IASA = 5
#const dspecialair_xOffset = -6
#const dspecialair_yOffset = -1
#const dspecialair_xRange = 6
#const dspecialair_yRange = 6
#const dspecialair_hitFrame = 1
#const dspecialair_lastHitFrame = 1
#const dspecialair_damage_info = DSpecialAir|8|110|50|84

// sideB
#const sspecial_IASA = calc(16 + 4 + 41)
#const sspecial_xOffset = -4
#const sspecial_yOffset = 0
#const sspecial_xRange = 27
#const sspecial_yRange = 4
#const sspecial_hitFrame = 17
#const sspecial_lastHitFrame = 20
// #const sspecial_damage_info = SSpecial|7|74|60|65

#const sspecialair_IASA = calc(16 + 4 + 41)
#const sspecialair_xOffset = -4
#const sspecialair_yOffset = 0
#const sspecialair_xRange = 27
#const sspecialair_yRange = 4
#const sspecialair_hitFrame = 17
#const sspecialair_lastHitFrame = 20
// #const sspecialair_damage_info = SSpecialAir|7|72|38|270

// grab
#const grab_IASA = 32
#const grab_xOffset = 2.43
#const grab_yOffset = -3.82
#const grab_xRange = 5.47
#const grab_yRange = 3.91
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_damage_info = Grab|3|35|135|45
#const dthrow_damage_info = Grab|1|150|40|270
#const bthrow_damage_info = Grab|2|80|85|56
#const uthrow_damage_info = Grab|2|75|110|90

// NAir
#const nair_IASA = 41
#const nair_xOffset = -3.45
#const nair_yOffset = -0.61
#const nair_xRange = 6.92
#const nair_yRange = 4.77
#const nair_hitFrame = 4
#const nair_lastHitFrame = 7
#const nair_damage_info = NAir|12|10|100|361

#const mv_nair_weak = 1
#const nair_weak_xOffset = -3.58
#const nair_weak_yOffset = -0.22
#const nair_weak_xRange = 7.02
#const nair_weak_yRange = 5.08
#const nair_weak_hitFrame = 8
#const nair_weak_lastHitFrame = 31
#const nair_weak_damage_info = NAir|9|0|100|361

// FAir
#const fair_IASA = 52
#const fair_xOffset = -0.02
#const fair_yOffset = -4.24
#const fair_xRange = 8.24
#const fair_yRange = 5.62
#const fair_hitFrame = 6
#const fair_lastHitFrame = 8
#const fair_damage_info = FAir|9|10|100|361

// BAir
#const bair_IASA = 37
#const bair_xOffset = -14.97
#const bair_yOffset = -1.82
#const bair_xRange = 10.2
#const bair_yRange = 7.05
#const bair_hitFrame = 4
#const bair_lastHitFrame = 7
#const bair_damage_info = BAir|9|0|100|361

#const mv_bair_weak = 1
#const bair_weak_xOffset = -14.91
#const bair_weak_yOffset = -1.52
#const bair_weak_xRange = 10.25
#const bair_weak_yRange = 7.15
#const bair_weak_hitFrame = 8
#const bair_weak_lastHitFrame = 19
#const bair_weak_damage_info = BAir|9|0|100|361

// UAir
#const uair_IASA = 35
#const uair_xOffset = -6
#const uair_yOffset = -5.9
#const uair_xRange = 4.84
#const uair_yRange = 6.15
#const uair_hitFrame = 8
#const uair_lastHitFrame = 9
#const uair_damage_info = UAir|5|30|22|90

#const mv_uair_hit2 = 1
#const uair_hit2_xOffset = -7.32
#const uair_hit2_yOffset = -6.4
#const uair_hit2_xRange = 6.92
#const uair_hit2_yRange = 8.57
#const uair_hit2_hitFrame = 11
#const uair_hit2_lastHitFrame = 14
#const uair_hit2_damage_info = UAir|10|22|120|70

// DAir
#const dair_IASA = 51
#const dair_xOffset = -5.17
#const dair_yOffset = 1.46
#const dair_xRange = 6.59
#const dair_yRange = 6.31
#const dair_hitFrame = 5
#const dair_lastHitFrame = 24
#const dair_damage_info = DAir|12|10|100|290