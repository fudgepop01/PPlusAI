#snippet FASTFALL_CHECK
  immediateTempVar = move_xRange * 2
  if Equal AirGroundState 2 && absTargetXDistance <= immediateTempVar && LevelValue >= LV8 && !(Equal XDistBackEdge XDistFrontEdge)  && !(Equal approachType at_fakeout) && !(Equal CurrAction hex(0xC))
    COULD_HIT_WITH_FASTFALL(var2, var3, var6, move_hitFrame + (move_lastHitFrame - move_hitFrame) / 2)
    if Equal shouldFastFall 1
      LOGSTR str("FASTFALL")
      Seek CallAttacks
      Jump
    endif
    
    COULD_HIT_WITH_FASTFALL(var2, var3, var6, move_hitFrame)
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