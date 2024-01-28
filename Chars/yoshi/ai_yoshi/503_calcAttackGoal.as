#snippet FILTER_CHECKS
  $ifLastOrigin(uspecialair,false)
    move_IASA += YDistFloor
    move_IASA += 80
  $ifLastOrigin(uspecial,true)
    move_IASA += 60
  endif
#endsnippet