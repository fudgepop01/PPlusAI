#snippet USPECIAL_ACTIONS
  elif Equal CurrAction hex(0x114) || Equal CurrAction hex(0x119) || Equal CurrAction hex(0x11A)
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsClose = 4
#endsnippet

#snippet DSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
  endif
#endsnippet

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
  endif
#endsnippet

#snippet INITIALIZERS
  #let recoveryType = var10
  recoveryType = Rnd
#endsnippet

#snippet ADDITIONAL_TRIGGERS
LOGSTR str("NCY")
LOGVAL nearCliffY
LOGVAL absNCX
if nearCliffY > -10 && nearCliffY < 5 && absNCX < 40 && recoveryType <= 0.4
  ClearStick
  AbsStick nearCliffX
  Button B
elif nearCliffY > 60 && absNCX > maxXEdgeDist
  ClearStick
  AbsStick 0 (-0.7)
  Button B
elif nearCliffY > 60 && recoveryType <= 0.6
  ClearStick
  AbsStick 0 (-0.7)
  Button B
endif
#endsnippet