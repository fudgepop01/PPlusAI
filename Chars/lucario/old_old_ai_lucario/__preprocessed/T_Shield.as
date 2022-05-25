#include <Definition_AIMain.h>
id 0x8201
unk 0x0

str "*"
str "SHIELD"
str "Snapback"
str ":1"
str "leniency"
str "act OOS"
str "shield DI"
str "angle shield"

SetTimeout 6000
var5 = 0
label begin
Cmd30

SAFE_INJECT_0 var0
SAFE_INJECT_1 var1
SAFE_INJECT_2 var2
SAFE_INJECT_3 var3
SAFE_INJECT_4 var4

Goto offstageCheck
if var2 > 0
  if FramesHitstun > 0
    var22 = LevelValue * 0.01 - 0.1
    if LevelValue >= 60 && Rnd <= var22
      if Damage < 80 || Equal FramesHitlag 1
        ClearStick
        Stick 0 (-1)
      elif Rnd < 0.4
        ClearStick
        Stick 0 (-1)
        if LevelValue >= 75 && Rnd <= var22
          Button R
        endif
      endif
    endif
    Call OnGotDamaged
  endif
endif

ClearStick
Button R 
if var2 > 0 && Equal CurrAction 29
  Call OOSHub
elif var3 > 0 && Equal CurrAction 29 
  var17 = OPos * -1
  AbsStick var17
elif var4 > 0
  var17 = OPos * 0.6
  var22 = (OTopNY - TopNY) * 0.01
  if var22 > 0.6
    var22 = 0.6
  endif
  AbsStick var17 var22
endif

var5 += 1
Seek begin
Return
label offstageCheck

  var17 = 15
  var17 = XSpeed * var17
  GetYDistFloorOffset var16 var17 5 0
  // var22 = TopNY - var16 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if !(Equal var16 -1) 
    var16 = 0
  elif Equal DistBackEdge DistFrontEdge
    var16 = 2
  elif Equal var16 -1
    if var17 < 0
      var16 = 1
    elif var17 > 0
      var16 = -1
    endif
  else
    var16 = 0
  endif
if Equal var16 2 && !(Equal AirGroundState 1)
  var18 = 0
  Call RecoveryHub
endif

Return
Return
