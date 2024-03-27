#snippet SKIP_EXEC
  $ifLastOrigin(uspecial,false)
    Goto handleUSpecial 
  $ifLastOrigin(uspecialair,true)
    Goto handleUSpecial
  endif
  if !(True)
    label handleUSpecial
    anotherTempVar = OPos * 30
    GetYDistFloorOffset immediateTempVar anotherTempVar 5 0
    if immediateTempVar < 0
      if Equal AirGroundState 1 
        $setLastAttack(usmash)
      else
        $setLastAttack(fair)
      endif
    endif
    Return
  endif
#endsnippet

#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 6 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet JAB123_3
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 6 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x49) && AnimFrame >= 9 && Rnd <= 0.6
    Button A
  endif
#endsnippet

#snippet DSPECIAL
  ClearStick
  AbsStick OPos
  MOD immediateTempVar AnimFrame 6
  if immediateTempVar <= 1 && XDistLE 30
    if OTopNY > TopNY || YDistFloor < 0
      Button B
    endif
  endif
  if AnimFrame > 50
    Seek finish
    Jump
  endif 
#endsnippet

#snippet DSPECIALHIT
  ClearStick
  AbsStick OPos
  MOD immediateTempVar AnimFrame 6
  if immediateTempVar <= 1 && XDistLE 30
    if OTopNY > TopNY || YDistFloor < 0
      Button B
    endif
  endif
  if AnimFrame > 50
    Seek finish
    Jump
  endif 
#endsnippet

#snippet USPECIAL
  Seek finish
  Jump
#endsnippet

#snippet USPECIALAIR
  Seek finish
  Jump
#endsnippet