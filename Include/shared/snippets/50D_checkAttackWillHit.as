#snippet FASTFALL_CHECK
  {FASTFALL_CHECK_INNER}
#endsnippet

#snippet FASTFALL_CHECK_INNER
  $ifAerialAttack()
    if Equal AirGroundState 2 && !(Equal currGoal cg_edgeguard)
      #let fastfallDist = var18
      CALC_FASTFALL_DIST(fastfallDist, move_hitFrame + move_duration - counter + 1)

      

      immediateTempVar = fastfallDist - HurtboxSize * 0.5
      immediateTempVar -= YDistFloor
      if immediateTempVar > 0
        globTempVar = distX - TopNX
        immediateTempVar = TopNY - fastfallDist
        immediateTempVar = distY - immediateTempVar
        
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
    anotherTempVar = TotalXSpeed * globTempVar
  endif
  tempGoalX -= anotherTempVar
#endsnippet

#snippet MOVE_IASA_CHECK
  EstYCoord immediateTempVar move_IASA
#endsnippet