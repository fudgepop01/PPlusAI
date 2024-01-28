#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10)
  $genActions(NSPECIAL, 112|117|118|119)
  $genActions(SSPECIAL, 113)
  $genActions(USPECIAL, 114|11b|11c)
  $genActions(DSPECIAL, 115)

  // false = canUse
  #const LucDownB_LABit = hex(0x42)
  // true = canUse
  #const LucUpB_LABit = hex(0x3F)
  #const LucAura_LAFloat = hex(0x1B)

  #const UpBRadius = 70
  #const UpBRadiusX = 50
  #const downBDist = 90
  #const downBHeight = 20

  #const optNone = 0
  #const optJump = 1
  #const optUpB = 2
  #const optHighUpB = 3
  #const optUpBCancel = 4
  #const optDownB = 5
  #const optDownBCancel = 6
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
#endsnippet

#snippet RECOVERY_CONDITIONS
  #let nearCliffX = var0
  #let nearCliffY = var1
  #let absNCX = var2  
  #let cliffDist = var3

  DIST_TO_CLIFF(nearCliffX, nearCliffY)
  nearCliffY *= -1

  if !(NoOneHanging)
    nearCliffY += 25
  endif
  // drift towards goal
  ClearStick
  AbsStick nearCliffX
  absNCX = nearCliffX
  Abs absNCX
  Norm cliffDist nearCliffX nearCliffY
  Abs cliffDist

  DynamicDiceClear dslot0
  DynamicDiceAdd dslot0 optNone 1
  
  GetLaFloat globTempVar LucAura_LAFloat 0
  if globTempVar >= 65 
    GetLaBit anotherTempVar LucUpB_LABit 0
    if cliffDist < calc(UpBRadius + 30) && Equal anotherTempVar true 
      DynamicDiceAdd dslot0 optUpBCancel 5
    endif
    GetLaBit anotherTempVar LucDownB_LABit 0
    if absNCX <= calc(downBDist + 20) && Equal anotherTempVar false && nearCliffY < downBHeight
      DynamicDiceAdd dslot0 optDownBCancel 5
    endif
  endif

  GetLaBit anotherTempVar LucUpB_LABit 0
  if cliffDist < UpBRadius && absNCX <= UpBRadiusX && Equal anotherTempVar true
    DynamicDiceAdd dslot0 optUpB 20
  endif

  GetLaBit anotherTempVar LucDownB_LABit 0
  if absNCX <= downBDist && Equal anotherTempVar false && nearCliffY < downBHeight
    DynamicDiceAdd dslot0 optDownB 20
  endif

  if nearCliffY > cs_djumpHeight && NumJumps > 0
    DynamicDiceAdd dslot0 optJump 3
  endif

  $tempVar(recPotential,globTempVar)
  recPotential = 0
  // GetLaBit anotherTempVar LucUpB_LABit 0
  // if Equal anotherTempVar true
  //   recPotential += UpBRadius
  //   GetLaFloat anotherTempVar LucAura_LAFloat 0
  //   if anotherTempVar >= 65
  //     recPotential += 10
  //   endif
  // endif

  anotherTempVar = NumJumps * cs_djumpHeight
  recPotential += anotherTempVar

  anotherTempVar = TopNY - BBoundary
  if anotherTempVar > 20 && nearCliffY < recPotential
  else
    DynamicDiceClear dslot0
    DynamicDiceAdd dslot0 optNone 1
    if NumJumps > 0
      DynamicDiceAdd dslot0 optJump 100
    else
      GetLaFloat globTempVar LucAura_LAFloat 0
      GetLaBit anotherTempVar LucUpB_LABit 0
      if globTempVar >= 65 && Equal anotherTempVar true
        DynamicDiceAdd dslot0 optUpBCancel 100
      else 
        DynamicDiceAdd dslot0 optUpB 100
      endif
    endif
  endif

  DynamicDiceRoll dslot0 recOption 0
  if recOption > optJump
    ClearStick
  endif
  if recOption > 0
    if Equal recOption optJump
      Button X
    elif recOption < optDownB
      Button B
      AbsStick 0 1
    else 
      Button B
      AbsStick 0 -1
    endif
  endif
#endsnippet

#snippet USPECIAL
  if Equal CurrSubaction hex(0x1e)
    Call MainHub
  endif 

  if Equal isBelowStage 1
    if nearCliffX > TopNX
      nearCliffX -= 2
    else
      nearCliffX += 2
    endif
  endif

  if Equal CurrAction hex(0x11b) || Equal CurrAction hex(0x114)
    if Equal recOption optUpBCancel && ActionTimer >= 15 && Equal CurrAction hex(0x11b) 
      Button A
      anotherTempVar = TopNX * -1
      AbsStick anotherTempVar
      Return
    endif

    if !(NoOneHanging)
      nearCliffY -= 15
      if nearCliffX > 0
        nearCliffX -= 5
      else
        nearCliffX += 5
      endif
    endif

    if Equal isBelowStage 0
      if XSpeed < -0.2 && nearCliffX < 0 
        nearCliffX -= 50
      elif XSpeed > 0.2 && nearCliffX > 0
        nearCliffX += 50
      endif
    endif

    globTempVar = nearCliffX
    Abs globTempVar
    if globTempVar < 10 && nearCliffY < 3 && nearCliffY > -5 && YSpeed < 0
      ClearStick
    else
      #let absNCX = var2
      #let NCY = var3
      absNCX = nearCliffX
      NCY = nearCliffY

      Norm globTempVar nearCliffX nearCliffY
      Abs globTempVar
      nearCliffX /= globTempVar
      nearCliffY /= globTempVar
      nearCliffY *= -1

      Abs absNCX
      globTempVar = XSpeed
      Abs globTempVar
      if NCY < 0 && absNCX < 30 && globTempVar > 2
        nearCliffY -= 1
      elif NCY < 20 && absNCX < 30 && YSpeed > 0
        nearCliffY -= 1
      endif

      AbsStick nearCliffX nearCliffY
    endif
  endif
#endsnippet

#snippet DSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    AbsStick nearCliffX
  elif Equal recOption optDownBCancel
    Button A
    Stick 0 (-1)
  endif
#endsnippet