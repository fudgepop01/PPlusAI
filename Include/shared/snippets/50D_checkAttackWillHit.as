#snippet FASTFALL_CHECK
  {FASTFALL_CHECK_INNER}
#endsnippet

#snippet FASTFALL_CHECK_INNER
  $ifAerialAttack()
    if Equal AirGroundState 2 && !(Equal currGoal cg_edgeguard)
      #let fastfallDist = var6
      CALC_FASTFALL_DIST(fastfallDist, move_hitFrame)

      // LOGSTR str("FASTFALL DIST")
      // LOGVAL fastfallDist
      // LOGSTR str("CURRENT YPOS")
      // LOGVAL TopNY
      // PRINTLN

      immediateTempVar = fastfallDist + CenterY - TopNY
      immediateTempVar -= YDistFloor
      if immediateTempVar > 0
        globTempVar = distX - TopNX
        immediateTempVar = distY - TopNY + fastfallDist

        Abs globTempVar
        Abs immediateTempVar
        if globTempVar <= tempXRange && immediateTempVar <= tempYRange
          if !(Equal scriptVariant sv_checkHit)
            scriptVariant = sv_execute_fastfall
            CallI ExecuteAttack
            Finish
          else
            scriptVariant = sv_execute_fastfall
            Return
          endif
        endif
      endif

      // globTempVar = move_lastHitFrame - move_hitFrame
      // GetAttribute anotherTempVar attr_fastFallSpeed 0
      // anotherTempVar *= globTempVar
      // globTempVar = distX - TopNX
      // immediateTempVar = distY - TopNY + fastfallDist + anotherTempVar

      // Abs globTempVar
      // Abs immediateTempVar
      // if globTempVar <= tempXRange && immediateTempVar <= tempYRange
      //   if !(Equal scriptVariant sv_checkHit)
      //     scriptVariant = sv_execute_fastfall
      //     CallI ExecuteAttack
      //     Finish
      //   else
      //     scriptVariant = sv_execute_fastfall
      //     Return
      //   endif
      // endif
    endif
  endif
#endsnippet

#snippet SELF_Y_ADJUST
  {SELF_Y_ADJUST_INNER}
#endsnippet

#snippet SELF_Y_ADJUST_INNER
  if AnimFrame < 2
    if TotalYSpeed > 0
      anotherTempVar = TopNY + TotalYSpeed * globTempVar - Gravity * globTempVar * Gravity
    else
      anotherTempVar = TopNY + TotalYSpeed * globTempVar
    endif
  else
    EstYCoord anotherTempVar globTempVar
  endif
  tempGoalY -= anotherTempVar
#endsnippet