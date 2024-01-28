#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 7 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet USPECIAL
  if ActionTimer < 20 && CurrAction > hex(0x100)
    #const attackFrame = 14

    #const minY = 34
    #const maxY = 67
    // #const rangeY = calc(maxY - minY)
    #const rangeY = 33
    #const yPerFrame = 2.2

    // -20 or 53 with influence
    #const minX = 34
    #const maxX = 85

    // #const rangeX = calc(maxX - minX)
    #const rangeX = 51
    #const xPerFrame = 3.4

    #const xInfluenceMin = 40
    #const xInfluenceMax = 90
    #const xInfluencePerFrame = 3.571429

    #let framesHeld = var8
    if Equal ActionTimer 0
      framesHeld = 0
    endif 

    anotherTempVar = 20 - ActionTimer
    if OAnimFrame > 10
      EstOXCoord goalX anotherTempVar
      EstOYCoord goalY anotherTempVar
    else
      EstOXCoord goalX 3
      EstOYCoord goalY 3
    endif
    immediateTempVar = goalY - TopNY
    immediateTempVar -= minY
    
    // x diff
    globTempVar = goalX - TopNX
    Abs globTempVar
    globTempVar -= minX

    anotherTempVar = yPerFrame * ActionTimer
    // check if held for y diff
    if anotherTempVar < immediateTempVar
      Button B
      framesHeld += 1
    else
      // check if held for x diff
      if anotherTempVar < globTempVar
        Button B
        framesHeld += 1
      endif
    endif
    LOGSTR str("fHeld")
    LOGVAL framesHeld
    PRINTLN

    // distEggTraveled
    anotherTempVar = xPerFrame * framesHeld
    anotherTempVar += minX

    globTempVar = OPos * Direction
    if globTempVar < 0
      anotherTempVar -= 20
    endif
    LOGSTR str("baseXDist")
    LOGVAL anotherTempVar
    PRINTLN

    goalX -= anotherTempVar
    goalX -= TopNX

    // dist that CAN be added to egg
    if framesHeld > 0
      globTempVar = xInfluencePerFrame * framesHeld * Direction
      // stickAmt = (goalX - anotherTempVar - TopNX) / globTempVar
      goalX /= globTempVar
    endif

    LOGSTR str("stickRes")
    LOGVAL goalX
    PRINTLN

    Stick goalX
  endif  
#endsnippet