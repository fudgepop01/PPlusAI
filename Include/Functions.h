///This value is a threshold which means the opponent is far.
func AIPDFloat1 : 0x0

///This value is a threshold which means the opponent is in middle distance.
func AIPDFloat2 : 0x1

///Returns direction of the character.
///If the character is facing left,-1,otherwise,1
func Direction : 0x2

///Returns the position of the opponent.
///If the opponent is in left side of the character,-1,otherwise,1.
func OPos : 0x3

///Returns X coordinate of the character.
func XCoord : 0x4

///Returns X coordinate of the opponent.
func OXCoord : 0x5

///Returns the distance between the character and an edge in which side the opponent is.
func DistToOEdge : 0x6

///Returns how many frames has passed since current execution of the routine started.
func NumFrames : 0x7

///Returns X speed of the character
func XSpeed : 0x8

///Always returns 0.This is used to initiate a vector.
func Zero : 0x9

///Always returns 1.
func One : 0xA

///Returns Y coordinte of the character.
func YCoord : 0xB

///Returns Y coordinate of the opponent character.
func OYCoord : 0xC

///Returns Y speed of the character.
func YSpeed : 0xD

///Returns random value.
///0<=Rnd<=X*0.01 : X%
func Rnd : 0xE

///Returns remain jump count
func NumJumps : 0xF

///Returns the distance between the character and the edge in front of him.
func DistFrontEdge : 0x10

///Returns level value of the character.
///Level9=100 Level1=0
func LevelValue : 0x11

///Random X offset for attacks (only within 603X and 604X)
func RandXOffset : 0x12

///Unknown
func Func13 : 0x13

///Returns X coordinate of an object like PK thunder.
func ObjXCoord : 0x14

///Returns Y coordinate of an object like PK thunder.
func ObjYCoord : 0x15

///Returns X speed of the opponent
func OXSpeed : 0x16

///Returns Y speed of the opponent
func OYSpeed : 0x17

///Returns X speed of an object like PK thunder.
func ObjXSpeed : 0x18

///Returns Y speed of an object like PK thunder.
func ObjYSpeed : 0x19

///Returns X coordinate of the character's landing collision.
func ExactXCoord : 0x1A

///Returns Y coordinate of the character's landing collision.
func ExactYCoord : 0x1B

///Returns X coordinate of the opponent's landing collision
func ExactOXCoord : 0x1C

///Returns Y coordinate of the opponent's landing collision.
func ExactOYCoord : 0x1D

///Returns the damage of the character.
func Damage : 0x1E

///Returns the damage of the opponent.
func ODamage : 0x1F

///9 = 30
///8 = 27.5
///7 = 20
///6 = 14
///5 = 11
///4 = 5.5
///3 = 0.5
///2 = 0
///1 = 0
///0 = 0
func Rank : 0x20

func GetJumpHeight : 0x21
func GetJumpLength : 0x22

func GetAirHigh : 0x23
func GetAirLength : 0x24

///Returns opponent's direction.
///If the opponent is facing left,-1,otherwise,1
func ODirection : 0x25

///Returns the opponent's jump count
func ONumJumps : 0x26

///Returns the character's hurtbox size.
func HurtboxSize : 0x27

///Returns the opponent's hurtbox size.
func OHurtboxSize : 0x28
// 0x8091e430

///Returns the distance between the character and the edge behind the character.
func DistBackEdge : 0x29

///Returns bottom boundary of the stage.
func BBoundary : 0x2A

///Returns top boundary of the stage.
func TBoundary : 0x2B

///Returns left boundary of the stage.
func LBoundary : 0x2C

///Returns right boundary of the stage.
func RBoundary : 0x2D

///Returns the distance between the character and the top boundary.
func DistTop : 0x2E
