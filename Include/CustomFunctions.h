///Returns the current action of the character.
func CurrAction : 0x2F

///Returns the current action of the opponent.
func OCurrAction : 0x12F

///Returns the previous action of the character.
func PrevAction : 0x30

///Returns the previous action of the opponent.
func OPrevAction : 0x130

///Returns the current subaction of the character.
func CurrSubaction : 0x31

///Returns the current subaction of the opponent.
func OCurrSubaction : 0x131

///Returns the animation frame counter of the character.
func AnimFrame : 0x32

///Returns the animation frame counter of the opponent.
func OAnimFrame : 0x132

///Returns X speed from the character only.
func CharXSpeed : 0x33

///Returns X speed from the opponent only.
func OCharXSpeed : 0x133

///Returns Y speed from the character only.
func CharYSpeed : 0x34

///Returns Y speed from the opponent only.
func OCharYSpeed : 0x134

///Returns X speed from knockback only.
func KBXSpeed : 0x35

///Returns X speed from knockback only.
func OKBXSpeed : 0x135

///Returns Y speed from knockback only.
func KBYSpeed : 0x36

///Returns Y speed from knockback only.
func OKBYSpeed : 0x136

///Returns overall speed from knockback only.
func KBSpeed : 0x37

///Returns overall speed from knockback only.
func OKBSpeed : 0x137

///Returns the trajectory of knockback received in degrees, or -1 if no KB.
func KBAngle : 0x38

///Returns the trajectory of knockback received in degrees, or -1 if no KB.
func OKBAngle : 0x138

///Returns X speed from all sources combined.
func TotalXSpeed : 0x39

///Returns X speed from all sources combined.
func OTotalXSpeed : 0x139

///Returns Y speed from all sources combined.
func TotalYSpeed : 0x3A

///Returns Y speed from all sources combined.
func OTotalYSpeed : 0x13A

///Returns X coordinate of the base of the character.
func TopNX : 0x3B

///Returns X coordinate of the base of the opponent.
func OTopNX : 0x13B

///Returns Y coordinate of the base of the character.
func TopNY : 0x3C

///Returns Y coordinate of the base of the opponent.
func OTopNY : 0x13C

///Returns Y coordinate of the character's landing collision.
func SCDBottom : 0x3D

///Returns Y coordinate of the opponent's landing collision.
func OSCDBottom : 0x13D

///Returns the maximum non-fastfall speed of the character.
func MaxFallSpeed : 0x3E

///Returns the maximum non-fastfall speed of the opponent.
func OMaxFallSpeed : 0x13E

///Returns the number of frames since leaving the ground
func AirTime : 0x3F

///Returns the number of frames since leaving the ground
func OAirTime : 0x13F

///Returns the air/ground state of the character.
///Ground 1, Air 2, Ledge 3
func AirGroundState : 0x40

///Returns the air/ground state of the opponent.
///Ground 1, Air 2, Ledge 3
func OAirGroundState : 0x140

///Returns the number of frames of hitlag remaining.
func FramesHitlag : 0x41

///Returns the number of frames of hitlag remaining.
func OFramesHitlag : 0x141

///Returns the number of frames of hitstun remaining.
func FramesHitstun : 0x42

///Returns the number of frames of hitstun remaining.
func OFramesHitstun : 0x142

///Returns the number of frames since pressing the shield button
func FramesSinceShield : 0x43

///Returns the number of frames since pressing the shield button
func OFramesSinceShield : 0x143

///Returns the number of hits the character has received without leaving hitstun.
func ComboedCount : 0x44

///Returns the number of hits the opponent has received without leaving hitstun.
func OComboedCount : 0x144

///Returns 1 if the character's attack has connected, and 0 if it has not.
func HitboxConnected : 0x45

///Returns 1 if the opponent's attack has connected, and 0 if it has not.
func OHitboxConnected : 0x145

///Returns 1 if the character is FastFalling, and 0 if they are not.
func IsFastfalling : 0x46

///Returns 1 if the opponent is FastFalling, and 0 if they are not.
func OIsFastfalling : 0x146

///Returns the X distance between the character and the edge in front of the character.
func XDistFrontEdge : 0x47

///Returns the X distance between the opponent and the edge in front of the character.
func OXDistFrontEdge : 0x147

///Returns the X distance between the character and the edge behind the character.
func XDistBackEdge : 0x48

///Returns the X distance between the opponent and the edge behind the character.
func OXDistBackEdge : 0x148

///Returns the Y distance between the character and the edge in front of the character.
func YDistFrontEdge : 0x49

///Returns the Y distance between the opponent and the edge in front of the character.
func OYDistFrontEdge : 0x149

///Returns the Y distance between the character and the edge behind the character.
func YDistBackEdge : 0x4A

///Returns the Y distance between the opponent and the edge behind the character.
func OYDistBackEdge : 0x14A

///Returns the Y distance between the character and the floor below the character, or -1 if off stage
func YDistFloor : 0x4B

///Returns the Y distance between the opponent and the floor below the character, or -1 if off stage
func OYDistFloor : 0x14B

///Returns 1 if there is a floor somewhere directly below the character, and 0 if there is not.
func IsOnStage : 0x4C

///Returns 1 if there is a floor somewhere directly below the opponent, and 0 if there is not.
func OIsOnStage : 0x14C

///Returns X coordinate of an article of the opponent
func OArticleXCoord : 0x4D

///Returns X coordinate of an article of the opponent
func OArticleYCoord : 0x4E

///Returns X coordinate of an article of the opponent
func OArticleXSpeed : 0x4F

///Returns X coordinate of an article of the opponent
func OArticleYSpeed : 0x50

// C++ INJECTIONS START HERE

///returns the "mode" that the AI is in
func AIMD : 0x51
func OAIMD : 0x151

///self-explanatory
func PlayerNum : 0x52
func OPlayerNum : 0x152

/// how many times the current action appears in the
/// stale-move queue
func CurrActionFreq : 0x53
func OCurrActionFreq : 0x153

/// if the character can pass through the ground
func IsOnPassableGround : 0x54
func OIsOnPassableGround : 0x154

/// if the character can cancel their current attack
func CanCancelAttack : 0x55
func OCanCancelAttack : 0x155

/// character's weight stat
func Weight : 0x56
func OWeight : 0x156

/// character's gravity stat
func Gravity : 0x57
func OGravity : 0x157

/// character's fast fall speed
func FastFallSpeed : 0x58
func OFastFallSpeed : 0x158

/// endframe of O's current animation
func EndFrame : 0x59
func OEndFrame : 0x159

/// width of ECB
func Width : 0x5A
func OWidth : 0x15A

/// centerX
func CenterX : 0x5B
func OCenterX : 0x15B

/// centerY
func CenterY : 0x5C
func OCenterY : 0x15C

func PlayerCount : 0x5D

/// functional stack pop
func STACK_POP : 0x5E

// long-term-frame stack read
func LTF_STACK_READ : 0x5F

/// current training script selected
/// 0xFFFF = default
func TrainingScript : 0x60

func ActionTimer : 0x70
func OActionTimer : 0x170

/// FETCH PERSONALITY TRAIT VALUES WITH THESE
func PT_AGGRESSION : 0x80
func PT_BAIT_DASHAWAYCHANCE : 0x81
func PT_BAIT_WDASHAWAYCHANCE : 0x82
func PT_BAITCHANCE : 0x83
func PT_BRAVECHANCE : 0x84
func PT_CIRCLECAMPCHANCE : 0x85
func PT_DJUMPINESS : 0x86
func PT_JUMPINESS : 0x87
func PT_PLATCHANCE : 0x88
func PT_SDICHANCE : 0x89
func PT_WALL_CHANCE : 0x8A
func PT_REACTION_TIME : 0x8B

/// TEMPORARY FOR TOGGLING DEBUG CODE
func TEMP_DEBUG_TOGGLE : 0xFF