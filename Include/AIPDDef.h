def {
  float float1 // 0x0 // how close is "far"
  float float2 // how close is "mid"
  byte byte1
  byte byte2
  byte byte3
  byte byte4
  byte byte5
  byte byte6
  byte byte7
  byte byte8
  float float3 // 0x10
  float float4
  byte byte9
  byte byte10
  byte byte11
  byte byte12
  float float5
  float float6 // 0x20
  short short1
  short short2
  float float7
  byte byte13
  byte byte14
  byte byte15
  byte byte16
  float float8 // 0x30
  float float9
  float float10
  float float11
  int int1 // 0x40
  int int2
  int int3
  int int4
  int int5 // 0x50
  int int6
  byte byte17
  byte byte18
  byte byte19
  byte byte20
  byte byte21
  byte byte22
  byte byte23
  byte byte24
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