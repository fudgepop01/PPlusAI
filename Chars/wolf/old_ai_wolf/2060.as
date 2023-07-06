#snippet OFFENSIVE_ONSTAGE_MOVES
    if rndChoice < 0.3
        Call NAir
    elif rndChoice < 0.5
        Call NSpecial
    elif rndChoice < 0.8
        Call DAir
    else
        Call BAir
    endif
#endsnippet

#snippet EDGEGUARD_ABOVE_MOVES
    if rndChoice < 0.3
        Call BAir
    elif rndChoice < 0.6
        Call DAir
    elif rndChoice < 0.7
        Call NSpecialAir
    else
        Call UAir
    endif
#endsnippet

#snippet EDGEGUARD_BELOW_MOVES
    if OYDistBackEdge < 10
        Call DAir
    elif OYDistBackEdge > 50
        Call BAir
    else
        Call DAir
    endif
#endsnippet