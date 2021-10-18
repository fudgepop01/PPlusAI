// OOS HUB
// controls OOS options
#include <Definition_AIMain.h>
id 0x8007

unk 0x0

var3 = 20
predictOOption var17 10 LevelValue
predictionConfidence var22 10 LevelValue
if Equal var17 1
  var3 = 40
  if var22 >= 0.4
    var3 = 55
  elif var22 >= 0.8
    var3 = 70
  endif
  var3 *= LevelValue * 0.01
endif

var1 = 0
label
Cmd30
var21 = 32775

RetrieveATKD var4 OCurrSubaction 1

var4 = OEndFrame - OAnimFrame
if Equal OCurrAction 51
  var17 = OTopNY + OYDistBackEdge
  EstOPassTimeY var17 var17
  var17 += 11
  if var17 < var4
    var4 = var17
  endif
endif
if OAttacking && var4 > 15 && OAnimFrame >= var5 
  AbsStick OPos
  Call AIHub
elif XDistLE 50 && var3 > 0
  Button R
elif OAttacking && OAnimFrame > 15 && OAnimFrame < var5 && XDistLE 50
  var3 += 1
  Button R
endif
var3 -= 1

if Equal CurrAction 29
  Button R
  if Equal OPos Direction && XDistLE 12 && Rnd < 0.8 && AnimFrame > 3
    var1 = 1
  endif
  if LevelValue >= 75 && Equal OPos Direction
    var0 = OPos
  else
    var0 = OPos * 0.6 * -1
  endif
  AbsStick var0
  Return
endif

var22 = OTopNY - TopNY 
if Equal var1 1 && XDistLE 18 && var22 < 10 && Equal OPos Direction && var4 > 3
  Button R
  if Equal CurrAction 27
    Button A|R
    var18 = 1
    Call Grab
  endif
  Return
endif

predictAverage var17 3 LevelValue
var17 += 10
var22 = var17 + 20
if XDistLE var17 var22
  Goto other_GOOS
elif Equal var1 1
  Goto other_GOOS
endif

if !(True)
  label other_GOOS
  Button R
  if Equal LevelValue 100 && Equal IsOnPassableGround 1 && Rnd < 0.7
    Seek shieldDropOOS
    Jump
  elif Equal CurrAction 27 && var4 > 8 && var3 <= 10 || XDistLE var17 var22 && !(OAttacking)
    var17 = Rnd * 100
    if var17 < 78
      Button X
      Seek jumpHandler
      Return
    elif var17 < 90 && XDistFrontEdge > 25
      AbsStick OPos
    elif var17 < 93
      var17 = OPos * -1
      AbsStick var17
    else
      AbsStick 0 (-1)
    endif
    Call AIHub
  endif
  Return
endif

  GetNearestCliff var17
  var17 = TopNX - var17
  var17 *= -1
  var22 *= -1
  var22 = var22 - (TopNY * -1)
var22 = var17
Abs var22
if var22 < 25 && Equal IsOnStage 1 && Rnd < 0.1
  Button R
  var17 *= -1
  AbsStick var17
  Return
endif

if Equal CurrAction 28
  Button X
  Seek jumpHandler
  Return
endif

if CurrAction <= 32
  Call AIHub
endif
Return

label shieldDropOOS
  var22 = 3
  label
  ClearStick
  Button R
  if Equal CurrAction 27
    Stick 0 (-0.715)
    var22 -= 1
    if var22 <= 0
      Button X
      Seek jumpHandler
      Return
    endif
  elif Equal CurrAction 114
//     {SHIELDDROP_OPTIONS}
    Call AIHub
  endif
Return

label jumpHandler
Cmd30
var0 = OXSpeed
Abs var0
var17 = OPos * 0.4
AbsStick var17
var1 = OXSpeed * OPos
if SamePlane && var1 < 0 && var0 > 0.2 && InAir && ODistLE 60
  var18 = 1
  var17 = OTopNY - TopNY
  if XDistLE 20 && Rnd < 0.7 && var17 < 10
    Call DAir
  elif XDistLE 20 && var17 > 40
    Call UAir
  elif XDistLE 40
    Call NAir
  elif !(Equal OPos Direction) && XDistLE 60
    Call BAir
  else
    Call FAir
  endif
elif Rnd < 0.3 && InAir && XDistLE 60
  var18 = 1
  var17 = OTopNY - TopNY
  if XDistLE 20 && Rnd < 0.7 && var17 < 10
    Call DAir
  elif XDistLE 20 && var17 > 40
    Call UAir
  elif XDistLE 40
    Call NAir
  elif !(Equal OPos Direction) && XDistLE 60
    Call BAir
  else
    Call FAir
  endif
endif

if InAir
  if XDistBackEdge < -10 && var4 < 6
    var17 = OPos * -1
    AbsStick var17 (-1)
  elif XDistFrontEdge > 10 && LevelValue >= 7
    AbsStick OPos (-1)
  else
    AbsStick 0 (-1)
  endif

  Button R
//   {WAVEDASH_OPTIONS}
  Call AIHub
endif
Return
Return
