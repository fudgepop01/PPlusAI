#snippet SKIP_CHECKS
  $ifLastAttack(ASC)
    Seek asc
    Jump
  $ifLastOrigin(dspecial,true)
    Seek dspecial
    Jump
  elif Equal HitboxConnected 1
    Seek 
    Jump
  endif
#endsnippet

#snippet COMMON_EXTENSION
  if !(True)
    label cancelCheck
    if Equal FramesHitlag 0 && Equal HitboxConnected 1
      XGoto CalcAttackGoal
      XReciever
      Call ExecuteAttack
    endif
    Return
  endif

  $ifLastAttack(jab1232)
  $elifLastAttack(jab1233)
  $ifLastOrigin(sspecial, true)
  $ifLastOrigin(dspecial, true)
  $ifLastOrigin(nspecial, true)
  $ifLastOrigin(dair, true)
    if AnimFrame > 12
      Goto cancelCheck
    endif
  else
    Goto cancelCheck
  endif  
#endsnippet

#snippet JAB1232
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 8 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x49) 
    Goto cancelCheck
  endif
#endsnippet

#snippet JAB1233
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 8 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x49) && AnimFrame >= 10 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x4a)
    Goto cancelCheck
  endif
#endsnippet

#snippet ASC
  Button R
  label asc_end
  Seek asc_end
#endsnippet