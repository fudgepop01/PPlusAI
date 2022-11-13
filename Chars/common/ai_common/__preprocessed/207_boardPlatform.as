#include <Definition_AIMain.h>
id 0x8207
unk 0x0

XReciever
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
XReciever
Seek solidNav
var17 = var2 - TopNX
var22 = var17
Abs var22
if var22 <= 5 && CurrAction >= 1
  Seek execute
endif
AbsStick var17
DrawDebugRectOutline var2 TopNY 5 5 255 136 0 85
Return
label execute
DrawDebugRectOutline var0 var1 5 5 255 136 0 153
MOD var22 AnimFrame 3
if Equal AirGroundState 1 && var22 <= 1
  if Equal CanCancelAttack 1
  elif Equal HitboxConnected 1 && HasCurry
  elif Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif CurrAction >= 24 && !(Equal CurrAction 73) && !(Equal CurrAction 103) && !(Equal CurrAction 108)
    Return
  endif
  Button X
  ClearStick
  var17 = var0 - TopNX
  var17 *= 0.1
  AbsStick var17
  Return
elif Equal AirGroundState 2
  if !(Equal PrevAction 10)
    Button X
    var22 = var0 - TopNX
    var22 /= 15
  endif
  Seek
  Return 
endif

label adrift
XGoto PerFrameChecks
XReciever
Seek adrift
DrawDebugRectOutline var0 var1 5 5 255 136 0 136

if TopNY > var1 || YSpeed < -0.1 || !(Equal AirGroundState 2)
  CallI MainHub
endif
var22 = var0 - TopNX + XSpeed * 11
AbsStick var22
Return
Return
