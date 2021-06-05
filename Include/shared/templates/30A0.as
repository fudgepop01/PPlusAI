// Spotdodge routine

#include <Definition_AIMain.h>
//TrueID=0x0
id 0x30A0

//Set Unknown
unk 0x0

if !(Equal AirGroundState 1)
  FORCED_SWITCH_CONDITIONS
  Call AIHub
endif

if !(OAttacking)
  if FrameGE 21
    Finish
  endif
  Return
endif

SetTimeout 50
if Equal IsOnStage 1 && Equal AirGroundState 1
  Button R
  Stick 0 (-1)
endif
Call AIHub
Return
Return