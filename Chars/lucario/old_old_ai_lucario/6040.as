#snippet POST_HOOKS
  if Equal HitboxConnected 1
    if CalledAs DAir
      if frameCounter >= 11 || Equal moveVariant mv_dair_weak
        Call ComboHub
      endif
    else
      Call ComboHub
    endif
  endif
#endsnippet