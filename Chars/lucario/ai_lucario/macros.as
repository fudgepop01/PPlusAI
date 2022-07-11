#macro LUC_CANCEL_CHECK(varName, target)
  $tempVar({varName}, {target})
  GetRaBit {varName} hex(0x20) 0
  if {varName} < 1
    GetRaBit {varName} hex(0x21) 0
    if {varName} < 1
      GetRaBit {varName} hex(0x22) 0
      if {varName} < 1
        GetRaBit {varName} hex(0x23) 0
      endif
    endif
  endif
#endmacro