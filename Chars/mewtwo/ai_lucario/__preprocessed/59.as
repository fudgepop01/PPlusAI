id 0x59

unk 0x0

  if FramesHitstun > 0
    var22 = LevelValue * 0.01 - 0.1
    if LevelValue >= 60 && Rnd <= var22
      if Damage < 30
        ClearStick
        Stick 0 (-1)
      elif Rnd < 0.4
        ClearStick
        Stick 0 (-1)
        if LevelValue >= 75 && Rnd <= var22
          Button R
        endif
      endif
    endif
    Call OnGotDamaged
  endif
  if Equal var4 -2
  elif var4 < 0 || var4 > var15
    var4 = -1
  endif
  Cmd30
  if Equal var4 -2
  else
    var4 += 1
  endif
  if Equal HitboxConnected 1 && OKBSpeed > var16 && OFramesHitstun > 0
    var16 = OKBSpeed
  endif
  if Equal var4 1
    if OCurrAction >= 26 && OCurrAction <= 33 && Rnd < 0.8
      trackOAction 11 2
    elif OCurrAction >= 52 && OCurrAction <= 56 && Rnd < 0.8
      trackOAction 11 3
    elif OAttacking && Rnd < 0.8
      trackOAction 11 1
    elif Rnd < 0.3
      trackOAction 11 0
    endif
  endif
  if Equal var4 10
  if OCurrAction >= 52 && OCurrAction <= 56 && Rnd < 0.7
    trackOAction 7 3
  elif OCurrAction >= 26 && OCurrAction <= 33 && Rnd < 0.7
    trackOAction 7 2
  elif OAttacking && Rnd < 0.7
    trackOAction 7 1
  elif Rnd < 0.2
    trackOAction 7 0
  endif
  endif
  if Equal var4 var13 && !(Equal var16 4) && Equal var21 32769
    predictOOption var17 13 LevelValue
    var22 = OTopNX - TopNX
    if var22 < -15 && Equal HitboxConnected 0
      if Equal AirGroundState 2
        if XSpeed < -0.2
          if Equal var17 3
            trackOAction 13 2
          else
            trackOAction 13 1
          endif
        elif XSpeed > 0.2
          if Equal var17 1
            trackOAction 13 2
          else
            trackOAction 13 3
            trackOAction 13 3
          endif
        endif
      elif True
        if Equal OPos Direction
          if Equal var17 3
            trackOAction 13 2
          else
            trackOAction 13 1
          endif
        elif True
          if Equal var17 1
            trackOAction 13 2
          else
            trackOAction 13 3
            trackOAction 13 3
          endif
        endif
      endif
    elif var22 > 15 && Equal HitboxConnected 0
      if Equal AirGroundState 2
        if XSpeed < -0.2
          if Equal var17 1
            trackOAction 13 2
          else
            trackOAction 13 3
            trackOAction 13 3
          endif
        elif XSpeed > 0.2
          if Equal var17 3
            trackOAction 13 2
          else
            trackOAction 13 1
          endif
        endif
      elif True
        if Equal OPos Direction
          if Equal var17 3
            trackOAction 13 2
          else
            trackOAction 13 1
          endif
        elif True
          if Equal var17 1
            trackOAction 13 2
          else
            trackOAction 13 3
            trackOAction 13 3
          endif
        endif
      endif
    else
      trackOAction 13 var17
    endif
    var22 = Rnd * 7
    if var22 < 1
      trackOAction 13 1
    elif var22 < 2
      trackOAction 13 2
    elif var22 < 4
      trackOAction 13 3
    endif
    // HIGHLIGHT_GUESSES(13, LevelValue)
  endif
  if Equal CanCancelAttack 1 || CurrAction <= 9
    var18 = 0
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
