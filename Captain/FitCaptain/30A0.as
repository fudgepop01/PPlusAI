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
DEFENSIVE_REACTION_TIME(var0, var1)
  Button R
  Stick 0 (-1)
  Call AIHub
Return
Return