#include <Definition_AIMain.h>
id 0x850D
unk 0x0

//= XReciever

// $setLastAttack(nspecialair)
// var21 = 16.3

// where will attacker be at end of frame
// where will defender be at end of frame
// apply positional offset to defender position
// check to see if move will hit if swung now

// CLEAR VARIABLES:
// 9, 10, 11, 12

// $setLastAttack(dtilt)


  var22 = 19
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 6 0
STACK_PUSH 15 0
STACK_PUSH 7 0
STACK_PUSH 9 0
STACK_PUSH 10 0
STACK_PUSH 1 0
STACK_PUSH 0 0
  XGoto GetChrSpecific
  //= XReciever
var16 = 0

if var15 > 10
  var15 = 10
endif

var0 *= Scale
var1 *= Scale
var10 *= Scale
var9 *= Scale

// temp until loop
// 1. adjust hitFrame
  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  var22 = STACK_POP
  if Equal var3 1
  if Equal AirGroundState 1
    GetAttribute var23 940 0
    var7 += var23
  endif
endif

// 2. check if it's worth pursuing this attack
var17 = OAnimFrame + var7
if OCurrAction >= 78 && OCurrAction <= 82 && 26 < var17
  Return
elif OCurrAction >= 96 && OCurrAction <= 97 && 19 < var17
  Return
elif OCurrAction >= 31 && OCurrAction <= 32 && 19 < var17 // roll
  Return
elif Equal OCurrAction 30 || Equal OCurrAction 142 || Equal OCurrAction 144 || Equal OCurrAction 145
  if 15 < var17 // spotdodge
    Return
  endif
elif Equal OCurrAction 33 && 29 < var17 // airdodge
  Return
elif Equal OCurrSubaction 217 || Equal OCurrSubaction 48
  if 33 < var17 // roll from ledge
    Return
  endif
elif Equal OCurrSubaction 222 || Equal OCurrSubaction 221
  if 61 < var17 // roll from ledge SLOW
    Return
  endif
endif

// 3. setup ranges
var0 = var0 + var10
if var0 < 0
  var16 = 1
  var0 *= -1
endif
var0 -= 2

var9 -= 2
var1 = var9 - var1
var1 += 2

  var22 = 23
  XGoto GetChrSpecific
  //= XReciever
var2 = var22

// grabs an estimate of the potential move xRange to hit
// $ifAerialAttackNotSpecial()
//   var17 = var7 + var15 * 0.25
//   var17 *= 0.15
//   if Equal AirGroundState 2
//     // get max possilbe air speed
//     GetAttribute var22 128 0
//     var23 = var17 * var22
//     var17 = var23
//     // max possible speed
//     var23 += XSpeed
//     Abs var23
//     // min possible speed
//     var17 -= XSpeed
//     Abs var17
//     // clamp by term vel
//     GetAttribute var22 136 0
//     if var23 > var22
//       var23 = var22
//     endif
//     if var17 > var22
//       var17 = var22
//     endif
//     // positive offset
//     var22 = var7 + var15 * 0.25
//     var22 *= 0.15
//     var23 *= var22
//     var10 += var23
//     var23 *= Direction * 2
//     var0 -= var23
//     // negative offset
//     var17 *= var22
//     var10 += var17
//     var17 *= Direction * 2
//     var0 += var17
//   elif !(Equal CurrAction 10)
//     GetAttribute var22 68 0
//     var22 *= var17
//     var10 += var22
//     var9 += OHurtboxSize
//   endif
// endif

// if Equal OCurrAction 77
//   var9 += 3
//   var1 += 3
// endif

// $ifAerialAttack()
// else
//   var22 = var9 * 2 - var1
//   if var22 <= HurtboxSize && OYDistFloor > HurtboxSize && OYSpeed > 0
//     var20 = -1
//     Return
//   endif
//   var22 = var0 * 0.25 - var10 * 0.8
//   if XDistLE var22
//     var20 = -1
//     Return
//   endif
// endif

var22 = OHurtboxSize * 0.5
var9 += var22
// var1 -= var22
// LOGSTR 1330135552 1392508928 0 0 0
// LOGVAL OHurtboxSize
// PRINTLN

var22 = OWidth * 0.3
var10 += var22
// var0 -= var22
// var22 *= 0.5

// LOGVAL_NL var10
// var22 = 10
// // if var21 >= 16.7
// //   var22 = (var15 + var7) * 0.15
// // endif
// if Equal var21 16.41
//   var9 += var22
//   // var1 += var22
//   var10 += var22
//   // var0 -= var22
// endif 

if OFramesHitstun < 1
  GetAttribute var22 40 1
  PredictOMov var23 14
  var23 *= var22
  var10 += var23

  // var22 *= var23
  // var22 *= 2

  if Equal var21 16.3
    predictAverage var22 11
    var22 *= 0.75
    var10 += var22
    var10 += Width
  endif
endif
// LOGVAL_NL var10

if !(True)
  if Equal OCurrAction 74 || Equal OCurrAction 77 || Equal OCurrAction 83 || Equal OCurrAction 84
    Return
  endif
  var15 = 1
endif

// if OCurrAction >= 68 && OCurrAction <= 73 || Equal OCurrAction 66
//   var22 = var9 - var1
//   if OYDistFloor < var22 && OYSpeed < 0 && OYDistFloor > 1
//     Return
//   endif
// endif

// CLEAR VARIABLES:
// 9, 10, 11, 12

// $tempVar(dirX, var22)
// GET_CHAR_TRAIT(dirX, 0.001)
if !(True)
  Abs var0
elif Equal AirGroundState 1
  if var0 < 0 && OPos < 0
  elif var0 > 0 && OPos > 0
  else
    var0 *= -1
  endif
elif var16 > 0
  var0 *= -1
endif


// adjust difficulty
if LevelValue <= 21
  var22 = Rnd * 30 - 15
  var7 += var22
  var22 = Rnd * 30 - 15
  var0 += var22
  var22 = Rnd * 30 - 15
  var1 += var22
  var22 = Rnd * 15
  var10 += var22
  var22 = Rnd * 15
  var9 += var22
elif LevelValue <= 60
  var22 = Rnd * 16 - 8
  var0 += var22
  var22 = Rnd * 16 - 8
  var1 += var22
  var22 = Rnd * 6
  var10 += var22
  var22 = Rnd * 6
  var9 += var22
endif

var7 -= 1
var8 = var15

STACK_PUSH var10 1
STACK_PUSH var9 1
STACK_PUSH var0 1
STACK_PUSH var1 1

// var1 *= -1

LOGSTR 1481768960 0 0 0 0
LOGVAL var10
LOGSTR 1498546176 0 0 0 0
LOGVAL var9
LOGSTR 1129840640 0 0 0 0
LOGVAL var0
LOGSTR 1129906176 0 0 0 0
LOGVAL var1
PRINTLN

var16 = -1
if OCurrAction >= 256

  var22 = OCurrAction + 256
  RetrieveFullATKD var3 var22 var22 var22 var22 var22 var22 var22 1
  var16 = var3
  if var3 >= 0
    var2 = 0
  endif
endif
var0 += var2


if !(True)
  label CHECK_HIT_LOOP
endif

RESET_LTF_STACK_PTR

var4 = LTF_STACK_READ
var5 = LTF_STACK_READ

if var8 < 0
  var8 = 0
  SeekNoCommit CHECK_HIT_LOOP
endif

var2 = var8
var2 += var7
// LOGSTR 1702065152 1768759296 1718771968 1835335680 0
// LOGVAL var2
// PRINTLN

// 1. where will attacker be at end of frame

  var22 = LTF_STACK_READ * -1 // var0
  var17 = 0
if !(True)
    var17 = 1
    var22 *= OPos
  endif
if  var20 >= 10 && var20 <= 14
    if Equal var17 0
      var22 *= Direction
    endif
  endif
  var23 = TopNX
  // var22 = var0
  var23 = TotalXSpeed * var2
if  var20 >= 10 && var20 <= 14
    if Equal AirGroundState 1
      GetAttribute var17 76 0
      var23 *= var17
    endif
  else
    var23 = 0
  endif
  var23 += TopNX
  var23 -= var22 // var0
  STACK_PUSH var23 0

  var23 = TopNY
if  var20 >= 10 && var20 <= 14
    if Equal AirGroundState 1
      GetAttribute var22 84 0
      var17 = TopNY + var22
      var14 = TopNY + 10.31 - 5
      if var17 < OTopNY
        GetAttribute var22 72 0
        var14 = TopNY + 35.57 - 5
      endif
    else
      GetAttribute var22 72 0
      GetAttribute var23 88 0
      var22 *= var23
      var23 = TopNY + 35.57
      if var23 < OTopNY && NumJumps > 0
        var14 = var23 - 5
      else
        var22 = TotalYSpeed
      endif
    endif
    CalcYChange var23 var2 var22 Gravity MaxFallSpeed FastFallSpeed 0
    var23 += TopNY
  elif Equal AirGroundState 1
    var23 = TopNY
  elif AnimFrame <= 5
    // MARKER THINGY HERE
    CalcYChange var23 var2 CharYSpeed Gravity MaxFallSpeed FastFallSpeed 0
    var23 += TopNY
  else
    EstYCoord var23 var2
  endif
  var23 -= LTF_STACK_READ // var1
  STACK_PUSH var23 0

  // NOTE visualization SELF
  var17 = STACK_POP // YPos
  var22 = STACK_POP // XPos
  // LOGSTR_NL 1347375104 1346716672 0 0 0
  // LOGVAL_NL var22
  var23 = 255 - var2 * 5
  DrawDebugRectOutline var22 var17 var4 var5 200 255 0 var23
  STACK_PUSH var22 0
  STACK_PUSH var17 0



var10 = 0
// if Equal OAirGroundState 2
//   $ifAerialAttack()
//     var10 = OHurtboxSize + HurtboxSize
//     var10 *= 0.5
//   endif
// endif
// 2. where will defender be at end of frame
  if var16 < 0

    if OCurrAction > 32 && OAnimFrame > 3
      EstOXCoord var23 var2
    else
      var23 = OCenterX + OTotalXSpeed * var2
    endif
    STACK_PUSH var23 0


    if Equal OAirGroundState 2
      var23 = var2
      if OAnimFrame <= 3 && !(Equal OYSpeed 0)
        CalcYChange var23 var23 OCharYSpeed OGravity OMaxFallSpeed OFastFallSpeed 0
        var23 += OCenterY
      else
        EstOYCoord var23 var23
        var22 = OHurtboxSize * 0.5
        var23 += var22
      endif
    else
      var23 = OCenterY
    endif
    // if OYDistBackEdge > 5
    //   if var23 < 0
    //     var23 = 0
    //   endif
    //   var5 += var23
    // endif
    Goto adjustPosIfInGround
    var23 += var10
    STACK_PUSH var23 0
  elif True


    var22 = OCenterX
    var23 = OTopNY
    var17 = var2
  STACK_PUSH var0 0
  STACK_PUSH var1 0
  STACK_PUSH var2 0
  STACK_PUSH var3 0
  STACK_PUSH var4 0
  STACK_PUSH var5 0
  STACK_PUSH var6 0
STACK_PUSH 23 0
STACK_PUSH 22 0
  STACK_PUSH var17 0
  var22 = 22
  XGoto GetChrSpecific
  var6 = STACK_POP
  var5 = STACK_POP
  var4 = STACK_POP
  var3 = STACK_POP
  var2 = STACK_POP
  var1 = STACK_POP
  var0 = STACK_POP

    STACK_PUSH var22 0
    Goto adjustPosIfInGround
    var23 += var10
    STACK_PUSH var23 0
  endif

  // NOTE visualization OTHER
  var17 = STACK_POP // YPos
  var22 = STACK_POP // XPos
  var23 = 255 - var2 * 5
  DrawDebugRectOutline var22 var17 OWidth OHurtboxSize 255 0 255 var23
  // LOGSTR 1886351360 1885692928 0 0 0
  // LOGVAL var22
  // PRINTLN
  STACK_PUSH var22 0
  STACK_PUSH var17 0

// stack: 
// estOYPos, estOXPos, var23, var23, var14, var13, var10, var9

// 3. apply positional offset to defender position
  // FIXME come up with a better strategy for setAttackGoal
  // $tempVar(estOYPosOffs, var23)
  // estOYPosOffs = OTopNY - var14
  // estOYPosOffs += STACK_POP // estOYPos
  // $tempVar(estOXPosOffs, var22)
  // estOXPosOffs = OCenterX - var13
  // estOXPosOffs += STACK_POP // estOXPos
  // STACK_PUSH estOXPosOffs 0
  // STACK_PUSH estOYPosOffs 0

// check to see if move will hit if swung now
  var9 = STACK_POP // var9

  var10 = STACK_POP // estOXPos

  // LOGSTR 1702065152 544176384 1879048192 0 0
  // LOGVAL var9
  // var23 = STACK_POP
  // LOGSTR 1702065152 544808960 1886352128 0 0
  // LOGVAL var23
  // var11 = var9 - var23 // var23
  // Abs var11
  // PRINTLN
  var11 = var9 - STACK_POP // var23
  Abs var11

  // var4 *= 1
  // var5 *= 1

  // LOGSTR_NL 2018654976 544821760 991983872 1140850688 0
  // LOGVAL var4
  // LOGVAL var5
  // LOGVAL var11
  // PRINTLN
  // handle dash for idle ground moves:
if  Equal var20 0 || var20 >= 4 && var20 <= 2 || Equal var20 6 || Equal var20 9 || var20 >= -1 && var20 <= 7
    var23 = TopNX + 20 * OPos
    var22 = var10 - var23
    Abs var22
    if var22 <= var4 && var11 <= var5 && var21 < 16.7
      if Equal CurrAction 3 || Equal CurrAction 8 || Equal CurrAction 9
        if AnimFrame < 3 || Equal CurrAction 8 || Equal CurrAction 9 || !(Equal Direction OPos)
          var16 = 5
          var15 = -20
          CallI Wavedash 
        endif
      endif
    endif

    if Equal CurrAction 3
      // STACK_TOSS 1 // ignore var23

      var23 = TopNX + CharXSpeed * (AnimFrame - 10)
      var22 = var10 - var23
      Abs var22
      if var22 <= var4 && var11 <= var5
        label runWait
          XGoto PerFrameChecks
          Seek runWait
          ClearStick
          Stick 1
          if Equal CurrAction 4 || Equal CurrAction 1
            Seek crouchWait
            Jump
          endif
        Return
      endif
    endif
  endif
    
  var12 = STACK_POP // var23
  var10 -= var12
  Abs var10
  // LOGSTR_NL 2017722368 0 0 0 0
  // LOGVAL_NL var10
  
  if var10 < var4
  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  var22 = STACK_POP
  if Equal var3 1

      Abs var11
      STACK_PUSH var16 0
      STACK_PUSH var11 0
      // LOGSTR 2032165888 1768318464 0 0 0
      // LOGVAL var11
  var17 = var2
  if Equal CurrSubaction JumpSquat || Equal AirGroundState 1
    GetAttribute var22 940 0
    var17 -= var22
    GetAttribute var22 84 0
  else
    var22 = CharYSpeed
  endif
  CalcYChange var10 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
  
  var22 = TopNY + var10 - var1
  // VIS FASTFALL
  var5 *= 0.5
  var4 *= 0.5
  DrawDebugRectOutline OCenterX var22 var4 var5 255 0 255 221
  var5 *= 2
  var4 *= 2
  var11 = var9 - var22
  Abs var11
  if var11 <= var5
  var17 = var7 + var15 - var8
  if Equal CurrSubaction JumpSquat || Equal AirGroundState 1
    GetAttribute var22 940 0
    var17 -= var22
    GetAttribute var22 84 0
  else
    var22 = CharYSpeed
  endif
  CalcYChange var10 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
    var16 = 1
    CalcYChange var10 var6 YSpeed Gravity MaxFallSpeed FastFallSpeed 1
    Goto checkCanEdgeguard
    if var22 > 0
      Goto checkIfAirViable // fastfall
    endif
  endif
      // LOGSTR 1717960704 0 0 0 0
      // LOGVAL var11
      // PRINTLN
      var11 = STACK_POP // original var11
      var23 = YSpeed 
      if Equal AirGroundState 1
        GetAttribute var23 84 0
      endif
      CalcYChange var10 var6 var23 Gravity MaxFallSpeed FastFallSpeed 0
      Goto checkCanEdgeguard
      if var22 < 0
        var20 = -1
        Return
      endif
      if var11 <= var5
        var16 = 0
        Goto checkIfAirViable // normal
      endif
      
      var16 = STACK_POP
    elif Equal AirGroundState 1 && var11 <= var5
      // handle run for idle ground moves
      if Equal CurrAction 4 || Equal CurrAction 3 
if  Equal var20 0 || var20 >= 4 && var20 <= 2 || Equal var20 6 || Equal var20 9 || var20 >= -1 && var20 <= 7
          label crouchWait
            XGoto PerFrameChecks
            //= XReciever
            Seek crouchWait
            if CurrAction < 3 || CurrAction > 4
              var15 = -20
              Call MainHub
            endif
            ClearStick
            if Equal CurrAction 4
              Stick 0 -1
            else  
              Stick 1
            endif
          Return
        endif
      endif

      CallI ExecuteAttack
    endif
  endif

if var8 > 0
  var8 -= 2
  SeekNoCommit CHECK_HIT_LOOP
endif

var15 = 0

// MIXES UP AN APPROACH

  var22 = 0.003
  XGoto GetChrSpecific
  //= XReciever
var0 = var22
PredictOMov var22 14
if Equal var21 16.41 || YDistFloor > 35
elif CHANCE_MUL_LE PT_BAITCHANCE 0.02 || var22 > 0.25
  if var21 < 16.7 && var0 <= var7
    RESET_LTF_STACK_PTR
    var17 = LTF_STACK_READ // var4
    Abs var0
    var17 += var0
    var17 *= 1.5
    
    if !(XDistLE var17)
      PRINTLN
      LOGSTR_NL 1179603456 1128603648 1145131776 1212432640 1313031424
      LOGVAL_NL var17
      var17 = TopNX - OCenterX
      Abs var17
      LOGVAL_NL var17
      var21 = 10.5
      var20 = -1
      Return
    endif

    if var22 < 0.075
  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  var22 = STACK_POP
  if Equal var3 1
        if var7 <= 8
          Return
        endif
      elif var7 <= 13
        Return
      endif
    endif

  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
    if LevelValue >= 48 && Equal var22 0 && var21 < 16.7 && OAnimFrame > 8
      predictAverage var22 11
      if var22 < 15
        var22 = 15
      endif
      var22 *= 2.5
      if XDistLE var22
        LOGSTR_NL 1296652288 1431322368 0 0 0
        var15 = -10
        GetCommitPredictChance var23
        if var23 > 0.13 && Rnd < 0.15
          LOGSTR_NL 1179995136 1279807232 1344291072 1463900416 0
          var16 = 3 + 0.1
          CallI JumpScr
        endif
        if Rnd < 0.35 && CHANCE_MUL_LE PT_BAITCHANCE 0.04
          LOGSTR_NL 1179210240 1398013952 0 0 0
          if CHANCE_MUL_LE PT_BAITCHANCE 0.6
            var16 = 3
            if Equal AirGroundState 2 && AnimFrame > 6
              if YDistFloor <= 5
                var16 = 2
              elif YSpeed < 0.5 && NumJumps > 0
                LOGSTR_NL 1247104256 1344294656 1447383552 540082176 0
                var16 = 1 + 0.1
                var20 = -1
                CallI JumpScr
              endif
            elif XDistLE 20
              var16 = 2
            endif
            CallI Wavedash
          endif
          var16 = 2
          var21 = 16.4
          CallI DashScr
          Return
        endif

        GetCommitPredictChance var23
        LOGVAL var23
        if Equal AirGroundState 1 && CHANCE_MUL_LE PT_BAITCHANCE 0.04
          LOGSTR_NL 1128811264 541212928 1230241792 0 0
          PredictOMov var22 10
          if var23 >= 0.17 && var22 < 0.15
            LOGSTR_NL 1111574784 1411405568 1095324672 0 0
            if XDistLE 25
              var21 = 10.2
              Return
            else
              var16 = 2
              CallI Wavedash
            endif
          endif
        endif
        LOGVAL var23
        if var23 < 0.15 && Rnd < 0.4 || var23 > 0.25 && Rnd < 0.4
          var22 = OPos * 40
          GetYDistFloorOffset var22 var22 15 1
          if var22 > 0
            if CHANCE_MUL_LE PT_BRAVECHANCE 0.2
              LOGSTR_NL 1145131776 1210073344 1463900416 0 0
              var16 = 6
              var20 = -1
              CallI DashScr
            elif CHANCE_MUL_LE PT_AGGRESSION 0.2 && AnimFrame > 6
              LOGSTR_NL 1247104256 1344294656 1447383552 541480192 1280049152
              var21 = 16.4
              var16 = 1 + 0.1
              var20 = -1
              CallI JumpScr
            endif
            var21 = 10.2
          endif
          Return
        endif
      endif
    endif
  endif
endif
Return
label adjustPosIfInGround

  if OYDistFloor > 0
    var22 = OSCDBottom - var23
    if var22 > OYDistFloor
      var23 = OSCDBottom - OYDistFloor
    endif
  endif
Return
label checkCanEdgeguard

  var22 = TotalXSpeed * var8 * 1.2
  if Equal var16 1
    var22 *= 0.7
  endif
  var23 = OPos * 10
  var22 += var23
  GetYDistFloorOffset var22 var22 5 0
  var23 = var14 + 10
  GetYDistFloorAbsPos var23 var13 var23
  if Equal var22 -1 || Equal var23 -1 || Equal YDistFloor -1 || var21 >= 16.7 && Equal OYDistFloor -1
  var22 = 18
  XGoto GetChrSpecific
  //= XReciever
var23 = var22
    var23 *= -1
    if Equal AirGroundState 2
      var17 = OTopNY + OYDistBackEdge
      LOGVAL var17
      var22 = TopNY + var10
      var17 += var22
      // LOGSTR 1717856512 1936993280 544366848 1852269824 0
      // LOGVAL var17
      // LOGVAL var23
      // PRINTLN
      if var17 > var23
      else
        var22 = -1
        Return
      endif
    endif
  endif
  var22 = 1
Return
label checkIfAirViable
  if Equal CurrAction 10
  elif Equal AirGroundState 1

  var22 = 0.001
  XGoto GetChrSpecific
  //= XReciever
if !(True)
      if NoJumpPrevFrame
        Button X
      endif
    elif Equal var22 -1 && Equal Direction OPos
      var16 = -99
      ClearStick
      Stick -1
    elif !(Equal var22 -1) && !(Equal Direction OPos)
      var16 = -99
      ClearStick
      Stick -1
    elif NoJumpPrevFrame
      Button X
    endif
  elif !(Equal AirGroundState 3)
    CallI ExecuteAttack
  endif
Return
Return
