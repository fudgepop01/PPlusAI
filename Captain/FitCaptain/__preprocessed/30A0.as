// Spotdodge routine

#include <Definition_AIMain.h>
//TrueID=0x0
id 0x30A0

//Set Unknown
unk 0x0

if !(Equal AirGroundState 1)
    Finish
endif

if !(OAttacking)
  if FrameGE 21
    Finish
  endif
  Return
endif

SetTimeout 50
  var1 = Rnd * 5
  if var1 >= 5
      var0 = 0
  elif var1 >= 4
      var0 = 5
      if Equal LevelValue 100
        var0 = 0
      endif
  elif var1 >= 3
      var0 = 10
  elif var1 >= 2
      var0 = 15
  else
      var0 = 21
  endif
  if !(Equal var0 0)
    var0 = var0 + Rnd * 5
    var0 = var0 + Rnd * (100 - LevelValue) / 6
  endif
  label
  if var0 <= 0
      Seek
  endif
  var0 -= 1
  Return
  label begin
if Equal IsOnStage 1
  Button R
  Stick 0 (-1)
endif
Call AIHub
Return
Return