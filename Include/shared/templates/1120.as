// THROW HANDLER
// is ALWAYS called whenever a successfully grab occurs
#include <Definition_AIMain.h>
//TrueID=0x1120
id 0x1120

//Set Unknown
unk 0x0

#let pummelCount = var0
if ODamage > 160
  pummelCount = 4
elif ODamage > 120
  pummelCount = 3
elif ODamage > 80
  pummelCount = 2
elif ODamage > 40
  pummelCount = 1
else
  pummelCount = 0
endif

label _begin

#let ODmgXWeight = var1
GET_WEIGHT_TABLE(ODmgXWeight, var2)

ODmgXWeight = ODmgXWeight - 200
ODmgXWeight *= -1
ODmgXWeight /= 100
ODmgXWeight *= ODamage

ClearStick
label
if CurrAction < hex(0x34) || CurrAction > hex(0x3C)
  Call AIHub
elif Equal CurrAction hex(0x39)
  if pummelCount > 0
    Button A
    pummelCount -= 1
    Return
  elif True
    #let fBoundDist = var2
    #let bBoundDist = var3
    #let uBoundDist = var4
    #let tries = var4

    if Equal Direction 1
      fBoundDist = RBoundary - TopNX
      bBoundDist = LBoundary - TopNX
    else
      bBoundDist = RBoundary - TopNX
      fBoundDist = LBoundary - TopNX
    endif
    uBoundDist = TBoundary - TopNY

    #let fThrowDMG = var5
    #let bThrowDMG = var6
    #let uThrowDMG = var7
    #let dThrowDMG = var8

    LOGSTR str("fbound")
    if fBoundDist < 120
      $generateThrowDMG(160, f)

      tries = 5
      label
      tries -= 1
      if tries < 0
        Seek
        Jump
      endif
      if fThrowDMG < ODmgXWeight && Rnd < 0.4
        Goto fthrow
        Seek _begin
      elif uThrowDMG < ODmgXWeight && Rnd < 0.4
        Goto uthrow
        Seek _begin
      elif dThrowDMG < ODmgXWeight && Rnd < 0.4
        Goto dthrow
        Seek _begin
      elif bThrowDMG < ODmgXWeight && Rnd < 0.4
        Goto bthrow
        Seek _begin
      endif
      Return
      label
      if Rnd < 0.7
        if Rnd < 0.5
          Goto dthrow
        else
          Goto fthrow
        endif
        Seek _begin 
        Return
      endif
    endif
    LOGSTR str("bbound")
    if bBoundDist < 120
      $generateThrowDMG(160, b)

      tries = 5
      label
      tries -= 1
      if tries < 0
        Seek
        Jump
      endif
      if bThrowDMG < ODmgXWeight && Rnd < 0.4
        Goto fthrow
        Seek _begin
      elif uThrowDMG < ODmgXWeight && Rnd < 0.4
        Goto uthrow
        Seek _begin
      elif dThrowDMG < ODmgXWeight && Rnd < 0.4
        Goto dthrow
        Seek _begin
      elif fThrowDMG < ODmgXWeight && Rnd < 0.4
        Goto bthrow
        Seek _begin
      endif
      label
      if Rnd < 0.7
        if Rnd < 0.5
          Goto uthrow
        else
          Goto bthrow
        endif
        Seek _begin 
        Return
      endif
      Return
    endif
    LOGSTR str("ubound")
    if uBoundDist < 350
      $generateThrowDMG(220, u)

      tries = 5
      label
      tries -= 1
      if tries < 0
        Seek
        Jump
      endif
      if bThrowDMG < ODmgXWeight && Rnd < 0.4
        Goto fthrow
        Seek _begin
      elif uThrowDMG < ODmgXWeight && Rnd < 0.4
        Goto uthrow
        Seek _begin
      elif dThrowDMG < ODmgXWeight && Rnd < 0.4
        Goto dthrow
        Seek _begin
      elif fThrowDMG < ODmgXWeight && Rnd < 0.4
        Goto bthrow
        Seek _begin
      endif
    endif
    label

    LOGSTR str("all out")
    $generateThrowDMG(80, any)

    Seek _begin

    if ODmgXWeight < dThrowDMG && Rnd < 0.5
      Goto dthrow
      Return
    elif ODmgXWeight < uThrowDMG && Rnd < 0.8
      Goto uthrow
      Return
    endif

    if fBoundDist < bBoundDist
      Goto fthrow
      Return
    else
      Goto bthrow
      Return
    endif
    LOGSTR str("end")
  endif
  Return
endif
Return

label fthrow
  Stick 1 0
  moveVariant = mv_fthrow
Return

label bthrow
  Stick (-1) 0
  moveVariant = mv_bthrow
Return

label uthrow
  Stick 0 1
  moveVariant = mv_uthrow
Return

label dthrow
  Stick 0 (-1)
  moveVariant = mv_dthrow
Return
Return
Return
