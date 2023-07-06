#snippet FASTFALL_CHECK
  {FASTFALL_CHECK_INNER}
#endsnippet

#snippet FASTFALL_CHECK_INNER
  $ifAerialAttack()
    if Equal AirGroundState 2 && !(Equal currGoal cg_edgeguard)
      #let fastfallDist = var18
      CALC_FASTFALL_DIST(fastfallDist, move_hitFrame + move_duration - counter + 1)
      

      anotherTempVar = HurtboxSize * 0.5
      immediateTempVar = fastfallDist + YDistFloor + anotherTempVar
      anotherTempVar = globTempVar
      globTempVar -= move_IASA
      globTempVar *= FastFallSpeed
      globTempVar += TopNY

      // LOGSTR str("FFSTUFF")
      // LOGVAL fastfallDist
      // LOGVAL YDistFloor
      // LOGVAL anotherTempVar
      // PRINTLN
      if immediateTempVar > 0
        GET_CHAR_TRAIT(anotherTempVar, chr_cs_recoveryDistY)
        if OYDistBackEdge > -1 || globTempVar >= anotherTempVar || !(DangerEnabled)

          globTempVar = targetX - TopNX
          immediateTempVar = TopNY + fastfallDist
          // DrawDebugRectOutline TopNX immediateTempVar 10 2 color(0x00FFFFDD)
          immediateTempVar = targetY - immediateTempVar
          
          Abs globTempVar
          Abs immediateTempVar
          if globTempVar <= tempXRange && immediateTempVar <= tempYRange
            if !(Equal scriptVariant sv_checkHit)
              scriptVariant = sv_execute_fastfall
              SetDebugOverlayColor color(0xFF0000FF)
              CallI ExecuteAttack
              Finish
            else
              scriptVariant = sv_execute_fastfall
              Return
            endif
          endif

        endif
      endif
    endif
  endif
#endsnippet

#snippet SELF_Y_ADJUST
  {SELF_Y_ADJUST_INNER}
#endsnippet

#snippet SELF_Y_ADJUST_INNER
  if Equal AirGroundState 1
    $ifAerialAttack()
      GetAttribute immediateTempVar attr_jumpYInitVelShort 0
      anotherTempVar = OHurtboxSize * 0.5
      anotherTempVar += TopNY + immediateTempVar
      if anotherTempVar < OTopNY
        GetAttribute immediateTempVar attr_jumpYInitVel 0
      endif
      estYPos = immediateTempVar * estFrame - Gravity * estFrame * estFrame
      estYPos += TopNY
    else
      estYPos = TopNY
    endif
  elif AnimFrame <= 3
    // MARKER THINGY HERE
    CalcYChange estYPos estFrame YSpeed Gravity MaxFallSpeed FastFallSpeed 0
    estYPos += TopNY
  else
    EstYCoord estYPos estFrame
  endif
  estYPos -= LTF_STACK_READ // move_centerY
#endsnippet

#snippet SELF_X_ADJUST
  {SELF_X_ADJUST_INNER}
#endsnippet

#snippet SELF_X_ADJUST_INNER
  // LOGSTR_NL str("TNX, XSp, eFr")
  // LOGVAL_NL TopNX 
  // LOGVAL_NL XSpeed
  // LOGVAL_NL estFrame
  estXPos = TopNX + XSpeed * estFrame
  // LOGSTR_NL str("initial")
  // LOGVAL_NL estXPos 
  // LOGSTR_NL str("OFFS")
  // LOGVAL_NL move_xOffset
  immediateTempVar = LTF_STACK_READ * -1 // move_centerX
  $ifAerialAttackNotSpecial()
    immediateTempVar *= Direction
  else
    estXPos = TopNX
  endif
  // LOGSTR_NL str("ADJUSTED")
  // LOGVAL_NL immediateTempVar
  estXPos -= immediateTempVar
  // LOGSTR_NL str("final")
  // LOGVAL_NL estXPos 
#endsnippet

#snippet MOVE_IASA_CHECK
  CalcYChange globTempVar move_IASA YSpeed Gravity MaxFallSpeed FastFallSpeed 0
  globTempVar += TopNY
#endsnippet