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
      anotherTempVar = move_hitFrame + move_duration - counter + 1
      // LOGSTR str("FFSTUFF")
      // LOGVAL fastfallDist
      // LOGVAL YDistFloor
      // LOGVAL anotherTempVar
      // PRINTLN
      if immediateTempVar > 0
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
#endsnippet

#snippet SELF_Y_ADJUST
  {SELF_Y_ADJUST_INNER}
#endsnippet

#snippet SELF_Y_ADJUST_INNER
  if Equal AirGroundState 1
    $ifAerialAttack()
      GetAttribute immediateTempVar attr_jumpYInitVelShort 0
      anotherTempVar = 0 + immediateTempVar * globTempVar - Gravity * globTempVar * globTempVar
    else
      anotherTempVar = 0
    endif
  elif AnimFrame <= 3
    if TotalYSpeed > 0
      anotherTempVar = 0 + TotalYSpeed * globTempVar - Gravity * globTempVar * globTempVar
    else
      anotherTempVar = 0 + TotalYSpeed * globTempVar
    endif
  else
    EstYCoord anotherTempVar globTempVar
    anotherTempVar -= TopNY
  endif
  tempGoalY -= anotherTempVar
#endsnippet

#snippet SELF_X_ADJUST
  {SELF_X_ADJUST_INNER}
#endsnippet

#snippet SELF_X_ADJUST_INNER
  anotherTempVar = TotalXSpeed * 3
  $ifAerialAttack()
    EstXCoord anotherTempVar globTempVar
    anotherTempVar -= XCoord
  endif
  tempGoalX -= anotherTempVar
#endsnippet

#snippet MOVE_IASA_CHECK
  CalcYChange immediateTempVar move_IASA YSpeed Gravity MaxFallSpeed FastFallSpeed 0
  immediateTempVar += TopNY
#endsnippet