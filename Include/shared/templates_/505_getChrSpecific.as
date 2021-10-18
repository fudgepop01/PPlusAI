#include <Definition_AIMain.h>
id 0x8505
unk 0x0

XReciever

  LOGSTR str("-----===-----")
  LOGSTR str("GET CHR SPEC")
  LOGVAL chr_trait_select
  LOGSTR str("-----===-----")


if Equal chr_trait_select chr_pt_jumpiness
  chr_trait_return = pt_jumpiness
elif Equal chr_trait_select chr_pt_djumpiness
  chr_trait_return = pt_djumpiness
elif Equal chr_trait_select chr_pt_riskReactionBalance
  chr_trait_return = pt_riskReactionBalance
elif Equal chr_trait_select chr_pt_aggression
  chr_trait_return = pt_aggression
elif Equal chr_trait_select chr_pt_baitChance
  chr_trait_return = pt_baitChance
elif Equal chr_trait_select chr_pt_bait_dashAwayChance
  chr_trait_return = pt_bait_dashAwayChance
elif Equal chr_trait_select chr_pt_bait_wdashAwayChance
  chr_trait_return = pt_bait_wdashAwayChance
elif Equal chr_trait_select chr_pt_wall_chance
  chr_trait_return = pt_wall_chance
elif Equal chr_trait_select chr_pt_braveChance
  chr_trait_return = pt_braveChance
elif Equal chr_trait_select chr_pt_platChance
  chr_trait_return = pt_platChance
elif Equal chr_trait_select chr_pt_circleCampChance
  chr_trait_return = pt_circleCampChance
elif Equal chr_trait_select chr_pt_SDIChance
  chr_trait_return = pt_SDIChance
elif Equal chr_trait_select chr_pt_dashForceTurnFrame
  chr_trait_return = pt_dashForceTurnFrame
elif Equal chr_trait_select chr_pt_dashDanceMinFrames
  chr_trait_return = pt_dashDanceMinFrames
elif Equal chr_trait_select chr_pt_shortHopHeight
  chr_trait_return = pt_shortHopHeight
elif Equal chr_trait_select chr_pt_djumpHeight
  chr_trait_return = pt_djumpHeight
elif Equal chr_trait_select chr_pt_wavedashDist
  chr_trait_return = pt_wavedashDist
elif Equal chr_trait_select chr_chk_isAerialAttack
  LOGSTR str("-----===-----")
  LOGSTR str("-----===-----")
  LOGSTR str("IS AERIAL???")
  $ifAerialAttack()
    LOGSTR str("YES")
    chr_trait_return = 1
  endif
  LOGSTR str("-----===-----")
  LOGSTR str("-----===-----")
endif

Return
Return