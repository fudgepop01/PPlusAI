cmd RetrieveATKD : 0x33 startVar subaction @opponent
///Allows/Suppresses AI routine switch by system
cmd ToggleSwitch : 0x34

//C++ INJECTIONS START HERE

//INFO-GETTING CODES
cmd GetRaBit : 0x35 variable index opponent
cmd GetRaBasic : 0x36 variable index opponent
cmd GetRaFloat : 0x37 variable index opponent

cmd GetLaBit : 0x38 variable index opponent

/// 0x4F = consecutive ledge grab counter
cmd GetLaBasic : 0x39 variable index opponent
cmd GetLaFloat : 0x3A variable index opponent

cmd GetYDistFloorOffset : 0x3B variable offset opponent

// cmd GetMoveFrequency : 0x3D variable move stale opponent

/// if a teammate is closer to the target and not in hitstun,
/// this will return 1
cmd GetIsTeammateCloser : 0x3E variable

cmd CalcYChangeWithGravity : 0x3F variable framecount opponent

//AI COMMAND CODES

/// makes the AI taunt.
/// 1 for "up"
/// 2 for "side"
/// 3 for "down"
cmd Taunt : 0x40 direction

/// changes the AI mode of operation
/// AND sets the script
cmd SetAIMD : 0x41 md script

/// changes the target to another random valid
/// target (if possible)
cmd SwitchTarget : 0x42

/// clears the button input
/// particularly useful when dealing with md 3
cmd ClearButton : 0x43

//DEBUGGING CODES

/// injects custom values into the debugger if it's active
cmd SAFE_WRITE_0 : 0xB0 variable
cmd SAFE_WRITE_1 : 0xB1 variable
cmd SAFE_WRITE_2 : 0xB2 variable
cmd SAFE_WRITE_3 : 0xB3 variable
cmd SAFE_WRITE_4 : 0xB4 variable
cmd SAFE_WRITE_5 : 0xB5 variable
cmd SAFE_WRITE_6 : 0xB6 variable
cmd SAFE_WRITE_7 : 0xB7 variable
cmd SAFE_WRITE_8 : 0xB8 variable
cmd SAFE_WRITE_9 : 0xB9 variable
cmd SAFE_WRITE_A : 0xBA variable
cmd SAFE_WRITE_B : 0xBB variable
cmd SAFE_WRITE_C : 0xBC variable
cmd SAFE_WRITE_D : 0xBD variable
cmd SAFE_WRITE_E : 0xBE variable
cmd SAFE_WRITE_F : 0xBF variable

/// injects custom values if the debugger is an active code
/// otherwise leaves the variable untouched
cmd SAFE_INJECT_0 : 0xC0 variable
cmd SAFE_INJECT_1 : 0xC1 variable
cmd SAFE_INJECT_2 : 0xC2 variable
cmd SAFE_INJECT_3 : 0xC3 variable
cmd SAFE_INJECT_4 : 0xC4 variable
cmd SAFE_INJECT_5 : 0xC5 variable
cmd SAFE_INJECT_6 : 0xC6 variable
cmd SAFE_INJECT_7 : 0xC7 variable
cmd SAFE_INJECT_8 : 0xC8 variable
cmd SAFE_INJECT_9 : 0xC9 variable
cmd SAFE_INJECT_A : 0xCA variable
cmd SAFE_INJECT_B : 0xCB variable
cmd SAFE_INJECT_C : 0xCC variable
cmd SAFE_INJECT_D : 0xCD variable
cmd SAFE_INJECT_E : 0xCE variable
cmd SAFE_INJECT_F : 0xCF variable


//Drawing codes
cmd DrawDebugPoint : 0xD0 x y red green blue alpha
cmd DrawDebugLine : 0xD1 x1 y1 x2 y2 red green blue alpha
cmd DrawDebugRectOutline : 0xD2 cx cy width height red green blue alpha

// changes the overlay color for a character
cmd EnableDebugOverlay : 0xE0
cmd DisableDebugOverlay : 0xE1
cmd SetDebugOverlayColor : 0xE2 red green blue alpha

///logs a value to the console
cmd LOGVAL : 0xF0 value

///logs up to 16 ASCII characters to the console
///every 3 characters are encoded as a number. just use the
///preprocessor str() function
cmd LOGSTR : 0xF1 p1 p2 p3 p4 p5
