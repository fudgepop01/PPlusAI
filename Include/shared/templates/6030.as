#include <Definition_AIMain.h>
//TrueID=0x6030
id 0x6030

//Set Unknown
unk 0x0

//Strings

Cmd30

{PRE_SCRIPT_HOOKS}

SetTimeout 300
if Equal CurrAction hex(0x03) || Equal CurrAction hex(0x04) 
  Stick 1
endif

if CalledAs Jab123
  Goto _Jab123
elif CalledAs FTilt
  Goto _FTilt
elif CalledAs UTilt
  Goto _UTilt
elif CalledAs DTilt
  Goto _DTilt
elif CalledAs FSmash
  Goto _FSmash
elif CalledAs USmash
  Goto _USmash
elif CalledAs DSmash
  Goto _DSmash
elif CalledAs NSpecial
  Goto _NSpecial
elif CalledAs SSpecial
  Goto _SSpecial
elif CalledAs USpecial
  Goto _USpecial
elif CalledAs DSpecial
  Goto _DSpecial
elif CalledAs Grab
  Goto _Grab
elif CalledAs DashAttack
  Goto _DashAttack
else
  Call AIHub
endif

if Equal movePart 0
  {AT_CONDITIONS}
endif

if !(Equal AirGroundState 1)
  if lastAttack <= valDSmash || lastAttack >= valGrab
    Call AIHub
  endif
endif

ClearStick

{SPECIAL_PERFORMERS}

if CalledAs Jab123
  Button A
elif CalledAs FTilt
  Button A
  Stick 0.7 0
elif CalledAs UTilt
  Button A
  Stick 0 0.7
elif CalledAs DTilt
  Button A
  Stick 0 (-0.7)
elif CalledAs FSmash
  Button A
  AbsStick OPos 0
elif CalledAs USmash
  Button A
  Stick 0 1
elif CalledAs DSmash
  Button A
  Stick 0 (-1)
elif CalledAs NSpecial
  Button B
elif CalledAs SSpecial
  Button B
  AbsStick OPos 0
elif CalledAs USpecial
  Button B
  Stick 0 1
elif CalledAs DSpecial
  Button B
  Stick 0 (-1)
elif CalledAs Grab
  Button R|A
elif CalledAs DashAttack
  label
  if Equal CurrAction hex(0x04)
    Button A
    Stick 1
    Seek
  elif Equal CurrAction hex(0x03) && AnimFrame > 3
    Button A
    Stick 1
    Seek
  elif CurrAction <= hex(0x09)
    Stick 1
  else
    Call AIHub
  endif
  Return
endif
label _executed
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

{PRE_HOOKS}

if CalledAs Jab123
  Goto _Jab123_impl
elif CalledAs FTilt
  Goto _FTilt_impl
elif CalledAs UTilt
  Goto _UTilt_impl
elif CalledAs DTilt
  Goto _DTilt_impl
elif CalledAs FSmash
  Goto _FSmash_impl
elif CalledAs USmash
  Goto _USmash_impl
elif CalledAs DSmash
  Goto _DSmash_impl
elif CalledAs NSpecial
  Goto _NSpecial_impl
elif CalledAs SSpecial
  Goto _SSpecial_impl
elif CalledAs USpecial
  Goto _USpecial_impl
elif CalledAs DSpecial
  Goto _DSpecial_impl
elif CalledAs Grab
  Goto _Grab_impl
elif CalledAs DashAttack
  Goto _DashAttack_impl
endif

{POST_HOOKS}

Seek _begin
Return

label _Jab123_impl
  {Jab}
Return

label _FTilt_impl
  {FTilt}
Return

label _UTilt_impl
  {UTilt}
Return

label _DTilt_impl
  {DTilt}
Return

label _FSmash_impl
  {FSmash}
Return

label _USmash_impl
  {USmash}
Return

label _DSmash_impl
  {DSmash}
Return

label _NSpecial_impl
  {NSpecial}
Return

label _SSpecial_impl
  {SSpecial}
Return

label _USpecial_impl
  {USpecial}
Return

label _DSpecial_impl
  {DSpecial}
Return

label _Grab_impl
  {Grab}
Return

label _DashAttack_impl
  {DashAttack}
Return

label CTD
var1 = 0
CALC_TARGET_DISTANCES(var5, var6, var7, var8, move_lastHitFrame - frameCounter)
Return

label checks
PUT_ME_AT_TOP
if lastAttack <= valDSmash || lastAttack >= valGrab
  {AGS_CHECK}
endif
Return

label _Jab123
  $generateDefinedVariants(Jab123)
Return

label _FTilt
  $generateDefinedVariants(FTilt)
Return

label _UTilt
  $generateDefinedVariants(UTilt)
Return

label _DTilt
  $generateDefinedVariants(DTilt)
Return

label _FSmash
  $generateDefinedVariants(FSmash)
Return

label _USmash
  $generateDefinedVariants(USmash)
Return

label _DSmash
  $generateDefinedVariants(DSmash)
Return

label _NSpecial
  $generateDefinedVariants(NSpecial)
Return

label _SSpecial
  $generateDefinedVariants(SSpecial)
Return

label _USpecial
  $generateDefinedVariants(USpecial)
Return

label _DSpecial
  $generateDefinedVariants(DSpecial)
Return

label _Grab
  $generateDefinedVariants(Grab)
Return

label _DashAttack
  $generateDefinedVariants(DashAttack)
Return
Return