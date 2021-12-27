#snippet FASTFALL_CHECK
  $ifAerialAttack()
    if Equal AirGroundState 2
      #let fastfallDist = var4
      CALC_FASTFALL_DIST(fastfallDist, move_hitFrame)

      // immediateTempVar = fastfallDist + (OSCDBottom - TopNY)
      // immediateTempVar -= YDistBackEdge
      // if immediateTempVar > 0
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
      // endif
    endif
  endif
#endsnippet