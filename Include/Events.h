///Always true
event True : 0x0

///This situation happens when the opponent is recoverying
event MeteoChance : 0x1

///[OBSOLETE]Do not use this name
event ev1 : 0x1

///When the opponent is in high sky above, triggered
event OInHigh : 0x2

///[OBSOLETE]Don't use this name
event ev2 : 0x2

///Has something to do with stage
event ev3 : 0x3

///The opponent is in front of the character and X distance is large
event fXFar : 0x4

///The opponent is in front of the character and X distance is intermediate
event fXMiddle : 0x5

///The opponent is in front of the character and X distance is close
event fXClose : 0x6

///The opponent is in the back of the character
event Back : 0x7

//The opponent is far from the character
event Far : 0x8

///The opponent and the character are on the same plane.
event SamePlane : 0x9

///The character is lying on the ground
event Lying : 0xA

///The character can jump(neither jump count is 0 nor already used up-b)
event CanJump : 0xB

///If the character is Mario and in air and hasn't use his cape yet,triggered
event MarioCape : 0xC

///The character full-charged something like Mario's water,samus's charge shot
event FullCharge : 0xD

///If the character is pokemon trainer and the character is tired,triggered
event PokemonTired : 0xE

///Becomes true when the character is diddy and just ended his side-b
event DiddyCling : 0xF

///The character is gliding
event Gliding : 0x10

///The character is falling with accelerating speed
event AccelFall : 0x11

///The character is in air
event InAir : 0x12

///The opponent is in front of the character
event fVeryClose : 0x13

///The opponent's X coordinate and the character's are close together
event XVeryClose : 0x14

///Close enough to recover using jump
event JumpRecoverRange : 0x15

///[OBSOLETE]Don't use this
event ev15 : 0x15

///Peach is hovering
event PeachHover : 0x16

///Opponent is very close to the character or in his back
event VeryCloseOrBack : 0x17

///Not in state of MeteoChance,too far,not on the same plane,in the air 
///but in the state of the opponent is in high sky
event Not1_4_9_12And2 : 0x18

///Snake is using up-b
event SnakeUpB : 0x19

///The opponent is being blown because of some attack
event OBlown : 0x1A

///The opponent is special-falling
event OSFall : 0x1B

///Ice climbers is relavant to this
event ev1C : 0x1C

///Diddy hasn't created 2 bananas
event DiddyBanana : 0x1D