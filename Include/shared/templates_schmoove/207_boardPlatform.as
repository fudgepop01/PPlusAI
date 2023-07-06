#include <Definition_AIMain.h>
id 0x8207
unk 0x0

XReciever
NoRepeat
label setup
#let xGoal = var0
#let yGoal = var1

xGoal = TopNX + XSpeed * 9
immediateTempVar = TopNY + 50
GetYDistFloorAbsPos globTempVar xGoal immediateTempVar
yGoal = immediateTempVar - globTempVar

label solidCheck
#let midGoal = var2
GetColDistPosRel globTempVar immediateTempVar xGoal TopNY 0 50 0
if Equal globTempVar -1 && Equal immediateTempVar -1
  Seek execute
  Jump
endif
immediateTempVar += 1
//-- calc path
// calcRight
GetColDistPosRel globTempVar anotherTempVar xGoal immediateTempVar 175 0 0
if Equal globTempVar -1 && Equal anotherTempVar -1
  Seek calcLeft
  Jump
endif
globTempVar += 10
anotherTempVar -= 2
GetColDistPosRel globTempVar anotherTempVar globTempVar anotherTempVar 0 -60 1
if Equal globTempVar -1 && Equal anotherTempVar -1
  Seek calcLeft
  Jump
else 
  midGoal = globTempVar
  Seek solidNav
  Jump
endif
label calcLeft
// calcLeft
GetColDistPosRel globTempVar anotherTempVar xGoal immediateTempVar -175 0 0
if Equal globTempVar -1 && Equal anotherTempVar -1
  CallI MainHub
endif
globTempVar -= 10
anotherTempVar -= 2
GetColDistPosRel globTempVar anotherTempVar globTempVar anotherTempVar 0 -60 1
if Equal globTempVar -1 && Equal anotherTempVar -1
  CallI MainHub
else 
  midGoal = globTempVar
endif
label solidNav
XGoto PerFrameChecks
XReciever
Seek solidNav
globTempVar = midGoal - TopNX
immediateTempVar = globTempVar
Abs immediateTempVar
if immediateTempVar <= 5 && CurrAction >= hex(0x1)
  Seek execute
endif
AbsStick globTempVar
DrawDebugRectOutline midGoal TopNY 5 5 color(0xFF880055)
Return
label execute
DrawDebugRectOutline xGoal yGoal 5 5 color(0xFF880099)
if Equal AirGroundState 1
  ACTIONABLE_ON_GROUND
  Button X
  ClearStick
  globTempVar = xGoal - TopNX
  globTempVar *= 0.1
  AbsStick globTempVar
  Return
elif Equal AirGroundState 2
  if !(Equal PrevAction hex(0xA))
    Button X
    immediateTempVar = xGoal - TopNX
    immediateTempVar /= 15
  endif
  Seek
  Return 
endif

label adrift
XGoto PerFrameChecks
XReciever
Seek adrift
DrawDebugRectOutline xGoal yGoal 5 5 color(0xFF880088)

if TopNY > yGoal || YSpeed < -0.1 || !(Equal AirGroundState 2)
  CallI MainHub
endif
immediateTempVar = xGoal - TopNX + XSpeed * 11
AbsStick immediateTempVar
Return
Return