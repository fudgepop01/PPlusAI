#snippet UNAFFECTED_Y_MOVES
  $ifLastList(bair;dair;uspecialair;sspecialair,false)
  else
    {UNAFFECTED_Y_MOVES_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_X_MOVES
  $ifLastList(bair;uspecialair;sspecialair,false)
  else
    {UNAFFECTED_X_MOVES_INNER}
  endif
#endsnippet