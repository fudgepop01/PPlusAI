#snippet SELF_Y_ADJUST
  $ifLastList(bair;dair;uspecialair;sspecialair,false)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastList(bair;dair;uspecialair;sspecialair,false)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastList(bair;uspecialair;sspecialair,false)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet