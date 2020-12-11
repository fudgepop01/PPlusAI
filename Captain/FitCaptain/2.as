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

// globTempVar = 15
// DrawDebugRectOutline TopNX TopNY globTempVar globTempVar color(0xFFFFFFDD)
// globTempVar += 15
// DrawDebugRectOutline TopNX TopNY globTempVar globTempVar color(0xFFAAAADD)
// globTempVar += 15
// DrawDebugRectOutline TopNX TopNY globTempVar globTempVar color(0xFF7777DD)
// globTempVar += 15
// DrawDebugRectOutline TopNX TopNY globTempVar globTempVar color(0xFF4444DD)
// globTempVar += 15
// DrawDebugRectOutline TopNX TopNY globTempVar globTempVar color(0xFF0000DD)

#let ODmgXWeight = var2

GET_WEIGHT_TABLE(var2, var0)

ODmgXWeight /= 100
ODmgXWeight *= ODamage

if Equal hit_knockback -1
  hit_knockback = hex(0xFFFF)
endif

// LOGSTR str("comboHub")
// if Equal lastAttack hex(0x6031)
//   if ODmgXWeight > 20
//     if OYDistSelf > 30
//       Call UAir
//     elif OYDistSelf > 10
//       Call FAir
//     else
//       Call DAir
//     endif
//   endif
// elif Equal lastAttack hex(0x6032)
//   if ODmgXWeight < 40 && Equal OAirGroundState 1
//     var0 = Rnd * 2
//     if var0 < 1
//       Call Grab
//     elif var0 < 2
//       Call Jab123
//     endif
//   else
//     Call DAir
//   endif
// elif Equal lastAttack hex(0x6033)
// if Equal lastAttack hex(0x6034)
//   if ODmgXWeight < 50 && OYDistFloor > -20
//     var0 = Rnd * 3
//     if var0 < 1
//       Call Grab
//     elif var0 < 2
//       Call Jab123
//     else
//       Call DAir
//     endif
//   elif ODmgXWeight < 80
//     var0 = Rnd * 2
//     if var0 < 1
//       Call DAir
//     elif var0 < 2
//       Call UAir
//     endif
//   elif True
//     if OYDistSelf < 15
//       Call DAir
//     else
//       Call FAir
//     endif
//   endif
if Equal lastAttack hex(0x603C)
  // LOGSTR str("grbCmbo")
  if Equal moveVariant mv_uthrow
    if ODmgXWeight > 80
      if XDistLE 20
        Call FAir
      else
        Call UAir
      endif
    elif OYDistSelf > 25
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
endif
if Equal lastAttack hex(0x6041)
  if hit_knockback < 4 && OYDistSelf < 30 && Rnd < 0.5 && OYDistFloor > -10 && SamePlane
    Call Grab
  endif
endif
// // elif Equal lastAttack hex(0x6042)
// //   if OYDistSelf > 20
// //     Call FAir
// //   else
// //     Call UAir
// //   endif
// // elif Equal lastAttack hex(0x6043)
// //   if ODmgXWeight > 60
// //     Call FAir
// //   else
// //     Call UAir
// //   endif
if Equal lastAttack hex(0x6044)
  if MeteoChance
    Call FAir
  elif OYDistSelf < 20 && YDistBackEdge > -10 && ODmgXWeight > 60
    Call FAir
  endif
endif
if Equal lastAttack hex(0x6045)
  if ODmgXWeight > 100 && OYDistSelf > 30
    Call UAir
  elif ODmgXWeight > 70 && OYDistSelf > 30
    if Rnd < 0.8
      Call FAir
    else
      Call UAir
    endif
  elif ODmgXWeight > 60 && OYDistSelf > 18
    if Rnd < 0.8
      Call FAir
    else
      Call UAir
    endif
  elif OYDistSelf > 35
    Call UAir
  elif True
    if Rnd < 0.7
      Call DAir
    elif Rnd < 0.1 && OYDistFloor > -5
      Call Jab123
    elif Rnd < 0.3 && OYDistFloor > -8
      Call USmash
    endif
  endif
endif
if Equal lastAttack hex(0x6039)
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

if OYDistBackEdge > -5 && Equal OCurrAction hex(0x49) && Rnd < 0.75
  Seek techChase_wait
  Jump
endif
Seek contCombo
Jump
Return

label techChase_wait
TECHCHASE_SITUATION(var0, var1, var2, var3, var4, var5, Rnd * 100, _AIHub, contCombo)

label _AIHub
Call AIHub

label contCombo

#let comboLeniency = var2
comboLeniency = OFramesHitstun
comboLeniency += 0

if YDistBackEdge < -25
  if OYDistSelf < 0
    Call DAir
  elif OYDistSelf < 15
    Call FAir
  elif OYDistSelf < 30
    Call UAir
  endif
endif
if OYDistSelf < 15
  var0 = Rnd
  if var0 < 0.2 && comboLeniency >= sspecial_hitFrame
    Call SSpecial
  elif var0 < 0.4 && comboLeniency >= dair_hitFrame
    Call DAir
  elif var0 < 0.6 && comboLeniency >= dtilt_hitFrame
    Call DTilt
  elif var0 < 0.8 && comboLeniency >= utilt_hitFrame
    Call UTilt
  else
    Call DAir
  endif
elif OYDistSelf < 30
  if XDistLE 30
    var0 = Rnd
    if var0 < 0.4
      Call Grab
    elif var0 < 0.45 && comboLeniency >= jab123_hitFrame
      Call Jab123
    elif var0 < 0.55 && comboLeniency >= dtilt_hitFrame
      Call DTilt
    elif var0 < 0.75 && comboLeniency >= dair_hitFrame
      Call DAir
    else
      Call NAir
    endif
  elif Rnd < 0.5
    Call NAir
  endif
elif OYDistSelf < 45
  if XDistLE 45
    if ODmgXWeight > 70
      Call DAir
    else
      Call NAir
    endif
  elif True
    if ODmgXWeight > 70
      Call FAir
    else
      Call NAir
    endif
  endif
elif OYDistSelf < 60
  if XDistLE 15
    if ODmgXWeight > 70
      Call FAir
    else
      Call DAir
    endif
  elif XDistLE 30
    Call FAir
  else
    Call UAir
  endif
elif True
  if ODmgXWeight > 70 && XDistLE 30
    Call FAir
  elif ODmgXWeight > 20
    Call UAir
  else
    Call NAir
  endif
endif

noCombo = noComboVal
Call AIHub
Return
Return