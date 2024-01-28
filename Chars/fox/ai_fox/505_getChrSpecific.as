#snippet FETCH_MOVE_DATA
  $generateFetchMoveData(0)
#endsnippet

#snippet EVT_CHR_CHECKS
#endsnippet

#snippet EVT_RANGED_HIT
#endsnippet

// #snippet EST_OWN_RECOVERY
//   // up to var6 is free
//   #let GX = var0
//   #let GY = var1
//   #let framesAhead = var2
//   #let phaseFramesAhead = var3
//   #let velX = var4
//   #let velY = var5

//   #let phase = var6

//   phase = OCurrAction
//   GX = OCenterX
//   GY = OCenterY
//   velX = 0
//   velY = 0
    
//   // 41 frames
//   if Equal phase hex(0x114)
//     immediateTempVar = 41 - OActionTimer - framesAhead
//     if immediateTempVar < 0
//       phase = hex(0x117)
//       framesAhead = immediateTempVar * -1
//     endif 
//   endif

  
//   phaseFramesAhead = framesAhead
//   if Equal phase hex(0x117)
//     if Equal OCurrAction hex(0x114)
//       immediateTempVar = OCenterX * 0.5
//       Norm immediateTempVar immediateTempVar OCenterY
//       Abs immediateTempVar
//       anotherTempVar = 30 - phaseFramesAhead
//       if anotherTempVar < 0
//         phaseFramesAhead = 30
//       endif
//     else
//       Norm immediateTempVar OXSpeed OYSpeed
//       anotherTempVar = 30 - OActionTimer - phaseFramesAhead
//       if anotherTempVar < 0
//         phaseFramesAhead = 30 - OActionTimer
//       endif
//     endif
//     if Equal immediateTempVar 0
//       immediateTempVar = 0.00001
//     endif
//     anotherTempVar = 1 / immediateTempVar

//     velX = anotherTempVar * calc(1/80)
//     velY = immediateTempVar * calc(1/80)
//     anotherTempVar = velX * phaseFramesAhead
//     immediateTempVar = velY * phaseFramesAhead
//     GX += anotherTempVar
//     GY += immediateTempVar

//     framesAhead -= phaseFramesAhead
//     if framesAhead > 0
//       phase = hex(0x118)
//     endif
//   endif  
// #endsnippet