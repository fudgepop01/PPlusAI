#snippet ADDITIONAL_FILTERS
  GetRaBit immediateTempVar hex(0x6B) 0
  if Equal immediateTempVar 0
    $ifLastAttack(fsmash)
      lastAttack = -1
    $elifLastAttack(dsmash_strong)
      lastAttack = -1
    $elifLastAttack(dsmash2_strong)
      lastAttack = -1
    $elifLastAttack(usmash_strong)
      lastAttack = -1
    $elifLastAttack(nspecial)
      lastAttack = -1
    $elifLastAttack(nspecialair)
      lastAttack = -1
    endif
  elif True
    $ifLastAttack(fsmash)
      lastAttack = -1
    $elifLastAttack(dsmash)
      lastAttack = -1
    $elifLastAttack(dsmash2)
      lastAttack = -1
    $elifLastAttack(usmash)
      lastAttack = -1
    endif
  endif
#endsnippet

#snippet COMBO_MOVES
  $addToDice(dspecial)
  $addToDice(dspecialair)
#endsnippet

#snippet PANIC_MOVES
  $addToDice(nair)
#endsnippet

#snippet LAUNCH_MOVES
  $addToDice(dspecial)
  $addToDice(dair)
#endsnippet

#snippet PRESSURE_MOVES
  $addToDice(dair)
  $addToDice(dspecial)
  $addToDice(dspecialair)
#endsnippet

#snippet BREAKCC_MOVES
  $addToDice(dair)
  $addToDice(dspecial)
#endsnippet

#snippet BAIT_MOVES
  $addToDice(sspecialair)
  $addToDice(sspecialair)
  GetRaBit immediateTempVar hex(0x6B) 0
  if Equal immediateTempVar 0
    $addToDice(nspecial_charge)
  endif
#endsnippet

#snippet CAMP_MOVES
  $addToDice(sspecialair)
  $addToDice(sspecialair)
  GetRaBit immediateTempVar hex(0x6B) 0
  if Equal immediateTempVar 0 && NoOpponent
    $addToDice(nspecial_charge)
    $addToDice(nspecial_charge)
    $addToDice(nspecial_charge)
  endif
#endsnippet