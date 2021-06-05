// HOVER HUB
// controls how mewtwo behaves during hover

id 0x8101

unk 0x00000

var21 = 33025

if !(Equal CurrAction 288)
  Call AIHub
endif

// to keep hover going
Button X

if YDistBackEdge > 40
  Call ChrSpecific3
endif

if !(Equal XDistBackEdge XDistFrontEdge)
  var18 = 0
  var16 = 255


  var2 = OWeight
  var2 /= 100
  var2 *= ODamage

  if var2 > 60 && OYDistBackEdge < -5 && Equal OIsOnStage 1 && XDistLE 30
    var19 = 1
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

