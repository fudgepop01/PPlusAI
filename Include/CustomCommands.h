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

cmd GetYDistFloorOffset : 0x3B variable xOffset yOffset opponent

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
cmd CalcKnockback : 0x43 variable damage atkDamage bkb kbg targetWeight isWeightDependent

/// calcs the Y change of a fighter
cmd CalcYChange : 0x44 variable frameCount ySpeed gravity maxFallSpeed fastFallSpeed shouldFastFall

cmd SetAutoDefend : 0x45 oneOrZero

cmd SetDisabledMd : 0x46 mdValue

cmd RetrieveFullATKD : 0x47 unkVar startVar endVar xMinVar xMaxVar yMinVar yMaxVar subactionID opponent

//AI TRACKING CODES

/// configurable opponent option tracking
/// 1 for "approach"
/// 2 for "defend"
/// ---
/// 0 for "null"
/// 1 for "attack"
/// 2 for "grab"
/// 3 for "defend"
cmd trackOAction : 0x50 managertype actiontype

/// predicts option of opponent based on tracked data and stores in variable
/// 1 = "attack"
/// 2 = "grab"
/// 3 = "defend"
/// lookamount = value / 100 (for LevelValue support)
cmd predictOOption : 0x51 variable managertype lookamount 

/// returns how confident the prediction is 
cmd predictionConfidence : 0x52 variable managertype lookamount

/// averages the prediction values
cmd predictAverage : 0x53 variable managertype lookamount

/// adds 1 to the current prediction (effectively treats as a counter)
cmd incrementPrediction : 0x54 managertype

/// obtains the current value stored in the prediction
cmd getCurrentPredictValue : 0x55 variable managerType


// MISSING OPERATOR CODES
cmd OR : 0x60 variable op1 op2
cmd AND : 0x61 variable op1 op2
cmd LSHIFT : 0x62 variable op1 op2
cmd RSHIFT : 0x63 variable op1 op2
cmd MOD : 0x64 variable op1 op2
cmd COS : 0x65 variable value
cmd SIN : 0x66 variable value

// ITEM CODES
cmd GetItemLocFromIdx : 0x70 variable1 variable2 idx
cmd GetArticleOfTypeAtTarget : 0x71 variable1 variable2 type opponent
cmd GetArticleOfTypeLoc : 0x72 variable1 variable2 type

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
