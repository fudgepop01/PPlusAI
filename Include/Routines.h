
///Seems to be doing nothing
act Nothing : 0x0

act Unk10 : 0x10

act Unk20 : 0x20
act Unk21 : 0x21
act Unk22 : 0x22
act Unk23 : 0x23
act Unk24 : 0x24

/// Run Away X
act Unk30 : 0x30
act Unk31 : 0x31
act Unk32 : 0x32
act Unk33 : 0x33

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

act RollBase : 0x70
act RollF : 0x71
act RollB : 0x72

act GetBehind0 : 0x80

//Ground attack routines

act Unk1010 : 0x1010
act Unk1020 : 0x1020
act Unk1030 : 0x1030
act Unk1040 : 0x1040
act Unk1050 : 0x1050

/// NOTE: often called when opponent is high up and
/// when opponent and self are on same plane
/// NOTE: is effectively a noop in PM
act Unk1060 : 0x1060

act Unk1070 : 0x1070
act Unk1071 : 0x1071
act Unk1072 : 0x1072
act Unk1073 : 0x1073
act Unk1074 : 0x1074
act Unk1075 : 0x1075
act Unk1076 : 0x1076
act Unk1077 : 0x1077
act Unk1078 : 0x1078

/// follow opponent coming down
act Unk1080 : 0x1080
/// aggressively follow opponent coming down
act Unk1090 : 0x1090

///Deals with intercepting the opponent's recovery
act BlockRecovery : 0x10A0
act BlockRecovery1 : 0x10A1
act BlockRecovery2 : 0x10A2
act BlockRecovery3 : 0x10A3
act Unk10D0 : 0x10D0
///Called when the opponent is hanging cliff
act InterceptCliff : 0x10F0

///Called after grabbing an opponent successfully
act Unk1120 : 0x1120
act Unk1130 : 0x1130
act Unk1140 : 0x1140
act Unk1160 : 0x1160
act Unk1170 : 0x1170

//Recovery routines

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
/// sideb to ledge
act Unk2020 : 0x2020
/// hard DI in/out
act Unk2030 : 0x2030
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

act OnGotDamaged : 0x2050
act OnGotDamaged1 : 0x2051

///Ledge Hanging
act LedgeHang : 0x2060

///Lying
act Lying : 0x2070

//Handlers of the opponent's attacks

act Unk3010 : 0x3010
act Unk3020 : 0x3020
act Unk3030 : 0x3030
act Unk3040 : 0x3040
act Unk3080 : 0x3080
act Unk3090 : 0x3090
act Spotdodge : 0x30A0
act DodgeWhenAttacked : 0x30B0
act AirDodgeWhenAttacked : 0x30D0
act Reflect : 0x30E0

//Attack performing routines

act Jab123 : 0x6031
act FTilt : 0x6032
act UTilt : 0x6033
act DTilt : 0x6034
act FSmash : 0x6035
act USmash : 0x6036
act DSmash : 0x6037
act NSpecial : 0x6038
act SSpecial : 0x6039
act USpecial : 0x603A
act DSpecial : 0x603B
act Grab : 0x603C
act Nothing : 0x603D

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

act ATKVClose : 0x4030
act ATKVClose : 0x4031
act ATKVClose : 0x4032
act ATKVClose : 0x4033
act ATKVClose : 0x4034
act ATKVClose : 0x4035
act ATKVClose : 0x4036
act ATKVClose : 0x4037
act ATKVClose : 0x4038
act ATKVClose : 0x4039
act ATKVClose : 0x403A
act ATKVClose : 0x403B
act ATKVClose : 0x403C
act ATKVClose : 0x403D
act ATKVClose : 0x403E
act ATKVClose : 0x403F

act ATKClose : 0x4040
act ATKClose : 0x4041
act ATKClose : 0x4042
act ATKClose : 0x4043
act ATKClose : 0x4044
act ATKClose : 0x4045
act ATKClose : 0x4046
act ATKClose : 0x4047
act ATKClose : 0x4048
act ATKClose : 0x4049
act ATKClose : 0x404A
act ATKClose : 0x404B
act ATKClose : 0x404C
act ATKClose : 0x404D
act ATKClose : 0x404E
act ATKClose : 0x404F

act ATKMid : 0x4050
act ATKMid : 0x4051
act ATKMid : 0x4052
act ATKMid : 0x4053
act ATKMid : 0x4054
act ATKMid : 0x4055
act ATKMid : 0x4056
act ATKMid : 0x4057
act ATKMid : 0x4058
act ATKMid : 0x4059
act ATKMid : 0x405A
act ATKMid : 0x405B
act ATKMid : 0x405C
act ATKMid : 0x405D
act ATKMid : 0x405E
act ATKMid : 0x405F

act ATKFar : 0x4060
act ATKFar : 0x4061
act ATKFar : 0x4062
act ATKFar : 0x4063
act ATKFar : 0x4064
act ATKFar : 0x4065
act ATKFar : 0x4066
act ATKFar : 0x4067
act ATKFar : 0x4068
act ATKFar : 0x4069
act ATKFar : 0x406A
act ATKFar : 0x406B
act ATKFar : 0x406C
act ATKFar : 0x406D
act ATKFar : 0x406E
act ATKFar : 0x406F

act ATKBack : 0x4070
act ATKBack : 0x4071
act ATKBack : 0x4072
act ATKBack : 0x4073
act ATKBack : 0x4074
act ATKBack : 0x4075
act ATKBack : 0x4076
act ATKBack : 0x4077
act ATKBack : 0x4078
act ATKBack : 0x4079
act ATKBack : 0x407A
act ATKBack : 0x407B
act ATKBack : 0x407C
act ATKBack : 0x407D
act ATKBack : 0x407E
act ATKBack : 0x407F


act ComboG : 0x5000
act ComboG : 0x5001
act ComboG : 0x5002
act ComboG : 0x5003
act ComboG : 0x5004
act ComboG : 0x5005
act ComboG : 0x5006
act ComboG : 0x5007
act ComboG : 0x5008
act ComboG : 0x5009
act ComboG : 0x500A
act ComboG : 0x500B
act ComboG : 0x500C
act ComboG : 0x500D
act ComboG : 0x500E
act ComboG : 0x500F
act ComboG : 0x5010

act StageC : 0x6000
act StageC : 0x6001
act StageC : 0x6002
act StageC : 0x6003
act StageC : 0x6004
act StageC : 0x6005
act StageC : 0x6006
act StageC : 0x6007
act StageC : 0x6008
act StageC : 0x6009
act StageC : 0x600A
act StageC : 0x600B
act StageC : 0x600C
act StageC : 0x600D
act StageC : 0x600E
act StageC : 0x600F

act TurnWDBack : 0x7010

// Custom Attack preforming routines

act Landing : 0x59

act AIHub : 0x8000
act ApproachHub : 0x8001
act ComboHub : 0x8002
act EdgeguardHub : 0x8003
act RecoveryHub : 0x8004

act mix_tomhawkJump : 0x8F00
act mix_doubleJump : 0x8F01

act LvL1Hub : 0x8100
act LvL2Hub : 0x8200
act LvL3Hub : 0x8300
act LvL4Hub : 0x8400
act LvL5Hub : 0x8500
act LvL6Hub : 0x8600
act LvL7Hub : 0x8700
act LvL8Hub : 0x8800
act LvL9Hub : 0x8900

act LvL1R1 : 0x8101
act LvL1R2 : 0x8102
act LvL1R3 : 0x8103
act LvL1R4 : 0x8104
act LvL1R5 : 0x8105
act LvL1R6 : 0x8106
act LvL1R7 : 0x8107
act LvL1R8 : 0x8108
act LvL1R9 : 0x8109
act LvL1RA : 0x810A
act LvL1RB : 0x810B
act LvL1RC : 0x810C
act LvL1RD : 0x810D
act LvL1RE : 0x810E
act LvL1RF : 0x810F

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
act Unk90 : 0x90
act Unk1100 : 0x1100
act Unk1150 : 0x1150
act Unk3050 : 0x3050
act Unk601a : 0x601a
act Unk6022 : 0x6022
act Unk6023 : 0x6023
act Unk6024 : 0x6024
act Unk6025 : 0x6025
act Unk6040 : 0x6040
