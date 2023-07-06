#include <Definition_AIMain.h>
id 0x850F
unk 0x0

XReciever
if Equal goalY BBoundary
  XGoto GoalChoiceHub
  XReciever
  Return
endif

if Equal currGoal cg_circleCamp
  Goto getODist
  if immediateTempVar <= 32
    XGoto GoalChoiceHub
    XReciever
    Return
  endif

  Goto getDist
  if immediateTempVar <= 10
    if ODistLE 35 || Rnd <= 0.04
      XGoto GoalChoiceHub
      XReciever
      Return
    endif
    immediateTempVar = (1 - (LevelValue / 100)) * 30 + 10
    MOD immediateTempVar AnimFrame immediateTempVar
    if Equal immediateTempVar 1
      if Equal AirGroundState 1 && Rnd < pt_jumpiness
        goalY += calc(shortHopHeight - 3) 
        if Rnd < pt_jumpiness && Rnd < pt_jumpiness
          goalY += 5
        endif
      elif Equal AirGroundState 2 && YDistBackEdge < -5
        if Rnd < pt_djumpiness && NumJumps > 0
          goalY += djumpHeight
        else
          goalY += 1
          GetYDistFloorAbsPos immediateTempVar goalX goalY
          goalY -= immediateTempVar
        endif
      endif
    endif
  endif
elif currGoal >= cg_bait && currGoal < calc(cg_bait + 1)
  if Equal currGoal cg_bait
    immediateTempVar = (1 - (LevelValue / 100)) * 30 + 12
    MOD immediateTempVar AnimFrame immediateTempVar
    if Equal immediateTempVar 1
      predictAverage immediateTempVar man_OXHitDist LevelValue
      immediateTempVar += 15
      globTempVar = immediateTempVar + 15
      if ODistLE immediateTempVar
        DynamicDiceClear
        if Equal AirGroundState 1
          #const dr_dash = 1
          #const dr_jump = 2
          #const dr_wdash = 3
          #const dr_shield = 4
          #const dr_plat = 5
          DynamicDiceAdd dr_dash
          DynamicDiceAdd dr_jump
          DynamicDiceAdd dr_wdash
          DynamicDiceAdd dr_shield
          GetYDistFloorOffset immediateTempVar 0 40 0
          GetColDistPosRel globTempVar anotherTempVar TopNX SCDBottom 0 40 1
          if Equal globTempVar -1 && !(Equal immediateTempVar -1) && immediateTempVar < 40
            DynamicDiceAdd dr_plat 
          endif
          DynamicDiceRoll immediateTempVar
          if Rnd < 0.2
            scriptVariant = sv_roll_away
            Call Roll
          elif Rnd < pt_bait_dashAwayChance
            scriptVariant = sv_dash_away
            Call DashScr
          endif
          if Equal immediateTempVar dr_dash
            scriptVariant = sv_dash_away
            Call DashScr
          elif Equal immediateTempVar dr_jump
            scriptVariant = sv_jump_away
            Call JumpScr
          elif Equal immediateTempVar dr_wdash
            scriptVariant = sv_wavedash_out
            Call Wavedash
          elif Equal immediateTempVar dr_shield
            Call Shield
          else
            Call BoardPlatform
          endif
        elif NumJumps > 0
          scriptVariant = sv_jump_away
          Call JumpScr
        endif
      elif ODistLE globTempVar && Rnd < pt_jumpiness
        if Rnd < pt_jumpiness
          scriptVariant = sv_jump_over
          scriptVariant += svp_jump_fullhop
        else
          scriptVariant = sv_jump_neutral
        endif
        Call JumpScr
      elif True
        Goto OPosGoal
      endif
    endif
    predictAverage immediateTempVar man_OXHitDist LevelValue
    immediateTempVar += 15
    DrawDebugRectOutline goalX goalY immediateTempVar immediateTempVar color(0xFFFF0088)
    immediateTempVar += 15
    DrawDebugRectOutline goalX goalY immediateTempVar immediateTempVar color(0xFFFF0044)
  endif
else
  Goto getDist
  if immediateTempVar <= 8
    XGoto GoalChoiceHub
    XReciever
    Return
  endif
endif
Return
label OPosGoal
if OAnimFrame < 2
  goalX = OTopNX + OTotalXSpeed * 10 * OPos * ODirection * -1
else
  EstOXCoord goalX 18
  goalX -= OTopNX
  goalX *= OPos * ODirection * -1
  goalX += OTopNX
endif
goalY = OYDistBackEdge + OTopNY
if OYDistBackEdge < -30
  goalY += calc(shortHopHeight - 3) 
endif
Return
label getDist
immediateTempVar = TopNX - goalX
anotherTempVar = TopNY - goalY
Goto normalize
Return
label getODist
immediateTempVar = OTopNX - goalX
anotherTempVar = OTopNY - goalY
Goto normalize
Return
label normalize
Norm immediateTempVar immediateTempVar anotherTempVar
Abs immediateTempVar
Return
Return