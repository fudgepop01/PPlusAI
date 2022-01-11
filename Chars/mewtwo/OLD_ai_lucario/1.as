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

#snippet MIX_DOUBLEJUMP_SECTION
#endsnippet

#snippet ADDITIONAL_MIXUPS
#endsnippet

#snippet ADDITIONAL_YDIST_CHECKS
  elif !(CanJump) && NumJumps > 0 && approxDist < -maxYEdgeDistJumpNoUpB
      moveVariant = 0
      Call AIHub
#endsnippet