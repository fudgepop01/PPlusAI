#snippet AT_CONDITIONS
  if Equal approachType at_defend && OFramesHitstun < 1
    CallI DefendHub
  else
    LOGSTR str("APPROACHING")
    CallI ApproachHub
  endif
#endsnippet

#snippet AGS_CHECK
if !(Equal AirGroundState 2)
  Call AIHub
endif
#endsnippet