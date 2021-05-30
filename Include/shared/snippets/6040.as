#snippet AT_CONDITIONS
  if Equal approachType at_defend && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
#endsnippet

#snippet AGS_CHECK
if !(Equal AirGroundState 2)
  Call AIHub
endif
#endsnippet