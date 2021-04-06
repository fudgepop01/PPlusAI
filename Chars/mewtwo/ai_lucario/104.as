// TELEPORT APPROACH
// controls mewtwo's offensive teleport

id 0x8104

unk 0x00000

if InAir && YDistBackEdge < -10
  Call ApproachHub
endif

lastScript = hex(0x8104)

if lastAttack >= hex(0x6031) && lastAttack <= hex(0x603F)

endif

#let targetXDistance = var0
#let targetYDistance = var1

var3 = 1
var8 = 1

EST_O_COORDS(targetXDistance, targetYDistance, move_hitFrame + 19)

label
#let cancelFrameCount = var2

if lastAttack >= hex(0x6031) && lastAttack <= hex(0x603F)

elif True
  if !(Equal CurrAction hex(0x114)) && !(Equal CurrSubaction hex(0x1DD)) && CurrAction <= hex(0x0A)
    Button B
    Stick 0 0.7
    cancelFrameCount = 0
    Return
  endif
  label
  if Equal CurrAction hex(0x114) || Equal CurrAction hex(0x11B)
    if Equal CurrSubaction hex(0x1D9) || Equal CurrSubaction hex(0x1DA)
      Norm globTempVar targetXDistance targetYDistance
      targetXDistance /= globTempVar
      targetYDistance /= globTempVar
      AbsStick targetXDistance targetYDistance
      if !(InAir) && targetYDistance < 0.3
        Stick 0 0.3
      endif
    elif True
      if Equal lastAttack valBAir 
        globTempVar = OPos * -1
        AbsStick globTempVar
      else
        AbsStick OPos
      endif
    endif
    Return
  else
    cancelFrameCount += 1
    if !(InAir)
      Call AIHub
    endif
    if cancelFrameCount >= 5
      Call ApproachHub
    endif
  endif
endif
Return
Return