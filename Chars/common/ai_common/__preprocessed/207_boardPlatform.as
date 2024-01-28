#include <Definition_AIMain.h>
id 0x8207
unk 0x0

//= XReciever
NoRepeat
label setup

var0 = TopNX + XSpeed * 9
var22 = TopNY + 50
GetYDistFloorAbsPos var17 var0 var22
var1 = var22 - var17

label solidCheck
GetColDistPosRel var17 var22 var0 TopNY 0 50 0
if Equal var17 -1 && Equal var22 -1
  Seek execute
  Jump
endif
var22 += 1
//-- calc path
// calcRight
GetColDistPosRel var17 var23 var0 var22 175 0 0
if Equal var17 -1 && Equal var23 -1
  Seek calcLeft
  Jump
endif
var17 += 10
var23 -= 2
GetColDistPosRel var17 var23 var17 var23 0 -60 1
if Equal var17 -1 && Equal var23 -1
  Seek calcLeft
  Jump
else 
  var2 = var17
  Seek solidNav
  Jump
endif
label calcLeft
// calcLeft
GetColDistPosRel var17 var23 var0 var22 -175 0 0
if Equal var17 -1 && Equal var23 -1
  CallI MainHub
endif
var17 -= 10
var23 -= 2
GetColDistPosRel var17 var23 var17 var23 0 -60 1
if Equal var17 -1 && Equal var23 -1
  CallI MainHub
else 
  var2 = var17
endif
label solidNav
XGoto PerFrameChecks
//= XReciever
Seek solidNav
var17 = var2 - TopNX
var22 = var17
Abs var22
if var22 <= 5 && CurrAction >= 1
  Seek execute
endif
AbsStick var17
if Equal CurrAction 1
  ClearStick
endif
// DrawDebugRectOutline midGoal TopNY 5 5 color(0xFF880055)
Return
label execute
Seek execute
// DrawDebugRectOutline xGoal yGoal 5 5 color(0xFF880099)
MOD var22 GameTimer 3
if Equal AirGroundState 1 && var22 <= 1
  var22 = 300
  XGoto GetChrSpecific
  Seek execute
  if Equal var22 0 
    Return
  endif
  label ground_jump
  Button X
  ClearStick
  var17 = var0 - TopNX
  var17 *= 0.1
  AbsStick var17
  if Equal AirGroundState 2
    Seek adrift
    Jump
  endif
  Seek ground_jump
  Return
elif Equal AirGroundState 2
  label air_jump
  if !(Equal PrevAction 10)
    Button X
    var22 = var0 - TopNX
    var22 /= 15
  endif
  Seek adrift
  Return 
endif

label adrift
XGoto PerFrameChecks
if !(Equal var20 -1) 
  XGoto SetAttackGoal
  XGoto CheckAttackWillHit
endif
//= XReciever
Seek adrift
// DrawDebugRectOutline xGoal yGoal 5 5 color(0xFF880088)
if TopNY > var1 || YSpeed < -0.1 || YDistFloor < 2 && AnimFrame > 4 
  var15 = -10
  CallI MainHub
endif
var22 = var0 - TopNX + XSpeed * 11
AbsStick var22
Return
Return
