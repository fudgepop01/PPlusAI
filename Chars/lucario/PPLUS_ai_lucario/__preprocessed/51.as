id 0x51

unk 0x0

var21 = 51

// SetDebugOverlayColor 0 255 0 200
if FrameGE 0 && !(FrameGE 1)
  Button X
endif
if FrameGE 1 && !(FrameGE 6)
  // we don't want it to be a long jump if the AI is close
  // to the target
  var9 = (ExactOXCoord - ExactXCoord) / 15
  AbsStick var9
  // adjusts the trajectory of the jump if the
  // target is moving
  if OXSpeed > 0.2
    ClearStick
    AbsStick 1 0
  elif OXSpeed < -0.2
    ClearStick
    AbsStick (-1) 0
  endif
endif
if FrameGE 6
  Call AIHub
endif
Return
Return
