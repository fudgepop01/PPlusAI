#snippet OFFENSIVE_ONSTAGE_MOVES
    if rndChoice < 0.4
        Call NAir
    elif rndChoice < 0.8
        Call DAir
    else
        Call BAir
    endif
#endsnippet

#snippet EDGEGUARD_ABOVE_MOVES
    if rndChoice < 0.5
        Call BAir
    else
        Call DAir
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