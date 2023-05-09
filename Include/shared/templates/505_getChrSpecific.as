#include <Definition_AIMain.h>
id 0x8505
unk 0x0

//= XReciever
if Equal chr_trait_select chr_cs_moveData || Equal chr_trait_select chr_cs_moveName
  {FETCH_MOVE_DATA}
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
  STACK_PUSH anotherTempVar 0
  chr_trait_return = calc(-1 * cs_recoveryDistY)
  chr_trait_return -= 10
  if NumJumps > 0
    chr_trait_return += cs_djumpHeight
  endif
  anotherTempVar = BBoundary * -1
  anotherTempVar += 15
  if chr_trait_return > anotherTempVar
    chr_trait_return = anotherTempVar
  endif
  anotherTempVar = STACK_POP
elif Equal chr_trait_select chr_chk_isAerialAttack
  chr_trait_return = 0
  $ifAerialAttack()
    chr_trait_return = 1
  endif
elif Equal chr_trait_select chr_chk_OInCombo
  if XDistLE 70
    getCurrentPredictValue globTempVar man_OFramesPostHitstun
    anotherTempVar = PT_AGGRESSION * 15 + 10
    // LOGVAL_NL globTempVar
    if globTempVar > 200
      chr_trait_return = 0
      Return
    elif globTempVar <= anotherTempVar || OFramesHitstun > 0
      chr_trait_return = 1
      // LOGSTR_NL str("IS COMBO (1)")
      Return
    endif
    if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x59) && !(Equal OCurrAction hex(0x49))
    elif Equal OCurrAction hex(0x49) && OYDistFloor > 15
    elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
    else
      // LOGSTR_NL str("NOT COMBOING")
      chr_trait_return = 0
      Return
    endif
    // LOGSTR_NL str("IS COMBO (2)")
    chr_trait_return = 1
    Return
  endif
  chr_trait_return = 0
elif Equal chr_trait_select chr_chk_actionableOnGround
  chr_trait_return = 0
  if Equal CanCancelAttack 1
  elif Equal HitboxConnected 1 && HasCurry
  elif CurrAction >= hex(0x67) && CurrAction <= hex(0x6D)
  elif Equal CurrAction hex(0x16) 
    if Equal PrevAction hex(0x21)
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif CurrAction >= hex(0x18) && !(Equal CurrAction hex(0x49)) && !(Equal CurrAction hex(0x67)) && !(Equal CurrAction hex(0x6C))
    Return
  endif
  chr_trait_return = 1
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
elif Equal chr_trait_select evt_checkDefend
  {EVT_CHECK_DEFEND}
elif Equal chr_trait_select chr_get_OEndlag || Equal chr_trait_select chr_get_OEndlagSafe
  STACK_PUSH chr_trait_select 0
  CALC_ENDLAG(chr_trait_return)
  if Equal STACK_POP chr_get_OEndlagSafe
    if OAttackCond
      STACK_PUSH chr_trait_return 0
      $tempVar(xmax, anotherTempVar)
      RetrieveFullATKD immediateTempVar noVar globTempVar noVar xmax noVar noVar OCurrSubaction 1
      if Equal immediateTempVar 0
        immediateTempVar = OEndFrame
      endif 
      if OAnimFrame >= globTempVar || Equal OHitboxConnected 1
        chr_trait_return = immediateTempVar - OAnimFrame
        STACK_TOSS 1
        Return
      elif !(XDistLE xmax)
        chr_trait_return = STACK_POP
        Return
      else
        chr_trait_return = -1
        STACK_TOSS 1
        Return
      endif
      chr_trait_return = STACK_POP
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
elif Equal chr_trait_select chr_calc_ORecoverPos
  // STACK = [framesAhead, xVarTarget, yVarTarget]

  #let goalX = var0
  #let goalY = var1
  #let framesAhead = var2
  framesAhead = STACK_POP
  if OCurrAction >= hex(0x100)
    #let REC_KIND = var3
    #let REC_ARG1 = var4
    #let REC_ARG2 = var5
    #let REC_ARG3 = var6

    $tempVar(REC_ACTION, immediateTempVar)
    immediateTempVar = OCurrAction + hex(0x100)
    RetrieveFullATKD REC_KIND REC_ARG1 REC_ARG2 REC_ARG3 immediateTempVar immediateTempVar immediateTempVar REC_ACTION 1
    if Equal REC_KIND -1
      SeekNoCommit esc_recovery
    endif
    // move_lastHitFrame += 6
    goalX = OTopNX
    goalY = OTopNY
    if Equal REC_KIND RECOVERY_IDLE
    elif Equal REC_KIND RECOVERY_HORIZONTAL
      $tempVar(punish_frame, REC_ARG1)
      $tempVar(distTolerence, REC_ARG2)
      $tempVar(punishDist, REC_ARG3)

      immediateTempVar = punish_frame - framesAhead
      if XDistLE distTolerence || OActionTimer < immediateTempVar || OActionTimer > punish_frame
      else
        punishDist *= ODirection
        goalX += punishDist
      endif
    elif Equal REC_KIND RECOVERY_VERTICAL
      $tempVar(punish_frame, REC_ARG1)
      $tempVar(distTolerence, REC_ARG2)
      $tempVar(punishDist, REC_ARG3)

      immediateTempVar = punish_frame - framesAhead
      if XDistLE distTolerence || OActionTimer < immediateTempVar || OActionTimer > punish_frame
      else
        goalY += punishDist
      endif
    elif Equal REC_KIND RECOVERY_AIM
      $tempVar(movementStart, REC_ARG1)
      $tempVar(movementEnd, REC_ARG2)
      $tempVar(totalDistance, REC_ARG3)
      
      Norm immediateTempVar OXSpeed OYSpeed
      Abs immediateTempVar
      if Equal immediateTempVar 0
        SeekNoCommit esc_recovery
      endif 
      anotherTempVar = immediateTempVar
      immediateTempVar = 1 / anotherTempVar
      globTempVar = OXSpeed * immediateTempVar
      immediateTempVar = OYSpeed * immediateTempVar

      globTempVar *= totalDistance
      immediateTempVar *= totalDistance
      
      anotherTempVar = framesAhead + OActionTimer
      if anotherTempVar > movementStart
        // mult totalDist by (OActionTimer + framesAhead) / totalTime
        movementEnd -= movementStart
        if anotherTempVar > movementEnd
          anotherTempVar = movementEnd
        endif
        // anotherTempVar = movementEnd - anotherTempVar
        anotherTempVar -= OActionTimer
        anotherTempVar /= movementEnd
        globTempVar *= anotherTempVar
        immediateTempVar *= anotherTempVar
        goalX += globTempVar
        goalY += immediateTempVar
      endif
    endif
  else
    SeekNoCommit esc_recovery
  endif
  SetVarByNum STACK_POP goalX
  SetVarByNum STACK_POP goalY
  if !(True)
    label esc_recovery
    STACK_TOSS 2
  endif
endif
Return
label __ANGLE_FIX__
// if CalledFrom CheckAttackWillHit
//   LOGSTR str("angle")
//   LOGVAL immediateTempVar
// endif
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
anotherTempVar = STACK_POP
// if CalledFrom CheckAttackWillHit
//   LOGSTR str("poppedVar")
//   LOGVAL anotherTempVar
//   PRINTLN
// endif
SetVarByNum anotherTempVar immediateTempVar
Return
Return