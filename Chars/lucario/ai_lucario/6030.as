#snippet PRE_SCRIPT_HOOKS
  if CalledAs USpecial
    movePart = 1
  endif
#endsnippet

#snippet PRE_HOOKS
  if Equal movePart 2
    if var5 <= move_xRange && var6 <= move_yRange
    elif !(XDistLE 50)
    else
      Button A
    endif
  endif
#endsnippet

#snippet USmash
  AbsStick OPos
  if Equal HitboxConnected 1 && NumFrames < 17 && Equal moveVariant mv_usmash_cancel
    movePart = 1
    moveVariant = mv_ASC
    ClearStick
    Button B
    Call NSpecial
  endif 
#endsnippet

#snippet POST_HOOKS
  if Equal HitboxConnected 1
    Call ComboHub
  endif
#endsnippet

#snippet AGS_CHECK
  if !(Equal AirGroundState 1) && !(CalledAs USmash)
    Call AIHub
  endif
#endsnippet

#snippet NSpecial
  if Equal moveVariant mv_ASC 
    Seek ASC
  elif Equal moveVariant mv_aurabomb
    Button A
    Seek aurabomb
  else
    Seek NSPSetup
  endif
  Return

  label ASC
  if CurrAction <= hex(0x09)
    Call AIHub
  endif

  if CurrSubaction >= hex(0x1D0) && CurrSubaction <= hex(0x1D3)
    Button R
    Call AIHub
  endif
  Return

  label aurabomb
  Button A
  Call AIHub
  Return

  label NSPSetup
  Goto checks
  if CurrSubaction >= hex(0x1D0) && CurrSubaction <= hex(0x1D3)
    Seek NSPExecuteSetup
    Return
  elif CurrAction <= hex(0x09)
    Call AIHub
  endif
  if !(Equal OPos Direction)
    AbsStick OPos
  endif
  Return

  label NSPExecuteSetup
  #let timer = var1
  timer = 10 + Rnd * 70

  label NSPExec
  Goto checks

  #let loopTempVar = var0
  loopTempVar = 20

  if Equal movePart 2
    Seek 
    Jump
  endif
  if !(True)
    label _chk
    #let targetXDist = var5
    #let targetYDist = var6

    Goto CTD

    if targetXDist <= move_xRange && targetYDist <= move_yRange
      Button B
    endif

    loopTempVar -= 5
    if loopTempVar <= 0
      Seek
      Jump
    else
      Seek _chk
      Jump
    endif
    Return
  endif
  label

  if ODistLE 30
    if Rnd < 0.8 && Equal Direction OPos
      Button B
    elif Rnd < 0.2
      Button R
    elif Rnd < 0.4
      Stick 1 0
    else
      Stick -1 0
    endif
  endif
  timer -= 1
  if timer <= 0 && Equal movePart 2
    Button R
    Call AIHub
  elif timer <= 0
    movePart = 2
    timer = 50 + Rnd * 100
  endif
  Seek NSPExec
  Return
#endsnippet

#snippet SSpecial
  if Equal moveVariant mv_sspecial_spike && Equal XDistBackEdge XDistFrontEdge && Equal frameCounter 20
    Button A
  elif Equal moveVariant mv_sspecial_power && Equal frameCounter 20 
    Button A
  endif

  if FrameGE move_IASA || CurrAction <= hex(0x09) || Equal HitboxConnected 1
    Call AIHub
  endif
#endsnippet

#snippet USpecial
  #let targetXDistance = var5
  #let targetYDistance = var6
  #let targetOverallDist = var7
  EST_O_COORDS(targetXDistance, targetYDistance, 4)

  targetXDistance -= TopNX
  targetYDistance -= TopNY

  Norm targetOverallDist targetXDistance targetYDistance
  targetXDistance /= targetOverallDist
  targetYDistance /= targetOverallDist
  AbsStick targetXDistance targetYDistance

  if Equal HitboxConnected 1 || Equal NumFrames 38
    label
    Button A
    if Equal CurrSubaction hex(0x1E)
      SetFrame 0
      Seek CancelAttack
    endif
    Return
  endif

  if CurrAction <= hex(0x09) || Equal HitboxConnected 1
    Call AIHub
  endif
  Return

  label CancelAttack
    Goto checks
    if frameCounter >= 10
      isImmediateCombo = immediate
      Call ComboHub
    endif
  Return
#endsnippet