#include <Definition_AIMain.h>
id 0x850D
unk 0x0

//= XReciever

RESET_LTF_STACK_PTR

// $setLastAttack(nspecialair)
// currGoal = cg_attack_wall

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

if Equal var21 16.3
  var22 = 0.003
  XGoto GetChrSpecific
  //= XReciever
  GetAttribute var23 40 1
  var17 = var6
  var17 -= var22
  var17 *= var23
  if XDistLE var17
    var21 = 16.4
    XGoto CalcAttackGoal
  endif
endif

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
if OCurrAction >= 78 && OCurrAction <= 82 && var17 < 26
  Return
elif OCurrAction >= 96 && OCurrAction <= 97 && var17 < 19
  Return
elif OCurrAction >= 31 && OCurrAction <= 32 && var17 < 19 // roll
  Return
elif Equal OCurrAction 30 || Equal OCurrAction 142 || Equal OCurrAction 144 || Equal OCurrAction 145
  if var17 < 15 // spotdodge
    Return
  endif
elif Equal OCurrAction 33 && var17 < 29 // airdodge
  Return
elif Equal OCurrSubaction 217 || Equal OCurrSubaction 48
  if var17 < 33 // roll from ledge
    Return
  endif
elif Equal OCurrSubaction 222 || Equal OCurrSubaction 221
  if var17 < 61 // roll from ledge SLOW
    Return
  endif
endif

// 3. setup ranges
var0 = var10 + var0 
if var0 < 0
  var16 = 1
  var0 *= -1
endif
var22 = OWidth * 0.5
// move_centerX += immediateTempVar
// move_xRange += immediateTempVar
// move_centerX -= 2

// move_yRange -= 2
var1 = var9 - var1
var1 *= -1
var22 = OHurtboxSize * 0.5
// move_centerY += immediateTempVar
// move_yRange += immediateTempVar

// move_centerY += HurtboxSize

var18 = 0
var22 = HurtboxSize * 0.9
if var1 > var22 && OTopNY < TopNY
  var18 = 1
  LOGSTR_NL 1397247744 1431061504 541204480 1178684416 1279872512
  LOGVAL_NL var22
  LOGVAL_NL var1
endif

// move_centerY += 2
var10 *= 2
var9 *= 2
// move_xRange -= 2
// move_yRange -= 2

  var22 = 23
  XGoto GetChrSpecific
  //= XReciever
var2 = var22

// grabs an estimate of the potential move xRange to hit
// $ifAerialAttackNotSpecial()
//   globTempVar = move_hitFrame + move_duration * 0.25
//   globTempVar *= 0.15
//   if Equal AirGroundState 2
//     // get max possilbe air speed
//     GetAttribute immediateTempVar attr_airMobilityA 0
//     anotherTempVar = globTempVar * immediateTempVar
//     globTempVar = anotherTempVar
//     // max possible speed
//     anotherTempVar += XSpeed
//     Abs anotherTempVar
//     // min possible speed
//     globTempVar -= XSpeed
//     Abs globTempVar
//     // clamp by term vel
//     GetAttribute immediateTempVar attr_airXTermVel 0
//     if anotherTempVar > immediateTempVar
//       anotherTempVar = immediateTempVar
//     endif
//     if globTempVar > immediateTempVar
//       globTempVar = immediateTempVar
//     endif
//     // positive offset
//     immediateTempVar = move_hitFrame + move_duration * 0.25
//     immediateTempVar *= 0.15
//     anotherTempVar *= immediateTempVar
//     move_xRange += anotherTempVar
//     anotherTempVar *= Direction * 2
//     move_centerX -= anotherTempVar
//     // negative offset
//     globTempVar *= immediateTempVar
//     move_xRange += globTempVar
//     globTempVar *= Direction * 2
//     move_centerX += globTempVar
//   elif !(Equal CurrAction hex(0xA))
//     GetAttribute immediateTempVar attr_jumpXInitVel 0
//     immediateTempVar *= globTempVar
//     move_xRange += immediateTempVar
//     move_yRange += OHurtboxSize
//   endif
// endif

// if Equal OCurrAction hex(0x4D)
//   move_yRange += 3
//   move_yOffset += 3
// endif

// $ifAerialAttack()
// else
//   immediateTempVar = move_yRange * 2 - move_yOffset
//   if immediateTempVar <= HurtboxSize && OYDistFloor > HurtboxSize && OYSpeed > 0
//     lastAttack = -1
//     Return
//   endif
//   immediateTempVar = move_xOffset * 0.25 - move_xRange * 0.8
//   if XDistLE immediateTempVar
//     lastAttack = -1
//     Return
//   endif
// endif

// anotherTempVar = TopNX + move_centerX
// immediateTempVar = OCenterX - anotherTempVar
// anotherTempVar = OWidth * 0.5
// Abs immediateTempVar
// if immediateTempVar > anotherTempVar
//   immediateTempVar = anotherTempVar
// endif
// move_centerX += immediateTempVar

if  var20 >= 11 && var20 <= 15
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

// immediateTempVar = OHurtboxSize * 0.5
// move_yRange += immediateTempVar
// immediateTempVar *= 0.5
// move_centerY -= immediateTempVar

// LOGSTR str("OHBS")
// LOGVAL OHurtboxSize
// PRINTLN

// immediateTempVar = OWidth
// immediateTempVar *= 0.3
// move_xRange += immediateTempVar
// move_centerX += immediateTempVar
// immediateTempVar *= 0.5

// LOGVAL_NL move_xRange
// immediateTempVar = 10
// // if currGoal >= cg_edgeguard
// //   immediateTempVar = (move_duration + move_hitFrame) * 0.15
// // endif
// if Equal currGoal cg_attack_inCombo
//   move_yRange += immediateTempVar
//   // move_yOffset += immediateTempVar
//   move_xRange += immediateTempVar
//   // move_xOffset -= immediateTempVar
// endif 

  var22 = 0.003
  XGoto GetChrSpecific
  //= XReciever
if var22 < 5 && var21 < 16.7 && Equal DEBUG_VALUE 0 
  var17 = OTopNY + OHurtboxSize
  var23 = TopNY - var1
if  Equal var20 12 || Equal var20 14 || var20 >= 21 && var20 <= 28
  elif var17 < var23
    var20 = -1
    Return  
  endif

  if !(Equal var21 16.3) && !(Equal var21 16.5)
    var10 += var2
    var2 *= 0.5
    var0 += var2
  endif

  // GetAttribute immediateTempVar attr_dashInitVel 1
  // PredictOMov anotherTempVar mov_attack
  // anotherTempVar *= immediateTempVar
  // move_xRange += anotherTempVar

  // immediateTempVar *= anotherTempVar
  // immediateTempVar *= 2

  if Equal var21 16.3
    predictAverage var22 10
    var22 *= 0.75
    var10 += var22
    var10 += Width
  endif
endif
// LOGVAL_NL move_xRange

if Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20
  if Equal OCurrAction 74 || Equal OCurrAction 77 || Equal OCurrAction 83 || Equal OCurrAction 84
    Return
  endif
  var15 = 1
endif

// if OCurrAction >= hex(0x44) && OCurrAction <= hex(0x49) || Equal OCurrAction hex(0x42)
//   immediateTempVar = move_yRange - move_yOffset
//   if OYDistFloor < immediateTempVar && OYSpeed < 0 && OYDistFloor > 1
//     Return
//   endif
// endif

// CLEAR VARIABLES:
// 9, 10, 11, 12

// $tempVar(dirX, immediateTempVar)
// GET_CHAR_TRAIT(dirX, chr_get_moveDir)


// adjust difficulty
if LevelValue <= 21
  var22 = Rnd * 80 - 40
  var7 += var22
  var22 = Rnd * 80 - 40
  var0 += var22
  var22 = Rnd * 80 - 40
  var1 += var22
  var22 = Rnd * 30
  var10 += var22
  var22 = Rnd * 30
  var9 += var22
elif LevelValue <= 60
  var22 = Rnd * 26 - 13
  var0 += var22
  var22 = Rnd * 26 - 13
  var1 += var22
  var22 = Rnd * 10
  var10 += var22
  var22 = Rnd * 10
  var9 += var22
endif

var7 += 1
var8 = var15

// anotherTempVar = OHurtboxSize * 0.25
// move_yRange += anotherTempVar

STACK_PUSH var10 1
STACK_PUSH var9 1
STACK_PUSH var0 1

var22 = 0
if  Equal var20 12 || Equal var20 14 || var20 >= 21 && var20 <= 28
  if OTopNY >= TopNY
    if Equal AirGroundState 1 || YDistFloor < 2 && YDistFloor > 0
      // LOGSTR_NL str("AAT AGS1")
      GetAttribute var22 84 0
      // globTempVar = TopNY + immediateTempVar //- move_centerY
      var14 = TopNY + 14.59 - 1
      // anotherTempVar = move_yRange * 0.5
      // goalY += anotherTempVar
      EstOYCoord var23 var7
      if var14 < var23
        // LOGSTR_NL str("BIGJUMP")
        GetAttribute var22 72 0
        var14 = TopNY + 37.35 - 1
      endif
    elif Equal AirGroundState 2 && TotalYSpeed < 0.7 && NumJumps > 0
      // LOGSTR_NL str("AAT ELSE")
      GetAttribute var22 72 0
      GetAttribute var23 88 0
      var22 *= var23
      EstOYCoord var17 var7
      var23 = TopNY + 37.35 //- var1
      var17 -= 18.675
      if var23 > var17 && NumJumps > 0 && OTopNY > TopNY
        var14 = var23 + 4
        // goalY += move_centerY
      elif var21 >= 16.7 && YDistBackEdge > 29.35
        var14 = var23 + 4
        // goalY += move_centerY
        var13 = TopNX
      endif
      var22 = TotalYSpeed
    elif Equal AirGroundState 2
      var22 = TotalYSpeed
    endif
  endif
endif
STACK_PUSH var22 1

// anotherTempVar = TopNY + move_centerY
// immediateTempVar = OCenterY - anotherTempVar
// if immediateTempVar > OHurtboxSize
//   immediateTempVar = OHurtboxSize
// elif immediateTempVar < 0
//   immediateTempVar = 0
// endif
// immediateTempVar *= 0.5

// move_centerY += immediateTempVar
STACK_PUSH var1 1

// move_yOffset *= -1

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
// LOGSTR str("ef; c; hf")
// LOGVAL estFrame
// LOGVAL counter
// LOGVAL move_hitFrame
// PRINTLN

// 1. where will attacker be at end of frame

  var22 = LTF_STACK_READ * -1 // var0
  var17 = 0
if  var20 >= 11 && var20 <= 15
    var17 = 1
    var22 *= OPos
  endif
if  Equal var20 12 || Equal var20 14 || var20 >= 21 && var20 <= 28
    if Equal var17 0
      var22 *= Direction
    endif
  endif
  var23 = TopNX
if Equal var20 28
elif Equal var20 12
elif !(True)
  elif True
  // immediateTempVar = move_centerX
if  Equal var20 12 || Equal var20 14 || var20 >= 21 && var20 <= 28
    var23 = TotalXSpeed * var2
    if Equal AirGroundState 1
      var23 = GetJumpLength * var2
    elif XDistLE var22
      GetAttribute var23 132 0
      var23 *= var2
    var4 += var23
    endif
  else
    var23 = 0
  endif
  var23 += TopNX
  endif
  var23 -= var22 // var0
  STACK_PUSH var23 0

  var23 = TopNY
  var22 = LTF_STACK_READ // estYVelocity
if Equal var20 28
elif Equal var20 11
elif Equal var20 12
elif !(True)
  elif True
if  Equal var20 12 || Equal var20 14 || var20 >= 21 && var20 <= 28
    // LOGSTR str("yvel; ychange")
    // LOGVAL immediateTempVar
    CalcYChange var23 var2 var22 Gravity MaxFallSpeed FastFallSpeed 0
    // LOGVAL estYPos
    // PRINTLN
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
  endif
  // LOGSTR str("ypos bef; aft")
  // LOGVAL estYPos
  var23 += LTF_STACK_READ // var1
  // LOGVAL estYPos
  // PRINTLN
  STACK_PUSH var23 0

  // NOTE visualization SELF
  var17 = STACK_POP // YPos
  var22 = STACK_POP // XPos
  // LOGSTR_NL str("POPPED")
  // LOGVAL_NL immediateTempVar
  var23 = var2 * -5 + 255
  DrawDebugRectOutline var22 var17 var4 var5 200 255 0 var23
  STACK_PUSH var22 0
  STACK_PUSH var17 0


// $tempVar(trueOHBSize,move_xRange)
// trueOHBSize = 0
// if Equal OAirGroundState 2
//   $ifAerialAttack()
//     trueOHBSize = OHurtboxSize + HurtboxSize
//     trueOHBSize *= 0.5
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
        // immediateTempVar = OHurtboxSize
        // estOYPos += immediateTempVar
      else
        EstOYCoord var23 var23
        var22 = OHurtboxSize * 0.5
        var23 += var22
      endif
    else
      var23 = OCenterY
    endif
    // if OYDistBackEdge > 5
    //   if estOYPos < 0
    //     estOYPos = 0
    //   endif
    //   tempYRange += estOYPos
    // endif
    Goto adjustPosIfInGround
    // estOYPos += trueOHBSize
    // estOYPos += OHurtboxSize
    STACK_PUSH var23 0
  elif True


    var22 = OCenterX
    var23 = OCenterY
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
  OXGoto GetChrSpecific
  if Equal var22 -123456789
    STACK_TOSS 3
    EstOXCoord var22 var17
    EstOYCoord var23 var17
  endif
  var6 = STACK_POP
  var5 = STACK_POP
  var4 = STACK_POP
  var3 = STACK_POP
  var2 = STACK_POP
  var1 = STACK_POP
  var0 = STACK_POP

    STACK_PUSH var22 0
    Goto adjustPosIfInGround
    // estOYPos += OHurtboxSize
    STACK_PUSH var23 0
  endif

  // NOTE visualization OTHER
  var17 = STACK_POP // YPos
  var22 = STACK_POP // XPos
  var23 = var2 * -5 + 255
  DrawDebugRectOutline var22 var17 OWidth OHurtboxSize 255 0 255 var23
  // LOGSTR str("est O yPos")
  // LOGVAL estFrame
  // LOGVAL globTempVar
  // PRINTLN
  STACK_PUSH var22 0
  STACK_PUSH var17 0

// stack: 
// estOYPos, estOXPos, estYPos, estXPos, goalY, goalX, move_xRange, move_yRange

// 3. apply positional offset to defender position
  // FIXME come up with a better strategy for setAttackGoal
  // $tempVar(estOYPosOffs, anotherTempVar)
  // estOYPosOffs = OTopNY - goalY
  // estOYPosOffs += STACK_POP // estOYPos
  // $tempVar(estOXPosOffs, immediateTempVar)
  // estOXPosOffs = OCenterX - goalX
  // estOXPosOffs += STACK_POP // estOXPos
  // STACK_PUSH estOXPosOffs 0
  // STACK_PUSH estOYPosOffs 0

// check to see if move will hit if swung now
  var9 = STACK_POP // var9

  var10 = STACK_POP // estOXPos

  if Equal OCurrAction 69 || Equal OCurrAction 73
    GetYDistFloorAbsPos var23 var10 var9
    if var23 < 3 && var23 > 0
      var9 = TBoundary * 2
    endif
  endif

  // LOGSTR str("est oyp")
  // LOGVAL estOYPos
  // anotherTempVar = STACK_POP
  // LOGSTR str("est y pos")
  // LOGVAL anotherTempVar
  // yDiff = estOYPos - anotherTempVar // estYPos
  // Abs yDiff
  // PRINTLN
  var11 = var9 - STACK_POP // var23
  Abs var11

  // tempXRange *= 1
  // tempYRange *= 1

  // LOGSTR_NL str("xR; yR; yD")
  // LOGVAL tempXRange
  // LOGVAL tempYRange
  // LOGVAL yDiff
  // PRINTLN

  var23 = OWidth * 0.5
  var4 += var23
  var23 = OHurtboxSize * 0.5
  var5 += var23
  var4 *= 0.5
  var5 *= 0.5
  // handle dash for idle ground moves:
if  var20 >= 0 && var20 <= 2 || var20 >= 5 && var20 <= 8 || var20 >= 10 && var20 <= 11 || Equal var20 13
    var23 = TopNX + 27 * OPos
    var22 = var10 - var23
    Abs var22
    if var22 <= var4 && var11 <= var5 && var21 < 16.7 && LevelValue >= 60
      if Equal CurrAction 3 || Equal CurrAction 8 || Equal CurrAction 9
        if AnimFrame < 1 || Equal CurrAction 8 || Equal CurrAction 9 || !(Equal Direction OPos)
          var16 = 5
          var15 = -20
          CallI Wavedash 
        endif
      endif
    endif

    if Equal CurrAction 3 && LevelValue >= 31
      // STACK_TOSS 1 // ignore estXPos

      var23 = TopNX + CharXSpeed * (AnimFrame - 8)
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
  // LOGSTR str("xD")
  // LOGVAL xDiff
  // PRINTLN
  // tempYRange *= 0.5  
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
      // LOGSTR str("y diff")
      // LOGVAL yDiff
      if !(Equal OYSpeed 0) || !(Equal OAirGroundState 2)
if Equal var20 28
elif Equal var20 11
elif Equal var20 12
elif !(True)
  elif True
  if var21 < 16.7
    var23 = LevelValue + 2
    var22 = Rnd * var23
    if LevelValue >= 31 && var22 > 1
      // accounts for delay in fastfall
  var17 = var2 - 4
  if Equal CurrSubaction JumpSquat || Equal AirGroundState 1 || Equal CurrAction 11 && Equal AnimFrame 0
    GetAttribute var22 940 0
    var17 -= var22
    GetAttribute var22 84 0
  else
    var22 = TotalYSpeed
  endif
  CalcYChange var10 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
      if Equal var18 1 && var10 > 0
      else
        var22 = TopNY + var10 - var1
        // VIS FASTFALL
        // tempYRange *= 0.5
        // tempXRange *= 0.5
        DrawDebugRectOutline CenterX var22 var4 var5 255 0 255 221
        DrawDebugRectOutline OCenterX var9 var4 var5 255 255 255 221
        // tempYRange *= 2
        // tempXRange *= 2
        var11 = var9 - var22
        Abs var11
        // LOGSTR str("ff stuff")
        // LOGVAL estFrame
        // LOGVAL yDiff
        // LOGVAL tempYRange
        // LOGVAL move_centerY
        // PRINTLN
        if var11 <= var5
  var17 = var7 + var15 - var8
  if Equal CurrSubaction JumpSquat || Equal AirGroundState 1 || Equal CurrAction 11 && Equal AnimFrame 0
    GetAttribute var22 940 0
    var17 -= var22
    GetAttribute var22 84 0
  else
    var22 = TotalYSpeed
  endif
  CalcYChange var10 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
          var16 = 1
          var10 = YDistFloor + 1
if Equal var20 28
elif Equal var20 11
elif Equal var20 12
elif !(True)
          elif True  
            CalcYChange var10 var2 YSpeed Gravity MaxFallSpeed FastFallSpeed 1
          endif
          var22 = var10 + YDistFloor
          if var22 > 0 || YDistFloor < 0
            CalcYChange var10 var6 var23 Gravity MaxFallSpeed FastFallSpeed 1
            Goto checkCanEdgeguard
            if var22 > 0
              Goto checkIfAirViable // fastfall
            endif
          endif
        endif
      endif
    endif
  endif
  endif
      endif
      // LOGSTR str("ff")
      // LOGVAL yDiff
      // PRINTLN
      var11 = STACK_POP // original var11
      var23 = YSpeed 
      if Equal AirGroundState 1
        GetAttribute var23 84 0
      endif
      var10 = YDistFloor + 1
if Equal var20 28
elif Equal var20 11
elif Equal var20 12
elif !(True)
      elif True
        CalcYChange var10 var2 var23 Gravity MaxFallSpeed FastFallSpeed 0
      endif
      var22 = var10 + YDistFloor
      // LOGSTR str("YDF; ATV")
      // LOGVAL YDistFloor
      // LOGVAL immediateTempVar
      // PRINTLN
      if var10 > 0 && Equal var18 1
      elif var22 > 0 || YDistFloor < 0
        CalcYChange var10 var6 var23 Gravity MaxFallSpeed FastFallSpeed 0
        Goto checkCanEdgeguard
        if var22 < 0
          if NumJumps < 1
            var20 = -1
          endif
          Return
        endif
        // LOGSTR str("YDiff; YRange")
        // LOGVAL yDiff
        // LOGVAL tempYRange
        // PRINTLN
        if var11 <= var5
          var16 = 0
          Goto checkIfAirViable // normal
        endif
      endif
      
      var16 = STACK_POP
    elif Equal AirGroundState 1 && var11 <= var5
      // handle run for idle ground moves
      if Equal CurrAction 4 || Equal CurrAction 3 
if  var20 >= 0 && var20 <= 2 || var20 >= 5 && var20 <= 8 || var20 >= 10 && var20 <= 11 || Equal var20 13
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

// #let OEndlag = var0
// GET_CHAR_TRAIT(OEndlag, chr_get_OEndlag)
// PredictOMov immediateTempVar mov_attack

// anotherTempVar = LevelValue + 2
// immediateTempVar = Rnd * anotherTempVar

// if YDistFloor > 35 || LevelValue < LV4 || immediateTempVar < 2.5
// elif CHANCE_MUL_LE PT_BAITCHANCE 0.02 || immediateTempVar > 0.25
//   if currGoal < cg_attack_reversal && OEndlag <= move_hitFrame
//     RESET_LTF_STACK_PTR
//     globTempVar = LTF_STACK_READ // tempXRange
//     Abs move_centerX
//     globTempVar += move_centerX
//     globTempVar *= 2.5
    
//     if !(XDistLE globTempVar)
//       PRINTLN
//       // LOGSTR_NL str("FORCE DASHDANCE")
//       // LOGVAL_NL globTempVar
//       globTempVar = TopNX - OCenterX
//       Abs globTempVar
//       LOGVAL_NL globTempVar
//       // currGoal = cg_bait_dashdance
//       scriptVariant = sv_dash_away_defense
//       Call DashScr
//       // lastAttack = -1
//       Return
//     endif

//     // if immediateTempVar < 0.075
//     //   IF_AERIAL_ATTACK(var3)
//     //     if move_hitFrame <= 8
//     //       Return
//     //     endif
//     //   elif move_hitFrame <= 13
//     //     Return
//     //   endif
//     // endif

//     GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
//     if LevelValue >= LV6 && Equal immediateTempVar 0 && currGoal < cg_edgeguard && OAnimFrame > 8
//       predictAverage immediateTempVar man_OXSwingDist
//       if immediateTempVar < 15
//         immediateTempVar = 15
//       endif
//       immediateTempVar *= 2.5
//       if XDistLE immediateTempVar
//         LOGSTR_NL str("MIXUP?")
//         skipMainInit = mainInitSkip
//         GetCommitPredictChance anotherTempVar
//         if anotherTempVar > 0.13 && Rnd < 0.15
//           LOGSTR_NL str("FULLHOP AWAY")
//           scriptVariant = sv_jump_away + svp_jump_fullhop
//           CallI JumpScr
//         endif
//         if Rnd < 0.35 && CHANCE_MUL_LE PT_BAITCHANCE 0.04
//           LOGSTR_NL str("FIRST")
//           if CHANCE_MUL_LE PT_BAITCHANCE 0.6
//             scriptVariant = sv_wavedash_neutral
//             if Equal AirGroundState 2 && AnimFrame > 6
//               if YDistFloor <= 5
//                 scriptVariant = sv_wavedash_out
//               elif YSpeed < 0.5 && NumJumps > 0
//                 LOGSTR_NL str("JUMP OVER 1")
//                 scriptVariant = sv_jump_over + svp_jump_fullhop
//                 lastAttack = -1
//                 CallI JumpScr
//               endif
//             elif XDistLE 20
//               scriptVariant = sv_wavedash_out
//             endif
//             CallI Wavedash
//           endif
//           scriptVariant = sv_dash_away
//           currGoal = cg_attack_reversal
//           CallI DashScr
//           Return
//         endif

//         GetCommitPredictChance anotherTempVar
//         LOGVAL anotherTempVar
//         if Equal AirGroundState 1 && CHANCE_MUL_LE PT_BAITCHANCE 0.04
//           LOGSTR_NL str("CHK BAIT")
//           PredictOMov immediateTempVar mov_shield
//           if anotherTempVar >= 0.15 && immediateTempVar < 0.10
//             LOGSTR_NL str("BAIT WAIT")
//             if XDistLE 25
//               currGoal = cg_bait_wait
//               Return
//             else
//               scriptVariant = sv_wavedash_out
//               CallI Wavedash
//             endif
//           endif
//         endif
//         LOGVAL anotherTempVar
//         if anotherTempVar < 0.15 && Rnd < 0.4 || anotherTempVar > 0.25 && Rnd < 0.4
//           immediateTempVar = OPos * 40
//           GetYDistFloorOffset immediateTempVar immediateTempVar 15 1
//           if immediateTempVar > 0
//             // if CHANCE_MUL_LE PT_BRAVECHANCE 0.2
//             //   LOGSTR_NL str("DASH AWAY")
//             //   scriptVariant = sv_dash_outOfRange
//             //   // lastAttack = -1
//             //   CallI DashScr
//             // el
//             if CHANCE_MUL_LE PT_AGGRESSION 0.2 && AnimFrame > 6
//               LOGSTR_NL str("JUMP OVER FULL")
//               currGoal = cg_attack_shieldPunish
//               scriptVariant = sv_jump_over + svp_jump_fullhop
//               // lastAttack = -1
//               CallI JumpScr
//             endif
//             // currGoal = cg_bait_shield
//           endif
//           Return
//         endif
//       endif
//     endif
//   endif
// endif
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
    var23 -= HurtboxSize
    var23 *= -1
    if Equal AirGroundState 2
      var17 = OTopNY + OYDistBackEdge
      // LOGVAL yChange
      var22 = TopNY + var10
      var17 += var22
      // LOGSTR str("fdist, range")
      // LOGVAL globTempVar
      // LOGVAL anotherTempVar
      // DrawDebugRectOutline TopNX globTempVar 50 2 color(0xFF0000DD)
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
if  var20 >= 11 && var20 <= 15
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
