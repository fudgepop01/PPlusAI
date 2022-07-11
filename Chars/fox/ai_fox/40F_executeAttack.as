#snippet DSPECIAL
  if AnimFrame >= 6
    Button X
    Seek finish
    Return
    // scriptVariant = sv_wavedash_in
    // CallI Wavedash
  endif
#endsnippet

// #snippet POST_CHOICE_FILTER
//   $setLastAttack(dsmash)
// #endsnippet

#snippet DSPECIALAIR
  if AnimFrame >= 6
    Button X
  endif
#endsnippet

#snippet NSPECIAL
  if !(ODistLE 70) && AnimFrame > 3 && Equal CurrSubaction hex(0x1cf)
    Button B
  endif
#endsnippet

#snippet NSPECIALAIR
  ClearStick
  if !(ODistLE 15) && AnimFrame > 3 && Equal CurrSubaction hex(0x1d2) && Equal IsOnStage 1 && Equal AirGroundState 2
    Button B
  endif
#endsnippet