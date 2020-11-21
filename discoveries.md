here's where I'll log massive discoveries i've made while editing
AI:

- AIPD entires control what things are acceptable states to be in. This means
  that if you're already in one of the acceptable states, nothing will change.
- the `unk` value at the top of some scripts is some sort of pointer to another
  hidden script that we probably don't have access to. In the case of `10A0`,
  for instance, it cleared out var10 and var11 for some reason, which was heavily
  affecting my edgeguarding.
  - Set it to `0x0` to mitigate these side effects.
  - I would imagine that my prior theory about the strings was correct too, where
    the strings act as entry points of some sort for that exact thing to happen
- `ai_common` in the `fighter common` pac might seem to go without much use at first,
  but upon further inspection in ghidra it is quite important.
  - a pointer to `MiscData0` is stored in `aiMgr` (`0x138`), and this is address is used in
    the return value of `getAiReferPar`. Thus, `MiscData0` is actually a collection of
    "reference parameters." there are exactly 54 entries, each `0x20` in size.
  - a pointer to `MiscData1` is stored in `aiMgr` (`0x13C`), and this is used in
    the return value of `getAiSystemPar`. These appear to be a series of floats
    that are 4 bytes in size each, totaling in 33 values.
  - a pointer to `CE_common` is stored in `aiMgr` (`0x134`), and is used in the
    `act_change` function as a parameter in `get_script`. This seems to be how the AI
    system is able to default to these scripts if it doesn't get overridden.
  - a pointer to `ai_common` is also stored, but this appears to just be responsible
    for allocation and deallocation in memory