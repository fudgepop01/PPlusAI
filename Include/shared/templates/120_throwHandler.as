#include <Definition_AIMain.h>
id 0x1120
unk 0x0

XReciever

#let framesAfterHitlag = var0
framesAfterHitlag = 0

#let moveAngle = var1
GET_MOVE_DATA(moveAngle, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar)

label start

if OFramesHitlag <= 0 && OFramesHitstun > 0
  framesAfterHitlag += 1
  if Equal framesAfterHitlag 2
    if !(True)
      label correctMoveAngle
    endif
    if moveAngle > 90
      moveAngle -= 90
      if moveAngle > 90
        SeekNoCommit correctMoveAngle
      endif
    endif

    immediateTempVar = moveAngle + 3
    anotherTempVar = moveAngle - 3
    if OKBAngle > immediateTempVar
      trackOAction man_ODIAngle op_DI_in
    elif OKBAngle < anotherTempVar
      trackOAction man_ODIAngle op_DI_out
    elif Rnd < 0.5
      trackOAction man_ODIAngle op_DI_neutral
    endif
  endif
endif

if CurrAction < hex(0x34) || CurrAction > hex(0x3C)
  XGoto CalcAttackGoal
  XReciever
  skipMainInit = mainInitSkip
  currGoal = cg_attack_reversal
  CallI MainHub
elif Equal CurrAction hex(0x39) && AnimFrame > 8
  if Rnd < 0.7
    GetYDistFloorOffset immediateTempVar 20 0 0
    if Equal immediateTempVar -1
      AbsStick 1 0
      Return
    endif
    GetYDistFloorOffset immediateTempVar -20 0 0
    if Equal immediateTempVar -1
      AbsStick -1 0
      Return
    endif
  endif

  $ifLastAttack(fthrow)
    Stick 1 0
  $elifLastAttack(dthrow)
    Stick 0 (-1)
  $elifLastAttack(bthrow)
    Stick -1 0
  $elifLastAttack(uthrow)
    Stick 0 1
  elif True
    if Rnd < 0.5
      AbsStick 0 1
    else 
      AbsStick 0 (-1)
    endif
  endif
endif

Return
Return