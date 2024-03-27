#snippet SELF_Y_ADJUST
  $ifLastList(uspecialair;nspecialair;sspecialair;dspecialair;uspecial;nspecial;sspecial;dspecial,false)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastList(uspecialair;nspecialair;sspecialair;dspecialair;uspecial;nspecial;sspecial;dspecial,false)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastList(uspecialair;nspecialair;sspecialair;dspecialair;uspecial;nspecial;sspecial;dspecial,false)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  $ifLastList(uspecialair;nspecialair;sspecialair;dspecialair;uspecial;nspecial;sspecial;dspecial,false)
#endsnippet