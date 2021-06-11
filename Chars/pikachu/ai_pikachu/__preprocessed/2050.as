// forced-switch when hit by an attack
#include <Definition_AIMain.h>
//TrueID=0x2050
id 0x2050

//Set Unknown
unk 0x0

//Strings

Cmd30

if Equal var18 255
  Seek drifting
  Jump
endif

if Equal AirGroundState 1 && CurrAction <= 16
  var21 = 32770
  Call ApproachHub
endif

//______________________________________
// Rand DI / tech "smart" implementation
// randomly DIs unless conditions are met for survival DI

if !(Equal var21 8272)
  var22 = -1
  if Equal var21 32769
    var22 = 7
  elif Equal var21 32773
    var22 = 8
  elif Equal var21 32775
    var22 = 10
  endif

  var21 = 8272

  if Equal OCurrAction 60
    trackOAction var22 3
  else 
    trackOAction var22 1
  endif

  if ODistLE 70
    // if YDistBackEdge > -3 && YDistBackEdge <= 3
      var22 = TopNX - OTopNX
      Abs var22
      var22 += 5
      if var22 > 126
        var22 = 126
      endif
      trackOAction 4 var22
      var22 = TopNY - OTopNY
      Abs var22
      var22 += 5
      if var22 > 126
        var22 = 126
      endif
      trackOAction 5 var22
    // endif
  endif
endif

// if in hitstun...
if FramesHitstun > 0 || FramesHitlag > 0
  label hitstunHandler
  var21 = 32768
  if LevelValue >= 60
    var7 = Rnd * 4 * OPos * -1
    if KBAngle > 90 && KBAngle < 170
      var7 *= -1
    endif  
    if Rnd < 0.2
      var7 *= -1
    endif
  else
    var7 = (Rnd * 2) - 1
  endif
  if LevelValue >= 48
    var8 = Rnd - 1.5
  else
    var8 = (Rnd * 2) - 1
  endif
  if Rnd < 0.2
    var8 *= -1
  endif
  var2 = 1
  var3 = Rnd * 5 + 15
  var4 = 0
  // makes it loop from here each frame
  label _hitstunExecutor
  Cmd30

  if FramesHitlag > 1 && Equal LevelValue 100 
    if Rnd < 0.75
      var17 = OPos * -1
      if XDistBackEdge > -10
        var17 = OPos
      endif
      var22 = Rnd * 2 - 1
      if YDistBackEdge > -0.5 && LevelValue >= 75
        var22 = -1
      endif
      AbsStick var17 var22
    endif
    Return
  elif Equal FramesHitlag 1 && LevelValue >= 60 && YDistBackEdge > -1
    var22 = 0
    var17 = LevelValue * 0.01
    if LevelValue >= 75 && Rnd < var17
      var22 = TopNX * -1
      if FramesSinceShield > 100
        Button R
      endif
    endif
    AbsStick var22 (-1)
    Return
  endif
endif

if FramesHitlag > 1
  Seek hitstunHandler
  Return
endif

if Equal IsOnStage 0
  if CurrAction < 66 || CurrAction > 73
    Call RecoveryHub
  endif
endif

if LevelValue >= 21
  if Equal IsOnStage 0 && Equal CurrAction 69 && FramesHitlag <= 1
    Goto _checkTech
  elif Equal IsOnStage 1 && YDistBackEdge > -12 && YSpeed < 0
    Goto _checkTech
  endif
endif

if CurrAction < 11 || CurrAction > 16
  if FramesHitstun > 1 && Equal AirGroundState 2 || CurrAction >= 66 && CurrAction <= 68 && Equal AirGroundState 2 
    ClearStick
    if Equal var7 1 || Equal var7 -1.2 || Equal var7 -3
      if Equal var7 0
        AbsStick 0.3 0
        Return
      endif
      AbsStick var7 0
      Return
    elif True
      if KBAngle >= 80 && KBAngle <= 100
        var17 = Direction * -1
        AbsStick var17 (-1)
      elif Equal IsOnStage 0 || KBSpeed > 3.7
        // if offstage with high damage, switch to survival DI
        var7 = TopNX * -1
        AbsStick var7 1
      else
        AbsStick var7 var8
      endif
      if Equal LevelValue 75 && YDistBackEdge > -5 && Equal IsOnStage 1
        ClearStick
        AbsStick var7 (-1)
      endif
    endif
    // until hitstun is 0
    if LevelValue >= 60
      Goto _checkMeteorCancel
    endif
    Return
  endif
elif FramesHitstun > 0 && Equal DistFrontEdge DistBackEdge
  Call RecoveryHub
endif

if FramesHitstun > 1 && CurrAction >= 67 && CurrAction <= 69 && LevelValue >= 75
  var17 = OPos * -1
  if XDistBackEdge > -10
    var17 = OPos
  endif
  Stick var17 (-1)
  Return
endif

if FramesHitstun > 0 && CurrAction <= 16
  Seek
  Jump
elif FramesHitstun > 0 && var4 > 3 && LevelValue >= 42
  label
  var5 = Damage / 100
  var5 *= 0.75
  if Rnd < var5
    var18 = 1
    Call FakeOutHub
  endif
  
  if Equal AirGroundState 1
    if Rnd < 0.5 || LevelValue < 48
      Stick -1
    else
      var18 = 1
      Call DTilt
    endif
  elif Rnd < 0.2 && CanJump
    Button X
    var18 = 0
    Call DAir
  else
    Seek Hitstun_End
    Return
  endif
  Seek
  Jump
elif Equal FramesHitstun 1 && LevelValue >= 42
  label
  var17 = 15
  var6 = XSpeed * var17
  GetYDistFloorOffset var5 var6 5 0
  // var22 = TopNY - var5 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if var5 < 4 && !(Equal var5 -1) 
    var5 = 0
  elif Equal DistBackEdge DistFrontEdge
    var5 = 2
  elif Equal var5 -1
    if var6 < 0
      var5 = 1
    elif var6 > 0
      var5 = -1
    endif
  else
    var5 = 0
  endif
  if !(Equal var5 0)
    Call AIHub
    Return
  endif

  var5 = Damage / 100
  var5 *= 0.4
  if Rnd < var5 && ODistLE 40
    Call FakeOutHub
  endif

  if Equal AirGroundState 1
    if Rnd < 0.5 || LevelValue < 48
      Stick -1
    else
      var18 = 1
      Call DTilt
    endif
  elif Rnd < 0.2 && CanJump
    Button X
    var18 = 0
    Call DAir
  else
    Seek Hitstun_End
    Return
  endif
  Call AIHub
  Return
endif

if CurrAction >= 17 && CurrAction <= 23
  var4 += 1
endif

if FramesHitstun > 0 || FramesHitlag > 0
  Return
endif

Call AIHub
Return

// Goto statements will return back to where they came
// from if there isn't a label, making this possible
//
// makes the AI input R every 41 frames 80% (base) of the time
label _checkTech
if var2 <= 0
  if CurrAction >= 69 && CurrAction <= 77 && FramesSinceShield > 40
    var5 = (100 - LevelValue) / 100 * -1
    var5 += 0.95
    if Rnd < var5
      Button R
    endif
    var2 = 41
  endif
endif
var2 -= 1
Return

// THIS DOESN'T WORK
// YOU SPENT 4 HOURS TRYING TO MAKE IT WORK
// MAKING IT WORK BREAKS ALL OTHER RECOVERIES
// IT'S NOT WORTH IT BRO
// label _processTechInputs
// if LevelValue >= 48
//   var22 = 60
// else 
//   var22 = 100
// endif
// predictOOption var17 man_own_techchase var22 
// predictionConfidence var22 man_own_techchase var22

// if var22 >= 0.4 && Rnd < var22
//   label _mixups
//   if !(Equal var17 1) && Rnd < 0.5
//     Seek towards
//     Jump
//   elif !(Equal var17 3) && Rnd < 0.5
//     Seek away
//     Jump
//   endif
//   Seek _mixups
//   Jump
// elif True
//   label _habits
//   if Equal var17 1 || var22 <= 0.2 && Rnd < 0.5
//     Seek towards 
//     Jump
//   elif Equal var17 3 || var22 <= 0.2 && Rnd < 0.85
//     Seek away 
//     Jump
//   endif
//   Seek _habits
//   Jump
// endif


// if !(True)
//   label towards
//     if OPos < 0
//       var7 = -3
//     else
//       var7 = 1
//     endif
//     trackOAction man_own_techchase 1
//     Seek _executedRoll
//     Return
//   label away
//     if OPos < 0
//       var7 = 1
//     else
//       var7 = -3
//     endif
//     trackOAction man_own_techchase 3
//     Seek _executedRoll
//     Return
//   label _executedRoll
//     Seek _hitstunExecutor
//     Return
// endif
// Return

// meteor cancels when applicable 90% (base) of the time with
// a jump 50% of the time (if possible), otherwise with upB
label _checkMeteorCancel
if KBAngle >= 260 && KBAngle <= 280 && var3 <= 0 && Equal IsOnStage 0 && YDistFrontEdge > 0
  var5 = (100 - LevelValue) / 100
  var5 = 0.9 - var5
  if Rnd < 0.9
    if CanJump && Rnd < 0.5
      Button X
    elif CanJump && YDistFrontEdge > 40
      Button X
    else
      Stick 0 0.7
      Button B
      Call RecoveryHub
    endif
  endif
  var3 = 41
endif
var3 -= 1
Return

label Hitstun_End
  if YDistBackEdge > -20 || LevelValue <= 42
    Call AIHub
    Return
  endif
  GetRndPointOnStage var2
  label drifting
  if FramesHitlag > 0 || FramesHitstun > 0
    Call OnGotDamaged
  endif
  if !(Equal AirGroundState 1) && !(Equal XDistFrontEdge XDistBackEdge) && YDistBackEdge < -20
    if Rnd <= 0.02 && CanJump
      Button X
    endif
    if XDistLE 70
      var22 = OPos * -1
      AbsStick var22
    else
      var2 = TopNX - var2
      AbsStick var2 // the stick X var
    endif
    if YDistBackEdge > -12 && Rnd < 0.4 && Equal CurrAction 73
      Button R
    endif
    Return
  endif
  Call AIHub
Return
Return

