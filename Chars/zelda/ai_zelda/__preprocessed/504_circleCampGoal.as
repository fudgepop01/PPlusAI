#include <Definition_AIMain.h>
id 0x8504
unk 0x0

XReciever


var17 = -1
GetYDistFloorAbsPos var22 100 60
if var22 < 40 && !(Equal var22 -1)
  var17 = 100
endif
GetYDistFloorAbsPos var22 80 60
if var22 < 40 && !(Equal var22 -1)
  var17 = 80
endif
GetYDistFloorAbsPos var22 60 60
if var22 < 40 && !(Equal var22 -1)
  var17 = 60
endif
GetYDistFloorAbsPos var22 40 60
if var22 < 40 && !(Equal var22 -1)
  var17 = 40
endif

if Equal var17 -1
  XGoto RandomizeGoal
  XReciever
  DynamicDiceClear 0
  Return
endif

GetYDistFloorAbsPos var22 0 100
var23 = TopNX
Abs var23
if var22 < 50 && !(Equal var22 -1) && var23 < 80
  if OTopNY < 25
    DynamicDiceAdd 0 1 1
  elif TopNY < 60
    DynamicDiceAdd 0 4 1
  endif
endif
var17 *= -1
GetYDistFloorAbsPos var22 var17 80
var23 = var17 - TopNX
Abs var23
if var22 < 60 && !(Equal var22 -1) && var23 < 80
  var23 = var17 - OTopNX
  Abs var23
  if var23 > 30
    if OTopNY < 25
      DynamicDiceAdd 0 2 1
    else
      DynamicDiceAdd 0 5 1
    endif
  endif
endif
var17 *= -1
GetYDistFloorAbsPos var22 var17 80
var23 = var17 - TopNX
Abs var23
if var22 < 60 && !(Equal var22 -1) && var23 < 80
  var23 = var17 - OTopNX
  Abs var23
  if var23 > 30
    if OTopNY < 25
      DynamicDiceAdd 0 3 1
    else
      DynamicDiceAdd 0 6 1
    endif
  endif
endif

DynamicDiceRoll 0 var23 0
GetYDistFloorAbsPos var22 0 30
if Equal var23 1
  GetYDistFloorAbsPos var22 0 100
  var13 = 0
  var14 = 100 - var22 + 5
elif Equal var23 2
  var17 *= -1
  GetYDistFloorAbsPos var22 var17 80
  var13 = var17
  var14 = 80 - var22 + 5
elif Equal var23 3
  GetYDistFloorAbsPos var22 var17 80
  var13 = var17
  var14 = 80 - var22 + 5
elif Equal var23 4
  var13 = 0
  var14 = 30 - var22
elif Equal var23 5
  var13 = var17 * -1
  var14 = 30 - var22
elif Equal var23 6
  var13 = var17
  var14 = 30 - var22
else
  XGoto RandomizeGoal
  XReciever
  DynamicDiceClear 0
  Return
endif

var23 = Rnd * 20 - 10
var13 += var23
DynamicDiceClear 0

Return
Return
