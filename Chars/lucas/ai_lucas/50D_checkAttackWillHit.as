#snippet FASTFALL_CHECK
  $ifAerialAttack()
    if Equal AirGroundState 2
      #let fastfallDist = var4
      CALC_FASTFALL_DIST(fastfallDist, move_hitFrame)

      immediateTempVar = fastfallDist + (OSCDBottom - TopNY)
      immediateTempVar -= YDistBackEdge
      if immediateTempVar > 0
        globTempVar = distX - TopNX
        immediateTempVar = distY - TopNY + fastfallDist

        Abs globTempVar
        Abs immediateTempVar
        if globTempVar <= move_xRange && immediateTempVar <= move_yRange
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

      if NumJumps > 0

        if Equal IsOnStage 1
          #let hardFallDist = var4
          GetAttribute hardFallDist attr_fastFallSpeed 0
          hardFallDist *= move_hitFrame * -1
          immediateTempVar = hardFallDist + (OSCDBottom - TopNY)
          immediateTempVar -= YDistBackEdge

          if immediateTempVar > 0
            globTempVar = distX - TopNX
            immediateTempVar = distY - TopNY + hardFallDist

            Abs globTempVar
            Abs immediateTempVar
            if globTempVar <= move_xRange && immediateTempVar <= move_yRange
              if !(Equal scriptVariant sv_checkHit)
                scriptVariant = sv_execute_hardfall
                CallI ExecuteAttack
                Finish
              else
                scriptVariant = sv_execute_hardfall
                Return
              endif
            endif
          endif
        endif

        immediateTempVar = OTopNY - TopNY
        if immediateTempVar > 15
          #let risingDist = var4
          #const risingVel = 2
          risingDist = risingVel
          risingDist *= move_hitFrame
          immediateTempVar = risingDist + (OSCDBottom - TopNY)
          immediateTempVar -= YDistBackEdge

          if immediateTempVar > 0
            globTempVar = distX - TopNX
            immediateTempVar = distY - TopNY + risingDist

            Abs globTempVar
            Abs immediateTempVar
            if globTempVar <= move_xRange && immediateTempVar <= move_yRange
              if !(Equal scriptVariant sv_checkHit)
                scriptVariant = sv_execute_rising
                CallI ExecuteAttack
                Finish
              else
                scriptVariant = sv_execute_rising
                Return
              endif
            endif
          endif
        endif
      endif
    endif
  endif
#endsnippet