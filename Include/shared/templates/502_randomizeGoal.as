#include <Definition_AIMain.h>
id 0x8502
unk 0x0

//= XReciever
goalX = Rnd * 300 - 150
goalY = Rnd * 150
GetColDistPosRel globTempVar globTempVar goalX goalY 0 -150 0

if globTempVar <= -1
  goalY = BBoundary
  Return
endif

goalY = globTempVar
goalY += 2

if CHANCE_MUL_LE PT_JUMPINESS 1
  GetAttribute immediateTempVar attr_jumpYInitVel 0
  immediateTempVar *= 3.5
  goalY = goalY + Rnd * immediateTempVar * 10
  if CHANCE_MUL_LE PT_DJUMPINESS 1
    GetAttribute immediateTempVar attr_airJumpYMult 0
    goalY = goalY + Rnd * immediateTempVar * 10
  endif
endif

Return
Return
