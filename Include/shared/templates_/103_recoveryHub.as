#include <Definition_AIMain.h>
id 0x8103
unk 0x0

XReciever
// because some things might rely on these being unset
label reroll
#let yRecoveryOffset = var14
yRecoveryOffset = Rnd * 0
#let nearCliffX = var0
#let nearCliffY = var1
NEAREST_CLIFF(nearCliffX, nearCliffY)
Abs nearCliffX
{INITIALIZATION}
label begin
currGoal = cg_recover
SetDebugOverlayColor color(0xFF8800DD)
EnableDebugOverlay

if FramesHitstun > 0 && CurrAction >= hex(0x43) && CurrAction <= hex(0x45)
  CallI AttackedHub
elif CurrAction >= hex(0x73) && CurrAction <= hex(0x75)
  CallI OnLedge
elif Equal CurrAction hex(0xBD) || Equal CurrAction hex(0xBE)
  currGoal = cg_nothing
  CallI MainHub
endif

#let isBelowStage = var16

// detects if below stage
#let rawCX = var0
#let rawReturnX = var1
#let rawReturnY = var2
#let nearCliffXOffset = var2

GetNearestCliff rawCX
GetReturnGoal rawReturnX

#const NCXOffs = 7
#const NCXOffsNear = 5
{NCXOFFS_REDEFINE}

globTempVar = rawReturnX - rawCX 
isBelowStage = 0
if globTempVar < 10 && globTempVar > -10
  if globTempVar < 0
    nearCliffXOffset = NCXOffsNear
  else
    nearCliffXOffset = -NCXOffsNear
  endif
elif rawReturnX < TopNX && TopNX < rawCX
elif rawCX < TopNX && TopNX < rawReturnX  
elif TopNY < rawReturnY
  if globTempVar < 0
    nearCliffXOffset = NCXOffs
  else
    nearCliffXOffset = -NCXOffs
  endif
  isBelowStage = 1
endif

GetColDistPosRel globTempVar immediateTempVar TopNX TopNY 0 150 0
if !(Equal globTempVar -1) || !(Equal immediateTempVar -1)
  isBelowStage = 1
endif

#let nearCliffX = var0
#let nearCliffY = var1
NEAREST_CLIFF(nearCliffX, nearCliffY)

if SFALL_ACTIONS
  Goto handleSFall
  Return
elif USPECIAL_ACTIONS
  Goto handleUSpecial
  Return
elif NSPECIAL_ACTIONS
  Goto handleNSpecial
  Return
elif SSPECIAL_ACTIONS
  Goto handleSSpecial
  Return
elif DSPECIAL_ACTIONS
  Goto handleDSpecial
  Return
elif CurrAction >= hex(0xB) && CurrAction <= hex(0xD)
  if YDistBackEdge < -10
    currGoal = cg_nothing
    lastAttack = -1
    Call MainHub 
  elif YSpeed > 0 || AnimFrame < 2
    Goto handleJumpToStage
    Return
  endif
endif

#let isGoingOffstage = var2
GOING_OFFSTAGE(isGoingOffstage, var3, 15)

if YDistFloor > -1 || Equal AirGroundState 1
  currGoal = cg_nothing
  lastAttack = -1
  goalY = BBoundary
  goalX = 0
  Call MainHub
endif

if YDistBackEdge < 0
  XGoto PerFrameChecks
  XReciever
  Seek begin
endif

{RECOVERY_CONDITIONS}

Return

label handleNSpecial
  {NSPECIAL}
Return

label handleSSpecial
  {SSPECIAL}
Return

label handleUSpecial
  {USPECIAL}
Return

label handleDSpecial
  {DSPECIAL}
Return

label handleSFall
  {SFALL}
Return

label handleJumpToStage
  {JUMP_TO_STAGE}
Return

Return
Return