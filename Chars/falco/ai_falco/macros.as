#macro POSITION_CALC_OVERRIDES()
    if Equal lastAttack valSSpecialAir || Equal lastAttack valDSpecialAir
        globTempVar = TopNY
    endif
#endmacro