// NEUTRAL HUB
// controls pathing when in "neutral"
#include <Definition_AIMain.h>
id 0x8006

unk 0x0

Cmd30
// if InAir && Equal IsOnStage 1
//   Call AIHub
// endif

if InAir
  Call AIHub
endif

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

predictAverage var22 3 LevelValue
var22 += 15
if XDistLE var22
  Norm var22 TopNX TopNY
  Norm var17 OTopNX OTopNY
  if Equal AirGroundState 1
    if Equal var16 2
      var0 = 20 + Rnd * 30
      Seek _defend
      Jump
    elif XDistBackEdge < -25 && Rnd < 0.5
      var0 = 5 + Rnd * 10
      label
      var17 = OPos * -1
      AbsStick var17
      var0 -= 1
      if var0 < 0
        Call AIHub
      endif
    elif Rnd < 0.4
      var0 = 5 + Rnd * 10
      Button X
      label
      ClearStick
      var0 -= 1
      if var0 < 0
        Call AIHub
      endif
    elif Rnd < 0.2
      label
      Button X
      AbsStick OPos
    elif Rnd < 0.6
      label
      Call FakeOutHub
    else
      var0 = 10 + Rnd * 20
      label _defend
      Button R
      var0 -= 1
      var17 = OPos * 0.5
      var22 = OTopNY - TopNY
      var22 *= 0.5
      AbsStick var17 var22

      if var0 <= 0 || Equal CurrAction 29 || !(XDistLE 40)
        Call OOSHub
      endif
      Return
    endif
  endif

  Goto trackOMoves

  if Rnd < 0.05 || XDistFrontEdge < 25 || XDistBackEdge > -25 || Equal AirGroundState 2
    Call AIHub
  endif
else
  Call AIHub
endif

if Equal CurrAction 1
  ClearStick
endif
Return

label trackOMoves
  if ODistLE 45 && Equal OAnimFrame 5
    if OCurrAction >= 26 && OCurrAction <= 33 && Rnd < 0.7
      trackOAction 8 2
    elif OCurrAction >= 52 && OCurrAction <= 56 && Rnd < 0.7
      trackOAction 8 3
    elif OAttacking && Rnd < 0.7
      trackOAction 8 1
    elif Rnd < 0.1
      trackOAction 8 0
    endif

    predictOOption var17 8 LevelValue
    predictionConfidence var22 8 LevelValue

    if Equal var17 1 && Rnd < var22
      Call AIHub
    elif Equal var17 2 && Rnd < var22
      var18 = 0
      var21 = 32770
      Call Grab
    elif Equal var17 3 && Rnd < var22
      Call AIHub
    endif
  endif 
Return

Return
Return
