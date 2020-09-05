#include <Definition_AIMain.h>
//TrueID=0x6040
id 0x6040

//Set Unknown
unk 0x50000

//Strings



// sets up offsets to get to target position
if Equal movePart 0
  if CalledAs NAir
    lastAttack = hex(0x6041)
    move_xOffset = nair_xOffset
    move_yOffset = nair_yOffset
    move_xRange = nair_xRange
    move_yRange = nair_yRange
    move_hitFrame = nair_dist1
  elif CalledAs FAir
    lastAttack = hex(0x6042)
    move_xOffset = fair_xOffset
    move_yOffset = fair_yOffset
    move_xRange = fair_xRange
    move_yRange = fair_yRange
    move_hitFrame = fair_dist1
  elif CalledAs BAir
    lastAttack = hex(0x6043)
    move_xOffset = bair_xOffset
    move_yOffset = bair_yOffset
    move_xRange = bair_xRange
    move_yRange = bair_yRange
    move_hitFrame = bair_dist1
  elif CalledAs UAir
    lastAttack = hex(0x6044)
    move_xOffset = uair_xOffset
    move_yOffset = uair_yOffset
    move_xRange = uair_xRange
    move_yRange = uair_yRange
    move_hitFrame = uair_dist1
  elif CalledAs DAir
    lastAttack = hex(0x6045)
    move_xOffset = dair_xOffset
    move_yOffset = dair_yOffset
    move_xRange = dair_xRange
    move_yRange = dair_yRange
    move_hitFrame = dair_dist1
  else
    Call AIHub
  endif
  Call ApproachHub
elif Equal AirGroundState 2
  ClearStick
  move_IASA = nair_IASA
  if CalledAs FAir
    move_IASA = fair_IASA
    Stick (0.5) 0
  elif CalledAs BAir
    move_IASA = bair_IASA
    Stick (-0.5) 0
  elif CalledAs UAir
    move_IASA = uair_IASA
    Stick 0 (0.5)
  elif CalledAs DAir
    move_IASA = dair_IASA
    Stick 0 (-0.5)
  endif
  Button A
  Seek ExecuteAttack
else
  Call AIHub
endif
Return

label ExecuteAttack
if FrameGE 1
  CALC_TARGET_DISTANCES

  if Equal AirGroundState 1 || Equal YDistFloor -1 || AnimFrame >= move_IASA
    Call AIHub
  endif

  if targetXDistance < 0
    AbsStick (-1)
  else
    AbsStick 1
  endif


  if YSpeed < 0 && YDistFloor < 25 && YDistFloor >= 0
    var19 = 2
    var18 = 1
    Call Landing
  endif
endif
Return
Return