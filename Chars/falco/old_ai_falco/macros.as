#macro POSITION_CALC_OVERRIDES()
  if Equal lastAttack valSSpecialAir || Equal lastAttack valDSpecialAir
    globTempVar = TopNY
  endif
#endmacro

// #macro CTD_DEBUG_DISPLAY()
//   if !(CalledAs ComboHub)
//     targetXDistance += TopNX
//     targetYDistance += TopNY
//     DrawDebugRectOutline targetXDistance targetYDistance move_xRange move_yRange color(0x00FF0088)
//     targetXDistance -= TopNX
//     targetYDistance -= TopNY

//     globTempVar = hitboxSizeMultiplier + 1
//     globTempVar = move_xRange * (1/globTempVar)
//     move_xRange = globTempVar
//     move_xOffset = move_xOffset + globTempVar * hitboxSizeMultiplier

//     globTempVar = hitboxSizeMultiplier + 1
//     globTempVar = move_yRange * (1/globTempVar)
//     move_yRange = globTempVar
//     move_yOffset = move_yOffset - globTempVar * hitboxSizeMultiplier

//     // globTempVar = TopNY - move_yOffset + move_yRange + immediateTempVar
//     // DrawDebugRectOutline TopNX globTempVar 10 0 color(0x00FFFF88)

//     if CalledAs ApproachHub
//       move_xRange -= 2.5
//       move_xOffset += 5
//     endif

//     immediateTempVar = (move_xOffset + move_xRange)
//     immediateTempVar *= Direction
//     immediateTempVar += TopNX
//     globTempVar = TopNY - move_yOffset + move_yRange
//     DrawDebugRectOutline immediateTempVar globTempVar move_xRange move_yRange color(0x88888888)
//     globTempVar += localTemp
    
//     // if OTopNX > 0
//     //   immediateTempVar += move_xRange
//     // else
//     //   immediateTempVar -= move_xRange
//     // endif 
//     DrawDebugRectOutline immediateTempVar globTempVar move_xRange move_yRange color(0xFFFFFF88)

//     immediateTempVar = OHurtboxSize / 2
//     globTempVar = immediateTempVar + OSCDBottom
//     DrawDebugRectOutline OTopNX globTempVar 5 immediateTempVar color(0xFFFF00DD)
    
//     if CalledAs ApproachHub
//       move_xRange += 2.5
//       move_xOffset -= 5
//     endif

//     globTempVar = move_xRange * hitboxSizeMultiplier
//     move_xOffset -= globTempVar
//     move_xRange = move_xRange + globTempVar
//     globTempVar = move_yRange * hitboxSizeMultiplier
//     move_yOffset += globTempVar
//     move_yRange = move_yRange + globTempVar
//   endif
// #endmacro