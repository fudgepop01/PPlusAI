#snippet SELF_Y_ADJUST
  $ifLastList(dair;nspecial;nspecialair;sspecialair,false)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastList(dair;nspecial;nspecialair;sspecialair,false)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastList(dair;nspecialair;sspecialair,false)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  $ifLastList(dair;nspecial;nspecialair;sspecialair,false)
#endsnippet