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
#const jab123_IASA = 22
#const jab123_xOffset = -1.00
#const jab123_yOffset = -8
#const jab123_xRange = 8
#const jab123_yRange = 4.5
#const jab123_hitFrame = 2
#const jab123_lastHitFrame = 5
#const jab123_damage_info = Jab123|3|w20|100|80

#const mv_jab123_2 = 1
#const jab123_2_IASA = 21
#const jab123_2_xOffset = 1.00
#const jab123_2_yOffset = -8
#const jab123_2_xRange = 9.5
#const jab123_2_yRange = 4
#const jab123_2_hitFrame = 4
#const jab123_2_lastHitFrame = 7
#const jab123_2_damage_info = Jab123|2|w20|100|80

#const mv_jab123_3 = 2
#const jab123_3_IASA = 41
#const jab123_3_xOffset = 3.00
#const jab123_3_yOffset = -8
#const jab123_3_xRange = 10
#const jab123_3_yRange = 6
#const jab123_3_hitFrame = 5
#const jab123_3_lastHitFrame = 12
#const jab123_3_damage_info = Jab123|7|10|70|70

// dashattack
#const dashattack_IASA = 40
#const dashattack_xOffset = 13.00
#const dashattack_yOffset = -4
#const dashattack_xRange = 14
#const dashattack_yRange = 7
#const dashattack_hitFrame = 6
#const dashattack_lastHitFrame = 16
#const dashattack_damage_info = DashAttack|10|30|70|361

// ftilt
#const ftilt_IASA = 37
#const ftilt_xOffset = 3.00
#const ftilt_yOffset = -3
#const ftilt_xRange = 11.5
#const ftilt_yRange = 9
#const ftilt_hitFrame = 8
#const ftilt_lastHitFrame = 11
#const ftilt_damage_info = FTilt|10|10|100|361

// utilt
#const utilt_IASA = 46
#const utilt_xOffset = 0.00
#const utilt_yOffset = 5
#const utilt_xRange = 13.5
#const utilt_yRange = 20
#const utilt_hitFrame = 16
#const utilt_lastHitFrame = 21
#const utilt_damage_info = UTilt|13|40|80|361

// dtilt
#const dtilt_IASA = 36
#const dtilt_xOffset = 2.00
#const dtilt_yOffset = 1
#const dtilt_xRange = 13.5
#const dtilt_yRange = 8
#const dtilt_hitFrame = 10
#const dtilt_lastHitFrame = 15
#const dtilt_damage_info = DTilt|10|25|75|80

// fsmash
#const fsmash_IASA = 66
#const fsmash_xOffset = 5.00
#const fsmash_yOffset = -7
#const fsmash_xRange = 16.5
#const fsmash_yRange = 5
#const fsmash_hitFrame = 6
#const fsmash_lastHitFrame = 10
#const fsmash_damage_info = FSmash|17|20|100|361

// usmash
#const usmash_IASA = 63
#const usmash_xOffset = -4.00
#const usmash_yOffset = -3
#const usmash_xRange = 9.5
#const usmash_yRange = 18
#const usmash_hitFrame = 13
#const usmash_lastHitFrame = 21
#const usmash_damage_info = USmash|13|30|128|83

// dsmash
#const dsmash_IASA = 61
#const dsmash_xOffset = -28.00
#const dsmash_yOffset = -1
#const dsmash_xRange = 25
#const dsmash_yRange = 11
#const dsmash_hitFrame = 7
#const dsmash_lastHitFrame = 20
#const dsmash_damage_info = DSmash|16|30|100|361

// NAir
#const nair_IASA = 55
#const nair_xOffset = -3.00
#const nair_yOffset = -2
#const nair_xRange = 11.5
#const nair_yRange = 10
#const nair_hitFrame = 6
#const nair_lastHitFrame = 29
#const nair_damage_info = NAir|7|40|100|361

// FAir
#const fair_IASA = 46
#const fair_xOffset = -8.00
#const fair_yOffset = -2
#const fair_xRange = 11.5
#const fair_yRange = 6.5
#const fair_hitFrame = 13
#const fair_lastHitFrame = 30
#const fair_damage_info = FAir|10|20|100|361

// BAir
#const bair_IASA = 40
#const bair_xOffset = -19.00
#const bair_yOffset = -3
#const bair_xRange = 8.5
#const bair_yRange = 7
#const bair_hitFrame = 9
#const bair_lastHitFrame = 17
#const bair_damage_info = BAir|12|20|100|361

// UAir
#const uair_IASA = 34
#const uair_xOffset = -18.00
#const uair_yOffset = -8
#const uair_xRange = 18.5
#const uair_yRange = 13.5
#const uair_hitFrame = 5
#const uair_lastHitFrame = 13
#const uair_damage_info = UAir|13|10|100|361

// DAir
#const dair_IASA = 55
#const dair_xOffset = -5.00
#const dair_yOffset = 11
#const dair_xRange = 6.5
#const dair_yRange = 14.5
#const dair_hitFrame = 15
#const dair_lastHitFrame = 20
#const dair_damage_info = DAir|14|40|100|270
