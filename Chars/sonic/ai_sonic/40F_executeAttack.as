#snippet JAB123_2
  if AnimFrame > 3 && Rnd < 0.8
    Button A
  endif
#endsnippet

#snippet JAB123_3
  Seek jab123_2
  Jump
#endsnippet

#snippet SSPECIAL
  if Equal CurrAction hex(0x11f) 
    if {AnimFrame >= 7 && Rnd < 0.4} || {AnimFrame >= 7 && Equal HitboxConnected 1}
      if Equal HitboxConnected 1
        Button X
        Seek finish
        Jump
      endif
      Button X
      scriptVariant = sv_wavedash_goal
      Call Wavedash
    endif
  endif
#endsnippet

#snippet DSPECIAL
  if Equal CurrAction hex(0x124)
    MOD anotherTempVar GameTimer 5
    globTempVar = 100 - ActionTimer
    globTempVar *= 0.01 
    if !(XDistLE 30) && anotherTempVar < 2 && Rnd < globTempVar
      Button B
    endif
  elif Equal CurrAction hex(0x11e)
    AbsStick OPos
    if Equal HitboxConnected 1 || {XDistLE 30 && Rnd < 0.01} || YDistFloor < 0
      Button X
    endif
  elif Equal CurrAction hex(0x122)
    if AnimFrame > 8
      Button X
      Seek finish
      Jump
    endif
  endif
#endsnippet

#snippet DSPECIAL_AIR
  Seek dspecial
  Jump
endif