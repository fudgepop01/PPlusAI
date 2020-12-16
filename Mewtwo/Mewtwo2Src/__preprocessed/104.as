// TELEPORT APPROACH
// controls mewtwo's offensive teleport

id 0x8104

unk 0x00000

var21 = 33028

if var20 >= 24625 && var20 <= 24639

endif


var3 = 0

  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  var17 = OTopNY + OHurtboxSize
  var2 = var12 / 2
  var2 = TopNY - var10 + var2
  if var2 > var17
    var2 = OHurtboxSize * -1
  elif var2 < OTopNY
    var2 = 0
  else
    var17 = (var17 - var2)
    var17 = var17 * -1
    var2 = OHurtboxSize / var17
  endif
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   var0 = TopNX + (var9 * Direction)
  //   var0 = var0 + (var11 * Direction)
  //   var1 = TopNY - var10 + var12
  //   DrawDebugRectOutline var0 var1 var11 var12 255 68 68 153
  //   var1 += var2
  //   if var10 > -2 && var20 >= 24641 && var20 <= 24655
  //     var1 = var1 + var10 + 2 - var2
  //   endif
  //   if Equal PlayerNum 0
  //     DrawDebugRectOutline var0 var1 var11 var12 255 68 68 153
  //   elif Equal PlayerNum 1
  //     DrawDebugRectOutline var0 var1 var11 var12 68 68 255 153
  //   elif Equal PlayerNum 2
  //     DrawDebugRectOutline var0 var1 var11 var12 255 255 68 153
  //   elif Equal PlayerNum 3
  //     DrawDebugRectOutline var0 var1 var11 var12 68 255 68 153
  //   else
  //     DrawDebugRectOutline var0 var1 var11 var12 68 68 68 153
  //   endif
  //   var3 = OHurtboxSize / 2
  //   var17 = OTopNY + var3
  //   DrawDebugRectOutline OTopNX var17 var11 var3 68 255 68 153
  // endif
  var17 = 0
 // SAFE_INJECT_1 var17
  var17 = var13 + 19 + var3 + var17
  var17 /= 60
  EstOPosVecR var0 var1 var17
  // convert the values to use TopN X and Y instead of character's coordinates
  var17 = ExactOXCoord - ExactXCoord
  var17 = var17 - (OTopNX - TopNX)
  var0 = var0 - var17
  var17 = ExactOYCoord - ExactYCoord
  var17 = var17 - (OTopNY - TopNY)
  var1 = var1 - var17
  var0 += TopNX
  var0 = var0 - (var11 * Direction)
  var1 += TopNY
  // var17 = YDistBackEdge
  // if var10 > -2 && var20 >= 24641 && var20 <= 24655
  //   var1 = var1 + var10 + 2 - var2 - OHurtboxSize
  // endif
  // var1 -= TopNY
  var17 = var2 * 2
  var1 -= var17
  var1 = var1 - var12
  var1 += var10
  var0 = var0 - (var9 * Direction)
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   DrawDebugRectOutline var0 var1 var11 var12 255 0 0 136
  // endif
  var0 -= TopNX
  var1 -= TopNY

label

if var20 >= 24625 && var20 <= 24639

elif True
  if !(Equal CurrAction 276) && !(Equal CurrSubaction 477) && CurrAction <= 10
    Button B
    Stick 0 0.7
    var2 = 0
    Return
  endif
  label
  if Equal CurrAction 276 && !(Equal CurrSubaction 477)
    Norm var17 var0 var1
    var0 /= var17
    var1 /= var17
    AbsStick var0 var1
    if !(InAir) && var1 < 0.3
      Stick 0 0.5
    endif
    Return
  else
    var2 += 1
    if !(InAir)
      Call AIHub
    endif
    if var2 >= 5
      Call ApproachHub
    endif
  endif
endif
Return
Return
