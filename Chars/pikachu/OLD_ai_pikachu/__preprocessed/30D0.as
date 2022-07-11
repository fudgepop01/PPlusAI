#include <Definition_AIMain.h>
//TrueID=0x30D0
id 0x30D0

//Set Unknown
unk 0x00000

//Strings

LOGSTR 1027423488 1027423488 1027423488 1027423488 0
LOGSTR 1027423488 540225536 1144004608 1027423488 0
LOGSTR 1027423488 1027423488 1027423488 1027423488 0
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

