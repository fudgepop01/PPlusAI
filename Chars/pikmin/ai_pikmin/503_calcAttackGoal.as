#snippet ADDITIONAL_FILTERS
  // GetLa anotherTempVar hex(0xB) fromSelf 
  // if anotherTempVar <= true || immediateTempVar >= true
  //   $ifLastOrigin(sspecial,false)
  //     lastAttack = -1
  //   $ifLastOrigin(sspecialair,true)
  //     if NumJumps > 2
  //       lastAttack = -1
  //     endif
  //   endif
  // endif
    $ifLastOrigin(nspecial,false)
      if Rnd < 0.8
        lastAttack = -1
      endif
    $ifLastOrigin(nspecialair,true)
      if Rnd < 0.8
        lastAttack = -1
      endif
    endif
#endsnippet