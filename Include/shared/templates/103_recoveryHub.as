#include <Definition_AIMain.h>
id 0x8103
unk 0x0

//= XReciever
// because some things might rely on these being unset
label reroll
#let cliffDistX = var0
#let cliffDistY = var1
#let nearCliffX = var0
#let nearCliffY = var1
{CLIFF_DIST_MACRO}
Abs cliffDistX
{INITIALIZATION}
label begin
currGoal = cg_recover
SetDebugOverlayColor color(0xFF8800DD)
EnableDebugOverlay

XGoto PerFrameChecks
//= XReciever
Seek begin

#let isBelowStage = var16

// detects if below stage
#let rawCX = var0
#let rawReturnX = var1
#let rawReturnY = var2
#let cliffDistXOffset = var2

GetNearestCliff rawCX
GetReturnGoal rawReturnX

#const NCXOffs = 7
#const NCXOffsNear = 5
#const rec_jumpHeight = -cs_djumpHeight
{NCXOFFS_REDEFINE}

globTempVar = rawReturnX - rawCX 
isBelowStage = 0
if globTempVar < 10 && globTempVar > -10
  if globTempVar < 0
    cliffDistXOffset = NCXOffsNear
  else
    cliffDistXOffset = -NCXOffsNear
  endif
elif rawReturnX < TopNX && TopNX < rawCX
elif rawCX < TopNX && TopNX < rawReturnX  
elif TopNY < rawReturnY
  if globTempVar < 0
    cliffDistXOffset = NCXOffs
  else
    cliffDistXOffset = -NCXOffs
  endif
  isBelowStage = 1
endif

GetColDistPosRel globTempVar immediateTempVar TopNX TopNY 0 150 0
if !(Equal globTempVar -1) || !(Equal immediateTempVar -1)
  isBelowStage = 1
endif

#let cliffDistX = var0
#let cliffDistY = var1
{CLIFF_DIST_MACRO}

globTempVar = 0
if SFALL_ACTIONS
  globTempVar = 1
  Goto handleSFall
elif USPECIAL_ACTIONS
  globTempVar = 1
  Goto handleUSpecial
elif NSPECIAL_ACTIONS
  globTempVar = 1
  Goto handleNSpecial
elif SSPECIAL_ACTIONS
  globTempVar = 1
  Goto handleSSpecial
elif DSPECIAL_ACTIONS
  globTempVar = 1
  Goto handleDSpecial
elif CurrAction >= hex(0xB) && CurrAction <= hex(0xD)
  if YDistBackEdge < -10
    currGoal = cg_nothing
    lastAttack = -1
    Call MainHub 
  elif YSpeed > 0 || AnimFrame < 8
    globTempVar = 1
    Goto handleJumpToStage
    Return
  endif
endif

if YDistFloor > -1 
  if Equal AirGroundState 1 || Equal CurrAction hex(0xBE)
    currGoal = cg_nothing
    lastAttack = -1
    goalY = BBoundary
    goalX = 0
    Call MainHub
  elif !(Equal globTempVar 0)
    ClearStick
    globTempVar = TopNX * -1
    AbsStick globTempVar
    Return
  endif
elif HasCurry && Equal HitboxConnected 1
  currGoal = cg_nothing
  Call MainHub
elif !(Equal globTempVar 0)
  Return
endif

#let isGoingOffstage = var2
GOING_OFFSTAGE(isGoingOffstage, var3, 15)

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