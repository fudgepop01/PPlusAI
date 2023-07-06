// HOVER HUB
// controls how mewtwo behaves during hover

id 0x8101

unk 0x00000

lastScript = hex(0x8101)

if !(Equal CurrAction hex(0x120))
  Call AIHub
endif

// to keep hover going
Button X

if YDistBackEdge > maxYEdgeDist
  Call ChrSpecific3
endif

if !(Equal XDistBackEdge XDistFrontEdge)
  movePart = 0
  approachType = at_hover

  #let ODmgXWeight = var2

  ODmgXWeight = OWeight
  ODmgXWeight /= 100
  ODmgXWeight *= ODamage

  if ODmgXWeight > 60 && OYDistBackEdge < -5 && Equal OIsOnStage 1 && XDistLE 30
    moveVariant = mv_hc
    Call NAir
  elif Equal Direction OPos
    Call FAir
  else
    Call BAir
  endif

  Call NAir
endif

Return
Return
