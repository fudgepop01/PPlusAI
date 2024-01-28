#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 10 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet SSPECIAL
  if Equal OIsOnStage 1
    AbsStick OPos
  endif
#endsnippet

#snippet SSPECIALAIR
  Seek sspecial
  Jump
#endsnippet

// #snippet FTILT_2
//   if Equal CurrSubaction hex(0x50) && AnimFrame >= 3 && Rnd <= 0.8
//     Button A
//   endif
// #endsnippet

// #snippet FSMASH_2
//   if Equal CurrSubaction hex(0x58) && AnimFrame >= 17 && Rnd <= 0.8
//     Button A
//   endif
// #endsnippet