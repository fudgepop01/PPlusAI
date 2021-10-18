#include <Definition_AIMain.h>
id 0x8301
unk 0x0

str "*"
str "ADJUST MOVES"
str "x min"
str "x max"
str "y min"
str "y max"

SetTimeout 6000
label begin
Cmd30
#let xmin = var0
#let xmax = var1
#let ymin = var2
#let ymax = var3

SAFE_INJECT_0 xmin
SAFE_INJECT_1 xmax
SAFE_INJECT_2 ymin
SAFE_INJECT_3 ymax

#let xStart = var5
#let yStart = var6

if Equal OAnimFrame 1
  xStart = OTopNX
  yStart = OTopNY

  LOGSTR str("CONVERSION")
  LOGVAL xmin
  globTempVar = ymin * -1
  LOGVAL globTempVar
  globTempVar = xmax - xmin
  globTempVar *= 0.5
  LOGVAL globTempVar
  globTempVar = ymax - ymin
  globTempVar *= 0.5
  LOGVAL globTempVar
endif

#let cx = var7
#let cy = var8

globTempVar = xmax - xmin
globTempVar *= 0.5
cx = globTempVar + xmin
cx *= ODirection
cx += xStart
immediateTempVar = ymax - ymin
immediateTempVar *= 0.5
cy = immediateTempVar + yStart + ymin

DrawDebugRectOutline cx cy globTempVar immediateTempVar color(0x00FF00DD)

if Equal OCurrAction hex(0x10)
  Call NAir
endif
Return
Return