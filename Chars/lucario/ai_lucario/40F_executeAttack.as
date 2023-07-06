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
    LUC_CANCEL_CHECK(lucCanCancel, immediateTempVar)
    if Equal lucCanCancel 1
      XGoto CalcAttackGoal
      //= XReciever
      if lastAttack > -1
        Call ExecuteAttack
      endif
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
  label asc_end
  Button R
  Goto common_checks
  if Equal CurrSubaction hex(0x1b) || Equal CurrSubaction hex(0x1d)
    Seek finish
    Jump
  endif
  Seek asc_end
  Return
#endsnippet