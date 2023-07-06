#const DIRY_ABOVE = 8
#const DIRY_BELOW_AIR = 1
#const DIRY_BELOW_GROUND = -1
#const DIRX_FRONT = 4
#const DIRX_BACK = -3

#const cs_shortHopHeight = 10.31
#const cs_jumpHeight = 35.57
#const cs_djumpHeight = 35.57
#const cs_wavedashDist = 20

#const pt_jumpiness = 0.2
#const pt_djumpiness = 0.15
#const pt_aggression = 10.00
#const pt_bait_dashAwayChance = 0.3
#const pt_bait_wdashAwayChance = 0.5
#const pt_wall_chance = 0.6
#const pt_platChance = 0.23
#const pt_baitChance = 1.01
#const pt_braveChance = 0.45
#const pt_circleCampChance = 0.45

#const cs_dashForceTurnFrame = 10
#const cs_dashDanceMinFrames = 3
#const cs_recoveryDistX = 40
#const cs_recoveryDistY = -20

#const SFALL_ACTIONS = Equal CurrAction hex(0x10)

// jab123
#const jab123_IASA = 16
#const jab123_xOffset = 5.00
#const jab123_yOffset = -4
#const jab123_xRange = 9
#const jab123_yRange = 4.5
#const jab123_hitFrame = 1
#const jab123_lastHitFrame = 3
#const jab123_damage_info = Jab123|3|w11|100|361

#const mv_jab123_2 = 1
#const jab123_2_IASA = 18
#const jab123_2_xOffset = 4.00
#const jab123_2_yOffset = -4
#const jab123_2_xRange = 9
#const jab123_2_yRange = 4
#const jab123_2_hitFrame = 1
#const jab123_2_lastHitFrame = 3
#const jab123_2_damage_info = Jab123|2|w10|100|361

#const mv_jab123_3 = 2
#const jab123_3_IASA = 40
#const jab123_3_xOffset = 3.00
#const jab123_3_yOffset = -7
#const jab123_3_xRange = 10
#const jab123_3_yRange = 6.5
#const jab123_3_hitFrame = 5
#const jab123_3_lastHitFrame = 10
#const jab123_3_damage_info = Jab123|4|30|90|361

// dashattack
#const dashattack_IASA = 54
#const dashattack_xOffset = 7.00
#const dashattack_yOffset = 2
#const dashattack_xRange = 18
#const dashattack_yRange = 4
#const dashattack_hitFrame = 5
#const dashattack_lastHitFrame = 25
#const dashattack_damage_info = DashAttack|9|70|50|110

// ftilt
#const ftilt_IASA = 33
#const ftilt_xOffset = 8.00
#const ftilt_yOffset = -5
#const ftilt_xRange = 9
#const ftilt_yRange = 5
#const ftilt_hitFrame = 4
#const ftilt_lastHitFrame = 7
#const ftilt_damage_info = FTilt|10|6|100|361

// utilt
#const utilt_IASA = 31
#const utilt_xOffset = -2.00
#const utilt_yOffset = -3
#const utilt_xRange = 9
#const utilt_yRange = 14
#const utilt_hitFrame = 4
#const utilt_lastHitFrame = 11
#const utilt_damage_info = UTilt|7|28|130|96

// dtilt
#const dtilt_IASA = 35
#const dtilt_xOffset = 4.00
#const dtilt_yOffset = 0
#const dtilt_xRange = 8.5
#const dtilt_yRange = 4.5
#const dtilt_hitFrame = 4
#const dtilt_lastHitFrame = 7
#const dtilt_damage_info = DTilt|7|20|80|80

// fsmash
#const fsmash_IASA = 58
#const fsmash_xOffset = 12.00
#const fsmash_yOffset = -5
#const fsmash_xRange = 9.5
#const fsmash_yRange = 5
#const fsmash_hitFrame = 9
#const fsmash_lastHitFrame = 14
#const fsmash_damage_info = FSmash|15|25|100|361

// usmash
#const usmash_IASA = 41
#const usmash_xOffset = -19.00
#const usmash_yOffset = -5
#const usmash_xRange = 18
#const usmash_yRange = 12.5
#const usmash_hitFrame = 2
#const usmash_lastHitFrame = 8
#const usmash_damage_info = USmash|14|32|97|83

// dsmash
#const dsmash_IASA = 39
#const dsmash_xOffset = -16.00
#const dsmash_yOffset = 2
#const dsmash_xRange = 16
#const dsmash_yRange = 5
#const dsmash_hitFrame = 2
#const dsmash_lastHitFrame = 12
#const dsmash_damage_info = DSmash|15|30|90|361

// NAir
#const nair_IASA = 46
#const nair_xOffset = -7.00
#const nair_yOffset = 0
#const nair_xRange = 9
#const nair_yRange = 6.5
#const nair_hitFrame = 2
#const nair_lastHitFrame = 30
#const nair_damage_info = NAir|12|20|100|361

// FAir
#const fair_IASA = 76
#const fair_xOffset = -2.00
#const fair_yOffset = 0
#const fair_xRange = 10.5
#const fair_yRange = 12.5
#const fair_hitFrame = 16
#const fair_lastHitFrame = 23
#const fair_damage_info = FAir|13|20|100|60

// BAir
#const bair_IASA = 46
#const bair_xOffset = 3.00
#const bair_yOffset = 0
#const bair_xRange = -9
#const bair_yRange = 6
#const bair_hitFrame = 5
#const bair_lastHitFrame = 12
#const bair_damage_info = BAir|11|10|100|361

// UAir
#const uair_IASA = 34
#const uair_xOffset = -13.00
#const uair_yOffset = -8
#const uair_xRange = 12.5
#const uair_yRange = 11.5
#const uair_hitFrame = 3
#const uair_lastHitFrame = 9
#const uair_damage_info = UAir|11|0|100|55

// DAir
#const dair_IASA = 45
#const dair_xOffset = -11.00
#const dair_yOffset = 6
#const dair_xRange = 11
#const dair_yRange = 11.5
#const dair_hitFrame = 4
#const dair_lastHitFrame = 25
#const dair_damage_info = DAir|7|80|80|75
