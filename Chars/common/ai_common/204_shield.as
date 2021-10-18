#include <Definition_AIMain.h>
id 0x8204
unk 0x0

XReciever
label setup
#let OHasHitShield = var0
#let OEndLag = var1
#let timer = var2
#let patience = var3

OHasHitShield = 0
timer = 0
patience = Rnd * 110 + 40
Button R
Seek shield
Return
label shield
currGoal = cg_defend

XGoto PerFrameChecks
XReciever
Seek shield

if !(Equal AirGroundState 1)
  Return
endif

timer += 1
Button R

CALC_ENDLAG(OEndLag)

// if Equal LevelValue LV9
//   immediateTempVar = OPos * 0.5
//   globTempVar = OTopNY - TopNY
//   if globTempVar > 0.5
//     globTempVar = 0.5
//   else
//     globTempVar = -0.5
//   endif
//   AbsStick immediateTempVar globTempVar
// endif

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

MOD globTempVar timer 3
if Equal CurrAction hex(0x1B) && Equal globTempVar 0 
  GetShieldRemain globTempVar
  immediateTempVar = OHasHitShield * 0.03
  if globTempVar < 35 || timer >= patience || OEndLag > 8 || Rnd <= immediateTempVar || !(ODistLE 30)
    Seek pickOption
    Jump
  elif Equal OHitboxConnected 1 && OAttacking && Rnd < 0.3
    Seek pickOption
    Jump
  endif
endif
Return
label pickOption

predictAverage immediateTempVar man_OXHitDist LevelValue
immediateTempVar += 13
if OEndLag > 5 && Rnd < 0.8 && XDistLE immediateTempVar
  Button X
  Call FastAerial
elif XDistLE immediateTempVar
  predictionConfidence immediateTempVar man_ODefendOption LevelValue
  predictOOption globTempVar man_ODefendOption LevelValue 
  if Rnd < immediateTempVar && Equal globTempVar op_defend_grab
    Button X
    Call FastAerial
  endif
endif

if OEndLag > 15 && Rnd < 0.4
  scriptVariant = sv_wavedash_in
  CallI Wavedash
elif OEndLag > 9 && Rnd < 0.4
  scriptVariant = sv_wavedash_out
  CallI Wavedash
elif OEndLag > 5 && Rnd < 0.5 && Equal OPos Direction && ODistLE immediateTempVar
  Button A
  Call Grab
endif

if Rnd < 0.7
  predictionConfidence immediateTempVar man_ODefendOption LevelValue
  predictOOption globTempVar man_ODefendOption LevelValue 
  if Rnd < immediateTempVar
    if Equal globTempVar op_defend_attack
      if Rnd < 0.35
        scriptVariant = sv_jump_away
        if XDistBackEdge > -10
          scriptVariant = sv_jump_over
        endif
        CallI JumpScr
      endif
      Return
    elif Equal globTempVar op_defend_grab
      scriptVariant = sv_wavedash_in
      if XDistBackEdge > -10 && XDistFrontEdge < 10
        scriptVariant = sv_wavedash_awayFromLedge
      endif
      CallI Wavedash
    elif Equal globTempVar op_defend_shield
      scriptVariant = sv_wavedash_in
      if XDistBackEdge > -10 && XDistFrontEdge < 10
        scriptVariant = sv_wavedash_awayFromLedge
      endif
      CallI Wavedash
    endif
  endif
endif

if Rnd < 0.3
  if Rnd < 0.3
    scriptVariant = sv_jump_away
    CallI JumpScr
  elif Rnd < 0.2
    scriptVariant = sv_wavedash_out
    CallI Wavedash
  elif Rnd < 0.2
    AbsStick OPos
  elif Rnd < 0.2
    immediateTempVar = OPos * -1
    AbsStick immediateTempVar
  elif Rnd < 0.6
    AbsStick 0 (-1)
  endif
endif
Seek shield
Return
Return
Return
