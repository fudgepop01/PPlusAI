// OOS HUB
// controls OOS options
#include <Definition_AIMain.h>
id 0x8007

unk 0x0

#let tempVar = var0
#let grabOOS = var1
#let grabRange = var2
#let timer = var3
timer = 20
predictOOption globTempVar man_shield LevelValue
predictionConfidence immediateTempVar man_shield LevelValue
if Equal globTempVar op_attack
  timer = 40
  if immediateTempVar >= 0.4
    timer = 55
  elif immediateTempVar >= 0.8
    timer = 70
  endif
  timer *= LevelValue * 0.01
endif

grabOOS = 0
label
Cmd30
lastScript = hex(0x8007)

#let endDangerFrame = var5
#let OCurrEndlag = var4
RetrieveATKD OCurrEndlag OCurrSubaction 1

OCurrEndlag = OEndFrame - OAnimFrame
if Equal OCurrAction hex(0x33)
  globTempVar = OTopNY + OYDistBackEdge
  EstOPassTimeY globTempVar globTempVar
  globTempVar += 11
  if globTempVar < OCurrEndlag
    OCurrEndlag = globTempVar
  endif
endif
if OAttacking && OCurrEndlag > 15 && OAnimFrame >= endDangerFrame 
  AbsStick OPos
  Call AIHub
elif XDistLE 50 && timer > 0
  Button R
elif OAttacking && OAnimFrame > 15 && OAnimFrame < endDangerFrame && XDistLE 50
  timer += 1
  Button R
endif
timer -= 1

if Equal CurrAction hex(0x1D)
  Button R
  if Equal OPos Direction && XDistLE 12 && Rnd < 0.8 && AnimFrame > 3
    grabOOS = 1
  endif
  if LevelValue >= LV8 && Equal OPos Direction
    tempVar = OPos
  else
    tempVar = OPos * 0.6 * -1
  endif
  AbsStick tempVar
  Return
endif

immediateTempVar = OTopNY - TopNY 
if Equal grabOOS 1 && XDistLE calc(grab_xRange * 2 + grab_xOffset) && immediateTempVar < 10 && Equal OPos Direction && OCurrEndlag > 3
  Button R
  if Equal CurrAction hex(0x1B)
    Button A|R
    movePart = 1
    Call Grab
  endif
  Return
endif

predictAverage globTempVar man_oXHitDist LevelValue
globTempVar += 10
immediateTempVar = globTempVar + 20
if XDistLE globTempVar immediateTempVar
  Goto other_GOOS
elif Equal grabOOS 1
  Goto other_GOOS
endif

if !(True)
  label other_GOOS
  Button R
  if Equal LevelValue LV9 && Equal IsOnPassableGround 1 && Rnd < 0.7
    Seek shieldDropOOS
    Jump
  elif Equal CurrAction hex(0x1B) && OCurrEndlag > 8 && timer <= 10 || XDistLE globTempVar immediateTempVar && !(OAttacking)
    globTempVar = Rnd * 100
    if globTempVar < 78
      Button X
      Seek jumpHandler
      Return
    elif globTempVar < 90 && XDistFrontEdge > edgeRange
      AbsStick OPos
    elif globTempVar < 93
      globTempVar = OPos * -1
      AbsStick globTempVar
    else
      AbsStick 0 (-1)
    endif
    Call AIHub
  endif
  Return
endif

NEAREST_CLIFF(globTempVar, immediateTempVar)
immediateTempVar = globTempVar
Abs immediateTempVar
if immediateTempVar < 25 && Equal IsOnStage 1 && Rnd < 0.1
  Button R
  globTempVar *= -1
  AbsStick globTempVar
  Return
endif

if Equal CurrAction hex(0x1C)
  Button X
  Seek jumpHandler
  Return
endif

if CurrAction <= hex(0x19)
  Call AIHub
endif
Return

label shieldDropOOS
  immediateTempVar = 3
  label
  ClearStick
  Button R
  if Equal CurrAction hex(0x1B)
    Stick 0 (-0.715)
    immediateTempVar -= 1
    if immediateTempVar <= 0
      Button X
      Seek jumpHandler
      Return
    endif
  elif Equal CurrAction hex(0x72)
    {SHIELDDROP_OPTIONS}
    Call AIHub
  endif
Return

label jumpHandler
Cmd30
#let absOXSpeed = var0
#let OTowardsOrAway = var1
absOXSpeed = OXSpeed
Abs absOXSpeed
globTempVar = OPos * 0.4
AbsStick globTempVar
OTowardsOrAway = OXSpeed * OPos
if SamePlane && OTowardsOrAway < 0 && absOXSpeed > 0.2 && InAir && ODistLE 60
  {OFFENSIVE_OPTIONS}
elif Rnd < 0.3 && InAir && XDistLE 60
  {OFFENSIVE_OPTIONS}
endif

if InAir
  if XDistBackEdge < -shortEdgeRange && OCurrEndlag < 6
    globTempVar = OPos * -1
    AbsStick globTempVar (-1)
  elif XDistFrontEdge > shortEdgeRange && LevelValue >= 7
    AbsStick OPos (-1)
  else
    AbsStick 0 (-1)
  endif

  Button R
  {WAVEDASH_OPTIONS}
  Call AIHub
endif
Return
Return