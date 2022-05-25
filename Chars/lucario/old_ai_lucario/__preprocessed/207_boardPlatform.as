#include <Definition_AIMain.h>
id 0x8207
unk 0x0

XReciever
label setup

var0 = TopNX + XSpeed * 9
var22 = TopNY + 50
GetYDistFloorAbsPos var17 var0 var22
var1 = var22 - var17

label execute
DrawDebugRectOutline var0 var1 5 5 255 136 0 136
if Equal AirGroundState 1
  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif CurrAction >= 24
    Return
  endif
  Button X
  ClearStick
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
