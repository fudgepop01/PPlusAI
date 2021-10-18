#include <Definition_AIMain.h>
id 0x8204
unk 0x0

XReciever
LOGSTR str("START SHIELD")
label setup
#let OHasHitShield = var0
#let OEndLag = var1
#let timer = var2
#let patience = var3

OHasHitShield = 0
timer = 0
patience = Rnd * 100 + 50
label shield
currGoal = cg_defend

XGoto PerFrameChecks
XReciever
Seek shield

timer += 1
Button R

OEndLag = -1
if Equal OCurrAction hex(0x33) && OYSpeed < 0 && OYDistBackEdge > -15
  if Equal OCurrSubaction AttackAirN
    GetAttribute globTempVar attr_nairLandingLag 1
  elif Equal OCurrSubaction AttackAirF
    GetAttribute globTempVar attr_fairLandingLag 1
  elif Equal OCurrSubaction AttackAirB
    GetAttribute globTempVar attr_bairLandingLag 1
  elif Equal OCurrSubaction AttackAirHi
    GetAttribute globTempVar attr_uairLandingLag 1
  elif Equal OCurrSubaction AttackAirLw
    GetAttribute globTempVar attr_dairLandingLag 1
  endif
  globTempVar -= OYDistBackEdge
  globTempVar *= 0.5
  OEndLag = globTempVar
elif OAttacking 
  OEndLag = OEndFrame - OAnimFrame
endif

if Equal CurrAction hex(0x1D)
  MOD globTempVar timer 14
  if Equal globTempVar 0
    if OEndLag >= 35
      AbsStick OPos
    else
      immediateTempVar = OPos * -1
      AbsStick immediateTempVar
    endif
  endif 
  OHasHitShield += 1
endif

MOD globTempVar timer 4
if Equal CurrAction hex(0x1B) && Equal globTempVar 0 
  GetShieldRemain globTempVar
  immediateTempVar = OHasHitShield * 0.02
  if globTempVar < 35 || timer >= patience || OEndLag > 18 || Rnd <= immediateTempVar || !(ODistLE 45)
    Seek pickOption
    Jump
  endif
endif
Return
label pickOption
if OEndLag > 18 && Rnd < 0.4
  scriptVariant = sv_wavedash_in
  Call Wavedash
elif OEndLag > 13 && Rnd < 0.4
  scriptVariant = sv_wavedash_out
  CallI Wavedash
elif OEndLag > 8 && Rnd < 0.4 && Equal OPos Direction && XDistLE 12
  Button A
  Call Grab
endif

if Rnd < 0.4
  scriptVariant = sv_jump_away
  CallI JumpScr
elif Rnd < 0.4
  AbsStick OPos
elif Rnd < 0.4
  immediateTempVar = OPos * -1
  AbsStick immediateTempVar
elif Rnd < 0.7
  AbsStick 0 (-1)
else
  Seek shield
  Return
endif
CallI MainHub
Return
Return
