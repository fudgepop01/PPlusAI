#snippet SELF_Y_ADJUST
  $ifLastOrigin(sspecial,false)
  $ifLastOrigin(sspecialair,true)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastOrigin(sspecial,false)
  $ifLastOrigin(sspecialair,true)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet