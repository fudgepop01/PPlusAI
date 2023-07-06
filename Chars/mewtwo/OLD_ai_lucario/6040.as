#snippet PRE_SCRIPT_HOOKS
  if Equal CurrAction hex(0x120)
    Button X
  endif
#endsnippet

#snippet AT_CONDITIONS
  if Equal approachType at_defend && OFramesHitstun < 1
    Call DefendHub
  elif Equal approachType at_hover
    Call ChrSpecific2
  elif True
    #let isOffstageAtOffset = var0
    OFFSTAGE_OFFSET(var0, var1, 50 * OPos)
    if Equal isOffstageAtOffset 0 && !(ODistLE 30) && ODistLE 100 && CanJump && !(Equal XDistBackEdge XDistFrontEdge) && Equal IsOnStage 1
      Call ChrSpecific4
    else 
      Call ApproachHub
    endif
  endif
#endsnippet

#snippet POST_HOOKS
  #let targetXDistance = var5
  #let targetYDistance = var6
  // control float

  if Equal CurrAction hex(0x120)
    Button X
    Norm globTempVar targetXDistance targetYDistance
    targetXDistance /= globTempVar
    targetYDistance /= globTempVar

    AbsStick targetXDistance targetYDistance
    if YDistBackEdge > -5 && Equal IsOnStage 1 && targetYDistance < 0
      ClearStick 1
    endif
    if YDistBackEdge > -10
      if CalledAs NAir && Equal moveVariant mv_hc && frameCounter <= 25
        AbsStick targetXDistance (-1)
      elif CalledAs FAir && frameCounter <= 9
        AbsStick targetXDistance (-1)
      elif CalledAs BAir && frameCounter <= 12
        AbsStick targetXDistance (-1)
      elif CalledAs UAir && frameCounter <= 13
        AbsStick targetXDistance (-1)
      elif CalledAs DAir && frameCounter <= 20
        AbsStick targetXDistance (-1)
      endif
    endif
  endif
#endsnippet