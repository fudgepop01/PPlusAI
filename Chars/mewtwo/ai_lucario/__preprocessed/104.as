// TELEPORT APPROACH
// controls mewtwo's offensive teleport

id 0x8104

unk 0x00000

if InAir && YDistBackEdge < -10
  Call ApproachHub
endif

var21 = 33028

if var20 >= 24625 && var20 <= 24639

endif


var3 = 1
var8 = 1

  var0 = 0
  var1 = 0
  var22 = var13 + 19
  EstOYCoord var1 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  if OCurrAction <= 9 && var20 < 24641
    var22 /= 3
  endif
  EstOXCoord var0 var22
  var1 = var1 - (OSCDBottom - OTopNY)
  // correct if estimated y positions go beyond ground level
  // target
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var1 += var22
  endif
  // DrawDebugRectOutline var0 var1 5 5 136 255 136 221

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
  if Equal CurrAction 276 || Equal CurrAction 283
    if Equal CurrSubaction 473 || Equal CurrSubaction 474
      Norm var17 var0 var1
      var0 /= var17
      var1 /= var17
      AbsStick var0 var1
      if !(InAir) && var1 < 0.3
        Stick 0 0.3
      endif
    elif True
      if Equal var20 24643 
        var17 = OPos * -1
        AbsStick var17
      else
        AbsStick OPos
      endif
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
