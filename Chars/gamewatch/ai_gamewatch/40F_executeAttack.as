#snippet SKIP_CHECKS
  $ifLastOrigin(nspecialair,false)
    if YDistFloor < 0
      Seek finish
      Jump
    endif
  endif
#endsnippet

#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 8 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet NSPECIALAIR
  scriptVariant = sv_execute_fastfall
#endsnippet