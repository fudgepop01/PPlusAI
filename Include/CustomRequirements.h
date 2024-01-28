///If lhs=rhs, returns true
req Equal : 0x1020 lhs rhs

req IsStage : 0x1021 ID

//C++ INJECTIONS START HERE

/// for efficient use with personality trait values
req CHANCE_MUL_LE : 0x1022 trait multiplier
req CHANCE_MUL_GE : 0x1023 trait multiplier

/// if the script listed was called anywhere in the stack
req CalledFrom : 0x1024 AIID

/// if the fighter has turbo/curry 
req HasCurry : 0x1025

/// if blastzone wrapping is enabled (volatile)
req DangerEnabled : 0x1026

/// if the current animation of the target has a throw release that should be teched
req ShouldTechThrow : 0x1027

/// if the fighter did NOT input jump on the previous frame
req NoJumpPrevFrame : 0x1028

/// if the fighter is currently being thrown
req GettingThrown : 0x1029
