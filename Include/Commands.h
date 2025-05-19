///Terminate the execution of the module.
cmd Finish : 0x0

///[Not recommended to use]Binds a variable to a variable
///This can be done by varX=value
cmd SetVar : 0x1 variable value

///Binds a vector to a vector
cmd SetVec : 0x2 vector value

///[Not recommended to use]Insert a label
///This can be done by label *labelname*
cmd Label : 0x3 @ID

///Rests the execution for a frame and go to a label which was seeked before
cmd Return : 0x4

///Seeks a next label
cmd Seek : 0x5

///Seeks a label whose ID is specified with an argument
cmd Seek : 0x5 ID

///[Not recommended to use]Executes following codes if the requirements are true.
///This can be done by if *requirements*
cmd If : 0x6 ReqID @args

///[Not recommended to use]Executes following codes if NOT the requirements are true.
///This can be done by if !(*requirement*)
cmd IfNot : 0x7 ReqID @args

///[Not recommended to use]Executes following codes if previous if block wasn't executed
///This can be done by else
cmd Else : 0x8

///[Not recommended to use]Closes an if block
///This can be done by endif
cmd EndIf : 0x9

///Directs the stick. The positive direction of X coord is the direction to which the character faces.
cmd Stick : 0xA x @y

///Pushes buttons. You can specify multiple buttons by ORing them like this: A|B
///Button list:A B R X
cmd Button : 0xB buttonVal

///[Not recommended to use]Adds a value to a variable.
///This can be done by varX+=value1
cmd Add : 0xC variable value1 @additionalValues

///[Not recommended to use]Adds a value to a variable.
///This can be done by varX-=value1
cmd Sub : 0xD variable value1 @additionalValues

///[Not recommended to use]Adds a value to a variable.
///This can be done by varX*=value1
cmd Mul : 0xE variable value @additionalValues

///[Not recommended to use]Adds a value to a variable.
///This can be done by varX/=value1
cmd Div : 0xF variable value @additionalValues

///Adds vectors to a vector variable
cmd AddVector : 0x10 vector vec1 @additionalVecs

///Adds vectors to a vector variable
cmd SubVector : 0x11 vector vec1 @additionalVecs

///Multiplies elements of vectors element by element.
///This is neither dot product nor cross product.
cmd MulVector : 0x12 vector vec1 @additionalVecs

///Divides elements of vectors element by element.
cmd DivVector : 0x13 vector vec1 @additionalVecs

///Immediately goes to a label which was seeked before
cmd Jump : 0x14

///Stores a random value(0<x<1)
cmd Random : 0x15 variable
///Stores a random value(base<x<base+length)
cmd Random : 0x15 variable base length
///Not fully understood
cmd Random : 0x15 variable base length unknown revision

///[Not recommended to use]Additional OR requirement
///You can do this by || requirement
cmd Or : 0x16 ReqId @args

///[Not recommended to use]Additional NOR requirement
///You can do this by || !requirement
cmd OrNot : 0x17 ReqId @args

///[Not recommended to use]Additional AND requirement
///You can do this by && requirement
cmd And : 0x18 ReqId @args

///[Not recommended to use]Additional NAND requirement
///You can do this by && !requirement
cmd AndNot : 0x19 ReqId @args

///Sets current execution frame
cmd SetFrame : 0x1A frames

///Calls another module
cmd Call : 0x1B @AIID

///Jumps to a label immediately.
///This command saves previous location and you can return there using Return
cmd Goto : 0x1C ID

///Gets the next best "return goal" as calculated by the game
cmd GetReturnGoal : 0x1D variable

///Calculates absolute value and restore it
cmd Abs : 0x1E variable

///Directs the stick. The positive direction of X coord is right.
cmd AbsStick : 0x1F x @y

///There are no scripts that use this
/// Wait until on ground before continuing the script
cmd WaitForGround : 0x20

///Something to do with moving character
/// possibly execute wait?
/// Wait until on ground and actionable before continuing the script
cmd WaitForGroundCanAct : 0x21

///Sets execution timeout
/// max num frames a routine can last naturally
cmd SetTimeout : 0x22 timeout

///If the character is out of stage and the distance to edge is larger than the argument,stops execution of current routine.
cmd EdgeCheck : 0x23 distance

///Estimates time for the opponent to pass the specified x coordinate.
cmd EstOPassTimeX : 0x24 variable xcoord

///Estimates time for the opponent to pass the specified y coordinate.
cmd EstOPassTimeY : 0x25 variable ycoord

///Gets remaining time of the shield
cmd GetShieldRemain : 0x26 variable

///Gets random coordinate on the plane.
cmd GetRndPointOnStage : 0x27 variable

///Estimates the opponent's x coordinate after "time" passes
cmd EstOXCoord : 0x28 variable time

///Estimates the opponent's y coordinate after "time" passes
cmd EstOYCoord : 0x29 variable time

///Does dice roll to determine next attack
cmd AtkDiceRoll : 0x2A slot

///Presumably this was used to break debugger.
///Debugging interface of AIScriptpad uses this command to set breakpoint.
///This command is valid only when using debugging code.
cmd Breakpoint : 0x2B

///Presumably this was used to break debugger.
///Debugging interface of AIScriptpad uses this command to set breakpoint.
///This command is valid only when using debugging code.
///Also,because this is a definition for compiler,the argument is discarded.
cmd Breakpoint : 0x2B number

///Gets the length of given vector
cmd Norm : 0x2C variable x y

///Gets the dot product of given vectors
cmd Dot : 0x2D variable x1 y1 x2 y2

///Estimates the opponent's position after *second* passed and calculate vector from the current position of the character
/// stores vector in argument variables
cmd EstOPosVecR : 0x2E variable1 variable2 second

///Something attack range related
/// still no idea how the end result works until i know what r23 and f27 are
/// Attack Range Related
/// local_c8 = double converted item range
/// dvar27 = base range
/// if dvar27 < 0.2
/// variable = 0.2
/// weapon range
cmd Cmd2F : 0x2F variable baseRange

///Always used with AtkDiceRoll and cmd2F. This seems to restrict characters' move
/// Calls swingChkSet with 0 as the argument
/// Seems to prevent CPU from attacking for that frame(?)
cmd Cmd30 : 0x30

///Gets nearest cliff coordinate
cmd GetNearestCliff : 0x31 variable

///Clears stick input
///direction: If 0,clear X. Else,clear Y.
///With no argument specified,clears both.
cmd ClearStick : 0x32 @direction