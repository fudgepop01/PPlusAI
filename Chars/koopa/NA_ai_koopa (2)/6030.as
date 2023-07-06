#snippet Jab
if frameCounter >= 3 && Rnd < 0.3
    frameCounter = 0
    Button A
elif Equal HitboxConnected 1 && Rnd < 0.8
    frameCounter = 0
    Button A
endif
#endsnippet