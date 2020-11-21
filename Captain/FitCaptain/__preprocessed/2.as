// COMBO HUB
// a place for determining the next best attack when an opponent is in hitstun
#include <Definition_AIMain.h>
id 0x8002

unk 0x0

// each var20 corresponds to a move routine... so like 6031 means jab
// was the last move used...

ClearStick
var18 = 0

var1 = OTopNY - TopNY

// LOGSTR 1668246784 1651460096 1969356800 0 0
if Equal var20 24625
  // ...thus we'll end up here
  if ODamage > 20
    if var1 > 45
      Call UAir
    elif var1 > 15
      Call FAir
    else
      Call DAir
    endif
  endif
elif Equal var20 24626
  if ODamage < 40 && Equal OAirGroundState 1
    var0 = Rnd * 2
    if var0 < 1
      Call Grab
    elif var0 < 2
      Call Jab123
    endif
  else
    Call DAir
  endif
// elif Equal var20 24627
elif Equal var20 24628
  if ODamage < 50
    var0 = Rnd * 2
    if var0 < 1
      Call Grab
    elif var0 < 2
      Call Jab123
    endif
  elif ODamage < 90
    var0 = Rnd * 2
    if var0 < 1
      Call DAir
    elif var0 < 2
      Call UAir
    endif
  else
    Call FAir
  endif
elif Equal var20 24636
  // LOGSTR 1735549440 1131241984 1862270976 0 0
  if Rnd < 0.05
    Call UAir
  endif
  if Equal var19 4
    if XDistLE 30
      Call FAir
    elif var1 > 20
      Call UAir
    else
      Call NAir
    endif
  elif Equal var19 2
    if ODamage > 60 && var1 > 25
      Call FAir
    elif var1 > 25 && OYSpeed > 0.15
      Call UAir
    endif
    var0 = Rnd * 3
    if ODamage > 40 && var0 < 2
      Call DAir
    else
      var19 = 1
      Call Grab
    endif
  endif
elif Equal var20 24641
  if var15 < 13 && var1 < 30
    Call Grab
  endif
  if var1 < 25
    Call NAir
  else
    Call UAir
  endif
elif Equal var20 24642
  if var1 > 20
    Call FAir
  else
    Call UAir
  endif
elif Equal var20 24643
  if ODamage > 60
    Call FAir
  else
    Call UAir
  endif
elif Equal var20 24644
  if ODamage > 60 && var1 > 30 && var1 < 60
    Call FAir
  elif MeteoChance && var1 < 80
    Call FAir
  else
    Call UAir
  endif
elif Equal var20 24645
  if Equal OAirGroundState 1 && OCurrAction <= 32 || Equal OCurrAction 77 || Equal OFramesHitstun 0
    Call AIHub
  endif
  if OYSpeed <= 0.1
    Return
  endif
  // LOGSTR 1870226432 1769174016 0 0 0
  // LOGVAL var1
  if ODamage > 70 && var1 > 40
    if Rnd < 0.8
      Call FAir
    else
      Call UAir
    endif
  elif ODamage > 60 && var1 > 25
    if Rnd < 0.8
      Call FAir
    else
      Call UAir
    endif
  elif var1 > 35
    Call UAir
  else
    if Rnd < 0.9
      Call DAir
    else
      Call USmash
    endif
  endif
endif

var19 = 255
Call AIHub
Return
Return
