#include <Definition_AIMain.h>
id 0x8101
unk 0x0

str "*"
str "SH LASER"
str "Fire Frame"
str ":10"
str "FF Frame"
str ":20"
str "Min Wait"
str ":30"
str "Max Wait"
str ":60"
str "Min Height"
str "Max Height"
str "Debug Level"

SetTimeout 6000
var7 = 0
label begin
Cmd30

SAFE_INJECT_0 var0
SAFE_INJECT_1 var1
SAFE_INJECT_2 var2
SAFE_INJECT_3 var3
SAFE_INJECT_4 var4
SAFE_INJECT_5 var5
SAFE_INJECT_6 var6

Goto checks

var9 = 4
var10 = -2
var11 = 15
var12 = 2
var13 = 8

ClearStick
if Equal CurrAction 22 && AnimFrame >= 3
  Goto groundActs
elif CurrAction <= 9
  Goto groundActs
elif Equal AirGroundState 2
  if Equal var4 0
    if Equal var7 var1
      Stick 0 (-1)
    endif
    if Equal var7 var0
      Button B
    endif
  else
    if Equal var5 0
      var5 = 20
    endif
    var8 = Rnd * (var5 - var4) + var4
    var0 = var8 - 1
    var1 = var8 + 1
    var9 = 0
    label CNS
      Goto checks
      if var6 >= 2
        DrawDebugRectOutline 0 var8 20 1 0 255 255 221
      endif
      var17 = (var5 - var4) * 0.5
      var22 = (var5 + var4) * 0.5
      if var6 >= 1
        DrawDebugRectOutline 0 var22 20 var17 255 0 0 221
      endif

      if YDistBackEdge > -20
        var17 = YSpeed * -1
        CalcYChange var17 11 var17 Gravity MaxFallSpeed FastFallSpeed 1
        var17 = TopNY - -7 - var17
        if var6 >= 3
          DrawDebugRectOutline 0 var17 20 0.5 255 255 0 221
        endif
        if var0 <= var17 && var17 <= var1  
          Button B
          var9 = 1
          Seek CNS_end
        endif
      endif
      var17 = YSpeed * -1
      CalcYChange var17 11 var17 Gravity MaxFallSpeed FastFallSpeed 0
      
      var17 = TopNY - -7 - var17
      if var6 >= 3
        DrawDebugRectOutline 0 var17 20 0.5 255 136 0 221
      endif
      if var0 <= var17 && var17 <= var1  
        Button B
        Seek CNS_end
      endif
      if Equal AirGroundState 1
        Call 0x8101
      endif
    Return
    label CNS_end
      if Equal var9 1 && YSpeed <= 0
        Stick 0 (-1)
      endif
      if Equal AirGroundState 1
        Call 0x8101
      endif
    Return
  endif
endif

var7 += 1
Seek begin
Return
label groundActs
if !(Equal CurrAction 10)
  if !(Equal OPos Direction)
    Goto faceTarget
    var7 = 0
  elif var7 > var2 && var7 < var3 && Rnd < 0.05
    Button X
    var7 = 0
  elif var7 >= var3
    Button X
    var7 = 0
  endif
else
  var7 = 0
endif
Return
label faceTarget

var17 = OPos * 0.8
AbsStick var17

Return
label checks
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

  var17 = 15
  var16 = XSpeed * var17
  GetYDistFloorOffset var15 var16 5 0
  // var22 = TopNY - var15 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if !(Equal var15 -1) 
    var15 = 0
  elif Equal DistBackEdge DistFrontEdge
    var15 = 2
  elif Equal var15 -1
    if var16 < 0
      var15 = 1
    elif var16 > 0
      var15 = -1
    endif
  else
    var15 = 0
  endif
if Equal var15 2 && !(Equal AirGroundState 1)
  var18 = 0
  Call RecoveryHub
endif
Return
Return
