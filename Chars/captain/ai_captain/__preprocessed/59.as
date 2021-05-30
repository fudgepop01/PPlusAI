id 0x59

unk 0x0

  if FramesHitstun > 0
    var22 = LevelValue * 0.01 - 0.1
    if LevelValue >= 60 && Rnd <= var22
      ClearStick
      Stick 0 (-1)
    endif
    Call OnGotDamaged
  endif
if var3 < 0 || var3 > var15
  var3 = -1
endif
Cmd30
var3 += 1
if Equal HitboxConnected 1 && OKBSpeed > var16 && OFramesHitstun > 0
  var16 = OKBSpeed
endif
if Equal var3 1
  if OAttacking && Rnd < 0.8
    trackOAction 12 1
  elif OCurrAction >= 26 && OCurrAction <= 33 && Rnd < 0.8
    trackOAction 12 2
  elif OCurrAction >= 52 && OCurrAction <= 56 && Rnd < 0.8
    trackOAction 12 3
  elif Rnd < 0.3
    trackOAction 12 0
  endif
endif
if Equal var3 10
  if OAttacking && Rnd < 0.7
    trackOAction 8 1
  elif OCurrAction >= 26 && OCurrAction <= 33 && Rnd < 0.7
    trackOAction 8 2
  elif OCurrAction >= 52 && OCurrAction <= 56 && Rnd < 0.7
    trackOAction 8 3
  elif Rnd < 0.2
    trackOAction 8 0
  endif
endif
if Equal var3 var13 && !(Equal var16 4) && Equal var21 32769
  predictOOption var17 14 LevelValue
  var22 = OTopNX - TopNX
  if var22 < -15 && Equal HitboxConnected 0
    if Equal AirGroundState 2
      if XSpeed < -0.2
        if Equal var17 3
          trackOAction 14 2
        else
          trackOAction 14 1
        endif
      elif XSpeed > 0.2
        if Equal var17 1
          trackOAction 14 2
        else
          trackOAction 14 3
          trackOAction 14 3
        endif
      endif
    elif True
      if Equal OPos Direction
        if Equal var17 3
          trackOAction 14 2
        else
          trackOAction 14 1
        endif
      elif True
        if Equal var17 1
          trackOAction 14 2
        else
          trackOAction 14 3
          trackOAction 14 3
        endif
      endif
    endif
  elif var22 > 15 && Equal HitboxConnected 0
    if Equal AirGroundState 2
      if XSpeed < -0.2
        if Equal var17 1
          trackOAction 14 2
        else
          trackOAction 14 3
          trackOAction 14 3
        endif
      elif XSpeed > 0.2
        if Equal var17 3
          trackOAction 14 2
        else
          trackOAction 14 1
        endif
      endif
    elif True
      if Equal OPos Direction
        if Equal var17 3
          trackOAction 14 2
        else
          trackOAction 14 1
        endif
      elif True
        if Equal var17 1
          trackOAction 14 2
        else
          trackOAction 14 3
          trackOAction 14 3
        endif
      endif
    endif
  else
    trackOAction 14 var17
  endif
  var22 = Rnd * 7
  if var22 < 1
    trackOAction 14 1
  elif var22 < 2
    trackOAction 14 2
  elif var22 < 4
    trackOAction 14 3
  endif
  // HIGHLIGHT_GUESSES(14, LevelValue)
endif
if var3 >= var15 || CurrAction <= 9
  Call AIHub
endif

if Equal IsOnStage 0
  Call AIHub
endif


if Equal IsOnStage 0
  Call AIHub
endif

if Equal var18 1 && YSpeed <= 0 && Equal IsFastfalling 0 && Equal IsOnStage 1
  Stick 0 (-1)
elif Equal var19 1
  var0 = OPos
elif Equal var19 2
  var0 = (ExactOXCoord - ExactXCoord) / 10
else
  var0 = 0
endif
AbsStick var0 (-0.6)


if YSpeed < 0 && YDistBackEdge > -5 && Equal CurrAction 51 && AnimFrame < var15 && FramesSinceShield > 7 && LevelValue >= 60
  Button R
endif
if Equal AirGroundState 1
  var18 = 0
  Call AIHub
endif
Return
Return
