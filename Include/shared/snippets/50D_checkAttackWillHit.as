#snippet FASTFALL_CHECK
  {FASTFALL_CHECK_INNER}
#endsnippet

#snippet FASTFALL_CHECK_INNER
  if currGoal < cg_edgeguard
    anotherTempVar = LevelValue + 2
    immediateTempVar = Rnd * anotherTempVar
    if LevelValue >= LV4 && immediateTempVar > 1

      // accounts for delay in fastfall
      CALC_FASTFALL_DIST(yChange, estFrame - 4)
      if Equal shouldBeFalling 1 && yChange > 0
      else
        immediateTempVar = TopNY + yChange + move_centerY
        // VIS FASTFALL
        // tempYRange *= 0.5
        // tempXRange *= 0.5
        DrawDebugRectOutline CenterX immediateTempVar tempXRange tempYRange color(0xFF00FFDD)
        DrawDebugRectOutline OCenterX estOYPos tempXRange tempYRange color(0xFFFFFFDD)
        // tempYRange *= 2
        // tempXRange *= 2

        yDiff = estOYPos - immediateTempVar
        Abs yDiff
        // LOGSTR str("ff stuff")
        // LOGVAL estFrame
        // LOGVAL yDiff
        // LOGVAL tempYRange
        // LOGVAL move_centerY
        // PRINTLN
        if yDiff <= tempYRange
          scriptVariant = sv_execute_fastfall
          yChange = YDistFloor + 1
          {UNAFFECTED_Y_MOVES}
          elif True  
            CALC_FASTFALL_DIST(yChange, move_hitFrame + move_duration - counter)
          endif
          anotherTempVar = HurtboxSize * 0.5
          immediateTempVar = yChange + YDistFloor + anotherTempVar          
          if immediateTempVar > 0 || YDistFloor < 0
            CalcYChange yChange move_IASA TotalYSpeed Gravity MaxFallSpeed FastFallSpeed 1
            Goto checkCanEdgeguard
            if immediateTempVar > 0
              Goto checkIfAirViable // fastfall
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
  $ifAerialAttack()
    // LOGSTR str("yvel; ychange")
    // LOGVAL immediateTempVar
    CalcYChange estYPos estFrame immediateTempVar Gravity MaxFallSpeed FastFallSpeed 0
    // LOGVAL estYPos
    // PRINTLN
    estYPos += TopNY
  elif Equal AirGroundState 1
    estYPos = TopNY
  elif AnimFrame <= 5
    // MARKER THINGY HERE
    CalcYChange estYPos estFrame CharYSpeed Gravity MaxFallSpeed FastFallSpeed 0
    estYPos += TopNY
  else
    EstYCoord estYPos estFrame
  endif
#endsnippet

#snippet SELF_X_ADJUST
  {SELF_X_ADJUST_INNER}
#endsnippet

#snippet SELF_X_ADJUST_INNER
  // immediateTempVar = move_centerX

  $ifAerialAttack()
    estXPos = TotalXSpeed * estFrame
    if Equal AirGroundState 1
      estXPos = GetJumpLength * estFrame
    elif XDistLE immediateTempVar
      GetAttribute anotherTempVar attr_airMobilityB 0
      anotherTempVar *= estFrame
    tempXRange += anotherTempVar
    endif
  else
    estXPos = 0
  endif
  estXPos += TopNX
#endsnippet

#snippet MOVE_IASA_CHECK
  CalcYChange globTempVar move_IASA YSpeed Gravity MaxFallSpeed FastFallSpeed 0
  globTempVar += TopNY
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  if !(True)
#endsnippet