#include <Definition_AIMain.h>
id 0x1120
unk 0x0

//= XReciever

if Equal var20 -1 && CurrAction >= 52 && CurrAction <= 53 
  XGoto CalcAttackGoal
  //= XReciever
  Call ExecuteAttack
endif
Return

// #let framesAfterHitlag = var0
// framesAfterHitlag = 0

// #let moveAngle = var1
// GET_MOVE_DATA(moveAngle, var17, var17, var17, var17, var17, var17, var17, var17, var17, var17, var17)

// label start

// if OFramesHitlag <= 0 && OFramesHitstun > 0
//   framesAfterHitlag += 1
//   if Equal framesAfterHitlag 2
//     if !(True)
//       label correctMoveAngle
//     endif
//     if moveAngle > 90
//       moveAngle -= 90
//       if moveAngle > 90
//         SeekNoCommit correctMoveAngle
//       endif
//     endif

//     var22 = moveAngle + 3
//     var23 = moveAngle - 3
//     if OKBAngle > var22
//       trackOAction 5 1
//     elif OKBAngle < var23
//       trackOAction 5 3
//     elif Rnd < 0.5
//       trackOAction 5 2
//     endif
//   endif
// endif

// if CurrAction < 52 || CurrAction > 60
//   XGoto CalcAttackGoal
//   //= XReciever
//   if OFramesHitstun <= 1
//     var21 = 16.3
//   else
//     var15 = -10
//     var21 = 16.4
//   endif
//   CallI MainHub
// elif Equal CurrAction 57 && AnimFrame > 8
//   if Rnd < 0.7
//     GetYDistFloorOffset var22 20 10 0
//     if Equal var22 -1
//       AbsStick 1 0
//       Return
//     endif
//     GetYDistFloorOffset var22 -20 10 0
//     if Equal var22 -1
//       AbsStick -1 0
//       Return
//     endif
//   endif

//   if True
//     if Rnd < 0.5
//       AbsStick 0 1
//     else 
//       AbsStick 0 (-1)
//     endif
//   endif
// endif

Return
Return
