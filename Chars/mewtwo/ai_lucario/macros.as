// will setup and perform a jump if the target position is within the given
// ranges
#macro JUMP_IF_IN_RANGES(tempVar)
  #let targetYDistance = {tempVar}
  EstOYCoord globTempVar move_hitFrame
  globTempVar -= TopNY

  if MeteoChance && Equal AirGroundState 1 && OYSpeed > 0.01 && OYDistBackEdge > 15
    globTempVar += 25
  endif

  if MeteoChance && Equal IsOnStage 0 && YSpeed < 0.01 && globTempVar > 30 && globTempVar < 60
    Button X
    Stick 0 (-1)
    Call ChrSpecific2
  endif

  if globTempVar > SHIfOBeyond && globTempVar < jumpIfOWithin && Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif

  if globTempVar > FHIfOBeyond && globTempVar < jumpIfOWithin && Equal CurrSubaction JumpSquat
    Button X
  elif globTempVar > SHIfOBeyond && globTempVar < jumpIfOWithin && Equal CurrSubaction JumpSquat && OAttacking
    Button X
  endif

  if Equal AirGroundState 2 && YDistBackEdge < GetJumpHeight
    globTempVar += move_yOffset 
    globTempVar -= move_yRange 
    
    if globTempVar > DJIfOBeyond && globTempVar < DJIfOWithin && CanJump
      globTempVar = OTopNX - TopNX
      globTempVar *= 0.3
      ClearStick
      AbsStick globTempVar
      Button X
      if Rnd < 0.75
        Stick 0 (-1)
        Call ChrSpecific2
      endif
    endif
  endif
#endmacro
