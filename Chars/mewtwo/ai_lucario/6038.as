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
  Call ApproachHub
else
  move_IASA = nspecial_IASA
  move_yOffset = nspecial_yOffset
  move_xRange = nspecial_xRange
  move_yRange = nspecial_yRange
  ClearStick
  Button B
  SetFrame 0
  Seek
endif
Return

label 
#let timer = var1
timer = 50 + Rnd * 100
label ExecuteAttack
if CurrAction <= hex(0x09) || !(Equal AirGroundState 1)
  Call AIHub
endif

#let loopTempVar = var0
loopTempVar = 20

if CurrSubaction >= hex(0x1D0) && CurrSubaction <= hex(0x1D3)  
  Seek 
  Jump
endif
if !(True)
  label _chk
  #let targetXDist = var5
  #let targetYDist = var6

  var4 = 0
  CALC_TARGET_DISTANCES(var5, var6, var8, var3, var4, move_hitFrame + loopTempVar, _dummy, _dummy)

  if targetXDist <= move_xRange && targetYDist <= move_yRange
    Button B
  endif

  loopTempVar -= 5
  if loopTempVar <= 0
    Seek
    Jump
  else
    Seek _chk
    Jump
  endif
  Return
endif
label

if ODistLE 25
  if Rnd < 0.7
    Button B
  elif Rnd < 0.3
    Button R
  elif Rnd < 0.5
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