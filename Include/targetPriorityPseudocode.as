// for each ftSlot...

if OTeam != Team
  priority = Rnd * SUBS(0x7)
  // extra priority given to human players
  if SUBS(0x1C) != 0
    if isHuman
      priority += SUBS(0x1C)
    endif
  endif
  // prioritize distance according to SUBS(0x8) for x and SUBS(0xC) for y  
  if SUBS(0x0) != 0
    xDiff = OXCoord - XCoord
    yDiff = OYCoord - YCoord
    Norm diffLen xDiff yDiff
    if diffLen > 0
      var0 = 1/sqrt(diffLen)
      var0 *= diffLen
    endif
    var1 = SUBS(0x8) - SUBS(0xC)
    if var1 < 1
      var1 = 1
    endif
    var2 = (var0 - SUBS(0xC)) / var1
    if (var2 <= 1) && (var2 < 0)
      var2 = 0
    endif
    priority += (1 - var2) * SUBS(0x0)
  endif
  // damage
  // 0x1 = multiplier
  // 0x10 = min damage to consider
  // 0x12 = weight per damage (minus 0x10)
  if SUBS(0x1) != 0
    var0 = SUBS(0x12) - SUBS(0x10)
    if var0 < 1
      var0 = 1
    endif
    var1 = (ODamage - SUBS(0x10)) / var0
    if (var1 <= 1) && (var1 < 0)
      var1 = 0
    endif
    priority += var1 * SUBS(0x1)
  endif
  // inverse damage
  // 0x2 = multiplier
  // 0x14 = min damage to consider
  // 0x16 = weight per damage (minus 0x10)
  if SUBS(0x2) != 0
    var0 = SUBS(0x16) - SUBS(0x14)
    if var0 < 1
      var0 = 1
    endif
    var1 = (ODamage - SUBS(0x14)) / var0
    if (var1 <= 1) && (var1 < 0)
      var1 = 0
    endif
    priority += (0 - var1) * SUBS(0x2)
  endif

  if (statField_0x5 & 20000 != 0) || OActionCategory == acat_dragoon
    priority -= 500
  endif

  if OInDangerZone
    priority -= 200
  endif

  if StockMatch 
    if SUBS(0x3) != 0
      
    endif
  endif
endif