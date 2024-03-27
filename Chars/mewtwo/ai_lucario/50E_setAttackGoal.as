#snippet UNAFFECTED_Y_MOVES
  $ifLastList(nspecialair;sspecialair;dspecialair;uspecialair,false)
  $elifLastAttack(hover)
  else
    {UNAFFECTED_Y_MOVES_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_X_MOVES
  $ifLastList(nspecialair;uspecialair,false)
  $elifLastAttack(hover)
  else
    {UNAFFECTED_X_MOVES_INNER}
  endif
#endsnippet