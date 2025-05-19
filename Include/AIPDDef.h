// * defmax if >= lv5, otherwise defmin
def {
  float float1 // float farRange // farDist // 0x0 // how close is "far"
  float float2 // float midRange // midDist // 0x4 // how close is "mid"
  byte byte1 // byte baseRecoveryTimer // 0x8 // offstage recovery timer base
  byte byte2 // byte randRecoveryAdd // 0x9 // offstage recovery timer (random addition)
  byte byte3 // byte PMRecoveryHeight // 0xA // redundant // hijacked to be additional recovery height
  byte byte4 // 0xB // redundant 
  // RNG: md_refresh timer
  byte byte5 // 0xC // base 
  byte byte6 // 0xD // certain random addition
  byte byte7 // 0xE // set addition
  byte byte8 // 0xF // set addition chance
  float float3 // float jumpHeight // *0x10 - jumpHeight (fullhop + djump)
  float float4 // float jumpLength // *0x14 - jumpLength (fullhop + djump)
  byte byte9  // 0x18 // md_chase base addition
  byte byte10 // 0x19 // md_chase rand addition
  byte byte11 // 0x1A // md_chase add base timer
  byte byte12 // 0x1B // md_chase add base timer chance
  float float5 // 0x1C
  float float6 // 0x20
  short short1 // 0x24 // md_attack timer
  short short2 // 0x26 // general md timer
  float float7 // 0x28 // weapon (item) search range
  // UNKNOWN
  byte byte13 // 0x2C // weapon (item) search amount?
  byte byte14 // 0x2D // weapon (item) search amount rand addition
  byte byte15 // 0x2E // weapon (item) search addition amt
  byte byte16 // 0x2F // weapon (item) search addition amt chance
  float float8 // 0x30
  float float9  // 0x34 // min adventure mode md_unique(8) range
  float float10 // 0x38 // cond adventure mode md_unique(8) range
  float float11 // float validFloorRangeAbove // *0x3C validFloorRangeAbove
  int int1 // 0x40
  int int2 // 0x44
  int int3 // 0x48
  int int4 // 0x4C
  int int5 // 0x50
  int int6 // 0x54
  byte byte17 // 0x58
  byte byte18 // 0x59
  byte byte19 // 0x5A

  // FLAGS: 
  byte byte20 // *0x5B // can extend md_chase time
  byte byte21 // 0x5C
  byte byte22 // 0x5D // something to do with uspecial recovery
  byte byte23 // 0x5E * 0.01 // CPUType5 special 0x3050 chance
  byte byte24 // 0x5F
}

// EVERY value here is used in target_check, dealing with prioritizing goals
sub {
  byte byte1 // 0x0 // distance weight multiplier
  byte byte2 // 0x1 // damage weight multiplier
  byte byte3 // 0x2
  byte byte4 // 0x3
  byte byte5 // 0x4
  byte byte6 // 0x5
  byte byte7 // 0x6
  byte byte8 // 0x7
  float float1 // 0x8 // 
  float float2 // 0xC // 
  short short1 // 0x10
  short short2 // 0x12
  short short3 // 0x14
  short short4 // 0x16
  byte byte9 // 0x17
  byte byte10 // 0x18
  byte byte11 // 0x19
  byte byte12 // 0x1a
  byte byte13 // 0x1b
  byte byte14 // 0x1c
  byte byte15 // 0x1d
  byte byte16 // 0x1e
  byte byte17 // 0x1f
  byte byte18 // 0x20
  byte byte19 // 0x21
  int pad1 // 0x
  int pad2 // 0x
  int pad3 // 0x
  byte pad4 // 0x
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
  byte section1Start // md_return (recovery)
  byte section1End
  byte section2Start // md_attack
  byte section2End
  byte section3Start // md_defend
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
  int unk10 // int holdableMoves // bitfield: hold moves
  int unk11 // int multipartMoves // bitfield: multipart moves
  int unk12 // int NOTMeteoChanceMoves // bitfield: moves to NOT use during meteoChance
  int unk13 // int actWhenFullchargeMoves // bitfield: forced action upon full charge moves
  int unk14 // int swingChkRevise // bitfield: swingChk Revise moves
  int unk15 // int projectileMoves // bitfiled: projectile moves
}