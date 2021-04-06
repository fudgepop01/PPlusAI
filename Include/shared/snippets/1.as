#snippet FASTFALL_CHECK
  if Equal AirGroundState 2 && absTargetXDistance <= move_xRange && LevelValue >= LV8 && YDistBackEdge < -2
    COULD_HIT_WITH_FASTFALL(var2, var3, var4, var6, move_lastHitFrame - 2, _ffCalc)
    // var1 = targetYDistance
    // Abs var1
    if Equal shouldFastFall 1
      LOGSTR str("FASTFALL")
      Seek CallAttacks
      Jump
    endif
  endif
#endsnippet

#snippet DEBUG_SKIP
  var0 = 0
  SAFE_INJECT_3 var0
  if var0 > 0
    Seek CallAttacks
    Jump
  endif
#endsnippet