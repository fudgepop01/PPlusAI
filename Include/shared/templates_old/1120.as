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
ODmgXWeight = OWeight

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
    $clearMovesUsed()
    $refreshMoves()
    $excludeMovesNotOrigin(grab)
    $excludeMovesNamed(grab)
    $output(Goto)

    #let result = var2
    KILL_CHECK(result, move_currKnockback, move_angle, TopNX, TopNY)
    immediateTempVar = LevelValue * 0.7
    if Equal result 1 && Rnd <= immediateTempVar
      LOGSTR str("will kill")
      Goto execThrow
      Return
    endif

    #let result = var2
    MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 60, 0, 45, 20, 180)
    if Equal result 1 && Rnd <= 0.8
      LOGSTR str("combo")
      Goto execThrow
      Return
    endif

    MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 120, 50, 150, -200, 200)
    if Equal result 1 && Rnd <= 0.8
      TO_NEAREST_BLASTZONE(result, move_angle)
      if Equal result 1
        LOGSTR str("control")
        Goto execThrow
        Return
      endif
    elif Equal result 1 && Rnd <= 0.2
      LOGSTR str("yeet")
      Goto execThrow
      Return
    elif Rnd <= 0.02
      LOGSTR str("yeet")
      Goto execThrow
      Return
    endif
  endif
endif
Return

$generateMovesUsedKB()

label execThrow
  if Equal moveVariant mv_fthrow
    Stick 1 0
  elif Equal moveVariant mv_bthrow
    Stick -1 0
  elif Equal moveVariant mv_uthrow
    Stick 0 1
  elif Equal moveVariant mv_dthrow
    Stick 0 (-1)
  endif
Return
Return
