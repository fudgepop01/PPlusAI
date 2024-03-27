#snippet SELF_Y_ADJUST
  $ifLastList(nspecialair;sspecialair;dspecialair;uspecialair,false)
  $elifLastAttack(hover)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastList(nspecialair;sspecialair;dspecialair;uspecialair,false)
  $elifLastAttack(hover)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastList(nspecialair;uspecialair,false)
  $elifLastAttack(hover)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  $ifLastList(nspecialair;sspecialair;dspecialair;uspecialair,false)
  $elifLastAttack(hover)
#endsnippet

// #snippet FASTFALL_CHECK
//   $ifAerialAttack()
//     if Equal AirGroundState 2
//       #let fastfallDist = var18
//       CALC_FASTFALL_DIST(fastfallDist, move_hitFrame)

//       // LOGSTR str("FASTFALL DIST")
//       // LOGVAL fastfallDist
//       // LOGSTR str("CURRENT YPOS")
//       // LOGVAL TopNY
//       // PRINTLN

//       immediateTempVar = fastfallDist + (CenterY - TopNY)
//       immediateTempVar -= YDistFloor
//       if immediateTempVar > 0
//         globTempVar = targetX - TopNX
//         immediateTempVar = targetY - TopNY + fastfallDist

//         Abs globTempVar
//         Abs immediateTempVar
//         if globTempVar <= move_xRange && immediateTempVar <= move_yRange
//           if !(Equal scriptVariant sv_checkHit)
//             scriptVariant = sv_execute_fastfall
//                 LOGSTR_NL str("FASTFALL")
//             CallI ExecuteAttack
//             Finish
//           else
//             scriptVariant = sv_execute_fastfall
//             Return
//           endif
//         endif
//       endif

//       if NumJumps > 0

//         if Equal IsOnStage 1
//           #let hardFallDist = var18
//           GetAttribute hardFallDist attr_fastFallSpeed 0
//           hardFallDist *= move_hitFrame * -1
//           immediateTempVar = hardFallDist + (CenterY - TopNY)
//           immediateTempVar -= YDistFloor

//           if immediateTempVar > 0
//             globTempVar = targetX - TopNX
//             immediateTempVar = targetY - TopNY + hardFallDist

//             Abs globTempVar
//             Abs immediateTempVar
//             if globTempVar <= move_xRange && immediateTempVar <= move_yRange
//               if !(Equal scriptVariant sv_checkHit)
//                 scriptVariant = sv_execute_hardfall
//                 LOGSTR_NL str("HARDFALL")
//                 CallI ExecuteAttack
//               else
//                 scriptVariant = sv_execute_hardfall
//                 LOGSTR_NL str("RET 0")
//                 Return
//               endif
//             endif
//           endif
//         endif

//         immediateTempVar = OTopNY - TopNY
//         if immediateTempVar > 15
//           #let risingDist = var18
//           #const risingVel = 2
//           risingDist = risingVel
//           risingDist *= move_hitFrame
//           immediateTempVar = risingDist + (CenterY - TopNY)
//           immediateTempVar -= YDistFloor

//           if immediateTempVar > 0
//             globTempVar = targetX - TopNX
//             immediateTempVar = targetY - TopNY + risingDist

//             Abs globTempVar
//             Abs immediateTempVar
//             if globTempVar <= move_xRange && immediateTempVar <= move_yRange
//               if !(Equal scriptVariant sv_checkHit)
//                 scriptVariant = sv_execute_rising
//                 LOGSTR_NL str("RISING")
//                 CallI ExecuteAttack
//               else
//                 scriptVariant = sv_execute_rising
//                 Return
//               endif
//             endif
//           endif
//         endif
//       endif
//     endif
//   endif
// #endsnippet