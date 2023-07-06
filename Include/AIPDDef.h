def {
  float float1 // farDist // 0x10 // how close is "far"
  float float2 // midDist // 0x14 // how close is "mid"
  byte byte1 // 0x18
  byte byte2 // 0x19
  byte byte3 // 0x1A
  byte byte4 // 0x1B
  byte byte5 // 0x1C
  byte byte6 // 0x1D
  byte byte7 // 0x1E
  byte byte8 // 0x1F
  float float3 // 0x20
  float float4 // 0x24
  byte byte9  // 0x25
  byte byte10 // 0x26
  byte byte11 // 0x27
  byte byte12 // 0x28
  float float5 // 0x2C
  float float6 // 0x30
  short short1 // 0x34
  short short2 // 0x36
  float float7 // 0x38
  byte byte13 // 0x3C
  byte byte14 // 0x3D
  byte byte15 // 0x3E
  byte byte16 // 0x3F
  float float8 // 0x40
  float float9  // 0x44
  float float10 // 0x48
  float float11 // 0x4C
  int int1 // 0x50
  int int2 // 0x54
  int int3 // 0x58
  int int4 // 0x5C
  int int5 // 0x60
  int int6 // 0x64
  byte byte17 // 0x68
  byte byte18 // 0x69
  byte byte19 // 0x6A
  byte byte20 // 0x6B
  byte byte21 // 0x6C
  byte byte22 // 0x6D
  byte byte23 // 0x6E
  byte byte24 // 0x6F
}

sub {
  byte byte1
  byte byte2
  byte byte3
  byte byte4
  byte byte5
  byte byte6
  byte byte7
  byte byte8
  float float1
  float float2
  short short1
  short short2
  short short3
  short short4
  byte byte9
  byte byte10
  byte byte11
  byte byte12
  byte byte13
  byte byte14
  byte byte15
  byte byte16
  byte byte17
  byte byte18
  byte byte19
  int pad1
  int pad2
  int pad3
  byte pad4
}

/*
unk used in select_action (the first 6 bytes)

unk values used in calc_command_param:
- hardcoded:
	- unk11
	- unk13
	- unk10
- dynamic: from unk2 to unk15

unk values used in check_cmd_revise
- unk14

unk values used in check_cmd_fall
- unk12

unk values used in check_cmd_reflect
- unk15

*/

unk {
  byte section1Start
  byte section1End
  byte section2Start
  byte section2End
  byte section3Start
  byte section3End
  short unk1
  int unk2
  int unk3
  int unk4 // 0x10
  int unk5
  int unk6
  int unk7
  int unk8 // 0x20
  int unk9
  int unk10
  int unk11
  int unk12 // 0x30
  int unk13
  int unk14
  int unk15
}