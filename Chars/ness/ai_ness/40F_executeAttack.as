#snippet SKIP_EXEC
  $ifAerialAttack()
    if Equal scriptVariant sv_execute_hardfall
      label
      MOD immediateTempVar AnimFrame 2
      if Equal immediateTempVar 0
        Button X
      endif
      AbsStick OPos
      if Equal CurrAction hex(0xC) && AnimFrame >= 1
      else
        Return
      endif
    elif Equal scriptVariant sv_execute_rising
      label
      MOD immediateTempVar AnimFrame 2
      if Equal immediateTempVar 0
        Button X
      endif
      AbsStick OPos
      if Equal CurrAction hex(0xC)
      else
        Return
      endif
    endif
  endif
  ClearStick
#endsnippet

#snippet USPECIAL
  moveVariant = 0
  SeekNoCommit pkt_control
#endsnippet

#snippet USPECIALAIR
  moveVariant = 0
  SeekNoCommit pkt_control
#endsnippet

#snippet USPECIAL_PKT2
  moveVariant = 1
  SeekNoCommit pkt_control
#endsnippet

#snippet USPECIALAIR_PKT2
  moveVariant = 1
  SeekNoCommit pkt_control
#endsnippet

#snippet COMMON_EXTENSION
  if Equal scriptVariant sv_execute_hardfall && YSpeed <= 0
    AbsStick 0 (-1)
  elif Equal scriptVariant sv_execute_rising
    Button X
  endif
  
  if !(True)
    label pkt_control
    #const startDist = 60
    #const endDist = 6
    #const time = 20
    #let timer = var0
    timer = 20
    label exec_uspecial
    XGoto PerFrameChecks
    //= XReciever
    Seek exec_uspecial

    #let targetPosX = var3
    #let targetPosY = var4

    if Equal moveVariant 1
      // immediateTempVar = timer
      // if immediateTempVar < 0
      //   immediateTempVar = 1
      // endif
      // immediateTempVar += 7
      // immediateTempVar = 1
      // EstOXCoord targetPosX immediateTempVar
      // EstOYCoord targetPosY immediateTempVar 
      targetPosX = TopNX - OTopNX
      targetPosY = TopNY - OTopNY

      globTempVar = timer / time
      globTempVar *= calc(startDist - endDist)
      globTempVar += endDist
      Norm immediateTempVar targetPosX targetPosY

      targetPosX = targetPosX / immediateTempVar
      targetPosX *= globTempVar
      
      targetPosY = targetPosY / immediateTempVar
      targetPosY *= globTempVar * 1.2

      targetPosX = TopNX + targetPosX
      targetPosY = TopNY + targetPosY

      DrawDebugRectOutline targetPosX targetPosY 5 5 color(0xFF8800DD)
    endif
    
    #let PKTXPos = var5
    #let PKTYPos = var6
    #let PKTXSpd = var7
    #let PKTYSpd = var8

    GetArticleOfTypeAtTargetLoc PKTXPos PKTYPos art_ness_uspecial 0
    GetArticleOfTypeAtTargetSpeed PKTXSpd PKTYSpd art_ness_uspecial 0

    if Equal moveVariant 0
      immediateTempVar = PKTXPos - OTopNX
      anotherTempVar = PKTYPos - OTopNY
      Norm immediateTempVar immediateTempVar anotherTempVar
      immediateTempVar *= 0.25

      EstOXCoord targetPosX immediateTempVar
      EstOYCoord targetPosY immediateTempVar
    endif

    ClearStick

    // LOGSTR str("POSITIONS")
    // LOGVAL PKTXPos
    // LOGVAL PKTYPos
    // LOGSTR str("SPEEDS")
    // LOGVAL PKTXSpd
    // LOGVAL PKTYSpd

    if !(Equal PKTXPos 0) && !(Equal PKTYPos 0)
      Norm anotherTempVar PKTXSpd PKTYSpd
      // LOGSTR str("totalVel")
      // LOGVAL anotherTempVar
      immediateTempVar = PKTXSpd / anotherTempVar
      if Equal PKTXSpd 0
        immediateTempVar = 0
      endif 
      globTempVar = PKTYSpd / anotherTempVar
      if Equal PKTYSpd 0
        globTempVar = 0
      endif 
      // LOGSTR str("XVel, YVel")
      // LOGVAL immediateTempVar
      // LOGVAL globTempVar
      immediateTempVar *= 10
      globTempVar *= 10 
      immediateTempVar = immediateTempVar + PKTXPos - targetPosX
      globTempVar = globTempVar + PKTYPos - targetPosY
      // LOGSTR str("xdist ydist")
      // LOGVAL immediateTempVar
      // LOGVAL globTempVar
      Norm anotherTempVar immediateTempVar globTempVar
      if timer > 0 && anotherTempVar <= 25
        timer -= 1
      endif

      // LOGSTR str("vecLen")
      // LOGVAL anotherTempVar
      immediateTempVar /= anotherTempVar
      globTempVar /= anotherTempVar
      immediateTempVar *= -1
      globTempVar *= -1
      AbsStick immediateTempVar globTempVar
    endif
    if CurrAction <= hex(0x20)
      Seek finish
      Jump
    endif
    Return
  endif
#endsnippet

#snippet NSPECIAL_CHARGE
  if !(ODistLE 60) 
    Button B
  endif
#endsnippet

#snippet DSPECIAL
  if Equal CurrSubaction hex(0x1e3) && FramesHitlag <= 0 
    Button X
    scriptVariant = sv_wavedash_in
    CallI Wavedash
  endif
#endsnippet

#snippet DSPECIALAIR
  if Equal CurrSubaction hex(0x1e7) && FramesHitlag <= 0
    Button X
    if YDistFloor < 4
      scriptVariant = sv_wavedash_in
      CallI Wavedash
    endif
  endif
#endsnippet

#snippet JAB123_2
  if AnimFrame >= 5 && Equal CurrSubaction hex(0x48)
    Button A
  endif
#endsnippet

#snippet JAB123_3
  if AnimFrame >= 5 && Equal CurrSubaction hex(0x48)
    Button A
  elif AnimFrame >= 5 && Equal CurrSubaction hex(0x49)
    Button A
  endif
#endsnippet