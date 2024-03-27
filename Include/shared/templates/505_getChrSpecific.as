#include <Definition_AIMain.h>
id 0x8505
unk 0x0

//= XReciever
if Equal chr_trait_select chr_cs_moveData || Equal chr_trait_select chr_cs_moveName
  // chr cs moveData
  {FETCH_MOVE_DATA}
elif Equal chr_trait_select chr_cs_dashForceTurnFrame
  // chr cs dashForceTurnFrame
  chr_trait_return = cs_dashForceTurnFrame
elif Equal chr_trait_select chr_cs_dashDanceMinFrames
  // chr cs dashDanceMinFrames
  chr_trait_return = cs_dashDanceMinFrames
elif Equal chr_trait_select chr_cs_shortHopHeight
  // chr cs shortHopHeight
  chr_trait_return = cs_shortHopHeight
elif Equal chr_trait_select chr_cs_djumpHeight
  // chr cs djumpHeight
  chr_trait_return = cs_djumpHeight
elif Equal chr_trait_select chr_cs_wavedashDist
  // chr cs wavedashDist
  chr_trait_return = cs_wavedashDist
elif Equal chr_trait_select chr_cs_recoveryDistX
  // chr cs recoveryDistX
  chr_trait_return = cs_recoveryDistX
elif Equal chr_trait_select chr_cs_recoveryDistY
  // chr cs recoveryDistY
  STACK_PUSH anotherTempVar 0
  if currGoal >= cg_edgeguard
    chr_trait_return = calc(-1 * cs_recoveryDistY)
    chr_trait_return -= 10
    chr_trait_return *= 0.9
  else
    chr_trait_return = 0
  endif
  chr_trait_return += HurtboxSize
  if NumJumps > 0
    anotherTempVar = NumJumps - 1
    anotherTempVar *= cs_djumpHeight * 0.7
    anotherTempVar += cs_djumpHeight
    chr_trait_return += anotherTempVar
  endif
  {RECOVERY_ADDITIONS}
  anotherTempVar = BBoundary * -1
  anotherTempVar -= 25
  // LOGSTR str("ret recdist")
  // LOGVAL chr_trait_return
  // LOGVAL anotherTempVar
  // PRINTLN
  if chr_trait_return > anotherTempVar
    chr_trait_return = anotherTempVar
  endif
  // chr_trait_return -= 20
  anotherTempVar = STACK_POP
elif Equal chr_trait_select chr_chk_isAerialAttack
  // chr chk_isAerialAttack
  chr_trait_return = 0
  $ifAerialAttack()
    chr_trait_return = 1
  endif
elif Equal chr_trait_select chr_chk_OInCombo
  // chr chk_OInCombo
  Goto saveTempRegs
  if XDistLE 60 || OFramesHitstun > 0
    getCurrentPredictValue globTempVar man_OFramesPostHitstun
    anotherTempVar = PT_AGGRESSION * 5 + 10
    // LOGSTR_NL str("posthitstun")
    // LOGVAL_NL globTempVar
    if globTempVar > 200
      chr_trait_return = 0
      Goto restoreTempRegs
      Return
    elif globTempVar <= anotherTempVar || OFramesHitstun > 0
      chr_trait_return = 1
      // LOGSTR_NL str("IS COMBO (1)")
      Goto restoreTempRegs
      Return
    endif
    if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x59) && !(Equal OCurrAction hex(0x49))
    elif Equal OCurrAction hex(0x49) && OYDistFloor > 15
    elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
    else
      // LOGSTR_NL str("NOT COMBOING")
      chr_trait_return = 0
      Goto restoreTempRegs
      Return
    endif
    // LOGSTR_NL str("IS COMBO (2)")
    chr_trait_return = 1
    Goto restoreTempRegs
    Return
  endif
  chr_trait_return = 0
  Goto restoreTempRegs
elif Equal chr_trait_select chr_chk_actionableOnGround
  // chr chk_actionableOnGround
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
  // chr get_moveDir
  $genLastAttackDir()
elif Equal chr_trait_select chr_get_moveDirY
  // chr get_moveDirY
  $genLastAttackDirY()
elif Equal chr_trait_select evt_gotHit
  // evt gotHit
  {EVT_GOT_HIT}
elif Equal chr_trait_select evt_chrChecks
  // evt chrChecks
  {EVT_CHR_CHECKS}
elif Equal chr_trait_select evt_rangedHit
  // evt rangedHit
  {EVT_RANGED_HIT}
elif Equal chr_trait_select evt_checkDefend
  // evt checkDefend
  {EVT_CHECK_DEFEND}
elif Equal chr_trait_select chr_get_OEndlag || Equal chr_trait_select chr_get_OEndlagSafe
  // chr get_OEndlag
  Goto saveTempRegs
  STACK_PUSH chr_trait_select 0
  CALC_ENDLAG(chr_trait_return)
  if Equal STACK_POP chr_get_OEndlagSafe && !(Equal CurrAction hex(0x1D))
    if OAttackCond
      STACK_PUSH chr_trait_return 0
      $tempVar(xmax, anotherTempVar)
      RetrieveFullATKD immediateTempVar noVar globTempVar noVar xmax noVar noVar OCurrSubaction 1
      xmax += Width
      xmax += OWidth
      if Equal immediateTempVar 0
        immediateTempVar = OEndFrame
      endif 
      if OAnimFrame >= globTempVar || Equal OHitboxConnected 1
        chr_trait_return = immediateTempVar - OAnimFrame
        STACK_TOSS 1
        Goto restoreTempRegs
        Return
      elif !(XDistLE xmax)
        chr_trait_return = STACK_POP
        Goto restoreTempRegs
        Return
      else
        chr_trait_return = -500
        STACK_TOSS 1
        Goto restoreTempRegs
        Return
      endif
    else
      Goto restoreTempRegs
    endif
  else
    Goto restoreTempRegs
  endif
elif Equal chr_trait_select chr_calc_moveOffset
  #let move_hitFrame = var7
  chr_trait_return = 0
  Return
  Goto saveTempRegs
  if !(CalledFrom ExecuteAttack) && CurrAction < hex(0x20) && PrevAction < hex(0x20) && currGoal < cg_edgeguard
    // GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
    anotherTempVar = 0
    // if Equal immediateTempVar 1
    //   chr_trait_return = 0
    //   Goto restoreTempRegs
    //   Return
    // if OYDistFloor > 10
    // elif !(Equal currGoal cg_attack_reversal)
    //   immediateTempVar = OTopNY - TopNY
    //   if immediateTempVar <= 30
    //     anotherTempVar = 1
    //   endif
    // endif
    if OYDistFloor < 10 && currGoal < cg_edgeguard
    // elif !(Equal anotherTempVar 0) 
      GET_CHAR_TRAIT(immediateTempVar, chr_get_OEndlag)
      if immediateTempVar <= 5
        anotherTempVar = 1
      endif
    endif

    if OCurrAction >= hex(0x60) && OCurrAction <= hex(0x61)
      predictOOption globTempVar man_OTechOption
      predictionConfidence immediateTempVar man_OTechOption
      if immediateTempVar >= 0.3
        chr_trait_return = 0
        anotherTempVar = OPos * 20
        if Equal globTempVar op_tech_in
          chr_trait_return -= anotherTempVar
        elif Equal globTempVar op_tech_out
          chr_trait_return += anotherTempVar
        endif
      endif
    elif Equal anotherTempVar 1
      GetAttribute immediateTempVar attr_dashInitVel 1
      // $ifAerialAttack()
      //   if move_hitFrame > 10
      //     move_hitFrame = 10
      //   endif
      // endif
      // TODO
      immediateTempVar *= calc(0.2 * 3)
      predictOOption globTempVar man_OBaitOption
      predictionConfidence anotherTempVar man_OBaitOption  

      // FIXME
      // globTempVar = op_bait_move
      // anotherTempVar = 1

      if Equal globTempVar op_bait_move && anotherTempVar >= 0.6
        predictOOption anotherTempVar man_OBaitDirection 
        predictAverage globTempVar man_OXHitDist
        // FIXME
        // anotherTempVar = op_baitdir_overshoot
        globTempVar *= OPos
        if Equal currGoal cg_attack_wall
        elif Equal anotherTempVar op_baitdir_undershoot
          // LOGSTR_NL str("UNDERSHOOT")
          anotherTempVar = OXSpeed
          anotherTempVar *= OPos
          if OCurrAction >= hex(0x2) && OCurrAction <= hex(0x19) && anotherTempVar >= 0
          else
            immediateTempVar *= 5
          endif
          // chr_trait_return = immediateTempVar
          // immediateTempVar *= -1
        elif Equal anotherTempVar op_baitdir_overshoot
          // LOGSTR_NL str("OVERSHOOT")
          anotherTempVar = 15 * immediateTempVar
          GetYDistFloorOffset anotherTempVar anotherTempVar 5 1
          if !(Equal anotherTempVar -1)
            // immediateTempVar *= 5
            // chr_trait_return = immediateTempVar * -1
            immediateTempVar *= -1
          else
            immediateTempVar = 0
          endif
        endif
      endif
      chr_trait_return *= OPos
    else 
      chr_trait_return = 0
    endif
  else 
    chr_trait_return = 0
  endif


  Goto restoreTempRegs
elif Equal chr_trait_select chr_calc_certainty
  // chr calc_certainty
  Goto saveTempRegs

  GetCommitPredictChance anotherTempVar
  PredictOMov immediateTempVar mov_roll
  anotherTempVar += immediateTempVar

  if anotherTempVar < 0.5
    anotherTempVar -= 1
    anotherTempVar *= -1
  endif

  chr_trait_return = anotherTempVar
  Goto restoreTempRegs
elif Equal chr_trait_select chr_calc_ORecoverPos
  // chr calc_ORecoverPos
  // STACK = [framesAhead, xVarTarget, yVarTarget]

  #let GX = var0
  #let GY = var1
  #let framesAhead = var2
  framesAhead = STACK_POP
    
  {EST_OWN_RECOVERY}

  SetVarByNum STACK_POP GX
  SetVarByNum STACK_POP GY
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
label saveTempRegs
STACK_PUSH globTempVar st_function
STACK_PUSH anotherTempVar st_function
Return
label restoreTempRegs
anotherTempVar = STACK_POP
globTempVar = STACK_POP
Return
Return