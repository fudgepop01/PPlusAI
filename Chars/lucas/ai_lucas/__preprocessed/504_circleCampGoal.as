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
  DynamicDiceClear
  Return
endif

GetYDistFloorAbsPos var22 0 100
var23 = TopNX
Abs var23
if var22 < 50 && !(Equal var22 -1) && var23 < 80
  if OTopNY < 25
    DynamicDiceAdd 1
  elif TopNY < 60
    DynamicDiceAdd 4
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
      DynamicDiceAdd 2
    else
      DynamicDiceAdd 5
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
      DynamicDiceAdd 3
    else
      DynamicDiceAdd 6
    endif
  endif
endif

DynamicDiceRoll var23
GetYDistFloorAbsPos var22 0 30
if Equal var23 1
  GetYDistFloorAbsPos var22 0 100
  var8 = 0
  var9 = 100 - var22 + 5
elif Equal var23 2
  var17 *= -1
  GetYDistFloorAbsPos var22 var17 80
  var8 = var17
  var9 = 80 - var22 + 5
elif Equal var23 3
  GetYDistFloorAbsPos var22 var17 80
  var8 = var17
  var9 = 80 - var22 + 5
elif Equal var23 4
  var8 = 0
  var9 = 30 - var22
elif Equal var23 5
  var8 = var17 * -1
  var9 = 30 - var22
elif Equal var23 6
  var8 = var17
  var9 = 30 - var22
else
  XGoto RandomizeGoal
  XReciever
  DynamicDiceClear
  Return
endif

var23 = Rnd * 20 - 10
var8 += var23
DynamicDiceClear

Return
Return
