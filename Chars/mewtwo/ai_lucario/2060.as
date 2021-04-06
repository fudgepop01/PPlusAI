#snippet OFFENSIVE_ONSTAGE_MOVES
    if rndChoice < 0.4
        Call UAir
    elif rndChoice < 0.8
        Call NAir
    else
        Call DAir
    endif
#endsnippet

#snippet EDGEGUARD_ABOVE_MOVES
    Call BAir
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