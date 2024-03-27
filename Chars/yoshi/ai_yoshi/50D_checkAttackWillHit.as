#snippet SELF_Y_ADJUST
  $ifLastList(dspecial;dspecialair;uspecialair;uspecial;sspecialair,false)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastList(dspecial;dspecialair;uspecialair;uspecial;sspecialair,false)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastList(dspecial;dspecialair;uspecialair;uspecial;sspecialair,false)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  $ifLastList(dspecial;dspecialair;uspecialair;uspecial;sspecialair,false)
#endsnippet