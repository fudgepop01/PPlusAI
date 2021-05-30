id 0x59

unk 0x0

if Equal HitboxConnected 1 && OKBSpeed > var16 && OFramesHitstun > 0
  var16 = OKBSpeed
endif
if Equal AnimFrame 1
  if OAttacking && Rnd < 0.8
    trackOAction 12 3
  elif OCurrAction >= 26 && OCurrAction <= 33 && Rnd < 0.8
    trackOAction 12 2
  elif OCurrAction >= 52 && OCurrAction <= 56 && Rnd < 0.8
    trackOAction 12 3
  elif Rnd < 0.3
    trackOAction 12 0
  endif
endif
if AnimFrame > 30 && AnimFrame <= 31 
  if OAttacking && Rnd < 0.7
    trackOAction 8 3
  elif OCurrAction >= 26 && OCurrAction <= 33 && Rnd < 0.7
    trackOAction 8 2
  elif OCurrAction >= 52 && OCurrAction <= 56 && Rnd < 0.7
    trackOAction 8 3
  elif Rnd < 0.2
    trackOAction 8 0
  endif
endif
var22 = var14 + 1
if AnimFrame >= var14 && AnimFrame < var22 && !(Equal var16 4)
  var22 = OTopNX - TopNX 
  if var22 < -10 && Equal HitboxConnected 0
    if XSpeed < -0.2
      trackOAction 14 1
    elif XSpeed > 0.2
      trackOAction 14 3
    endif
  elif var22 > 10 && Equal HitboxConnected 0
    if XSpeed < -0.2
      trackOAction 14 3
    elif XSpeed > 0.2
      trackOAction 14 1
    endif
  else
    trackOAction 14 2
  endif
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
