#const DIRY_ABOVE = 15
#const DIRY_BELOW_AIR = 3
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 17.51
#const cs_jumpHeight = 40.04
#const cs_djumpHeight = 28.93
#const cs_wavedashDist = 37
#const cs_recoveryDistX = 110
#const cs_recoveryDistY = -50

#const cs_dashForceTurnFrame = 9
#const cs_dashDanceMinFrames = 4

#const _pt_aggression = 1.4
#const _pt_bait_dashAwayChance = 0.55
#const _pt_bait_wdashAwayChance = 0.15
#const _pt_baitChance = 0.9
#const _pt_braveChance = 0.65
#const _pt_circleCampChance = 0.45
#const _pt_djumpiness = 0.02
#const _pt_jumpiness = 0.05
#const _pt_platChance = 0.25
#const _pt_wall_chance = 0.4

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

//=========================================
// RECOVERY ACTIONS MOVED TO RECOVERY HUB
//=========================================

// jab123
#const jab123_IASA = 16
#const jab123_xOffset = 2.15
#const jab123_yOffset = -1.84
#const jab123_xRange = 7.43
#const jab123_yRange = 3.28
#const jab123_hitFrame = 3
#const jab123_lastHitFrame = 4
#const jab123_damage_info = Jab123|3|w20|100|80

#const mv_jab123_2 = 1
#const jab123_2_IASA = 22
#const jab123_2_xOffset = 3.5
#const jab123_2_yOffset = 0.26
#const jab123_2_xRange = 7.08
#const jab123_2_yRange = 4.22
#const jab123_2_hitFrame = 10
#const jab123_2_lastHitFrame = 11
#const jab123_2_damage_info = Jab123|2|w20|100|85

#const mv_jab123_3 = 1
#const jab123_3_IASA = 38
#const jab123_3_xOffset = 7.36
#const jab123_3_yOffset = -3.51
#const jab123_3_xRange = 6.23
#const jab123_3_yRange = 3.45
#const jab123_3_hitFrame = 22
#const jab123_3_lastHitFrame = 23
#const jab123_3_damage_info = Jab123|4|25|100|361

// dashattack
#const dashattack_IASA = 38
#const dashattack_xOffset = 6.63
#const dashattack_yOffset = -2.22
#const dashattack_xRange = 9.49
#const dashattack_yRange = 6.72
#const dashattack_hitFrame = 7
#const dashattack_lastHitFrame = 11
#const dashattack_damage_info = DashAttack|9|55|80|75

#const mv_dashattack_late = 1
#const dashattack_late_xOffset = 16.6
#const dashattack_late_yOffset = -1.22
#const dashattack_late_xRange = 13.69
#const dashattack_late_yRange = 7.35
#const dashattack_late_hitFrame = 12
#const dashattack_late_lastHitFrame = 22
#const dashattack_late_damage_info = DashAttack|5|35|80|90

// ftilt
#const ftilt_IASA = 39
#const ftilt_xOffset = 4.29
#const ftilt_yOffset = -1.92
#const ftilt_xRange = 5.89
#const ftilt_yRange = 4.24
#const ftilt_hitFrame = 10
#const ftilt_lastHitFrame = 13
#const ftilt_damage_info = FTilt|9|10|100|361

#const mv_ftilt_strong = 1
#const ftilt_strong_xOffset = 13.7
#const ftilt_strong_yOffset = -1.86
#const ftilt_strong_xRange = 4.25
#const ftilt_strong_yRange = 5.38
#const ftilt_strong_hitFrame = 10
#const ftilt_strong_lastHitFrame = 13
#const ftilt_strong_damage_info = FTilt|12|10|100|361

// utilt
#const utilt_IASA = 30
#const utilt_xOffset = -7.44
#const utilt_yOffset = -4.44
#const utilt_xRange = 9.85
#const utilt_yRange = 11.75
#const utilt_hitFrame = 6
#const utilt_lastHitFrame = 13
#const utilt_damage_info = UTilt|8|40|110|100

// dtilt
#const dtilt_IASA = 18
#const dtilt_xOffset = 4.05
#const dtilt_yOffset = -1.07
#const dtilt_xRange = 4.89
#const dtilt_yRange = 3.7
#const dtilt_hitFrame = 5
#const dtilt_lastHitFrame = 6
#const dtilt_damage_info = DTilt|8|20|75|50

#const mv_dtilt_outer = 1
#const dtilt_outer_xOffset = 13.2
#const dtilt_outer_yOffset = 0.47
#const dtilt_outer_xRange = 3.33
#const dtilt_outer_yRange = 3.37
#const dtilt_outer_hitFrame = 5
#const dtilt_outer_lastHitFrame = 6
#const dtilt_outer_damage_info = DTilt|8|20|75|361

// fsmash, 4
#const fsmash_IASA = 51
#const fsmash_xOffset = 3.22
#const fsmash_yOffset = -2.89
#const fsmash_xRange = 13.85
#const fsmash_yRange = 6.38
#const fsmash_hitFrame = 15
#const fsmash_lastHitFrame = 20
#const fsmash_damage_info = FSmash|14|40|100|361

// usmash, 3
#const usmash_IASA = 53
#const usmash_xOffset = -13.5
#const usmash_yOffset = -1.93
#const usmash_xRange = 12.78
#const usmash_yRange = 10.39
#const usmash_hitFrame = 6
#const usmash_lastHitFrame = 26
#const usmash_damage_info = USmash|11|25|117|90

// dsmash, 3
#const dsmash_IASA = 44
#const dsmash_xOffset = 1
#const dsmash_yOffset = 1.58
#const dsmash_xRange = 8.92
#const dsmash_yRange = 4.11
#const dsmash_hitFrame = 7
#const dsmash_lastHitFrame = 8
#const dsmash_damage_info = DSmash|16|40|80|361

#const mv_dsmash_hit2 = 1
#const dsmash_hit2_xOffset = -18.08
#const dsmash_hit2_yOffset = 0.61
#const dsmash_hit2_xRange = 9.18
#const dsmash_hit2_yRange = 4
#const dsmash_hit2_hitFrame = 15
#const dsmash_hit2_lastHitFrame = 18
#const dsmash_hit2_damage_info = DSmash|13|35|80|361

// noochB
#const nspecial_IASA = 39
#const nspecial_xOffset = 5
#const nspecial_yOffset = 0
#const nspecial_xRange = 60
#const nspecial_yRange = 8
#const nspecial_hitFrame = 14
#const nspecial_lastHitFrame = 30
#const nspecial_damage_info = NSpecial|-8|40|140|361

#const nspecialair_IASA = 39
#const nspecialair_xOffset = 5
#const nspecialair_yOffset = 0
#const nspecialair_xRange = 80
#const nspecialair_yRange = 8
#const nspecialair_hitFrame = 14
#const nspecialair_lastHitFrame = 30
#const nspecialair_damage_info = NSpecialAir|-8|40|140|361

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
#const dspecial_IASA = 40
#const dspecial_xOffset = -10
#const dspecial_yOffset = 80
#const dspecial_xRange = 10
#const dspecial_yRange = 40
#const dspecial_hitFrame = 19
#const dspecial_lastHitFrame = 19
#const dspecial_damage_info = DSpecial|-1|0|0|0

#const dspecialair_IASA = 40
#const dspecialair_xOffset = -10
#const dspecialair_yOffset = 80
#const dspecialair_xRange = 10
#const dspecialair_yRange = 40
#const dspecialair_hitFrame = 19
#const dspecialair_lastHitFrame = 19
#const dspecialair_damage_info = DSpecialAir|-1|0|0|0

// sideB
#const sspecial_IASA = 57
#const sspecial_xOffset = 3.492
#const sspecial_yOffset = -4.601
#const sspecial_xRange = 23.419
#const sspecial_yRange = 7.542
#const sspecial_hitFrame = 15
#const sspecial_lastHitFrame = 37
#const sspecial_damage_info = SSpecial|12|40|70|361

#const mv_sspecial_grab = 1
#const sspecial_IASA = 57
#const sspecial_xOffset = 5.420
#const sspecial_yOffset = -5.200
#const sspecial_xRange = 15.064
#const sspecial_yRange = 8.200
#const sspecial_hitFrame = 17
#const sspecial_lastHitFrame = 30
#const sspecial_damage_info = SSpecial|7|30|100|280

#const sspecialair_IASA = 107
#const sspecialair_xOffset = 3.492
#const sspecialair_yOffset = -4.601
#const sspecialair_xRange = 23.419
#const sspecialair_yRange = 7.542
#const sspecialair_hitFrame = 15
#const sspecialair_lastHitFrame = 37
#const sspecialair_damage_info = SSpecialAir|12|40|70|361

#const mv_sspecialair_grab = 1
#const sspecialair_IASA = 107
#const sspecialair_xOffset = 5.420
#const sspecialair_yOffset = -5.200
#const sspecialair_xRange = 15.064
#const sspecialair_yRange = 8.200
#const sspecialair_hitFrame = 17
#const sspecialair_lastHitFrame = 30
#const sspecialair_damage_info = SSpecialAir|7|30|100|280

// grab
#const grab_IASA = 32
#const grab_xOffset = 3
#const grab_yOffset = -3.5
#const grab_xRange = 5.75
#const grab_yRange = 3.5
#const grab_hitFrame = 7
#const grab_lastHitFrame = 7
#const grab_damage_info = Grab|0|0|0|0

#const fthrow_IASA = 29
#const fthrow_throwFrame = 11
#const fthrow_damage_info = Grab|11|65|55|45

#const dthrow_IASA = 31
#const dthrow_throwFrame = 14
#const dthrow_damage_info = Grab|3|60|105|50

#const bthrow_IASA = 28
#const bthrow_throwFrame = 11
#const bthrow_damage_info = Grab|10|55|70|45

#const uthrow_IASA = 41
#const uthrow_throwFrame = 15
#const uthrow_damage_info = Grab|7|35|105|80

// NAir
#const nair_IASA = 36
#const nair_xOffset = -10.84
#const nair_yOffset = 6.08
#const nair_xRange = 9.27
#const nair_yRange = 9.78
#const nair_hitFrame = 4
#const nair_lastHitFrame = 7
#const nair_damage_info = NAir|13|16|100|75

#const mv_nair_late = 1
#const nair_late_xOffset = -11.49
#const nair_late_yOffset = 6.96
#const nair_late_xRange = 11.37
#const nair_late_yRange = 11.76
#const nair_late_hitFrame = 8
#const nair_late_lastHitFrame = 18
#const nair_late_damage_info = NAir|9|5|100|60

// FAir
#const fair_IASA = 38
#const fair_xOffset = -0.18
#const fair_yOffset = -0.5
#const fair_xRange = 7.48
#const fair_yRange = 3.5
#const fair_hitFrame = 8
#const fair_lastHitFrame = 14
#const fair_damage_info = FAir|11|10|100|361

#const mv_fair_strong = 1
#const fair_strong_xOffset = 0.56
#const fair_strong_yOffset = -0.5
#const fair_strong_xRange = 7.11
#const fair_strong_yRange = 3.5
#const fair_strong_hitFrame = 6
#const fair_strong_lastHitFrame = 7
#const fair_strong_damage_info = FAir|15|10|100|361

// BAir
#const bair_IASA = 28
#const bair_xOffset = -20.29
#const bair_yOffset = 1.78
#const bair_xRange = 9.49
#const bair_yRange = 4.61
#const bair_hitFrame = 5
#const bair_lastHitFrame = 8
#const bair_damage_info = BAir|12|15|95|361

// UAir
#const uair_IASA = 31
#const uair_xOffset = -3.97
#const uair_yOffset = -6.41
#const uair_xRange = 9.43
#const uair_yRange = 8.9
#const uair_hitFrame = 5
#const uair_lastHitFrame = 7
#const uair_damage_info = UAir|12|20|90|361

#const mv_uair_late = 1
#const uair_late_xOffset = -12.35
#const uair_late_yOffset = -9.55
#const uair_late_xRange = 7.79
#const uair_late_yRange = 7.33
#const uair_late_hitFrame = 8
#const uair_late_lastHitFrame = 9
#const uair_late_damage_info = UAir|8|5|100|361

// DAir
#const dair_IASA = 39
#const dair_xOffset = -5.34
#const dair_yOffset = 8.05
#const dair_xRange = 5.19
#const dair_yRange = 7.78
#const dair_hitFrame = 10
#const dair_lastHitFrame = 12
#const dair_damage_info = DAir|15|30|80|270