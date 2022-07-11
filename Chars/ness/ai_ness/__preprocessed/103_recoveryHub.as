#include <Definition_AIMain.h>
id 0x8103
unk 0x0

XReciever
// because some things might rely on these being unset
label reroll
var14 = Rnd * 0
  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 = var1 - (TopNY * -1)
Abs var0
  var4 = 0
  var5 = Rnd
  var6 = Rnd
  var9 = Rnd
  var7 = Rnd
  var8 = Rnd
  var10 = Rnd
label begin
var21 = 3
SetDebugOverlayColor 255 136 0 221
EnableDebugOverlay

if FramesHitstun > 0 && CurrAction >= 67 && CurrAction <= 69
  CallI AttackedHub
elif CurrAction >= 115 && CurrAction <= 117
  CallI OnLedge
elif Equal CurrAction 189 || Equal CurrAction 190
  var21 = 0
  CallI MainHub
endif


// detects if below stage

GetNearestCliff var0
GetReturnGoal var1



var17 = var1 - var0 
var16 = 0
if var17 < 10 && var17 > -10
  if var17 < 0
    var2 = 4
  else
    var2 = -4
  endif
elif var1 < TopNX && TopNX < var0
elif var0 < TopNX && TopNX < var1  
elif TopNY < var2
  if var17 < 0
    var2 = 6
  else
    var2 = -6
  endif
  var16 = 1
endif

GetColDistPosRel var17 var22 TopNX TopNY 0 150 0
if !(Equal var17 -1) || !(Equal var22 -1)
  var16 = 1
endif

  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 = var1 - (TopNY * -1)

if Equal CurrAction 16
  Goto handleSFall
  Return
elif Equal CurrAction 276 || Equal CurrAction 282 || Equal CurrAction 283 || Equal CurrAction 284
  Goto handleUSpecial
  Return
elif Equal CurrAction 274 || Equal CurrAction 279 || Equal CurrAction 280
  Goto handleNSpecial
  Return
elif Equal CurrAction 275
  Goto handleSSpecial
  Return
elif Equal CurrAction 277 || Equal CurrAction 286 || Equal CurrAction 288
  Goto handleDSpecial
  Return
elif CurrAction >= 11 && CurrAction <= 13
  if YDistBackEdge < -10
    var21 = 0
    var20 = -1
    Call MainHub 
  elif YSpeed > 0 || AnimFrame < 2
    Goto handleJumpToStage
    Return
  endif
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

if YDistFloor > -1 || Equal AirGroundState 1
  var21 = 0
  var20 = -1
  var14 = BBoundary
  var13 = 0
  Call MainHub
endif

if YDistBackEdge < 0
  XGoto PerFrameChecks
  XReciever
  Seek begin
endif

  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 = var1 - (TopNY * -1)
  
  // drift towards goal
  var17 = var0 * -1
  ClearStick
  AbsStick var17
  var2 = var0
  Abs var2
  var17 = TopNY - BBoundary
  if !(NoOneHanging) && !(Equal var16 1)
    LOGSTR_NL 1936682240 1701801472 1696622592 1634625280 1768843008
    var1 -= 25
  endif
  if YDistBackEdge > 21.08 && var2 <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Return
  endif
  var1 -= var14
  if var7 <= 0.4 && YDistBackEdge > -8 && YDistBackEdge < 8 && var2 <= 55
    Button B
    ClearStick
    Stick 0 (-1)
    Return
  endif
  if var6 <= 0.6 && YDistBackEdge > 40 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if var9 <= 0.3 && YDistBackEdge > -20 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if var2 <= 80 && YDistBackEdge > 65 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif 
  if Equal var4 1 || var5 <= 0.8 && NumJumps > 0
    if YDistBackEdge > 13.079999999999998 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  elif YDistBackEdge > 75.08 || var17 < 18
    if NumJumps > 0 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    else
      var4 = 1
      Button B
      ClearStick
      AbsStick 0 (0.7)
      Return
    endif
  endif

Return

label handleNSpecial
  Seek reroll
Return

label handleSSpecial
  Seek reroll
Return

label handleUSpecial
  var0 = 20
  label exec_uspecial
  XGoto PerFrameChecks
  XReciever
  Seek exec_uspecial
  GetNearestCliff var1
  var1 = TopNX - var1
  var1 *= -1
  var2 *= -1
  var2 = var2 - (TopNY * -1)
  if !(Equal var16 1)
    if !(NoOneHanging)
      var2 -= 20
    endif
    if var10 < 0.5
      var22 = 20
      var2 += YDistBackEdge
      var2 -= var22
    endif
    if var9 <= 0.3 && YDistBackEdge > -20 || var6 <= 0.6 && YDistBackEdge > 40
      if TopNX > 0
        var1 += 3
      else
        var1 -= 3
      endif
    endif
  endif
  var17 = var0 / 20
  var17 *= 54
  var17 += 6
  Norm var22 var1 var2
  var3 = var1 / var22
  var3 *= var17
  
  var4 = var2 / var22
  var4 *= var17 * 1.2
  var3 = TopNX + var3
  var4 = TopNY + var4
  DrawDebugRectOutline var3 var4 5 5 255 136 0 221
  GetArticleOfTypeAtTargetLoc var5 var6 2 0
  GetArticleOfTypeAtTargetSpeed var7 var8 2 0
  ClearStick
  // LOGSTR 1347375872 1230260480 1330533120 0 0
  // LOGVAL var5
  // LOGVAL var6
  // LOGSTR 1397769472 1162105600 0 0 0
  // LOGVAL var7
  // LOGVAL var8
  if !(Equal var5 0) && !(Equal var6 0)
    Norm var23 var7 var8
    // LOGSTR 1953461248 1634489856 1701576704 0 0
    // LOGVAL var23
    var22 = var7 / var23
    if Equal var7 0
      var22 = 0
    endif 
    var17 = var8 / var23
    if Equal var8 0
      var17 = 0
    endif 
    // LOGSTR 1482056960 1814831104 1498834176 1811939328 0
    // LOGVAL var22
    // LOGVAL var17
    var22 *= 10
    var17 *= 10 
    var22 = var22 + var5 - var3
    var17 = var17 + var6 - var4
    // LOGSTR 2019846400 1936990208 2036623616 1936982016 0
    // LOGVAL var22
    // LOGVAL var17
    Norm var23 var22 var17
    if var0 > 0 && var23 <= 25
      var0 -= 1
    endif
    // LOGSTR 1986355968 1281715712 0 0 0
    // LOGVAL var23
    var22 /= var23
    var17 /= var23
    var22 *= -1
    var17 *= -1
    AbsStick var22 var17
  endif
  if CurrAction <= 256
    Call RecoveryHub
  endif
Return

label handleDSpecial
  Seek reroll
Return

label handleSFall
  var17 = TopNX * -1
  AbsStick var17
Return

label handleJumpToStage
  ClearStick
  if Equal var16 1
    var17 = var1 * -1
    AbsStick var17
  elif var1 > 6 || var1 < -6
    var17 = var1 * -1
    AbsStick var17
  elif YDistBackEdge < 25.08
    var17 = var1 * -3
    AbsStick var17
  endif
Return

Return
Return
