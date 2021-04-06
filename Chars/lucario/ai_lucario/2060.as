#snippet OFFENSIVE_ONSTAGE_MOVES
    if rndChoice < 0.1
        Call USpecial
    elif rndChoice < 0.35
        Call DAir
    else
        Call FAir
    endif
#endsnippet

#snippet EDGEGUARD_ABOVE_MOVES
    Call BAir
#endsnippet

#snippet EDGEGUARD_BELOW_MOVES
    if OYDistBackEdge > 35
        Call DAir
    else
        Call BAir
    endif
#endsnippet