#include <Definition_AIMain.h>
//TrueID=0x6040
id 0x6040

//Set Unknown
unk 0x0

//Strings

Cmd30

{PRE_SCRIPT_HOOKS}

SetTimeout 300

if CalledAs NAir
  Goto _NAir
elif CalledAs FAir
  Goto _FAir
elif CalledAs BAir
  Goto _BAir
elif CalledAs UAir
  Goto _UAir
elif CalledAs DAir
  Goto _DAir
elif CalledAs NSpecialAir
  Goto _NSpecialAir
elif CalledAs SSpecialAir
  Goto _SSpecialAir
elif CalledAs USpecialAir
  Goto _USpecialAir
elif CalledAs DSpecialAir
  Goto _DSpecialAir
else
  CallI AIHub
endif

if Equal movePart 0
  {AT_CONDITIONS}
endif

if !(Equal AirGroundState 2)
  Call AIHub
endif

ClearStick

{SPECIAL_PERFORMERS}

if CalledAs NAir
  Button A
elif CalledAs FAir
  Button A
  Stick 1 0
elif CalledAs BAir
  Button A
  Stick -1
elif CalledAs UAir
  Button A
  Stick 0 0.7
elif CalledAs DAir
  Button A
  Stick 0 (-0.7)
elif CalledAs NSpecialAir
  Button B
elif CalledAs SSpecialAir
  Button B
  AbsStick OPos 0
elif CalledAs USpecialAir
  Button B
  Stick 0 0.7
elif CalledAs DSpecialAir
  Button B
  Stick 0 (-0.7)
endif
label
Seek 
Return
label
if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x21)
  trackOAction man_approach op_defend
elif OCurrAction >= hex(0x34) && OCurrAction <= hex(0x38)
  trackOAction man_approach op_grab
elif OAttacking && Rnd < 0.7
  trackOAction man_approach op_attack
elif Rnd < 0.8
  trackOAction man_approach op_null
endif

#let frameCounter = var4
frameCounter = -1
label _begin
Goto checks
Goto CTD
Goto movement

{PRE_HOOKS}

if CalledAs NAir
  Goto _NAir_impl
elif CalledAs FAir
  Goto _FAir_impl
elif CalledAs BAir
  Goto _BAir_impl
elif CalledAs UAir
  Goto _UAir_impl
elif CalledAs DAir
  Goto _DAir_impl
elif CalledAs NSpecialAir
  Goto _NSpecialAir_impl
elif CalledAs SSpecialAir
  Goto _SSpecialAir_impl
elif CalledAs USpecialAir
  Goto _USpecialAir_impl
elif CalledAs DSpecialAir
  Goto _DSpecialAir_impl
endif

{POST_HOOKS}

Seek _begin
Return

label _NAir_impl
  {NAir}
Return

label _FAir_impl
  {FAir}
Return

label _BAir_impl
  {BAir}
Return

label _UAir_impl
  {UAir}
Return

label _DAir_impl
  {DAir}
Return

label _NSpecialAir_impl
  {NSpecialAir}
Return

label _SSpecialAir_impl
  {SSpecialAir}
Return

label _USpecialAir_impl
  {USpecialAir}
Return

label _DSpecialAir_impl
  {DSpecialAir}
Return

label CTD
  var1 = 0
  CALC_TARGET_DISTANCES(var5, var6, var7, var8, move_lastHitFrame - frameCounter)
Return

label checks
  PUT_ME_AT_TOP
  if !(Equal AirGroundState 2)
    CallI AIHub
  endif
Return

label movement
  ClearStick

  #let isGoingOffstage = var0
  if Equal shouldFastFall 1
    isGoingOffstage = 10
  endif
  GOING_OFFSTAGE(isGoingOffstage, var1, move_IASA - frameCounter - isGoingOffstage)

  if YSpeed <= 0 && Equal IsOnStage 1 && Equal shouldFastFall 1 && Equal isGoingOffstage 0
    LOGSTR str("should_FF")
    Stick 0 (-1)
  else
    Stick 0 0.5
  endif

  if !(Equal isGoingOffstage 0) && !(Equal isGoingOffstage 2)
    AbsStick isGoingOffstage
  elif !(Equal approachType at_undershoot)
    if targetXDistance < 0
      AbsStick -1 0
    else
      AbsStick 1 0
    endif
  endif

  Abs targetXDistance
  Abs targetYDistance
  if YSpeed < 0 && YDistBackEdge > -10 && YDistBackEdge <= 0 && Equal IsOnStage 1 && frameCounter > move_lastHitFrame
    globTempVar = move_xRange * 2
    if targetXDistance <= globTempVar && Equal HitboxConnected 0
      Return
    elif !(Equal isGoingOffstage 0)
      Return
    endif
    var19 = 2
    var18 = 1
    CallI Landing
  endif
Return

label _NAir
  $generateDefinedVariants(NAir)
Return

label _FAir
  $generateDefinedVariants(FAir)
Return

label _BAir
  $generateDefinedVariants(BAir)
Return

label _UAir
  $generateDefinedVariants(UAir)
Return

label _DAir
  $generateDefinedVariants(DAir)
Return

label _NSpecialAir
  $generateDefinedVariants(NSpecialAir)
Return

label _SSpecialAir
  $generateDefinedVariants(SSpecialAir)
Return

label _USpecialAir
  $generateDefinedVariants(USpecialAir)
Return

label _DSpecialAir
  $generateDefinedVariants(DSpecialAir)
Return
Return