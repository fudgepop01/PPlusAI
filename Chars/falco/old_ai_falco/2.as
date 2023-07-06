#snippet DEBUG_START
#endsnippet

#snippet MOVE_SPECIFIC_COMBOS
  // if Equal lastAttack valGrab
  //   // LOGSTR str("grbCmbo")
  //   if Equal moveVariant mv_uthrow
  //     if ODmgXWeight > 50
  //       if XDistLE 20
  //         Call FAir
  //       else
  //         Call UAir
  //       endif
  //     elif OYDistSelf > 25
  //       Call UAir
  //     else
  //       Call NAir
  //     endif
  //   elif Equal moveVariant mv_dthrow
  //     if ODmgXWeight > 50 && OYDistSelf > 25
  //       Call FAir
  //     elif OYDistSelf > 25 && OYSpeed > 0.15
  //       Call UAir
  //     endif
  //     var0 = Rnd * 3
  //     if ODmgXWeight > 40 && var0 < 2
  //       Call DAir
  //     else
  //       moveVariant = mv_techChase
  //       Call Grab
  //     endif
  //   endif
  // endif
  // if hit_knockback < 4
  //   Goto grab
  //   comboLeniency = 8
  //   if OYDistBackEdge < -5
  //     moveVariant = mv_techChase
  //   endif
  //   Goto analyze
  // endif
  // if ODmgXWeight > 50
  //   Goto fair
  //   comboLeniency = 2
  //   Goto analyze
  // // else
  // //   Goto dair
  // //   comboLeniency = 2
  // endif
  if OFramesHitstun > 10 && Rnd < 0.5 && YDistBackEdge > -10 && OYDistBackEdge > -15
    Call Grab
  endif
#endsnippet

#snippet GLOB_FILTERS
  $excludeMovesOrigin(sspecial|sspecialair|USpecial|USpecialAir)
#endsnippet

#snippet KILL_GR_FILTERS
  $excludeMovesNotOrigin(fsmash|usmash|dsmash|dair|nair|bair)
#endsnippet

#snippet KILL_AIR_FILTERS
  $excludeMovesNotOrigin(dair|nair|bair|uair|dspecialair)
#endsnippet

#snippet EDGEGUARD_OPTIONS
  $pickRandMove(nspecial|sspecial|dair|ftilt|dtilt|dsmash, Goto)
#endsnippet