#snippet SELF_Y_ADJUST
  $ifLastList(sspecial;sspecialair;nspecialair;uspecialair,false)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastList(sspecial;sspecialair;nspecialair;uspecialair,false)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastList(sspecial;sspecialair;nspecialair;uspecialair,false)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet MOVE_IASA_CHECK
  EstYCoord immediateTempVar move_IASA
  $ifLastList(sspecial;sspecialair,false)
    immediateTempVar = 1000
  endif
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  $ifLastList(sspecial;sspecialair;nspecialair;uspecialair,false)
#endsnippet