///If the character is in certain range, returns true
req XDistLE : 0x1000 distance

///If the character is minDist<X<maxDist,returns true
req XDistLE : 0x1000 minDist maxDist

///If the opponent is in certain range, returns true
req ODistLE : 0x1001 distance

///If the current execution frame is greater than the argument, returns true.
req FrameGE : 0x1002 frames

///If the character is in idle state, returns true.
req Idling : 0x1003

///If the character is dashing, returns true.
req Dashing : 0x1004

///If the character is in air, returns true.
req InAir : 0x1005

//req6 is empty

///Don't use this.
req GT : 0x1007

///Don't use this.
req LT : 0x1008

///Don't use this.
req GE : 0x1009

///Don't use this.
req LE : 0x100A

///If the character is able to throw someone, returns true.
req CanThrow : 0x100B

///If current routine was called with the ID,returns true.
req CalledAs : 0x100C AIID

///If the charaacter is out of stage, returns true.
req OutOfStage : 0x100D

///Not sure but used in some files
req InAirOnSaved : 0x100E

///We haven't figured out what action 0x1E and 0x1D mean.
req Act1EOr1D : 0x100F

///Still being Researched
req Act1EOr1D : 0x100F zeroToTwo

///If any character is within certain range, returns true.
req CharDistLE : 0x1010

///If the result of AtkDiceRoll is the routine specified with the argument,returns true.
req DiceRollResult : 0x1011 AIID

///If the character is outside of the stage and falling,returns true.
req Falling : 0x1012

///If the character is invincible,returns true.
req Invincible : 0x1013

///If the character is grabbing someone, returns true.
req Grabbing : 0x1014

///Unknown. Mode has something to do with this.
req ModeRelated : 0x1015

///If a character who is in normal state is within certain range, returns true.
req NormCharDistLE : 0x1016

///If the opponent is attacking, returns true.
req OAttacking : 0x1017

///If the opponent is using the attack with the value specified, returns true.
req OAttacking : 0x1017 val

///If the nearest edge hangs no character, returns true.
req NoOneHanging : 0x1018

///The opponent is performing attack in close range
req OCol : 0x1019

///If the opponent is hanging cliff using wire,returns true.
req OWiring : 0x101A

///If the opponent is in air,returns true.
req OInAir : 0x101B

///If the character is caught by someone,returns true.
req IsCaught : 0x101C

///If there are no opponents,returns true.
req NoOpponent : 0x101D

///If the character is the character specified with an argument,returns true.
req IsCharOf : 0x101E charID

///If the opponent is the character specified with an argument,returns true.
req OIsCharOf : 0x101F charID

///Always true
req True : 0x0

///This situation happens when the opponent is recoverying
req MeteoChance : 0x1

///[OBSOLETE]Do not use this name
req ev1 : 0x1

///When the opponent is in high sky above, triggered
req OInHigh : 0x2

///[OBSOLETE]Don't use this name
req ev2 : 0x2

///Has something to do with stage
req ev3 : 0x3

///The opponent is in fron of the character and X distance is large
req fXFar : 0x4

///The opponent is in fron of the character and X distance is intermediate
req fXMiddle : 0x5

///The opponent is in fron of the character and X distance is close
req fXClose : 0x6

///The opponent is in the back of the character
req Back : 0x7

//The opponent is far from the character
req Far : 0x8

///The opponent and the character are on the same plane.
req SamePlane : 0x9

///The character is lying on the ground
req Lying : 0xA

///The character can jump(neither jump count is 0 nor already used up-b)
req CanJump : 0xB

///If the character is Mario and in air and hasn't use his cape yet,triggered
req MarioCape : 0xC

///The character full-charged something like Mario's water,samus's charge shot
req FullCharge : 0xD

///If the character is pokemon trainer and the character is tired,triggered
req PokemonTired : 0xE

///Becomes true when the character is diddy and just ended his side-b
req DiddyCling : 0xF

///The character is gliding
req Gliding : 0x10

///The character is falling with accelerating speed
req AccelFall : 0x11

///The character is in air
req rInAir : 0x12

///The opponent is in front of the character
req fVeryClose : 0x13

///The opponent's X coordinate and the character's are close together
req XVeryClose : 0x14

///Close enough to recover using jump
req JumpRecoverRange : 0x15

///[OBSOLETE]Don't use this
req ev15 : 0x15

///Peach is hovering
req PeachHover : 0x16

///Opponent is very close to the character or in his back
req VeryCloseOrBack : 0x17

///Not in state of MeteoChance,too far,not on the same plane,in the air
///but in the state of the opponent is in high sky
req Not1_4_9_12And2 : 0x18

///Snake is using up-b
req SnakeUpB : 0x19

///The opponent is being blown because of some attack
req OBlown : 0x1A

///The opponent is special-falling
req OSFall : 0x1B

///Ice climbers is relavant to this
req ev1C : 0x1C

///Diddy hasn't created 2 bananas
req DiddyBanana : 0x1D