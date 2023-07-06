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

#let frameCounter = var7
SetTimeout 6000
frameCounter = 0
label begin
Cmd30
#let fireFrame = var0
#let fastFallFrame = var1
#let minWaitTime = var2
#let maxWaitTime = var3
#let minHeight = var4
#let maxHeight = var5
#let debugLevel = var6

SAFE_INJECT_0 fireFrame
SAFE_INJECT_1 fastFallFrame
SAFE_INJECT_2 minWaitTime
SAFE_INJECT_3 maxWaitTime
SAFE_INJECT_4 minHeight
SAFE_INJECT_5 maxHeight
SAFE_INJECT_6 debugLevel

Goto checks

move_xOffset = nspecial_xOffset
move_yOffset = nspecial_yOffset
move_xRange = nspecial_aim_xRange
move_yRange = nspecial_aim_yRange
move_hitFrame = nspecial_hitFrame

ClearStick
if Equal CurrAction hex(0x16) && AnimFrame >= 3
  Goto groundActs
elif CurrAction <= hex(0x9)
  Goto groundActs
elif Equal AirGroundState 2
  if Equal minHeight 0
    if Equal frameCounter fastFallFrame
      Stick 0 (-1)
    endif
    if Equal frameCounter fireFrame
      Button B
    endif
  else
    #let targetHeight = var8
    #let fastFallFlag = var9
    #let lwBound = var0
    #let hiBound = var1
    if Equal maxHeight 0
      maxHeight = 20
    endif
    targetHeight = Rnd * (maxHeight - minHeight) + minHeight
    lwBound = targetHeight - 1
    hiBound = targetHeight + 1
    fastFallFlag = 0
    label CNS
      Goto checks
      if debugLevel >= 2
        DrawDebugRectOutline 0 targetHeight 20 1 color(0x00FFFFDD)
      endif
      globTempVar = (maxHeight - minHeight) * 0.5
      immediateTempVar = (maxHeight + minHeight) * 0.5
      if debugLevel >= 1
        DrawDebugRectOutline 0 immediateTempVar 20 globTempVar color(0xFF0000DD)
      endif

      if YDistBackEdge > -20
        globTempVar = YSpeed * -1
        CalcYChange globTempVar 11 globTempVar Gravity MaxFallSpeed FastFallSpeed 1
        globTempVar = TopNY - nspecial_aim_yOffset - globTempVar
        if debugLevel >= 3
          DrawDebugRectOutline 0 globTempVar 20 0.5 color(0xFFFF00DD)
        endif
        if lwBound <= globTempVar && globTempVar <= hiBound  
          Button B
          fastFallFlag = 1
          Seek CNS_end
        endif
      endif
      globTempVar = YSpeed * -1
      CalcYChange globTempVar 11 globTempVar Gravity MaxFallSpeed FastFallSpeed 0
      
      globTempVar = TopNY - nspecial_aim_yOffset - globTempVar
      if debugLevel >= 3
        DrawDebugRectOutline 0 globTempVar 20 0.5 color(0xFF8800DD)
      endif
      if lwBound <= globTempVar && globTempVar <= hiBound  
        Button B
        Seek CNS_end
      endif
      if Equal AirGroundState 1
        Call sc_laser_still
      endif
    Return
    label CNS_end
      if Equal fastFallFlag 1 && YSpeed <= 0
        Stick 0 (-1)
      endif
      if Equal AirGroundState 1
        Call sc_laser_still
      endif
    Return
  endif
endif

frameCounter += 1
Seek begin
Return
label groundActs
if !(Equal CurrAction hex(0xA))
  if !(Equal OPos Direction)
    Goto faceTarget
    frameCounter = 0
  elif frameCounter > minWaitTime && frameCounter < maxWaitTime && Rnd < 0.05
    Button X
    frameCounter = 0
  elif frameCounter >= maxWaitTime
    Button X
    frameCounter = 0
  endif
else
  frameCounter = 0
endif
Return
label faceTarget

globTempVar = OPos * 0.8
AbsStick globTempVar

Return
label checks
HITSTUN_CHECK

#let isGoingOffstage = var15
GOING_OFFSTAGE(isGoingOffstage, var16, 15)
if Equal isGoingOffstage 2 && !(Equal AirGroundState 1)
  movePart = 0
  Call RecoveryHub
endif
Return
Return