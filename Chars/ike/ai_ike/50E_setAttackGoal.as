#snippet UNAFFECTED_Y_MOVES
  $ifLastList(sspecial;sspecialair;uspecialair,false)
  else
    {UNAFFECTED_Y_MOVES_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_X_MOVES
  $ifLastList(sspecial;sspecialair;uspecialair,false)
  else
    {UNAFFECTED_X_MOVES_INNER}
  endif
#endsnippet