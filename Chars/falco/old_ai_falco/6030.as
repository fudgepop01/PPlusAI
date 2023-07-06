#snippet PRE_HOOKS
  Goto CTD
#endsnippet

#snippet SPECIAL_PERFORMERS
  if CalledAs NSpecial
    move_yRange = nspecial_aim_yRange
    label CNS
      Goto checks

      globTempVar = YSpeed * -1
      if YDistBackEdge > -20
        CalcYChange globTempVar 13 globTempVar Gravity MaxFallSpeed FastFallSpeed 1
      else
        CalcYChange globTempVar 13 globTempVar Gravity MaxFallSpeed FastFallSpeed 0
      endif
      move_yOffset = nspecial_aim_yOffset + globTempVar - OHurtboxSize / 2

      if Equal AirGroundState 1
        Call AIHub
      endif
      #let iterator = var0
      move_xRange = nspecial_aim_xRange
      move_xOffset = 100
      move_lastHitFrame = 20
      move_hitFrame = 20
      label CNSIteration
        #let xDist = var5
        #let yDist = var6
        Goto CTD

        Abs xDist
        Abs yDist
        if xDist <= nspecial_aim_xRange && yDist <= move_yRange
          Button B
          Seek CNS_end
          Jump
        endif
        if move_xOffset <= 0 
          Seek CNS
          Return
        endif
        move_xOffset -= 25
        move_hitFrame -= 5
        move_lastHitFrame -= 5
        Seek CNSIteration
        Jump
        Return
    Return
    label CNS_end
    Seek _executed
    Jump
  endif
#endsnippet

#snippet NSpecial
  if YSpeed <= 0 && Equal IsFastfalling 0 && YDistBackEdge > -20
    Stick 0 (-1)
  endif
  if Equal AirGroundState 1 && AnimFrame > 3
    Call AIHub
  endif
#endsnippet

#snippet DSpecial
  if frameCounter >= 6
    Button X
    Call AIHub
  endif
#endsnippet