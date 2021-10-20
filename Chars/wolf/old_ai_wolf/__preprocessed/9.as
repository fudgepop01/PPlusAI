// EDGE ESCAPE HUB
// controls how the AI decides to take back stage control
#include <Definition_AIMain.h>
id 0x8009

unk 0x0

SetTimeout 600

var21 = 32777

label start

if !(Equal Direction OPos)
  var22 = OPos * 0.5
  AbsStick var22
  Return
endif

if ODistLE 20 && Rnd < 0.25
  Seek commit
endif

predictOOption var17 12 LevelValue
predictionConfidence var22 12 LevelValue

if Equal var17 1
  var22 *= 0.65
  if var22 < Rnd
    Seek threat
    Jump
  endif
elif Equal var17 2 && var22 < Rnd
  Seek wait
  Jump
elif Equal var17 3 && var22 < Rnd
  Seek commit
  Jump  
endif

var17 = Rnd * 3
if var17 < 1
  Seek threat
elif var17 < 2
  Seek wait
else
  Seek commit
endif
Jump
Return

label threat
var16 = 101
var17 = Rnd * 4
if var17 < 1 && Equal AirGroundState 1
  label threat_WDBack
  var4 = Rnd * 10
  label 
  Goto checkSituation
  var4 -= 1
  if var4 <= 0
    Button X
    Seek
  endif
  AbsStick OPos
  if Equal CurrAction 1 || Equal CurrAction 6
    ClearStick
  endif 
  Return
  label
  Goto checkSituation
  var22 = OPos * -1
  AbsStick var22
  if InAir && YDistBackEdge > -1 && XDistBackEdge < -1 && Equal IsOnStage 1
    Button R
    if XDistBackEdge > -5
      ClearStick 
      AbsStick OPos (-1)
    else
      AbsStick var22 (-1)
    endif
    Seek
  elif InAir
    Call RecoveryHub
  endif
  Return 
  label
  Goto checkSituation
  if CurrAction <= 18
    Seek
  endif
  Return
  label
elif var17 < 2
  label threat_dash_foward
  var4 = Rnd * 4
  label 
  Goto checkSituation
  var4 -= 1
  if var4 <= 0 || XDistLE 15
    Seek
  endif
  AbsStick OPos
  if Equal CurrAction 1 || Equal CurrAction 6
    ClearStick
  endif 
  Return
  label
elif var17 < 3 && XDistBackEdge < -10
  label threat_dash_back
  var4 = Rnd * 4
  label 
  Goto checkSituation
  var4 -= 1
  if var4 <= 0 || XDistLE 15 || XDistFrontEdge < 6
    Seek
  endif
  var22 = OPos * -1
  AbsStick var22
  if Equal CurrAction 1 || Equal CurrAction 6
    ClearStick
  endif 
  Return
  label  
elif var17 < 4 && XSpeed < 0.5 && XSpeed > -0.5
  label threat_jump
  var4 = Rnd * 15 + 10
  Button X
  label 
  Goto checkSituation
  var4 -= 1
  if var4 <= 0
    Seek
  endif
  if XDistLE 20 && XDistBackEdge < -10 && InAir
    var22 = OPos * -1
    AbsStick var22
  endif
  Return
  label
else
  label threat_aerial
  Goto checkSituation
  var4 = Rnd * 15
  if !(InAir)
    Button X
    label 
    Goto checkSituation
    var4 -= 1
    if var4 <= 0
      Seek
    endif
    if !(XDistLE 20) && InAir
      var22 = OPos * 1
      AbsStick var22
    endif
    Return
  endif
  label
  Goto checkSituation
  if Rnd < 0.5
    ClearStick
    Button A
  else
    Button A
    Stick 1
  endif
  Seek
  Return
  label
  Goto checkSituation
  if InAir
    var22 = OPos * 1
    AbsStick var22
  else
    Seek
  endif
  Return
  label
endif

Seek start
trackOAction 12 1
Jump
Return

label wait
var16 = 102

if Rnd < 0.5
  label wait_stand
  var4 = Rnd * 10 + 5
  label 
  Goto checkSituation
  var4 -= 1
  if var4 <= 0
    Seek
  endif
  Return
  label
elif Equal AirGroundState 1
  label wait_shield
  Goto checkSituation
  var4 = Rnd * 40 + 10
  label 
  Goto checkSituation
  var4 -= 1
  Button R
  if var4 <= 0
    Seek
  elif Equal CurrAction 29 
    trackOAction 12 2
    Call OOSHub
  endif
  Return
  label
endif
label

Seek start
trackOAction 12 2
Jump
Return

label commit
var16 = 103

var17 = Rnd * 4
if var17 < 1
  label commit_attack
  Goto checkSituation
  if Rnd < 0.2
    Button A
    Stick 0 (-1)
  elif Rnd < 0.2
    Button A
    Stick 0.7 0
  else
    ClearStick
    Button A
  endif
  Seek
  Return
  label
  Goto checkSituation
  var22 = TopNX * -1
  AbsStick var22
  Return
elif var17 < 2
  label commit_aerial
  var4 = Rnd * 40 + 10
  Button X
  label 
  Goto checkSituation
  var4 -= 1
  var22 = TopNX * -1
  AbsStick var22
  if var4 <= 0 && InAir
    Seek
  endif  
  Return
  label
  if Rnd < 0.5
    ClearStick
    Button A
  else
    Button A
    Stick 1
  endif
  Seek
  Return
  label
  Goto checkSituation
  var22 = TopNX * -1
  AbsStick var22
  Return
elif var17 < 3
  label commit_roll
  Goto checkSituation
  if !(InAir)
    Seek
    Jump
  endif
  Return
  label
  Button R
  if Equal CurrAction 27
    var22 = TopNX * -1
    AbsStick var22
    Seek
  endif
  Return
  label
  Goto checkSituation
  if Equal CurrAction 27
    Seek commit_jump
  endif
  Return
elif var17 < 4
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
  var22 = TopNX * -1
  AbsStick var22
  Return
endif
Return

label checkSituation

  predictAverage var22 4 LevelValue
  predictAverage var17 5 LevelValue
  // DrawDebugRectOutline TopNX TopNY var22 var17 255 0 0 136
  if Equal AirGroundState 1 && OFramesHitstun < 1 && !(Equal var16 7)
    predictAverage var22 4 LevelValue
    var17 = OXSpeed * 5 * OPos * -1
    var22 += var17
    // LOGSTR 1868054784 1953784064 1667974144 1769174016 0
    // LOGVAL var22
    if XDistLE var22
      predictAverage var22 5 LevelValue
      var17 = OYSpeed * 5
      var22 += var17
      var17 = TopNY - OTopNY
      Abs var17
      // LOGSTR 1868120320 1953784064 1667974144 1769174016 0
      // LOGVAL var22
      if var17 <= var22
        if CalledAs DefendHub
          var22 = 8
        else
          var22 = 7
        endif
        
        if !(OAttacking) && Rnd <= 0.05
          trackOAction var22 0
          predictAverage var17 4 LevelValue
          var17 *= 0.5
          trackOAction 4 var17
        endif
        predictOOption var17 var22 LevelValue
        predictionConfidence var22 var22 LevelValue
        
        var22 *= 0.1
        if Equal var17 1 && Rnd <= var22
          var22 = OPos * OXSpeed
          if var22 < 0 
            LOGSTR 1684366848 1701733376 540082176 0 0
            Call Unk3020
          endif
        elif Equal var17 1 && Rnd <= var22 && Rnd < 0.2
          var18 = 1
          LOGSTR 1684366848 1701733376 540147712 0 0
          Call FakeOutHub
        endif
        if Equal var17 1 && Rnd <= var22 && OAttacking && OAnimFrame > 10 && OAnimFrame < 20
          var22 = OPos * OXSpeed
          if var22 < 0 
            LOGSTR 1684366848 1701733376 540213248 0 0
            Call Unk3020
          endif
        endif
      endif
    endif
  endif
  if OAttacking && OAnimFrame < 2 && ODistLE 90
    var22 = TopNX - OTopNX
    Abs var22
    var22 += 10
    if var22 > 126
      var22 = 126
    endif
    trackOAction 4 var22
  endif
if OAnimFrame > 1 && OAnimFrame <= 2 && ODistLE 80
  if OPrevAction >= 66 && OPrevAction <= 69 || Equal OPrevAction 73 || Equal var16 7
    if Equal OCurrAction 12 || Equal OCurrAction 13
      trackOAction 14 1
    elif OAttacking && Rnd < 0.6
      trackOAction 14 1
    elif Equal OCurrAction 14 || Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 96 || Equal OCurrAction 97
      if OFramesHitstun <= 0 && Rnd < 0.5
        trackOAction 14 2
      endif
    endif
  endif
endif
// if OAttacking && OAnimFrame > 1 && OAnimFrame <= 2 && ODistLE 70
//   if YDistBackEdge > -3 && YDistBackEdge <= 3
//     var22 = TopNX - OTopNX
//     Abs var22
//     var22 += 10
//     if var22 > 126
//       var22 = 126
//     endif
//     trackOAction 4 var22
//     var22 = TopNY - OTopNY
//     Abs var22
//     var22 += 10
//     if var22 > 126
//       var22 = 126
//     endif
//     trackOAction 5 var22
//   endif
// endif

  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 = var1 - (TopNY * -1)
Abs var0

var1 = TopNX
Abs var1
var2 = OTopNX
Abs var2

var3 = TopNY - OTopNY

if Equal IsOnStage 0
  Call RecoveryHub
elif var0 > 45 || var1 < var2 || !(XDistLE 50) || var3 > 40
  if Equal var16 103
    trackOAction 12 3
  endif
  Call AIHub
elif OFramesHitstun > 0
  if Equal var16 103
    trackOAction 12 3
  endif
  Call ComboHub
elif OAttacking && OAnimFrame > 10 && !(Equal var16 103)
  Seek commit
  Jump
endif
Return
Return
