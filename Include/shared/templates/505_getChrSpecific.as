#include <Definition_AIMain.h>
id 0x8505
unk 0x0

XReciever

if Equal chr_trait_select chr_cs_moveData
  $generateFetchMoveData()
elif Equal chr_trait_select chr_cs_dashForceTurnFrame
  chr_trait_return = cs_dashForceTurnFrame
elif Equal chr_trait_select chr_cs_dashDanceMinFrames
  chr_trait_return = cs_dashDanceMinFrames
elif Equal chr_trait_select chr_cs_shortHopHeight
  chr_trait_return = cs_shortHopHeight
elif Equal chr_trait_select chr_cs_djumpHeight
  chr_trait_return = cs_djumpHeight
elif Equal chr_trait_select chr_cs_wavedashDist
  chr_trait_return = cs_wavedashDist
elif Equal chr_trait_select chr_cs_recoveryDistX
  chr_trait_return = cs_recoveryDistX
elif Equal chr_trait_select chr_cs_recoveryDistY
  chr_trait_return = cs_recoveryDistY
elif Equal chr_trait_select chr_chk_isAerialAttack
  chr_trait_return = 0
  $ifAerialAttack()
    chr_trait_return = 1
  endif
elif Equal chr_trait_select chr_chk_OInCombo
  getCurrentPredictValue globTempVar man_OFramesPostHitstun
  anotherTempVar = PT_AGGRESSION * 20
  if globTempVar <= anotherTempVar
    if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x59) && !(Equal OCurrAction hex(0x49))
    elif Equal OCurrAction hex(0x49) && OYDistFloor > 15
    elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
      chr_trait_return = 1
      Return
    endif
  endif
  chr_trait_return = 0
elif Equal chr_trait_select chr_get_moveDir
  $genLastAttackDir()
elif Equal chr_trait_select chr_get_moveDirY
  $genLastAttackDirY()
elif Equal chr_trait_select evt_gotHit
  {EVT_GOT_HIT}
elif Equal chr_trait_select evt_chrChecks
  {EVT_CHR_CHECKS}
elif Equal chr_trait_select evt_rangedHit
  {EVT_RANGED_HIT}
elif Equal chr_trait_select chr_get_OEndlag || Equal chr_trait_select chr_get_OEndlagSafe
  STACK_PUSH chr_trait_select
  CALC_ENDLAG(chr_trait_return)
  if Equal STACK_POP chr_get_OEndlagSafe
    if OAttacking
      RetrieveFullATKD immediateTempVar globTempVar anotherTempVar anotherTempVar anotherTempVar anotherTempVar anotherTempVar OCurrSubaction 1
      if Equal immediateTempVar 0
        immediateTempVar = OEndFrame
      endif 
      if OAnimFrame >= globTempVar || Equal OHitboxConnected 1
        chr_trait_return = immediateTempVar - OAnimFrame
      else
        chr_trait_return = -1
      endif
    endif
  endif
elif Equal chr_trait_select chr_calc_certainty
  anotherTempVar = 0
  PredictOMov immediateTempVar mov_shield LevelValue
  if immediateTempVar > anotherTempVar
    anotherTempVar = immediateTempVar
  endif
  PredictOMov immediateTempVar mov_dash LevelValue
  if immediateTempVar > anotherTempVar
    anotherTempVar = immediateTempVar
  endif
  PredictOMov immediateTempVar mov_jump LevelValue
  if immediateTempVar > anotherTempVar
    anotherTempVar = immediateTempVar
  endif
  PredictOMov immediateTempVar mov_attack LevelValue
  if immediateTempVar > anotherTempVar
    anotherTempVar = immediateTempVar
  endif
  PredictOMov immediateTempVar mov_grab LevelValue
  if immediateTempVar > anotherTempVar
    anotherTempVar = immediateTempVar
  endif
  chr_trait_return = anotherTempVar
endif
Return
label __ANGLE_FIX__
if Equal OAirGroundState 1
  if Equal immediateTempVar 361
    if anotherTempVar < 32
      immediateTempVar = anotherTempVar * 0.03125 * 44
    else
      immediateTempVar = 44
    endif
  elif Equal immediateTempVar -361
    if anotherTempVar < 32
      immediateTempVar = 180 - anotherTempVar * 0.03125 * 44
    else
      immediateTempVar = 136
    endif
  endif
elif Equal immediateTempVar 361
  immediateTempVar = 45
elif Equal immediateTempVar -361
  immediateTempVar = 135
endif
Return
Return