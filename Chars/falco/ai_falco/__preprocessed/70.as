#include <Definition_AIMain.h>
//TrueID=0x70
id 0x8070

//Set Unknown
unk 0x0

//Strings

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

if DistFrontEdge < 25 || !(ODistLE 60) || InAir
    Goto _end
elif DistBackEdge < 25 || !(ODistLE 60) || InAir
    Goto _end
endif
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Button X
endif
if InAir
    Button R
    if ODistLE 40
        var17 = OPos * -1
        AbsStick var17 (-1)
    else
        AbsStick OPos (-1)
    endif
endif
if FrameGE 10
    Goto _end
endif
Return

label _end
  if OAttacking && Equal AirGroundState 1
    if Rnd < 0.3
      Call Spotdodge
    elif Rnd < 0.3
      Call RollBase
    elif True
      label defStart
  if !(OAttacking) || Rnd <= 0.1 || OCurrActionFreq >= 4
    Seek begin
    Jump
  endif
  var0 = 21 - 0
  var0 = Rnd * var0 + 0
  if !(Equal var0 0)
    var0 = var0 + Rnd * (100 - LevelValue) / 6
  endif
  
  // var0 = var0 - (OCurrActionFreq * 4) 
  var1 = 0
  label
  LOGSTR 1027423488 1025524736 1162223616 1027423488 1023410176
  if FramesHitstun > 0
    Call AIHub
  endif
  if !(OAttacking)
    var1 = 1
  endif
  if Equal CurrAction 3
    Stick 0.8
  elif Equal CurrAction 4
    Stick 0 (-1)
  endif
  if Equal var1 1 && OAttacking
    Seek
    Jump
  elif var0 <= 0
    Seek
    Jump
  endif
  var0 -= 1
  Return
  label
  SetFrame 0
  label begin
      label def
      if Rnd < 0.3
        Call Unk3020
      elif Rnd < 0.3
        Button R
        Stick 1
        Call AIHub
      elif Rnd < 0.3
        Button R 
        Stick -1
        Call AIHub
      endif
      Return
    endif
  else
    predictOOption var0 6 LevelValue
    predictionConfidence var1 6 LevelValue
    if Equal var0 1 && Rnd < 6
      Seek def
      Jump
    endif
    if Equal var21 32769
      Call ApproachHub
    endif
    Call AIHub
  endif
Call AIHub
Return
Return

