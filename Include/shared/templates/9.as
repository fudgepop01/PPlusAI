// EDGE ESCAPE HUB
// controls how the AI decides to take back stage control
#include <Definition_AIMain.h>
id 0x8009

unk 0x0

SetTimeout 600

lastScript = hex(0x8009)
#let frameCount = var4

label start

if !(Equal Direction OPos)
  immediateTempVar = OPos * 0.5
  AbsStick immediateTempVar
else
  Seek
  Jump
endif

if ODistLE 20 && Rnd < 0.3
  Seek commit
endif

predictOOption globTempVar man_atEdgeInit LevelValue
predictionConfidence immediateTempVar man_atEdgeInit LevelValue

if Equal globTempVar op_threat
  immediateTempVar *= 0.65
  if immediateTempVar < Rnd
    Seek threat
    Jump
  endif
elif Equal globTempVar op_wait && immediateTempVar < Rnd
  Seek wait
  Jump
elif Equal globTempVar op_commit && immediateTempVar < Rnd
  Seek commit
  Jump  
endif

globTempVar = Rnd * 3
if globTempVar < 1
  Seek threat
elif globTempVar < 2
  Seek wait
else
  Seek commit
endif
Jump
Return

label threat
edgeType = et_threat
globTempVar = Rnd * 4
if globTempVar < 1 && Equal AirGroundState 1
  label threat_WDBack
  frameCount = Rnd * 10
  label 
  Goto checkSituation
  frameCount -= 1
  if frameCount <= 0 || XDistLE 15
    Button X
    Seek
  endif
  AbsStick OPos
  Return
  label
  Goto checkSituation
  immediateTempVar = OPos * -1
  AbsStick immediateTempVar
  if InAir
    Button R
    if XDistBackEdge > -5
      ClearStick 
      AbsStick 0 (-1)
    else
      AbsStick immediateTempVar (-1)
    endif
    Seek
  endif
  Return 
  label
  Goto checkSituation
  if CurrAction <= hex(0x12)
    Seek
  endif
  Return
  label
elif globTempVar < 2
  label threat_dash_foward
  frameCount = Rnd * 4
  label 
  Goto checkSituation
  frameCount -= 1
  if frameCount <= 0 || XDistLE 15
    Seek
  endif
  AbsStick OPos
  if Equal CurrAction hex(0x01)
    ClearStick
  endif 
  Return
  label
elif globTempVar < 3 && XDistBackEdge < -10
  label threat_dash_back
  frameCount = Rnd * 4
  label 
  Goto checkSituation
  frameCount -= 1
  if frameCount <= 0 || XDistLE 15 || XDistFrontEdge < 6
    Seek
  endif
  immediateTempVar = OPos * -1
  AbsStick immediateTempVar
  Return
  label  
elif globTempVar < 4 && XSpeed < 0.5 && XSpeed > -0.5
  label threat_jump
  frameCount = Rnd * 15 + 10
  Button X
  label 
  Goto checkSituation
  frameCount -= 1
  if frameCount <= 0
    Seek
  endif
  if XDistLE 20 && XDistBackEdge < -10 && InAir
    immediateTempVar = OPos * -1
    AbsStick immediateTempVar
  endif
  Return
  label
else
  label threat_aerial
  Goto checkSituation
  frameCount = Rnd * 15
  if !(InAir)
    Button X
    label 
    Goto checkSituation
    frameCount -= 1
    if frameCount <= 0
      Seek
    endif
    if !(XDistLE 20) && InAir
      immediateTempVar = OPos * 1
      AbsStick immediateTempVar
    endif
    Return
  endif
  label
  Goto checkSituation
  {AERIAL_THREATS}
  Seek
  Return
  label
  Goto checkSituation
  if InAir
    immediateTempVar = OPos * 1
    AbsStick immediateTempVar
  else
    Seek
  endif
  Return
  label
endif

Seek start
trackOAction man_atEdgeInit op_threat
Jump
Return

label wait
edgeType = et_wait

if Rnd < 0.5
  label wait_stand
  frameCount = Rnd * 10 + 5
  label 
  Goto checkSituation
  frameCount -= 1
  if frameCount <= 0
    Seek
  endif
  Return
  label
else
  label wait_shield
  Goto checkSituation
  frameCount = Rnd * 40 + 20
  label 
  Goto checkSituation
  frameCount -= 1
  Button R
  if frameCount <= 0
    Seek
  elif Equal CurrAction hex(0x1D) 
    trackOAction man_atEdgeInit op_wait
    Call OOSHub
  endif
  Return
  label
endif
Return
label

Seek start
trackOAction man_atEdgeInit op_wait
Jump
Return

label commit
edgeType = et_commit

globTempVar = Rnd * 4
if globTempVar < 1
  label commit_attack
  Goto checkSituation
  {GROUND_ATTACKS}
  Seek
  Return
  label
  Goto checkSituation
  immediateTempVar = TopNX * -1
  AbsStick immediateTempVar
  Return
elif globTempVar < 2
  label commit_aerial
  frameCount = Rnd * 40 + 10
  Button X
  label 
  Goto checkSituation
  frameCount -= 1
  immediateTempVar = TopNX * -1
  AbsStick immediateTempVar
  if frameCount <= 0 && InAir
    Seek
  endif  
  Return
  label
  {AERIAL_ATTACKS}
  Seek
  Return
  label
  Goto checkSituation
  immediateTempVar = TopNX * -1
  AbsStick immediateTempVar
  Return
elif globTempVar < 3
  label commit_roll
  Goto checkSituation
  if !(InAir)
    Seek
  endif
  Return
  label
  Button R
  if Equal CurrAction hex(0x1B)
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
    Seek
  endif
  Return
  label
  Goto checkSituation
  if Equal CurrAction hex(0x1B)
    Seek commit_jump
  endif
  Return
elif globTempVar < 4
  label commit_jump
  Goto checkSituation
  if InAir && Rnd <= 0.03
    Seek
    Return
  endif
  Button X
  Return
  label
  Goto checkSituation
  Button X
  immediateTempVar = TopNX * -1
  AbsStick immediateTempVar
  Return
endif
Return

label checkSituation
#const outEdgeRange = calc(edgeRange + 20)

#let absNearCliffX = var0
NEAREST_CLIFF(absNearCliffX, var1)
Abs absNearCliffX

#let absPos = var1
#let absOPos = var2
absPos = TopNX
Abs absPos
absOPos = OTopNX
Abs absOPos

#let oYDist = var3
oYDist = TopNY - OTopNY

if absNearCliffX > outEdgeRange || absPos < absOPos || !(XDistLE 50) || oYDist > 40
  if Equal edgeType et_commit
    trackOAction man_atEdgeInit op_commit
  endif
  Call AIHub
elif OFramesHitstun > 0
  if Equal edgeType et_commit
    trackOAction man_atEdgeInit op_commit
  endif
  Call ComboHub
elif OAttacking && OAnimFrame > 10 && !(Equal edgeType et_commit)
  Seek commit
  Jump
endif
Return
Return