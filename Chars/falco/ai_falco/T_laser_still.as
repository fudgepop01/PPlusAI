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

#let frameCounter = var5
SetTimeout 6000
frameCounter = 0
label begin
Cmd30
#let fireFrame = var0
#let fastFallFrame = var1
#let minWaitTime = var2
#let maxWaitTime = var3

SAFE_INJECT_0 fireFrame
SAFE_INJECT_1 fastFallFrame
SAFE_INJECT_2 minWaitTime
SAFE_INJECT_3 maxWaitTime

Goto offstageCheck
HITSTUN_CHECK

ClearStick
if Equal CurrAction hex(0x16) && AnimFrame >= 3
  Goto groundActs
elif CurrAction <= hex(0x9)
  Goto groundActs
elif Equal AirGroundState 2
  LOGSTR str("FFFrame")
    LOGVAL fireFrame
  if Equal frameCounter fastFallFrame
    Stick 0 (-1)
  endif
  LOGSTR str("FireFrame")
    LOGVAL fireFrame
  if Equal frameCounter fireFrame
    Button B
  endif
endif

LOGSTR str("FCounter")
LOGVAL frameCounter
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
label offstageCheck

#let isGoingOffstage = var16
GOING_OFFSTAGE(isGoingOffstage, var17, 15)
if Equal isGoingOffstage 2 && !(Equal AirGroundState 1)
  movePart = 0
  Call RecoveryHub
endif

Return
Return