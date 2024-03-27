#snippet UNAFFECTED_Y_MOVES
  $ifLastList(uspecialair;sspecialair;dspecialair,false)
  else
    {UNAFFECTED_Y_MOVES_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_X_MOVES
  $ifLastList(uspecialair;dspecialair,false)
  else
    {UNAFFECTED_X_MOVES_INNER}
  endif
#endsnippet