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

#let frameCounter = var5
SetTimeout 6000
frameCounter = 0
label begin
Cmd30
#let snapback = var0
#let leniency = var1
#let actOOS = var2
#let shieldDI = var3
#let angleShield = var4

SAFE_INJECT_0 snapback
SAFE_INJECT_1 leniency
SAFE_INJECT_2 actOOS
SAFE_INJECT_3 shieldDI
SAFE_INJECT_4 angleShield

Goto offstageCheck
if actOOS > 0
  HITSTUN_CHECK
endif

ClearStick
Button R 
if actOOS > 0 && Equal CurrAction hex(0x1D)
  Call OOSHub
elif shieldDI > 0 && Equal CurrAction hex(0x1D) 
  globTempVar = OPos * -1
  AbsStick globTempVar
elif angleShield > 0
  globTempVar = OPos * 0.6
  immediateTempVar = (OTopNY - TopNY) * 0.01
  if immediateTempVar > 0.6
    immediateTempVar = 0.6
  endif
  AbsStick globTempVar immediateTempVar
endif

frameCounter += 1
Seek begin
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