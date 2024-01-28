#snippet SKIP_CHECKS
  if Equal CurrAction hex(0x85)
    Seek execGeneral
    Jump
  endif
#endsnippet

#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame > 7 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet JAB123_3
  if Equal CurrSubaction hex(0x48) && AnimFrame > 7 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x49) && AnimFrame > 10 && Rnd <= 0.6
    Button A
  endif
#endsnippet

#snippet FSMASH2
  if Equal CurrAction hex(0x2C) && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet SSPECIAL
  immediateTempVar = TopNX - OTopNX
  globTempVar = OTopNY - TopNY
  Norm anotherTempVar immediateTempVar globTempVar
  Abs anotherTempVar

  EstYCoord immediateTempVar 10
  globTempVar = OTopNY - immediateTempVar
  if globTempVar > 20
    Stick -1
  elif globTempVar < -10
    Stick 1
  endif

  if YDistFloor < 5
    Button B
  endif

  if Equal CurrAction hex(0x85)
    if anotherTempVar <= 40
      currGoal = cg_attack_reversal
      XGoto CalcAttackGoal
      skipMainInit = sm_execAttack
      CallI MainHub
    elif anotherTempVar <= 60
      if globTempVar > 20
        Button X
      else 
        Button B
      endif    
      Seek finish
      Jump
    endif
  endif
#endsnippet

#snippet SSPECIALAIR
  Seek sspecial
  Jump
#endsnippet

#snippet NSPECIAL
  Seek exec_nspecial
  Jump
#endsnippet

#snippet NSPECIALAIR
  Seek exec_nspecial
  Jump
#endsnippet

#snippet COMMON_EXTENSION
  if !(True)
    label exec_nspecial
    XGoto PerFrameChecks
    Seek exec_nspecial
    if !(Equal OPos Direction)
      AbsStick OPos
      Button B
      Return
    endif

    #let targetPosX = var3
    #let targetPosY = var4

    #let ArrowXPos = var5
    #let ArrowYPos = var6
    #let ArrowXSpd = var7
    #let ArrowYSpd = var8
    #let ConsiderDist = var9

    // GetArticleOfTypeAtTargetLoc ArrowXPos ArrowYPos art_pit_nspecial 0
    // GetArticleOfTypeAtTargetSpeed ArrowXSpd ArrowYSpd art_pit_nspecial 0
    ArrowXPos = ObjXCoord
    ArrowYPos = ObjYCoord
    ArrowXSpd = ObjXSpeed
    ArrowYSpd = ObjYSpeed

    immediateTempVar = ArrowXPos - OCenterX
    anotherTempVar = ArrowYPos - OCenterY
    Norm immediateTempVar immediateTempVar anotherTempVar
    Abs immediateTempVar
    ConsiderDist = immediateTempVar
    immediateTempVar *= 0.1

    if OAnimFrame > 3
      EstOXCoord targetPosX immediateTempVar
      EstOYCoord targetPosY immediateTempVar
      anotherTempVar = OCenterX - OXCoord
      targetPosX += anotherTempVar
      anotherTempVar = OCenterY - OYCoord
      targetPosY += anotherTempVar
    else
      targetPosX = OCenterX
      targetPosY = OCenterY
    endif
    ClearStick

    LOGSTR str("POSITIONS")
    LOGVAL ArrowXPos
    LOGVAL ArrowYPos
    LOGSTR str("SPEEDS")
    LOGVAL ArrowXSpd
    LOGVAL ArrowYSpd
    PRINTLN


    if !(Equal ArrowXPos 0) && !(Equal ArrowYPos 0)
      Norm anotherTempVar ArrowXSpd ArrowYSpd
      Abs anotherTempVar
      // LOGSTR str("totalVel")
      // LOGVAL anotherTempVar
      immediateTempVar = ArrowXSpd / anotherTempVar
      if Equal ArrowXSpd 0
        immediateTempVar = 0
      endif 
      globTempVar = ArrowYSpd / anotherTempVar
      if Equal ArrowYSpd 0
        globTempVar = 0
      endif 
      LOGSTR str("XVel, YVel")
      LOGVAL immediateTempVar
      LOGVAL globTempVar
      PRINTLN
      immediateTempVar *= ConsiderDist
      globTempVar *= ConsiderDist 
      immediateTempVar = immediateTempVar + ArrowXPos - targetPosX
      globTempVar = globTempVar + ArrowYPos - targetPosY
      LOGSTR str("xdist ydist")
      LOGVAL immediateTempVar
      LOGVAL globTempVar
      PRINTLN
      Norm anotherTempVar immediateTempVar globTempVar
      Abs anotherTempVar

      LOGSTR str("vecLen")
      LOGVAL anotherTempVar
      PRINTLN
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