#snippet UNAFFECTED_Y_MOVES
  $ifLastList(nspecialair;nspecial;sspecialair;dspecialair,false)
  else
    {UNAFFECTED_Y_MOVES_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_X_MOVES
  $ifLastList(nspecialair;nspecial,false)
  else
    {UNAFFECTED_X_MOVES_INNER}
  endif
#endsnippet