#snippet UNAFFECTED_Y_MOVES
  $ifLastList(uspecialair;nspecialair;sspecialair,false)
  else
    {UNAFFECTED_Y_MOVES_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_X_MOVES
  $ifLastList(uspecialair;nspecialair,false)
  else
    {UNAFFECTED_X_MOVES_INNER}
  endif
#endsnippet