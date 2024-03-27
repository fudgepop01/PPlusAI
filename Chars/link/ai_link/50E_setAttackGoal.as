#snippet UNAFFECTED_Y_MOVES
  $ifLastList(uspecialair;nspecialair;sspecialair;dspecialair;uspecial;nspecial;sspecial;dspecial,false)
  else
    {UNAFFECTED_Y_MOVES_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_X_MOVES
  $ifLastList(uspecialair;nspecialair;sspecialair;dspecialair;uspecial;nspecial;sspecial;dspecial,false)
  else
    {UNAFFECTED_X_MOVES_INNER}
  endif
#endsnippet