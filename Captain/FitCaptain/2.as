// COMBO HUB
// a place for determining the next best attack when an opponent is in hitstun
#include <Definition_AIMain.h>
id 0x8002

unk 0x0

// each lastAttack corresponds to a move routine... so like 6031 means jab
// was the last move used...

ClearStick
movePart = 0

lastScript = hex(0x8002)

#let OYDistSelf = var1
OYDistSelf = OTopNY - TopNY

#let ODmgXWeight = var2

GET_WEIGHT_TABLE(var2, var0)

ODmgXWeight /= 100
ODmgXWeight *= ODamage

if Equal move_knockback -1
  move_knockback = hex(0xFFFF)
endif

// LOGSTR str("comboHub")
if Equal lastAttack hex(0x6031)
  // ...thus we'll end up here
  if ODmgXWeight > 20
    if OYDistSelf > 45
      Call UAir
    elif OYDistSelf > 15
      Call FAir
    else
      Call DAir
    endif
  endif
elif Equal lastAttack hex(0x6032)
  if ODmgXWeight < 40 && Equal OAirGroundState 1
    var0 = Rnd * 2
    if var0 < 1
      Call Grab
    elif var0 < 2
      Call Jab123
    endif
  else
    Call DAir
  endif
// elif Equal lastAttack hex(0x6033)
elif Equal lastAttack hex(0x6034)
  if ODmgXWeight < 50
    var0 = Rnd * 2
    if var0 < 1
      Call Grab
    elif var0 < 2
      Call Jab123
    endif
  elif ODmgXWeight < 90
    var0 = Rnd * 2
    if var0 < 1
      Call DAir
    elif var0 < 2
      Call UAir
    endif
  else
    Call FAir
  endif
elif Equal lastAttack hex(0x603C)
  // LOGSTR str("grbCmbo")
  if Rnd < 0.05
    Call UAir
  endif
  if Equal moveVariant mv_uthrow
    if XDistLE 30
      Call FAir
    elif OYDistSelf > 20
      Call UAir
    else
      Call NAir
    endif
  elif Equal moveVariant mv_dthrow
    if ODmgXWeight > 60 && OYDistSelf > 25
      Call FAir
    elif OYDistSelf > 25 && OYSpeed > 0.15
      Call UAir
    endif
    var0 = Rnd * 3
    if ODmgXWeight > 40 && var0 < 2
      Call DAir
    else
      moveVariant = mv_techChase
      Call Grab
    endif
  endif
elif Equal lastAttack hex(0x6041)
  if move_knockback < 2 && OYDistSelf < 30
    Call Grab
  endif
  if OYDistSelf < 25
    Call NAir
  else
    Call UAir
  endif
elif Equal lastAttack hex(0x6042)
  if OYDistSelf > 20
    Call FAir
  else
    Call UAir
  endif
elif Equal lastAttack hex(0x6043)
  if ODmgXWeight > 60
    Call FAir
  else
    Call UAir
  endif
elif Equal lastAttack hex(0x6044)
  if ODmgXWeight > 60 && OYDistSelf > 30 && OYDistSelf < 60
    Call FAir
  elif MeteoChance && OYDistSelf < 80
    Call FAir
  else
    Call UAir
  endif
elif Equal lastAttack hex(0x6045)
  if Equal OAirGroundState 1 && OCurrAction <= hex(0x20) || Equal OCurrAction hex(0x4D) || Equal OFramesHitstun 0
    Call AIHub
  endif
  if OYSpeed <= 0.1
    Return
  endif

  // LOGSTR str("oydist")
  // LOGVAL OYDistSelf
  if ODmgXWeight > 70 && OYDistSelf > 40
    if Rnd < 0.8
      Call FAir
    else
      Call UAir
    endif
  elif ODmgXWeight > 60 && OYDistSelf > 25
    if Rnd < 0.8
      Call FAir
    else
      Call UAir
    endif
  elif OYDistSelf > 35
    Call UAir
  elif True
    if Rnd < 0.9
      Call DAir
    else
      Call USmash
    endif
  endif
elif Equal lastAttack hex(0x6039)
  if ODmgXWeight > 70
    Call FAir
  elif ODmgXWeight > 30
    if Rnd < 0.2
      Call DAir
    elif Rnd < 0.2
      Call BAir
    else
      Call UAir
    endif
  endif
  Call NAir
endif

noCombo = noComboVal
Call AIHub
Return
Return