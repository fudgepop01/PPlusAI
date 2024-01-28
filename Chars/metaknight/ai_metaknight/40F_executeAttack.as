#snippet SKIP_EXEC
  $ifLastOrigin(uspecial,false)
    Goto handleUSpecial 
  $ifLastOrigin(uspecialair,true)
    Goto handleUSpecial
  $ifLastOrigin(dspecial,false)
    Goto handleDSpecial 
  $ifLastOrigin(dspecialair,true)
    Goto handleDSpecial 
  endif 
  endif
  if !(True)
    label handleUSpecial
    anotherTempVar = OPos * 30
    GetYDistFloorOffset immediateTempVar anotherTempVar 5 0
    if immediateTempVar < 0
      if Equal AirGroundState 1 
        $setLastAttack(usmash)
      else
        $setLastAttack(nair)
      endif
    endif
    Return
    label handleDSpecial
      GetYDistFloorAbsPos immediateTempVar goalX goalY
      if immediateTempVar < 0
        anotherTempVar = OYDistBackEdge / OXDistBackEdge
        if anotherTempVar < 3
          if Equal AirGroundState 1
            $setLastAttack(fsmash)
          else
            $setLastAttack(fair)
          endif
        endif
      endif
    Return
  endif
#endsnippet


#snippet FTILT2
  if Equal CurrSubaction hex(0x50) && AnimFrame >= 8 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet FTILT3
  if Equal CurrSubaction hex(0x50) && AnimFrame >= 8 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x51) && AnimFrame >= 7 && Rnd <= 0.6
    Button A
  endif
#endsnippet

#snippet DSPECIAL
  if Equal CurrAction hex(0x115) || Equal CurrAction hex(0x11b) || Equal CurrAction hex(0x11c)
    immediateTempVar = OTopNX - TopNX
    globTempVar = OTopNY - TopNY
    Norm anotherTempVar immediateTempVar globTempVar
    if anotherTempVar < 5
      anotherTempVar = 1
      Button A
    endif

    immediateTempVar = immediateTempVar / anotherTempVar
    globTempVar = globTempVar / anotherTempVar
    AbsStick immediateTempVar globTempVar

    if Equal CurrAction hex(0x11b) && YDistFloor < 0
      anotherTempVar = TopNX * -1
      AbsStick anotherTempVar
    endif

    Button B
  endif
#endsnippet

#snippet DSPECIALAIR
  if Equal CurrAction hex(0x115) || Equal CurrAction hex(0x11b) || Equal CurrAction hex(0x11c)
    immediateTempVar = OTopNX - TopNX
    globTempVar = OTopNY - TopNY
    Norm anotherTempVar immediateTempVar globTempVar

    if anotherTempVar < 5
      anotherTempVar = 1
      Button A
    endif

    immediateTempVar = immediateTempVar / anotherTempVar
    globTempVar = globTempVar / anotherTempVar
    AbsStick immediateTempVar globTempVar

    if Equal CurrAction hex(0x11b) && YDistFloor < 0
      anotherTempVar = TopNX * -1
      AbsStick anotherTempVar
    endif

    Button B
  endif
#endsnippet

#snippet USPECIAL
  if Equal CurrAction hex(0x85)
    Button A
  endif
#endsnippet

#snippet USPECIALAIR
  if Equal CurrAction hex(0x85)
    Button A
  endif
#endsnippet