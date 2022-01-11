#snippet KILL_MOVES
  DynamicDiceClear dslot0
  $addToDice(0, usmash_strong, 1)
  $addToDice(0, dsmash_hit1_outer, 1)
  $addToDice(0, dsmash_hit2_outer, 1)
  $addToDice(0, fsmash_outer, 1)
  $addToDice(0, utilt_start_outer, 1)
  $addToDice(0, uthrow, 1)
  $addToDice(0, fair_outer, 1)
#endsnippet

#snippet COMBO_MOVES
  DynamicDiceClear dslot0
  if OKBAngle >= 60 && OKBAngle <= 120
    $addToDice(0, usmash_outer, 1)
    $addToDice(0, utilt, 1)
    $addToDice(0, utilt_start_outer, 1)
    $addToDice(0, uair, 1)
    $addToDice(0, uair_mid, 1)
    $addToDice(0, uair_outer, 1)
  else
    $addToDice(0, uair_mid, 1)
    $addToDice(0, uair_outer, 1)
    $addToDice(0, fair_outer, 1)
    $addToDice(0, nair_hit2_inner, 1)
    $addToDice(0, uthrow, 1)
    $addToDice(0, fthrow, 1)
    $addToDice(0, sspecial, 1)
    $addToDice(0, dtilt, 1)
    $addToDice(0, dtilt_inner, 1)
    $addToDice(0, dtilt_outer, 1)
    $addToDice(0, utilt, 1)
    $addToDice(0, utilt_start_outer, 1)
  endif
#endsnippet

#snippet TECHCHASE_MOVES
  DynamicDiceClear dslot0
  $addToDice(0, dair_outer, 1)
  $addToDice(0, fsmash_outer, 1)
  $addToDice(0, fair_outer, 1)
  $addToDice(0, uthrow, 1)
  $addToDice(0, dthrow, 1)
#endsnippet

#snippet PRESSURE_MOVES
  DynamicDiceClear dslot0
  $addToDice(0, fair, 1)
  $addToDice(0, fair_mid, 1)
  $addToDice(0, fair_outer, 1)
  $addToDice(0, nair, 1)
  $addToDice(0, nair_hit1_strong, 1)
  $addToDice(0, nair_hit2_inner, 1)
  $addToDice(0, nair_hit2_strong, 1)
  $addToDice(0, uthrow, 1)
  $addToDice(0, fthrow, 1)
  $addToDice(0, dthrow, 1)
#endsnippet

#snippet BREAKCC_MOVES
  DynamicDiceClear dslot0
  $addToDice(0, dair_outer, 1)
  $addToDice(0, dsmash_hit1_outer, 1)
  $addToDice(0, fsmash_outer, 1)
  $addToDice(0, uthrow, 1)
#endsnippet

#snippet ESCAPECORNER_MOVES
  DynamicDiceClear dslot0
  $addToDice(0, fair, 1)
  $addToDice(0, nair, 1)
  $addToDice(0, dashattack_mid, 1)
  $addToDice(0, dashattack_strong, 1)
  $addToDice(0, utilt, 1)
  $addToDice(0, bthrow, 1)
#endsnippet

#snippet LAUNCH_MOVES
  DynamicDiceClear dslot0
  $addToDice(0, fair_outer, 1)
  $addToDice(0, utilt_start_outer, 1)
  $addToDice(0, utilt, 1)
  $addToDice(0, uthrow, 1)
#endsnippet

#snippet POKE_MOVES
  DynamicDiceClear dslot0
  $addToDice(0, fair, 1)
  $addToDice(0, fair_mid, 1)
  $addToDice(0, fair_outer, 1)
  $addToDice(0, nair, 1)
  $addToDice(0, nair_hit1_strong, 1)
  $addToDice(0, nair_hit2_inner, 1)
  $addToDice(0, nair_hit2_strong, 1)
  $addToDice(0, utilt, 1)
  $addToDice(0, ftilt, 1)
#endsnippet

#snippet CAMP_MOVES
#endsnippet

#snippet EDGEGUARD_MOVES
  DynamicDiceClear dslot0
  $addToDice(0, fsmash_outer, 1)
  $addToDice(0, fsmash, 1)
  $addToDice(0, fair, 1)
  $addToDice(0, fair_mid, 1)
  $addToDice(0, dair, 1)
  $addToDice(0, dair_mid, 1)
  $addToDice(0, dair_outer, 1)
#endsnippet

#snippet ANTIAIR_MOVES
  DynamicDiceClear dslot0
  $addToDice(0, fsmash_outer, 1)
  $addToDice(0, fsmash, 1)
  $addToDice(0, fair, 1)
  $addToDice(0, fair_mid, 1)
  $addToDice(0, dair, 1)
  $addToDice(0, dair_mid, 1)
  $addToDice(0, dair_outer, 1)
#endsnippet

#snippet CONVERSION_MOVES
  DynamicDiceClear dslot0
  if OKBAngle >= 60 && OKBAngle <= 120
    $addToDice(0, usmash_outer, 1)
    $addToDice(0, utilt, 1)
    $addToDice(0, utilt_start_outer, 1)
    $addToDice(0, uair, 1)
    $addToDice(0, uair_mid, 1)
    $addToDice(0, uair_outer, 1)
  else
    $addToDice(0, usmash_outer, 1)
    $addToDice(0, utilt, 1)
    $addToDice(0, utilt_start_outer, 1)
    $addToDice(0, fair, 1)
    $addToDice(0, fair_mid, 1)
    $addToDice(0, fair_outer, 1)
    $addToDice(0, dashattack_mid, 1)
    $addToDice(0, dashattack_strong, 1)
  endif
#endsnippet

#snippet FRAMETRAP_MOVES
  DynamicDiceClear dslot0
  $addToDice(0, utilt, 1)
  $addToDice(0, utilt_start_outer, 1)
  $addToDice(0, fair, 1)
  $addToDice(0, fair_mid, 1)
  $addToDice(0, fair_outer, 1)
  $addToDice(0, nair, 1)
  $addToDice(0, nair_hit1_strong, 1)
  $addToDice(0, nair_hit2_inner, 1)
  $addToDice(0, nair_hit2_strong, 1)
  $addToDice(0, sspecial, 1)
#endsnippet

#snippet CROSSUP_MOVES
  DynamicDiceClear dslot0
  $addToDice(0, fair, 1)
  $addToDice(0, fair_mid, 1)
  $addToDice(0, fair_outer, 1)
  $addToDice(0, nair, 1)
  $addToDice(0, nair_hit1_strong, 1)
  $addToDice(0, nair_hit2_inner, 1)
  $addToDice(0, nair_hit2_strong, 1)
#endsnippet

#snippet JABRESET_MOVES
  DynamicDiceClear dslot0
  $addToDice(0, jab123, 1)
#endsnippet