#snippet UNAFFECTED_Y_MOVES
  $ifLastList(dspecial;dspecialair;uspecialair;uspecial;sspecialair,false)
  else
    {UNAFFECTED_Y_MOVES_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_X_MOVES
  $ifLastList(dspecial;dspecialair;uspecialair;uspecial;sspecialair,false)
  else
    {UNAFFECTED_X_MOVES_INNER}
  endif
#endsnippet