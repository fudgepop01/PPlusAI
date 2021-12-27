#include <Definition_AIMain.h>
id 0x8401
unk 0x0

XReciever
label begin
XGoto PerFrameChecks
XReciever
Seek begin

ACTIONABLE_ON_GROUND

XGoto CalcAttackGoal
XReciever

skipMainInit = sm_execAttack
currGoal = cg_attack_reversal
Call MainHub
Return
Return