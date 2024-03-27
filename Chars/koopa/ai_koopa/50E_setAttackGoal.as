#snippet UNAFFECTED_Y_MOVES
  $ifLastList(nspecialair;nspecial;sspecialair;dspecial;dspecialair,false)
  else
    {UNAFFECTED_Y_MOVES_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_X_MOVES
  $ifLastList(nspecialair;nspecial;dspecialair,false)
  else
    {UNAFFECTED_X_MOVES_INNER}
  endif
#endsnippet