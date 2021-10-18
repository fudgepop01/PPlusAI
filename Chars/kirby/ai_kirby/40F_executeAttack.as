#snippet DSPECIALAIR
  if AnimFrame >= 30 || YDistBackEdge > 0 || Equal HitboxConnected 1
    Button B
    Call MainHub
  endif
#endsnippet

#snippet USPECIAL
  Button B
  Stick 1 (-1)
#endsnippet