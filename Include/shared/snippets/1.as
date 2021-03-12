#snippet FASTFALL_CHECK
  if Equal AirGroundState 2 && absTargetXDistance <= move_xRange && LevelValue >= LV8
    // SAFE_INJECT_E var1
    COULD_HIT_WITH_FASTFALL(var2, var3, var4, var6, move_hitFrame + loopTempVar - 2, _ffCalc)
    // var1 = targetYDistance
    // Abs var1
    if Equal shouldFastFall 1
      Seek CallAttacks
      Jump
    endif
  endif
#endsnippet