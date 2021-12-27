#snippet OFFENSIVE_ONSTAGE_MOVES
    if rndChoice < 0.5
        Call FAir
    elif rndChoice < 0.8
        Call NAir
    else
        Call UAir
    endif
#endsnippet

#snippet EDGEGUARD_ABOVE_MOVES
    if rndChoice < 0.5
        Call BAir
    elif rndChoice < 0.8
        Call UAir
    else
        Call NAir
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