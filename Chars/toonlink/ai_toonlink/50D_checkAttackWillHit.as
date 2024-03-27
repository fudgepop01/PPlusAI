#snippet SELF_Y_ADJUST
  $ifLastList(uspecialair;sspecialair;dspecialair;nspecialair,false)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastList(uspecialair;sspecialair;dspecialair;nspecialair,false)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  $ifLastList(uspecialair;sspecialair;dspecialair;nspecialair,false)
#endsnippet