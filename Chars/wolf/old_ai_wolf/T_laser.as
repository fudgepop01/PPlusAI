#include <Definition_AIMain.h>
id 0x8101
unk 0x0

str "*"
str "LASER APPROACH"
str "Min Count"
str ":3"
str "Max Count"
str ":8"
str "Min Wait"
str ":10"
str "Max Wait"
str ":50"
str "Dashdance"
str ":1"

#let frameCounter = var7
#let laserCount = var5
SetTimeout 6000
frameCounter = 0
laserCount = 0
label begin
Cmd30

#let shouldDashDance = var0
SAFE_INJECT_4 shouldDashDance

if shouldDashDance > 0
  #let amount = var0
  #let frameCount = var1
  amount = (105 - LevelValue) / 100
  amount = (Rnd * 10) - dashCountMax * amount
  OR amount amount amount
  frameCount = (Rnd * 20) + dashDanceMinFrames

  label _dashdance
  Cmd30

  if OCurrAction >= hex(0x3B) && OCurrAction <= hex(0x52) && Rnd <= 0.5
    amount = 0
  elif OCurrAction >= hex(0x18) && OCurrAction <= hex(0x19) && Rnd <= 0.5
    amount = 0
  elif OCurrAction >= hex(0x60) && OCurrAction <= hex(0x71) && Rnd <= 0.5
    amount = 0
  elif OYDistBackEdge < -40 && Rnd <= 0.1
    amount = 0
  elif amount >= 90
    SetFrame 0
    label
    AbsStick OPos
    if NumFrames >= 5
      Button X 
      amount = 0
    else
      Return
    endif
  endif

  globTempVar = OXSpeed * 3
  Abs globTempVar
  predictAverage immediateTempVar man_oXAttackDist
  globTempVar += immediateTempVar
  globTempVar += 25

  if Equal CurrAction hex(0x0A)
    Return
  elif Equal CurrAction hex(0x16) && AnimFrame < 4
    Return
  elif InAir && YDistBackEdge > -5 && YDistBackEdge < 0 && !(Equal XDistFrontEdge XDistBackEdge)
    if XDistBackEdge < -shortEdgeRange && XDistFrontEdge > shortEdgeRange
      if ODistLE shortEdgeRange
        if Rnd < 0.2
          amount = 100
        else
          amount = 0
        endif
      endif
      Button R
      if ODistLE globTempVar
        globTempVar = OPos * -1
        AbsStick globTempVar (-0.5)
      else
        AbsStick OPos (-0.5)
      endif
      Return
    endif
  elif Equal AirGroundState 1 && amount > 0 && Equal OFramesHitstun 0
    if Equal CurrAction hex(0x01) && !(Equal CurrAction hex(0x07))
      ClearStick
    elif !(XDistLE DDMaxRange) && !(Equal OPos Direction) && CurrAction <= hex(0x03) && NumFrames > 3
      SetFrame 0
      Stick (-1)
    elif NumFrames >= frameCount && Equal CurrAction hex(0x03)
      Goto _ddSubr
    elif AnimFrame >= dashForceTurnFrame && Equal CurrAction hex(0x03)
      Goto _ddSubr
    elif Equal CurrAction hex(0x04)
      ClearStick
      Stick 0 (-1)
    elif XDistFrontEdge <= 10
      SetFrame 0
      Stick (-1)
      amount -= 1
      if Rnd < 0.05 && !(Equal Direction OPos)
        amount = 100
      endif
    elif ODistLE globTempVar && CurrAction <= hex(0x03)
      if Rnd <= 0.2
        Seek _dashdanceEnd
        Jump
      endif

      if Equal Direction OPos && Rnd < 0.3 && XDistFrontEdge > edgeRange
        if Rnd < 0.1
          amount = 100
        endif
        amount -= 1
        Goto _ddSubr
      elif Equal Direction OPos && XDistBackEdge < -edgeRange && Rnd < 0.7
        SetFrame 0
        Stick (-1)
        amount -= 1
      elif Equal Direction OPos && Rnd < 0.05
        amount = 0
      else
        Stick 1
      endif
    elif Rnd < 0.7 && Equal CurrAction hex(0x03) && !(XDistFrontEdge <= 10)
      Stick 0.7
      Return
    else
      Stick 1
    endif
    Return
  endif
  ClearStick
  Seek _dashdanceEnd
  Jump
  Return

  label _ddSubr
  SetFrame 0
  if Equal Direction OPos && Rnd < DDWaveDash && XDistFrontEdge > shortEdgeRange && XDistBackEdge < -shortEdgeRange
    amount -= 1
    Button X
  endif
  if amount > 0 && Rnd < 0.7
    if LevelValue <= LV7
      Stick (-1)
    elif LevelValue >= LV8 && Rnd < 0.65
      Stick (-1)
    endif
  endif
  frameCount = (Rnd * 20) + dashDanceMinFrames
  Return
endif
label _dashdanceEnd
Goto checks

#let minCount = var0
#let maxCount = var1
#let minWaitTime = var2
#let maxWaitTime = var3
SAFE_INJECT_0 minCount
SAFE_INJECT_1 maxCount
SAFE_INJECT_2 minWaitTime
SAFE_INJECT_3 maxWaitTime

move_xOffset = nspecial_xOffset
move_yOffset = nspecial_yOffset
move_xRange = nspecial_xRange
move_yRange = nspecial_yRange
move_hitFrame = nspecial_hitFrame

ClearStick
if Equal CurrAction hex(0x16) && AnimFrame >= 3
  Goto groundActs
elif CurrAction <= hex(0x9)
  Goto groundActs
elif Equal AirGroundState 2
  move_yRange = nspecial_aim_yRange
  label CNS
    Goto checks

    globTempVar = YSpeed * -1
    if YDistBackEdge > -20
      CalcYChange globTempVar 14 globTempVar Gravity MaxFallSpeed FastFallSpeed 1
    else
      CalcYChange globTempVar 14 globTempVar Gravity MaxFallSpeed FastFallSpeed 0
    endif
    move_yOffset = nspecial_aim_yOffset + globTempVar - OHurtboxSize

    if Equal AirGroundState 1
      Call AIHub
    endif
    #let iterator = var0
    move_xRange = nspecial_aim_xRange
    move_xOffset = 100
    move_lastHitFrame = 20
    move_hitFrame = 20
    label CNSIteration
      #let xDist = var2
      #let yDist = var3
      Goto CTD

      Abs xDist
      Abs yDist
      if xDist <= nspecial_aim_xRange && yDist <= move_yRange
        Button B
        Seek CNS_end
        Jump
      endif
      if move_xOffset <= 0 
        Seek CNS
        Return
      endif
      move_xOffset -= 25
      move_hitFrame -= 5
      move_lastHitFrame -= 5
      Seek CNSIteration
      Jump
      Return
  Return
  label CNS_end
    if AnimFrame >= 14 && Rnd < 0.8 && YDistBackEdge > -3 && !(Equal XDistBackEdge XDistFrontEdge)
      Button R
      if XDistBackEdge > -25 && XDistBackEdge < -10
        Stick 1 (-0.5)
      elif XDistFrontEdge < 25 && XDistFrontEdge > 10
        Stick (-1) (-0.5)
      else
        immediateTempVar = (Rnd - 0.5) * 10
        Stick immediateTempVar (-0.5)
      endif
    endif
    if Equal AirGroundState 1
      Seek
      Jump
    endif
  Return
  label
  laserCount += 1
  if laserCount >= minCount && laserCount < maxCount && Rnd < 0.2 || laserCount >= maxCount
    if Rnd < 0.2
      Call DashAttack
    elif Rnd < 0.5
      Call NAir
    else
      Call DSpecial
    endif
  endif
  Seek begin
  Return
endif

frameCounter += 1
Seek _dashdanceEnd
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
label CTD
CALC_TARGET_DISTANCES(var2, var3, var15, var16, move_hitFrame)
Return 
Return