#snippet SELF_Y_ADJUST
  $ifLastList(sspecialair;dspecialair;nspecialair;uspecialair,false)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastList(sspecialair;dspecialair;nspecialair;uspecialair,false)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastList(sspecialair;dspecialair;nspecialair;uspecialair,false)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  $ifLastList(sspecialair;dspecialair;nspecialair;uspecialair,false)
#endsnippet