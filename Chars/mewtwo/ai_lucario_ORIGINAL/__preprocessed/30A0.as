// Spotdodge routine

#include <Definition_AIMain.h>
//TrueID=0x0
id 0x30A0

//Set Unknown
unk 0x0

if !(Equal AirGroundState 1)
  if OAttacking && Equal AirGroundState 1
    Call Unk3020
  elif Equal var21 32769
    Call ApproachHub
  endif
  Call AIHub
endif

if !(OAttacking)
  if FrameGE 21
    Finish
  endif
  Return
endif

SetTimeout 50
  if !(OAttacking) || Rnd <= 0.25 || OCurrActionFreq >= 4
    Seek begin
    Jump
  endif
  var0 = 9999.9999 - 9999.9999
  var0 = Rnd * var0 + 9999.9999
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
if Equal IsOnStage 1
  Button R
  Stick 0 (-1)
endif
Call AIHub
Return
Return
