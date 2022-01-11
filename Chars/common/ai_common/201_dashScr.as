#include <Definition_AIMain.h>
id 0x8201
unk 0x0

XReciever
label setup
#let timeLimit = var0
#let timePassed = var1
#let startOPos = var2
#let dashForceTurnFrame = var3
#let dashDanceMinFrames = var4
GET_CHAR_TRAIT(dashForceTurnFrame, chr_cs_dashForceTurnFrame)
GET_CHAR_TRAIT_SEEK(dashDanceMinFrames, chr_cs_dashDanceMinFrames, setup)

timePassed = 0

if Equal CurrAction hex(0x4) || Equal CurrAction hex(0x5)
  if Equal scriptVariant sv_dash_towards
    if Rnd < 0.2
      scriptVariant = sv_wavedash_neutral
    else
      scriptVariant = sv_wavedash_in
    endif
  elif Equal scriptVariant sv_dash_away
    scriptVariant = sv_wavedash_out 
  elif Equal scriptVariant sv_dash_toCenter
    scriptVariant = sv_wavedash_neutral
  endif
  CallI Wavedash
endif


timeLimit = dashForceTurnFrame * 2 - dashDanceMinFrames + Rnd * 20
timeLimit = Rnd * timeLimit + dashDanceMinFrames 
startOPos = OPos
if Equal scriptVariant sv_dash_away
  timeLimit += 3
  if timeLimit >= dashForceTurnFrame
    timeLimit = dashForceTurnFrame
  endif
elif Equal scriptVariant sv_dash_away_defense
  timeLimit += 20
endif
label execution
XGoto PerFrameChecks
XReciever
if !(Equal lastAttack -1) && !(Equal scriptVariant sv_dash_away) && !(Equal scriptVariant sv_dash_away_defense)
  XGoto SetAttackGoal
  XReciever
  XGoto CheckAttackWillHit
  XReciever
endif
Seek execution


if XDistFrontEdge < 15
  Call MainHub
elif XDistBackEdge > -25 && Equal Direction OPos && !(Equal scriptVariant sv_dash_through)
  scriptVariant = sv_dash_towards
endif

if timePassed < dashForceTurnFrame && !(Equal scriptVariant sv_dash_through) || Equal scriptVariant sv_dash_away_defense
  if Equal scriptVariant sv_dash_towards
    AbsStick OPos
  elif Equal scriptVariant sv_dash_away || Equal scriptVariant sv_dash_away_defense
    if XDistBackEdge > -10
      scriptVariant = sv_dash_through
      AbsStick OPos
      Return
    endif
    immediateTempVar = OPos * -1
    AbsStick immediateTempVar

    if Equal scriptVariant sv_dash_away_defense
      GET_CHAR_TRAIT(immediateTempVar, chr_get_OEndlagSafe)
      Seek execution
      if immediateTempVar >= 10
        currGoal = cg_attack_reversal
        skipMainInit = mainInitSkip
        if Equal CurrAction hex(0x4)
          scriptVariant = sv_wavedash_goal
          CallI Wavedash
        endif
        CallI MainHub
      endif
    endif
  elif Equal scriptVariant sv_dash_toCenter
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  endif
elif Equal scriptVariant sv_dash_through
  AbsStick OPos
  if !(Equal startOPos OPos)
    Call MainHub
  endif
  Return
endif
timePassed += 1
if timePassed > timeLimit
  Call MainHub
endif
Return
Return