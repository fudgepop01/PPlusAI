#include <Definition_AIMain.h>
id 0x8101
unk 0x0

str "*"
str "LASER STILL"
str "Fire Frame"
str ":10"
str "FF Frame"
str ":20"
str "Min Wait"
str ":30"
str "Max Wait"
str ":60"

SetTimeout 6000
var5 = 0
label begin
Cmd30

SAFE_INJECT_0 var0
SAFE_INJECT_1 var1
SAFE_INJECT_2 var2
SAFE_INJECT_3 var3

Goto offstageCheck
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

ClearStick
if Equal CurrAction 22 && AnimFrame >= 3
  Goto groundActs
elif CurrAction <= 9
  Goto groundActs
elif Equal AirGroundState 2
  LOGSTR 1179010560 1918987520 1694498816 0 0
    LOGVAL var0
  if Equal var5 var1
    Stick 0 (-1)
  endif
  LOGSTR 1181315584 1699115520 1634559232 0 0
    LOGVAL var0
  if Equal var5 var0
    Button B
  endif
endif

LOGSTR 1178824448 1970172928 1701969920 0 0
LOGVAL var5
var5 += 1
Seek begin
Return
label groundActs
if !(Equal CurrAction 10)
  if !(Equal OPos Direction)
    Goto faceTarget
    var5 = 0
  elif var5 > var2 && var5 < var3 && Rnd < 0.05
    Button X
    var5 = 0
  elif var5 >= var3
    Button X
    var5 = 0
  endif
else
  var5 = 0
endif
Return
label faceTarget

var17 = OPos * 0.8
AbsStick var17

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
