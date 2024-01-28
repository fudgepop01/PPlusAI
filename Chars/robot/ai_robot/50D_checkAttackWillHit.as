#snippet SELF_Y_ADJUST
  $ifLastOrigin(bair,false)
  $ifLastOrigin(dair,true)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastOrigin(bair,false)
  $ifLastOrigin(dair,true)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastOrigin(bair,false)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet