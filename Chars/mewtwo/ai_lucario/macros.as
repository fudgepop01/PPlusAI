// will setup and perform a jump if the target position is within the given
// ranges
#macro JUMP_IF_IN_RANGES(tempVar)
  #let targetYDistance = {tempVar}
  EstOYCoord globTempVar move_lastHitFrame
  globTempVar -= TopNY
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
  endif

  if Equal AirGroundState 2
    globTempVar = targetYDistance - gravChangeDist
    if globTempVar > DJIfOBeyond && globTempVar < DJIfOWithin && Equal AirGroundState 2 && CanJump && Equal IsOnStage 1
      Button X
      if Equal IsOnStage 0
        Stick 0 (-1)
        Call ChrSpecific2
      endif
    endif
  endif
#endmacro
