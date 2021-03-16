#snippet DEBUG_SKIP
  globTempVar = 0
  SAFE_INJECT_2 globTempVar
  if !(Equal globTempVar 0)
    Seek CallAttacks
    Jump
  endif
#endsnippet

#snippet SKIP_DASHDANCE_CONDITIONS
  elif Equal lastScript hex(0x8102) || Equal lastScript hex(0x8104) || XDistFrontEdge < shortEdgeRange || XDistBackEdge > -shortEdgeRange
#endsnippet

#snippet BEGINNING_CHECKS
#endsnippet

#snippet FASTFALL_CHECK
  if Equal AirGroundState 2 && absTargetXDistance <= move_xRange && LevelValue >= LV8
    COULD_HIT_WITH_FASTFALL(var2, var3, var4, var6, move_hitFrame + loopTempVar - 2, _ffCalc)
    if Equal shouldFastFall 1
      Seek CallAttacks
      Jump
    endif
  endif
#endsnippet

#snippet MIX_DOUBLEJUMP_SECTION
#endsnippet

#snippet ADDITIONAL_MIXUPS
#endsnippet

#snippet ADDITIONAL_YDIST_CHECKS
  elif !(CanJump) && NumJumps > 0 && approxDist < -maxYEdgeDistJumpNoUpB
      moveVariant = 0
      Call AIHub
#endsnippet