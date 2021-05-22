#snippet OFFENSIVE_ONSTAGE_MOVES
    if rndChoice < 0.4
        Call NAir
    elif rndChoice < 0.8
        Call FAir
    else
        Call DAir
    endif
#endsnippet

#snippet EDGEGUARD_ABOVE_MOVES
    if rndChoice < 0.5
        Call BAir
    else
        Call UAir
    endif
#endsnippet

#snippet EDGEGUARD_BELOW_MOVES
    if OYDistBackEdge < 10
        Call UAir
    elif OYDistBackEdge > 50
        Call DAir
    else
        Call BAir
    endif
#endsnippet