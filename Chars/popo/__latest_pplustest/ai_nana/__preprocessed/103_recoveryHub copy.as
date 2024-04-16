#include <Definition_AIMain.h>
id 0x8103
unk 0x0

//= XReciever
// because some things might rely on these being unset
label reroll
{CLIFF_DIST_MACRO}
Abs var0
{INITIALIZATION}

LOGSTR 1312902656 1092637184 1162033920 541147904 793985280
LOGVAL CurrAction
LOGVAL CurrSubaction
PRINTLN

var5 = 0
var6 = 0
if !(NoOneHanging) && Rnd < 0.8 || Rnd < 0.25
  var6 = HurtboxSize + 45 * Rnd
endif
label begin
var21 = 3
SetDebugOverlayColor 255 136 0 221
EnableDebugOverlay

XGoto PerFrameChecks
//= XReciever
Seek begin


// detects if below stage

GetNearestCliff var0
GetReturnGoal var1

{CLIFF_OFFSET}

{NCXOFFS_REDEFINE}

var17 = var1 - var0 
var16 = 0
if var17 < 10 && var17 > -10
  if var17 < 0
    var2 = 5
  else
    var2 = -5
  endif
elif var1 < TopNX && TopNX < var0
elif var0 < TopNX && TopNX < var1  
elif TopNY < var2
  if var17 < 0
    var2 = 7
  else
    var2 = -7
  endif
  var16 = 1
endif

GetColDistPosRel var17 var22 TopNX TopNY 0 150 0
if !(Equal var17 -1) || !(Equal var22 -1)
  var16 = 1
endif

{CLIFF_DIST_MACRO}

var17 = 0
if CurrAction >= 98 && CurrAction <= 108 && AnimFrame < 8
  Return
elif Equal CurrAction 16
  Goto handleSFall
  var17 = 1
elif Equal CurrAction 276 || Equal CurrAction 297 || Equal CurrAction 299
  Goto handleUSpecial
  var17 = 1
elif Equal CurrAction 274 || Equal CurrAction 279 || Equal CurrAction 280
  Goto handleNSpecial
  var17 = 1
elif Equal CurrAction 275 || Equal CurrAction 297
  Goto handleSSpecial
  var17 = 1
elif Equal CurrAction 277 || Equal CurrAction 300
  Goto handleDSpecial
  var17 = 1
elif CurrAction >= 11 && CurrAction <= 13
  if YDistFloor > -1
    var21 = 0
    var20 = -1
    var14 = BBoundary
    var13 = 0
    Call MainHub
  elif CharYSpeed > 0 || AnimFrame < 2
    var17 = 1
    Goto handleJumpToStage
    Seek begin
    if AnimFrame < 10
      Return
    endif
  endif
endif
Seek begin

if YDistFloor > -1
  if !(Equal var17 0)
    ClearStick
    var17 = TopNX * -1
    AbsStick var17
    Return
  elif CurrAction <= 25 || Equal CurrAction 190
    var21 = 0
    var20 = -1
    var14 = BBoundary
    var13 = 0
    Call MainHub
  endif
elif HasCurry && Equal HitboxConnected 1
  var21 = 0
  Call MainHub
elif !(Equal var17 0)
  Return
endif

  var17 = 15
  var3 = XSpeed * var17
  GetYDistFloorOffset var2 var3 5 0
  // var22 = TopNY - var2 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if !(Equal var2 -1) 
    var2 = 0
  elif Equal DistBackEdge DistFrontEdge
    var2 = 2
  elif Equal var2 -1
    if var3 < 0
      var2 = 1
    elif var3 > 0
      var2 = -1
    endif
  else
    var2 = 0
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
