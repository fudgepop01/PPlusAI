#include <Definition_AIMain.h>
id 0x8504
unk 0x0

XReciever
#const topPlat = 1
#const leftPlat = 2
#const rightPlat = 3
#const center = 4
#const underLeft = 5
#const underRight = 6

#const validRange = 80
#const threatRangeX = 30
#const threatValueY = 25

globTempVar = -1
GetYDistFloorAbsPos immediateTempVar 100 60
if immediateTempVar < 40 && !(Equal immediateTempVar -1)
  globTempVar = 100
endif
GetYDistFloorAbsPos immediateTempVar 80 60
if immediateTempVar < 40 && !(Equal immediateTempVar -1)
  globTempVar = 80
endif
GetYDistFloorAbsPos immediateTempVar 60 60
if immediateTempVar < 40 && !(Equal immediateTempVar -1)
  globTempVar = 60
endif
GetYDistFloorAbsPos immediateTempVar 40 60
if immediateTempVar < 40 && !(Equal immediateTempVar -1)
  globTempVar = 40
endif

if Equal globTempVar -1
  XGoto RandomizeGoal
  XReciever
  DynamicDiceClear dslot0
  Return
endif

GetYDistFloorAbsPos immediateTempVar 0 100
anotherTempVar = TopNX
Abs anotherTempVar
if immediateTempVar < 50 && !(Equal immediateTempVar -1) && anotherTempVar < validRange
  if OTopNY < threatValueY
    DynamicDiceAdd dslot0 topPlat 1
  elif TopNY < 60
    DynamicDiceAdd dslot0 center 1
  endif
endif
globTempVar *= -1
GetYDistFloorAbsPos immediateTempVar globTempVar 80
anotherTempVar = globTempVar - TopNX
Abs anotherTempVar
if immediateTempVar < 60 && !(Equal immediateTempVar -1) && anotherTempVar < validRange
  anotherTempVar = globTempVar - OTopNX
  Abs anotherTempVar
  if anotherTempVar > threatRangeX
    if OTopNY < threatValueY
      DynamicDiceAdd dslot0 leftPlat 1
    else
      DynamicDiceAdd dslot0 underLeft 1
    endif
  endif
endif
globTempVar *= -1
GetYDistFloorAbsPos immediateTempVar globTempVar 80
anotherTempVar = globTempVar - TopNX
Abs anotherTempVar
if immediateTempVar < 60 && !(Equal immediateTempVar -1) && anotherTempVar < validRange
  anotherTempVar = globTempVar - OTopNX
  Abs anotherTempVar
  if anotherTempVar > threatRangeX
    if OTopNY < threatValueY
      DynamicDiceAdd dslot0 rightPlat 1
    else
      DynamicDiceAdd dslot0 underRight 1
    endif
  endif
endif

DynamicDiceRoll dslot0 anotherTempVar 0
GetYDistFloorAbsPos immediateTempVar 0 30
if Equal anotherTempVar topPlat
  GetYDistFloorAbsPos immediateTempVar 0 100
  goalX = 0
  goalY = 100 - immediateTempVar + 5
elif Equal anotherTempVar leftPlat
  globTempVar *= -1
  GetYDistFloorAbsPos immediateTempVar globTempVar 80
  goalX = globTempVar
  goalY = 80 - immediateTempVar + 5
elif Equal anotherTempVar rightPlat
  GetYDistFloorAbsPos immediateTempVar globTempVar 80
  goalX = globTempVar
  goalY = 80 - immediateTempVar + 5
elif Equal anotherTempVar center
  goalX = 0
  goalY = 30 - immediateTempVar
elif Equal anotherTempVar underLeft
  goalX = globTempVar * -1
  goalY = 30 - immediateTempVar
elif Equal anotherTempVar underRight
  goalX = globTempVar
  goalY = 30 - immediateTempVar
else
  XGoto RandomizeGoal
  XReciever
  DynamicDiceClear dslot0
  Return
endif

anotherTempVar = Rnd * 20 - 10
goalX += anotherTempVar
DynamicDiceClear dslot0

Return
Return