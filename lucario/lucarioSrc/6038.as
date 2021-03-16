#include <Definition_AIMain.h>
//TrueID=0x6038
id 0x6038

//Set Unknown
unk 0x0

if Equal movePart 0
  lastAttack = hex(0x6038)
  move_xOffset = nspecial_xOffset
  move_yOffset = nspecial_start_yOffset
  move_xRange = nspecial_start_xRange
  move_yRange = nspecial_start_yRange
  move_hitFrame = nspecial_hitFrame
  move_lastHitFrame = nspecial_lastHitFrame
  if Equal moveVariant mv_aurabomb
    move_xOffset = nspecial_aurabomb_xOffset
    move_yOffset = nspecial_aurabomb_yOffset
    move_yRange = nspecial_aurabomb_yRange
  endif
  Call ApproachHub
else
  move_IASA = nspecial_IASA
  move_yOffset = nspecial_yOffset
  move_xRange = nspecial_xRange
  move_yRange = nspecial_yRange
  ClearStick
  Button B
  SetFrame 0
  if Equal moveVariant mv_ASC 
    Seek ASC
  elif Equal moveVariant mv_aurabomb
    Button A
    Seek aurabomb
  else
    Seek setup
  endif
endif
Return

label ASC
if CurrAction <= hex(0x09)
  Call AIHub
endif

if CurrSubaction >= hex(0x1D0) && CurrSubaction <= hex(0x1D3)
  Button R
  Call AIHub
endif
Return

label aurabomb
  Call AIHub
Return

label setup
#let timer = var1
timer = 20 + Rnd * 60
if CurrSubaction >= hex(0x1D0) && CurrSubaction <= hex(0x1D3)
  Seek ExecuteAttack
  Return
elif CurrAction <= hex(0x09)
  Call AIHub
endif
if !(Equal OPos Direction)
  AbsStick OPos
endif
Return

label ExecuteAttack
if !(Equal AirGroundState 1) && Equal XDistFrontEdge XDistBackEdge && CurrSubaction >= hex(0x1D0) && CurrSubaction <= hex(0x1D3)
  Button R
  Call AIHub
elif CurrAction <= hex(0x09)
  Call AIHub
endif

#let loopTempVar = var0
loopTempVar = 20

Seek 
Jump
if !(True)
  label
  #let targetXDist = var5
  #let targetYDist = var6

  var4 = 0
  CALC_TARGET_DISTANCES(var5, var6, var3, var4, move_hitFrame + loopTempVar, _dummy, _dummy)

  if targetXDist <= move_xRange && targetYDist <= move_yRange
    Button B
  endif

  loopTempVar -= 5
  if loopTempVar <= 0
    Seek
    Jump
  endif
  Return
endif
label

if ODistLE 30
  if Rnd < 0.8 && Equal Direction OPos
    Button B
  elif Rnd < 0.2
    Button R
  elif Rnd < 0.4
    Stick 1 0
  else
    Stick -1 0
  endif
endif
timer -= 1
if timer <= 0
  Button R
  Call AIHub
endif
Seek ExecuteAttack
Return
Return