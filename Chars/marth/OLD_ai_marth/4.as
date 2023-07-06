#snippet USPECIAL_ACTIONS
  elif Equal CurrAction hex(0x114)
#endsnippet

// #snippet LEDGE_REFRESH
//   globTempVar = 10
//   label 
//   if globTempVar >= 5
//     ClearStick
//     Stick 0 (-0.7)
//     Button B
//   elif globTempVar >= 3
//     Button X
//   else
//     approachType = 0
//     ClearStick
//     Stick 0 0.7
//     Button B
//     hasTriedToUpB = 1
//     Seek _main
//   endif
//   globTempVar -= 1
//   Return
// #endsnippet

#snippet USPECIAL
  globTempVar = nearCliffX - TopNX
  AbsStick globTempVar
#endsnippet