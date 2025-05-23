﻿// 0x6011 = slot0 = Very Close Attacks
// 0x6012 = slot1 = Medium Range Attacks
// 0x6013 = slot2 = Close Attacks
// 0x6014 = slot3 = Ground Attacks to edgeguard with (opponent below)
// 0x6015 = slot4 = Attacks that send the opponent high up
// 0x6016 = slot5 = general edgeguard attacks (combos @ pplus)
// 0x6017 = slot6 = attacks that cover both sides
// 0x6018 = slot7 = (UNCONFIRMED) fast counterhit
// 0x6019 = slot8 = Aerial OR ground approach options
// 0x601a = slot9 = close-range defensive attacks
// 0x601b = slot10 = Block Edgeguard
// 0x601c = slot11 = Jump Aerial approach options neutral
// 0x601d = slot12 = Jump Aerial approach option front
// 0x601e = slot13 = Jump Aerial Approach option behind
// 0x601f = slot14 = Jump Aerial approach hit above
// 0x6020 = slot15 = Jump Aerial approach options below

// unsure why these exist
// 0x6021 = slot11_sp
// 0x6022 = slot12_sp
// 0x6023 = slot13_sp
// 0x6024 = slot14_sp
// 0x6025 = slot15_sp

// 0x6026 = slot16 = general moves to use in neutral
// 0x6027 = slot17 = more powerful back-sending aerials
// 0x6028 = slot18 = move-powerful up-sending aerials
// 0x6029 = slot19 = Meteor Smashes
// -- edgeguarding (1140)
// 0x602a = slot20 = (UNCONFIRMED) defensive recovery attacks
// 0x602b = slot21 = main recovery
// -- also used in act_change (0x2040)
// 0x602c = slot22 = recover from side
// 0x602d = slot23 = recover from up high

//- /*
//-   CPU types:
//-   CPUType > 5:
//-     - on idle
//-       - set script to 0
//-       - var6 = 5 to 35
//-     > else:
//-       - var6 = 0 to 8
//- 
//-   CPUType 4 to 5:
//-     - chase subroutine:
//-       - 4x as likely to not return a thing
//- 
//-   0x0: 
//-   0x1:
//-   0x2:
//-   0x3:
//-   0x4:
//-   0x5:
//-   0x6:
//-   0x7:
//-   0x8:
//-   0x9:
//-   0xA:
//-   0xB:
//-   0xC:
//-   0xD:
//-   0xE:
//-   0xF:
//-   0x10:
//-   0x11:
//-   0x12:
//-   - if snake 
//-     - disable slot 10
//-   0x13:
//-   - disable slot 7, 12
//-   0x14: 
//-   - forces dspecial usage
//-   - if snake disable slot 7
//-   0x15:
//-     - does not check if offstage (?)
//-   0x16:
//-   0x17:
//-   0x18:
//-   0x19:
//-   0x1A:
//-   0x1B:
//-   - 80% chancr to not catch and throw down (unless Dedede) ?
//-   0x1C:
//-   - if sheik:
//-     - disable slots 0x15, 0x16
//-   - if peach or zelda:
//-     - use dspecial if on ground
//- */

///Seems to be doing nothing
act Nothing : 0x0

/// act_m_wait_init/act_m_wait
act Unk10 : 0x10

/// Get to Distance X LEDGE
act Unk20 : 0x20
act Unk21 : 0x21
act Unk22 : 0x22
act Unk23 : 0x23
act Unk24 : 0x24

act GoFarLedge : 0x21
act GoMidFarLedge : 0x22
act GoMidCloseLedge : 0x23
act GoCloseLedge : 0x24

/// Get To Distance X
act Unk30 : 0x30
act Unk31 : 0x31
act Unk32 : 0x32
act Unk33 : 0x33
act Unk34 : 0x34

act GoFar : 0x31
act GoMidFar : 0x32
act GoMidClose : 0x33
act GoClose : 0x34

///Walk up to the opponent
act WalkUp : 0x40

act Hop : 0x50
act SHopTowards : 0x51
act FHopTowards : 0x52
act SHopNeutral : 0x53
act DJNeutral : 0x54
act FHopAway : 0x55
act SHopAway : 0x56
act SHopDJ : 0x57
act FHopDJ : 0x58

act DashUp : 0x60
act DashBack : 0x61

act RollBase : 0x70
act RollF : 0x71
act RollB : 0x72

act GetBehind0 : 0x80

//Ground attack routines

// jab, grab (slot1); XDistLE 10
act DoVeryClose : 0x1010
act Unk1010 : 0x1010
// fsmash (slot3); XDistLE 25
act DoClose : 0x1020
act Unk1020 : 0x1020
// utilt, usmash (slot4); XDistLE 15
act SendHigh : 0x1030
act Unk1030 : 0x1030
// jab, grab (slot1); XDistLE 30 + 20*Rnd only if opponent "close" 
act DoMedRange : 0x1040
act Unk1040 : 0x1040
// wait until touching ground and can act for 10 frames; face the opponent; and attack with slot2 (NB, DB)
act BlkRecoveryProj : 0x1050
act Unk1050 : 0x1050

// usmash, upB (slot5) if opponent will fall into attack range in 30 frames (0.5s); else run to location
/// NOTE: often called when opponent is high up and
/// when opponent and self are on same plane
act AntiAir : 0x1060
act Unk1060 : 0x1060

/// id of 0x9070
/// slots 17 (bair), 18 (uair), and 11 (nair)
/// only relevant in captain, fox, ike, lucario, lucas, marth, ness, snake, yoshi
act Unk1070 : 0x1070
act AtkApproachAerial : 0x1070
/// captain, fox, ike, lucario, lucas (overrides), marth, ness, yoshi
act Unk1071 : 0x1071
act AtkJumpAerial : 0x1071
/// snake
act Unk1072 : 0x1072
/// captain
act Unk1073 : 0x1073
act Unk1074 : 0x1074
act Unk1075 : 0x1075
/// captain, ike, lucario
act Unk1076 : 0x1076
/// captain, ike
act Unk1077 : 0x1077
act Unk1078 : 0x1078

/// follow opponent coming down and execute slot 17, 18, or 11
act Unk1080 : 0x1080
act AtkAerialApproachGround : 0x1080
/// aggressively run to opponent coming down and execute slot8 (jab, usmash, grab, nair, fair, bair, uair)
act Unk1090 : 0x1090
act AtkAirOrGroundApproach : 0x1090

///Deals with intercepting the opponent's recovery
/// act_a_meteo_aft
act BlockRecovery : 0x10A0
act BlockRecovery1 : 0x10A1
act BlockRecovery2 : 0x10A2
act BlockRecovery3 : 0x10A3
/// DSmash (slot6) if idling -- something to hit an opponent behind them
act AtkCoverBothSides : 0x10D0
act Unk10D0 : 0x10D0
///Called when the opponent is hanging cliff
/// act_a_meteo_aft
/// act_a_ambush
act InterceptCliff : 0x10F0

///Called after grabbing an opponent successfully
/// Grab handler
act Unk1120 : 0x1120
/// common = rest frame
/// | diddy = spam ftilt/utilt/rapid jab
/// | donkey = jab when attacked
/// | pikachu = walk up and ftilt
/// | samus = jump when opponent jumps
/// | sonic = stalk (like pika w/ no attack)
/// | wolf = walk up DA / jab / tilt
/// | yoshi = walk up DA / jab / tilt
act Unk1130 : 0x1130
/// jump up/offstage ==> edgeguard
/// edgeguard with meteor smash
act Unk1140 : 0x1140
act EdgeguardMS : 0x1140
/// force-called under a condition having something to do with AIPD def10
act Unk1160 : 0x1160
/// slot9 (undefined in common); if XDistLE AIPDFloat2 && XDistLE 10
act Unk1170 : 0x1170

//Recovery routines

/// act_r_jump_aft_shot
act JumpOnStage : 0x2010
act JumpOnStage1 : 0x2011
act JumpOnStage2 : 0x2012
act JumpOnStage3 : 0x2013
act JumpOnStage4 : 0x2014
act JumpOnStage5 : 0x2015
act JumpOnStage6 : 0x2016
act JumpOnStage7 : 0x2017
act JumpOnStage8 : 0x2018
act JumpOnStage9 : 0x2019
/// sideb to ledge if offstage, else run towards center
/// only used with mario 
act Unk2020 : 0x2020
act RecoverNonUpSpMash : 0x2020
/// jump in direction of ledge
/// never used/called
act Unk2030 : 0x2030
act RecoverNonUSpOnce : 0x2030

/// act_r_jump_aft_shot
act EdgeRecover : 0x2040
act EdgeRecover1 : 0x2041
act EdgeRecover2 : 0x2042
act EdgeRecover3 : 0x2043
act EdgeRecover4 : 0x2044
act EdgeRecover5 : 0x2045
act EdgeRecover6 : 0x2046
act EdgeRecover7 : 0x2047
act EdgeRecover8 : 0x2048
act EdgeRecover9 : 0x2049

/// act_r_fall
act OnGotDamaged : 0x2050
act OnGotDamaged1 : 0x2051

///Ledge Hanging
/// act_r_dfjump
act LedgeHang : 0x2060

///Lying
act Lying : 0x2070

///Recover back on stage after being knocked up really high
act RecoverFromReallyHigh : 0x2080

/// act_d_wait_init/act_d_wait (action defensive wait?)
/// | basic defensive wait
act Unk3010 : 0x3010
/// complex shield routine
act Unk3020 : 0x3020
/// act_d_wait_init/act_d_wait
/// | complex defensive wait
act Unk3030 : 0x3030
/// act_d_wait_init/act_d_wait
/// | mid-complex defensive wait
act Unk3040 : 0x3040
/// defensive while holding item plus other things ???
act Unk3080 : 0x3080
/// defensive while holding item ???
act Unk3090 : 0x3090
act Spotdodge : 0x30A0
act DodgeWhenAttacked : 0x30B0
act AirDodgeWhenAttacked : 0x30D0
act Reflect : 0x30E0

//Attack performing routines

act GroundBase : 0x6030
act Jab123 : 0x6031
act FTilt : 0x6032
act UTilt : 0x6033
act DTilt : 0x6034
act FSmash : 0x6035
act USmash : 0x6036
act DSmash : 0x6037
act NSpecial : 0x6038
/// sheik has a special hardcoded handler for this for controlling the chain:
/// act_c_g_blow_f_sheik
act SSpecial : 0x6039
act USpecial : 0x603A
act DSpecial : 0x603B
act Grab : 0x603C
// act Nothing : 0x603DF

act AerialBase : 0x6040
act NAir : 0x6041
act FAir : 0x6042
act BAir : 0x6043
act UAir : 0x6044
act DAir : 0x6045
act NSpecialAir : 0x6046
act SSpecialAir : 0x6047
act USpecialAir : 0x6048
act DSpecialAir : 0x6049

/// auto throw routine
act AutoThrow : 0x6100

act GroundCombo : 0x4010
act AerialCombo : 0x4020

act ATKVClose0 : 0x4030
act ATKVClose1 : 0x4031
act ATKVClose2 : 0x4032
act ATKVClose3 : 0x4033
act ATKVClose4 : 0x4034
act ATKVClose5 : 0x4035
act ATKVClose6 : 0x4036
act ATKVClose7 : 0x4037
act ATKVClose8 : 0x4038
act ATKVClose9 : 0x4039
act ATKVCloseA : 0x403A
act ATKVCloseB : 0x403B
act ATKVCloseC : 0x403C
act ATKVCloseD : 0x403D
act ATKVCloseE : 0x403E
act ATKVCloseF : 0x403F

act ATKClose0 : 0x4040
act ATKClose1 : 0x4041
act ATKClose2 : 0x4042
act ATKClose3 : 0x4043
act ATKClose4 : 0x4044
act ATKClose5 : 0x4045
act ATKClose6 : 0x4046
act ATKClose7 : 0x4047
act ATKClose8 : 0x4048
act ATKClose9 : 0x4049
act ATKCloseA : 0x404A
act ATKCloseB : 0x404B
act ATKCloseC : 0x404C
act ATKCloseD : 0x404D
act ATKCloseE : 0x404E
act ATKCloseF : 0x404F

act ATKMid0 : 0x4050
act ATKMid1 : 0x4051
act ATKMid2 : 0x4052
act ATKMid3 : 0x4053
act ATKMid4 : 0x4054
act ATKMid5 : 0x4055
act ATKMid6 : 0x4056
act ATKMid7 : 0x4057
act ATKMid8 : 0x4058
act ATKMid9 : 0x4059
act ATKMidA : 0x405A
act ATKMidB : 0x405B
act ATKMidC : 0x405C
act ATKMidD : 0x405D
act ATKMidE : 0x405E
act ATKMidF : 0x405F

act ATKFar0 : 0x4060
act ATKFar1 : 0x4061
act ATKFar2 : 0x4062
act ATKFar3 : 0x4063
act ATKFar4 : 0x4064
act ATKFar5 : 0x4065
act ATKFar6 : 0x4066
act ATKFar7 : 0x4067
act ATKFar8 : 0x4068
act ATKFar9 : 0x4069
act ATKFarA : 0x406A
act ATKFarB : 0x406B
act ATKFarC : 0x406C
act ATKFarD : 0x406D
act ATKFarE : 0x406E
act ATKFarF : 0x406F

act ATKBack0 : 0x4070
act ATKBack1 : 0x4071
act ATKBack2 : 0x4072
act ATKBack3 : 0x4073
act ATKBack4 : 0x4074
act ATKBack5 : 0x4075
act ATKBack6 : 0x4076
act ATKBack7 : 0x4077
act ATKBack8 : 0x4078
act ATKBack9 : 0x4079
act ATKBackA : 0x407A
act ATKBackB : 0x407B
act ATKBackC : 0x407C
act ATKBackD : 0x407D
act ATKBackE : 0x407E
act ATKBackF : 0x407F

act ComboG0 : 0x5000
act ComboG1 : 0x5001
act ComboG2 : 0x5002
act ComboG3 : 0x5003
act ComboG4 : 0x5004
act ComboG5 : 0x5005
act ComboG6 : 0x5006
act ComboG7 : 0x5007
act ComboG8 : 0x5008
act ComboG9 : 0x5009
act ComboG : 0x500A
act ComboG : 0x500B
act ComboG : 0x500C
act ComboG : 0x500D
act ComboG : 0x500E
act ComboG : 0x500F
act ComboG : 0x5010

act StageC0 : 0x6000
act StageC1 : 0x6001
act StageC2 : 0x6002
act StageC3 : 0x6003
act StageC4 : 0x6004
act StageC5 : 0x6005
act StageC6 : 0x6006
act StageC7 : 0x6007
act StageC8 : 0x6008
act StageC9 : 0x6009
act StageCA : 0x600A
act StageCB : 0x600B
act StageCC : 0x600C
act StageCD : 0x600D
act StageCE : 0x600E
act StageCF : 0x600F

act TurnWDBack : 0x7010

// Custom routines

// 8/12/2021 CUSTOM ROUTINES
act NoTarget : 0x2080

act GoalChoiceHub : 0x8500
act PerFrameChecks : 0x8501
act RandomizeGoal : 0x8502
act CalcAttackGoal : 0x8503
act CircleCampGoal : 0x8504
act GetChrSpecific : 0x8505
act MoveToGoal : 0x850C
act CheckAttackWillHit : 0x850D
act SetAttackGoal : 0x850E
act UpdateGoal : 0x850F

act Init : 0x8000
act MainHub : 0x8100
act AttackedHub : 0x8101
act DefendHub : 0x8102
act RecoveryHub : 0x8103
act EdgeguardHub : 0x8104
act NeutralHub : 0x8104
act CampHub : 0x8105
act BaitHub : 0x8106
act PunishEndlag : 0x8107

act DashScr : 0x8201
act Roll : 0x8202
act JumpScr : 0x8203
act Shield : 0x8204
act Wavedash : 0x8205
act AerialDrift : 0x8206
act BoardPlatform : 0x8207
act ShieldDrop : 0x8208
act LyingDown : 0x8209
act OnLedge : 0x820A
act Respawn : 0x820B
act LedgeStall : 0x820C
act LedgeDash : 0x820D

act FastAerial : 0x8401
act ExecuteAttack : 0x840F

act CalcORecPos : 0x8600

act DashAttack : 0x603E

// OLD CUSTOM ROUTINES

// [DOES NOT TRULY EXIST]
// thanks to a code, the game will force
// the AI into this script when no opponent
// is around
// act | NoTarget : 0x2080

// act | Landing : 0x59

// act | AIHub : 0x8000
// act | ApproachHub : 0x8001
// act | ComboHub : 0x8002
// act | EdgeguardHub : 0x8003
// act | RecoveryHub : 0x8004
// act | DefendHub : 0x8005
// act | NeutralHub : 0x8006
// act | OOSHub : 0x8007
// act | FakeOutHub : 0x8008
// act | EdgeEscapeHub : 0x8009

act routine0x8000 : 0x8000
act routine0x8001 : 0x8001
act routine0x8002 : 0x8002
act routine0x8003 : 0x8003
act routine0x8004 : 0x8004
act routine0x8005 : 0x8005
act routine0x8006 : 0x8006
act routine0x8007 : 0x8007
act routine0x8008 : 0x8008
act routine0x8009 : 0x8009

// act | mix_tomhawkJump : 0x8F00
// act | mix_doubleJump : 0x8F01




// FOR COMPATIBILITY

act ChrSpecific1 : 0x8101
act ChrSpecific2 : 0x8102
act ChrSpecific3 : 0x8103
act ChrSpecific4 : 0x8104
act ChrSpecific5 : 0x8105
act ChrSpecific6 : 0x8106
act ChrSpecific7 : 0x8107
act ChrSpecific8 : 0x8108
act ChrSpecific9 : 0x8109
act ChrSpecificA : 0x810A
act ChrSpecificB : 0x810B
act ChrSpecificC : 0x810C
act ChrSpecificD : 0x810D
act ChrSpecificE : 0x810E
act ChrSpecificF : 0x810F

act LvL2R1 : 0x8201
act LvL2R2 : 0x8202
act LvL2R3 : 0x8203
act LvL2R4 : 0x8204
act LvL2R5 : 0x8205
act LvL2R6 : 0x8206
act LvL2R7 : 0x8207
act LvL2R8 : 0x8208
act LvL2R9 : 0x8209
act LvL2RA : 0x820A
act LvL2RB : 0x820B
act LvL2RC : 0x820C
act LvL2RD : 0x820D
act LvL2RE : 0x820E
act LvL2RF : 0x820F

act LvL3R1 : 0x8301
act LvL3R2 : 0x8302
act LvL3R3 : 0x8303
act LvL3R4 : 0x8304
act LvL3R5 : 0x8305
act LvL3R6 : 0x8306
act LvL3R7 : 0x8307
act LvL3R8 : 0x8308
act LvL3R9 : 0x8309
act LvL3RA : 0x830A
act LvL3RB : 0x830B
act LvL3RC : 0x830C
act LvL3RD : 0x830D
act LvL3RE : 0x830E
act LvL3RF : 0x830F

act LvL4R1 : 0x8401
act LvL4R2 : 0x8402
act LvL4R3 : 0x8403
act LvL4R4 : 0x8404
act LvL4R5 : 0x8405
act LvL4R6 : 0x8406
act LvL4R7 : 0x8407
act LvL4R8 : 0x8408
act LvL4R9 : 0x8409
act LvL4RA : 0x840A
act LvL4RB : 0x840B
act LvL4RC : 0x840C
act LvL4RD : 0x840D
act LvL4RE : 0x840E
act LvL4RF : 0x840F

act LvL5R1 : 0x8501
act LvL5R2 : 0x8502
act LvL5R3 : 0x8503
act LvL5R4 : 0x8504
act LvL5R5 : 0x8505
act LvL5R6 : 0x8506
act LvL5R7 : 0x8507
act LvL5R8 : 0x8508
act LvL5R9 : 0x8509
act LvL5RA : 0x850A
act LvL5RB : 0x850B
act LvL5RC : 0x850C
act LvL5RD : 0x850D
act LvL5RE : 0x850E
act LvL5RF : 0x850F

act LvL6R1 : 0x8601
act LvL6R2 : 0x8602
act LvL6R3 : 0x8603
act LvL6R4 : 0x8604
act LvL6R5 : 0x8605
act LvL6R6 : 0x8606
act LvL6R7 : 0x8607
act LvL6R8 : 0x8608
act LvL6R9 : 0x8609
act LvL6RA : 0x860A
act LvL6RB : 0x860B
act LvL6RC : 0x860C
act LvL6RD : 0x860D
act LvL6RE : 0x860E
act LvL6RF : 0x860F

act LvL7R1 : 0x8701
act LvL7R2 : 0x8702
act LvL7R3 : 0x8703
act LvL7R4 : 0x8704
act LvL7R5 : 0x8705
act LvL7R6 : 0x8706
act LvL7R7 : 0x8707
act LvL7R8 : 0x8708
act LvL7R9 : 0x8709
act LvL7RA : 0x870A
act LvL7RB : 0x870B
act LvL7RC : 0x870C
act LvL7RD : 0x870D
act LvL7RE : 0x870E
act LvL7RF : 0x870F

act LvL8R1 : 0x8801
act LvL8R2 : 0x8802
act LvL8R3 : 0x8803
act LvL8R4 : 0x8804
act LvL8R5 : 0x8805
act LvL8R6 : 0x8806
act LvL8R7 : 0x8807
act LvL8R8 : 0x8808
act LvL8R9 : 0x8809
act LvL8RA : 0x880A
act LvL8RB : 0x880B
act LvL8RC : 0x880C
act LvL8RD : 0x880D
act LvL8RE : 0x880E
act LvL8RF : 0x880F

act LvL9R1 : 0x8901
act LvL9R2 : 0x8902
act LvL9R3 : 0x8903
act LvL9R4 : 0x8904
act LvL9R5 : 0x8905
act LvL9R6 : 0x8906
act LvL9R7 : 0x8907
act LvL9R8 : 0x8908
act LvL9R9 : 0x8909
act LvL9RA : 0x890A
act LvL9RB : 0x890B
act LvL9RC : 0x890C
act LvL9RD : 0x890D
act LvL9RE : 0x890E
act LvL9RF : 0x890F

// newly discovered
/// act_m_stroll
act Unk90 : 0x90
/// act_a_goro
act Unk1100 : 0x1100
/// act_a_brk_wall global routine
/// called when back to a wall? if no wall, goes to edge and sometimes dives off
act Unk1150 : 0x1150
/// act_d_wait_init/act_d_wait
/// | complex defensive wait
act Unk3050 : 0x3050
/// act_d_air_sway
act Unk3060 : 0x3060

act Unk6010 : 0x6010
