//Automatically collected from OpenSA wiki.
/// Idle/Standing animation.
sact Wait1 : 0x0
/// Second Idle/Standing.
sact Wait2 : 0x1
/// Third Idle/Standing.
sact Wait3 : 0x2
/// Fourth Idle/Standing.
sact Wait4 : 0x3
/// Fifth Idle/Standing.
sact Wait5 : 0x4
/// Idle with Item in hand.
sact WaitItem : 0x5
/// Hand while picking up an item.
sact ItemHandPickUp : 0x6
/// Hand while holding a small item.
sact ItemHandHave : 0x7
/// Hand while holding a battering weapon.
sact ItemHandGrip : 0x8
/// Hand while holding a Trophy Stand.
sact ItemHandSmash : 0x9
/// Slow walk.
sact WalkSlow : 0xA
/// Medium-speed walk. 
sact WalkMiddle : 0xB
/// Fast walk.
sact WalkFast : 0xC
/// Stop walking.
sact WalkBrake : 0xD
/// Initial dash.
sact Dash : 0xE
/// Running.
sact Run : 0xF
/// Stop running.
sact RunBrake : 0x10
/// Face opposite direction.
sact Turn : 0x11
/// Turn while running.
sact TurnRun : 0x12
/// Stop running while turning.
sact TurnRunBrake : 0x13
/// Initial jump, before leaving ground.
sact JumpSquat : 0x14
/// Forward jump.
sact JumpF : 0x15
/// Forward shorthop.
sact JumpF_1 : 0x16
/// Backward jump.
sact JumpB : 0x17
/// Backward shorthop.
sact JumpB_1 : 0x18
/// Forward double jump.
sact JumpAerialF : 0x19
/// Backward double jump.
sact JumpAerialB : 0x1A
/// Second jump (multi-jumpers).
///Charizard, Dedede, Jigglypuff, Kirby, Meta Knight, Pit
sact JumpAerialF_1 : 0x1B
/// Third jump.
///Charizard, Dedede, Jigglypuff, Kirby, Meta Knight, Pit
sact JumpAerialF2 : 0x1C
/// Fourth jump.
///Dedede, Jigglypuff, Kirby, Meta Knight, Pit
sact JumpAerialF3 : 0x1D
/// Fifth jump.
///Dedede, Jigglypuff, Kirby, Meta Knight
sact JumpAerialF4 : 0x1E
/// Sixth jump.
///Dedede, Jigglypuff, Kirby, Meta Knight
sact JumpAerialF5 : 0x1F
/// Normal falling.
sact Fall : 0x20
/// Normal falling while leaning forwards.
sact FallF : 0x21
/// Normal falling while leaning backwards.
sact FallB : 0x22
/// Falling after double jump.
sact FallAerial : 0x23
/// Falling forwards after double jump.
sact FallAerialF : 0x24
/// Falling backwards after double jump.
sact FallAerialB : 0x25
/// Falling after using special move.
sact FallSpecial : 0x26
/// Falling forwards after using special move.
sact FallSpecialF : 0x27
/// Falling backwards after using special move.
sact FallSpecialB : 0x28
/// Tumble animation.
sact DamageFall : 0x29
/// Crouching animation.
sact Squat : 0x2A
/// Crouching idle animation.
sact SquatWait : 0x2B
/// Second crouching idle animation.
sact SquatWait2 : 0x2C
/// Crouching idle animation with item in hand.
sact SquatWaitItem : 0x2D
/// Crawling forward.
sact SquatF : 0x2E
/// Crawling backward.
sact SquatB : 0x2F
/// Standing up from crouch.
sact SquatRv : 0x30
/// Landing from fall (slower landing speed).
sact LandingLight : 0x31
/// Landing from fall (higher landing speed).
sact LandingHeavy : 0x32
/// Landing from FallSpecial.
sact LandingFallSpecial : 0x33
/// Footstooling someone.
sact StepJump : 0x34
/// Getting footstooled on the ground.
sact StepPose : 0x35
/// Recovering from grounded footstool.
sact StepBack : 0x36
/// Getting footstooled in the air.
sact StepAirPose : 0x37
/// Falling after airborne footstool.
sact StepFall : 0x38
/// Entering glide animation.
sact GlideStart : 0x39
/// Angling glide animation up and down.
sact GlideDirection : 0x3A
/// Separate animation for the wings.
sact GlideWing : 0x3B
/// Glide attack (g-air, gl-air).
sact GlideAttack : 0x3C
/// Exiting glide animation (having stalled).
sact GlideEnd : 0x3D
/// Landing while still in glide animation.
sact GlideLanding : 0x3E
/// Putting up shield.
sact GuardOn : 0x3F
/// Shield looping animation.
sact Guard : 0x40
/// Putting down shield.
sact GuardOff : 0x41
/// Shield getting hit.
sact GuardDamage : 0x42
/// Spot/Ground dodge.
sact EscapeN : 0x43
/// Forward roll Dodge.
sact EscapeF : 0x44
/// Backward roll Dodge.
sact EscapeB : 0x45
/// Air dodge.
sact EscapeAir : 0x46
/// Pushed backwards after having an attack clang.
sact Rebound : 0x47
/// Jab 1.
sact Attack11 : 0x48
/// Jab 2.
sact Attack12 : 0x49
/// Jab 3.
sact Attack13 : 0x4A
/// Entering rapid jab loop.
sact Attack100Start : 0x4B
/// Rapid jab loop.
sact Attack100 : 0x4C
/// Exiting rapid jab loop.
sact AttackEnd : 0x4D
/// Dash attack.
sact AttackDash : 0x4E
/// Forward tilt (f-tilt) angled upward.
sact AttackS3Hi_AttackS3S_ : 0x4F
/// Forward tilt (f-tilt).
sact AttackS3S : 0x50
/// Forward tilt 2 (f-tilt.2). 
/// Meta Knight, Snake
sact AttackS3S2 : 0x51
/// Forward tilt 3 (f-tilt.3). 
/// Meta Knight
sact AttackS3S3 : 0x52
/// Forward tilt (f-tilt) angled downward.
sact AttackS3Lw_AttackS3S_ : 0x53
/// Up tilt (u-tilt).
sact AttackHi3 : 0x54
/// Down tilt (d-tilt).
sact AttackLw3 : 0x55
/// Forward smash windup.
sact AttackS4Start : 0x56
/// Forward smash (f-smash) angled upward.
sact AttackS4Hi_AttackS4S_ : 0x57
/// Forward smash (f-smash).
sact AttackS4S : 0x58
/// Forward smash 2 (f-smash.2). 
/// Link, Toon Link
sact AttackS4S2 : 0x59
/// Forward Smash (f-smash) angled downward.
sact AttackS4Lw_AttackS4S_ : 0x5A
/// Forward smash charging.
sact AttackS4Hold : 0x5B
/// Up smash windup.
sact AttackHi4Start : 0x5C
/// Up smash (u-smash).
sact AttackHi4 : 0x5D
/// Up smash charging.
sact AttackHi4Hold : 0x5E
/// Down smash windup.
sact AttackLw4Start : 0x5F
/// Down smash (d-smash).
sact AttackLw4 : 0x60
/// Down smash charging.
sact AttackLw4Hold : 0x61
/// Neutral aerial (n-air).
sact AttackAirN : 0x62
/// Forward aerial (f-air).
sact AttackAirF : 0x63
/// Backward aerial (b-air).
sact AttackAirB : 0x64
/// Upward aerial (u-air).
sact AttackAirHi : 0x65
/// Downward aerial (d-air).
sact AttackAirLw : 0x66
/// Neutral Aerial (n-air) landing animation.
sact LandingAirN : 0x67
/// Forward aerial (f-air) landing animation.
sact LandingAirF : 0x68
/// Backward aerial (b-air) landing animation.
sact LandingAirB : 0x69
/// Upward aerial (u-air) landing animation.
sact LandingAirHi : 0x6A
/// Downward aerial (d-air) landing animation.
sact LandingAirLw : 0x6B
/// Standing grab.
sact Catch : 0x6C
/// Running grab.
sact CatchDash : 0x6D
/// Pivot grab.
sact CatchTurn : 0x6E
/// Holding opponent.
sact CatchWait : 0x6F
/// Pummel attack.
sact CatchAttack : 0x70
/// Releasing opponent (grab break).
sact CatchCut : 0x71
/// Backward throw (b-throw).
sact ThrowB : 0x72
/// Forward throw (f-throw).
sact ThrowF : 0x73
/// Upward throw (u-throw).
sact ThrowHi : 0x74
/// Downward throw (d-throw).
sact ThrowLw : 0x75
/// This is executed by the character in the process of being back thrown, not the character doing the throwing. For example, this is where the swing hitbox is for Mario's back throw, which is attached to the character being thrown.
sact ThrownB : 0x76
/// Same as ThrownB for forward throw.
sact ThrownF : 0x77
/// Same as ThrownB for upward throw.
sact ThrownHi : 0x78
/// Same as ThrownB for downward throw.
sact ThrownLw : 0x79
/// Same as ThrownB, but with the arms/legs pointing different directions. Used to compensate for some characters' non-standard rest poses. All "Dx" animations use this concept.
sact ThrownDxB : 0x7A
sact ThrownDxF : 0x7B
sact ThrownDxHi : 0x7C
sact ThrownDxLw : 0x7D
/// Getting grabbed by a taller opponent.
sact CapturePulledHi : 0x7E
/// Being held by a taller opponent.
sact CaptureWaitHi : 0x7F
/// Being pummeled by a taller opponent.
sact CaptureDamageHi : 0x80
/// Getting grabbed by a shorter opponent.
sact CapturePulledLw : 0x81
/// Being held by a shorter opponent.
sact CaptureWaitLw : 0x82
/// Being pummeled by a shorter opponent.
sact CaptureDamageLw : 0x83
/// Getting grabbed by Snake.
sact CapturePulledSnake : 0x84
/// Being held by Snake.
sact CaptureWaitSnake : 0x85
/// Being pummeled by Snake.
sact CaptureDamageSnake : 0x86
sact CapturePulledSnake_1 : 0x87
sact CaptureWaitSnake_1 : 0x88
sact CaptureDamageSnake_1 : 0x89
sact CapturePulledDxSnake : 0x8A
sact CaptureWaitDxSnake : 0x8B
sact CaptureDamageDxSnake : 0x8C
sact CapturePulledDxSnake_1 : 0x8D
sact CaptureWaitDxSnake_1 : 0x8E
sact CaptureDamageDxSnake_1 : 0x8F
sact CapturePulledBigSnake : 0x90
sact CaptureWaitBigSnake : 0x91
sact CaptureDamageBigSnake : 0x92
sact CapturePulledBigSnake_1 : 0x93
sact CaptureWaitBigSnake_1 : 0x94
sact CaptureDamageBigSnake_1 : 0x95
/// Escaping from an opponent's grab onto the ground (ground release).
sact CaptureCut : 0x96
/// Escaping from an opponent's grab into the air (air release).
sact CaptureJump : 0x97
/// Being hit weakly in the head.
sact DamageHi1 : 0x98
/// Being hit moderately in the head.
sact DamageHi2 : 0x99
/// Being hit strongly in the head.
sact DamageHi3 : 0x9A
/// Being hit weakly in the midsection.
sact DamageN1 : 0x9B
/// Being hit moderately in the midsection.
sact DamageN2 : 0x9C
/// Being hit strongly in the midsection.
sact DamageN3 : 0x9D
/// Being hit weakly in the legs.
sact DamageLw1 : 0x9E
/// Being hit moderately in the legs.
sact DamageLw2 : 0x9F
/// Being hit strongly in the legs.
sact DamageLw3 : 0xA0
/// Being hit weakly in the air.
sact DamageAir1 : 0xA1
/// Being hit moderately in the air.
sact DamageAir2 : 0xA2
/// Being hit strongly in the air.
sact DamageAir3 : 0xA3
/// Being hit in the head hard enough to be sent flying.
sact DamageFlyHi : 0xA4
/// Being hit in the midsection hard enough to be sent flying.
sact DamageFlyN : 0xA5
/// Being hit in the legs hard enough to be sent flying.
sact DamageFlyLw : 0xA6
/// Getting hit upward and rolling into a tumble.
sact DamageFlyTop : 0xA7
/// Getting hit hard enough to start reeling ("barrel roll").
sact DamageFlyRoll : 0xA8
/// Hit by a Paralyze attack (i.e. ZSS's Paralyzer).
sact DamageElec : 0xA9
/// Hitting the floor while tumbling, facing up.
sact DownBoundU : 0xAA
/// Lying on ground, facing up.
sact DownWaitU : 0xAB
/// Being hit while lying on ground, facing up.
sact DownDamageU : 0xAC
/// Being hit strongly while lying on ground, facing up.
sact DownDamageU3 : 0xAD
/// Eating something while in lying on ground, facing up.
sact DownEatU : 0xAE
/// Standing up after lying down, facing up.
sact DownStandU : 0xAF
/// Floor Attack, facing up.
sact DownAttackU : 0xB0
/// Rolling forward while lying down, facing up.
sact DownForwardU : 0xB1
/// Rolling backward while lying down, facing up.
sact DownBackU : 0xB2
/// Hitting the floor while tumbling, facing down.
sact DownBoundD : 0xB3
/// Lying on ground, facing down.
sact DownWaitD : 0xB4
/// Being hit while lying on ground, facing down.
sact DownDamageD : 0xB5
/// Being hit strongly while lying on ground, facing down.
sact DownDamageD3 : 0xB6
/// Eating something while lying on ground, facing down.
sact DownEatD : 0xB7
/// Standing up after lying down, facing down.
sact DownStandD : 0xB8
/// Floor Attack, facing down.
sact DownAttackD : 0xB9
/// Rolling forward while lying down, facing down.
sact DownForwardD : 0xBA
/// Rolling backward while lying down, facing down.
sact DownBackD : 0xBB
/// Lying down (facing up) while standing. Used in Stamina Mode, for example.
sact DownSpotU : 0xBC
/// Lying down (facing down) while standing. Used in Stamina Mode, for example.
sact DownSpotD : 0xBD
/// Teching the floor in place.
sact Passive : 0xBE
/// Teching the floor, rolling forward.
sact PassiveStandF : 0xBF
/// Teching the floor, rolling backward.
sact PassiveStandB : 0xC0
/// Teching a wall.
sact PassiveWall : 0xC1
/// Teching a wall into a jump.
sact PassiveWallJump : 0xC2
/// Teching a ceiling.
sact PassiveCeil : 0xC3
/// Wallcling position.
///Diddy, Lucario, Sheik, Squirtle
sact PassiveWall_1 : 0xC4
/// Stunned from shield break.
sact FuraFura : 0xC5
/// Standing up from knockdown after shield break, facing down.
sact FuraFuraStartD : 0xC6
/// Standing up from knockdown after shield break, facing up.
sact FuraFuraStartU : 0xC7
/// Recovering from shield stun.
sact FuraFuraEnd : 0xC8
/// Falling asleep.
sact FuraSleepStart : 0xC9
/// Zzzzzzzzz...
sact FuraSleepLoop : 0xCA
/// Waking up from sleep.
sact FuraSleepEnd : 0xCB
/// Being eaten by Kirby, Dedede, or Wario.
sact Swallowed : 0xCC
/// Dropping through a platform.
sact Pass : 0xCD
/// Beginning to teeter over a ledge ([[Ottotto]]).
sact Ottotto : 0xCE
/// Teetering over a ledge.
sact OttottoWait : 0xCF
/// Bouncing off a wall or ceiling while tumbling or reeling.
sact WallDamage : 0xD0
/// Hitting a ceiling while jumping.
sact StopCeil : 0xD1
/// Running into a wall.
sact StopWall : 0xD2
sact StopCeil_1 : 0xD3
/// Slipping backwards off a platform (such as being hit off while shielding).
sact MissFoot : 0xD4
/// Grabbing the ledge.
sact CliffCatch : 0xD5
/// Waiting on the ledge.
sact CliffWait : 0xD6
/// Ledge attack, under 100% damage.
sact CliffAttackQuick : 0xD7
/// Standing from ledge, under 100% damage.
sact CliffClimbQuick : 0xD8
/// Rolling from ledge, under 100% damage.
sact CliffEscapeQuick : 0xD9
/// Preparing to jump from ledge, under 100% damage.
sact CliffJumpQuick1 : 0xDA
/// Jumping off the ledge, under 100% damage.
sact CliffJumpQuick2 : 0xDB
/// Ledge attack, over 100% damage.
sact CliffAttackSlow : 0xDC
/// Standing from ledge, over 100% damage.
sact CliffClimbSlow : 0xDD
/// Rolling from ledge, over 100% damage.
sact CliffEscapeSlow : 0xDE
/// Preparing to jump from ledge, over 100% damage.
sact CliffJumpSlow1 : 0xDF
/// Jumping off the ledge, over 100% damage.
sact CliffJumpSlow2 : 0xE0
/// Tripping/slipping while already sitting on the floor.
sact SlipDown : 0xE1
/// Tripping/slipping while standing.
sact Slip : 0xE2
/// Tripping/slipping while turning around (while running).
sact SlipTurn : 0xE3
/// Tripping/slipping while starting a dash.
sact SlipDash : 0xE4
/// Tripping/slipping idle animation.
sact SlipWait : 0xE5
/// Standing up from a trip.
sact SlipStand : 0xE6
/// Attacking from a trip.
sact SlipAttack : 0xE7
/// Rolling forward from a trip.
sact SlipEscapeF : 0xE8
/// Rolling backward from a trip.
sact SlipEscapeB : 0xE9
/// Use of Zair/tether recovery (z-air).
sact AirCatch : 0xEA
/// Hanging from an edge after using a tether recovery (?).
sact AirCatchPose : 0xEB
/// Tether recovery connects with an edge (?).
sact AirCatchHit : 0xEC
sact AirCatch_1 : 0xED
/// Swimming up to the surface.
sact SwimRise : 0xEE
/// Reaching the surface of water.
sact SwimUp : 0xEF
/// Reaching the surface of water while at immediate panic level (?).
sact SwimUpDamage : 0xF0
/// Idle animation in the water.
sact Swim : 0xF1
/// Swimming forward.
sact SwimF : 0xF2
/// Stop swimming forward.
sact SwimEnd : 0xF3
/// Turning around in the water.
sact SwimTurn : 0xF4
/// Drowning animation in the water.
sact SwimDrown : 0xF5
/// Falling down back into the water to death.
sact SwimDrownOut : 0xF6
/// Picking up a small item.
sact LightGet : 0xF7
/// Picking up a small item while walking.
sact LightWalkGet : 0xF8
/// Picking up a food item.
sact LightEat : 0xF9
/// Picking up a food item while walking.
sact LightWalkEat : 0xFA
/// Picking up a heavy item.
sact HeavyGet : 0xFB
/// Taking a step with a heavy item.
sact HeavyWalk1 : 0xFC
/// Taking another step with a heavy item.
sact HeavyWalk2 : 0xFD
/// Dropping a small item.
sact LightThrowDrop : 0xFE
/// Throwing a small item forward.
sact LightThrowF : 0xFF
/// Throwing a small item backward.
sact LightThrowB : 0x100
/// Throwing a small item upward.
sact LightThrowHi : 0x101
/// Throwing a small item downward.
sact LightThrowLw : 0x102
/// Smash-throwing a small item forward (?).
sact LightThrowF_1 : 0x103
/// Smash-throwing a small item backward (?).
sact LightThrowB_1 : 0x104
/// Smash-throwing a small item upward (?).
sact LightThrowHi_1 : 0x105
/// Smash-throwing a small item downward (?).
sact LightThrowLw_1 : 0x106
/// Throwing a small item while running.
sact LightThrowDash : 0x107
/// Throwing a small item forward while in the air.
sact LightThrowAirF : 0x108
/// Throwing a small item backward while in the air.
sact LightThrowAirB : 0x109
/// Throwing a small item upward while in the air.
sact LightThrowAirHi : 0x10A
/// Throwing a small item downward while in the air.
sact LightThrowAirLw : 0x10B
/// Smash-throwing a small item forward while in the air (?).
sact LightThrowAirF_1 : 0x10C
/// Smash-throwing a small item backward while in the air (?).
sact LightThrowAirB_1 : 0x10D
/// Smash-throwing a small item upward while in the air (?).
sact LightThrowAirHi_1 : 0x10E
/// Smash-throwing a small item downward while in the air (?).
sact LightThrowAirLw_1 : 0x10F
/// Throwing a heavy item forward.
sact HeavyThrowF : 0x110
/// Throwing a heavy item backward.
sact HeavyThrowB : 0x111
/// Throwing a heavy item upward.
sact HeavyThrowHi : 0x112
/// Throwing a heavy item downward.
sact HeavyThrowLw : 0x113
/// Smash-throwing a heavy item forward (?).
sact HeavyThrowF_1 : 0x114
/// Smash-throwing a heavy item backward (?).
sact HeavyThrowB_1 : 0x115
/// Smash-throwing a heavy item upward (?).
sact HeavyThrowHi_1 : 0x116
/// Smash-throwing a heavy item downward (?).
sact HeavyThrowLw_1 : 0x117
/// Throwing a Trophy Stand forward.
sact SmashThrowF : 0x118
/// Throwing a Trophy Stand backward.
sact SmashThrowB : 0x119
/// Throwing a Trophy Stand upward.
sact SmashThrowHi : 0x11A
/// Throwing a Trophy Stand downward.
sact SmashThrowLw : 0x11B
/// Throwing a Trophy Stand while running.
sact SmashThrowDash : 0x11C
/// Throwing a Trophy Stand forward while in the air.
sact SmashThrowAirF : 0x11D
/// Throwing a Trophy Stand backward while in the air.
sact SmashThrowAirB : 0x11E
/// Throwing a Trophy Stand upward while in the air.
sact SmashThrowAirHi : 0x11F
/// Throwing a Trophy Stand downward while in the air.
sact SmashThrowAirLw : 0x120
/// Swinging a Beam Sword (neutral attack).
sact Swing1 : 0x121
/// Swinging a Beam Sword (f-tilt).
sact Swing3 : 0x122
/// Winding up a Beam Sword (f-smash).
sact Swing4Start : 0x123
/// Swinging a Beam Sword (f-smash).
sact Swing4 : 0x124
/// Swinging a Beam Sword a second time (f-smash). 
/// Captain Falcon
sact Swing42 : 0x125
/// Charging a Beam Sword (f-smash).
sact Swing4Hold : 0x126
/// Swinging a Beam Sword while running.
sact SwingDash : 0x127
/// Swinging a Home-Run Bat (neutral attack).
sact Swing1_1 : 0x128
/// Swinging a Home-Run Bat (f-tilt).
sact Swing3_1 : 0x129
/// Swinging a Home-Run Bat 4 REALZ (f-smash).
sact Swing4Bat : 0x12A
/// Swinging a Home-Run Bat while running.
sact SwingDash_1 : 0x12B
/// Swinging a Fan (neutral attack).
sact Swing1_2 : 0x12C
/// Swing a Fan (f-tilt).
sact Swing3_2 : 0x12D
/// Winding up a Fan (f-smash).
sact Swing4Start_1 : 0x12E
/// Swinging a Fan (f-smash).
sact Swing4_1 : 0x12F
/// Swinging a Fan a second time (f-smash). 
/// Captain Falcon
sact Swing42_1 : 0x130
/// Charging a Fan (f-smash).
sact Swing4Hold_1 : 0x131
/// Swinging a Fan while running.
sact SwingDash_2 : 0x132
/// Swinging a Star Rod (neutral attack).
sact Swing1_3 : 0x133
/// Swinging a Star Rod (f-tilt).
sact Swing3_3 : 0x134
/// Winding up a Star Rod (f-smash).
sact Swing4Start_2 : 0x135
/// Swinging a Star Rod (f-smash).
sact Swing4_2 : 0x136
/// Swinging a Star Rod a second time (f-smash). 
/// Captain Falcon
sact Swing42_2 : 0x137
/// Charging a Star Rod (f-smash).
sact Swing4Hold_2 : 0x138
/// Swinging a Star Rod while running.
sact SwingDash_3 : 0x139
/// Swinging a Lip's Stick (neutral attack).
sact Swing1_4 : 0x13A
/// Swing a Lip's Stick (f-tilt).
sact Swing3_4 : 0x13B
/// Winding up a Lip's Stick (f-smash).
sact Swing4Start_3 : 0x13C
/// Swinging a Lip's Stick (f-smash).
sact Swing4_3 : 0x13D
/// Swinging a Lip's Stick a second time (f-smash). 
/// Captain Falcon
sact Swing42_3 : 0x13E
/// Charging a Lip's Stick (f-smash).
sact Swing4Hold_3 : 0x13F
/// Swinging a Lip's Stick while running.
sact SwingDash_4 : 0x140
/// Standing with a Hammer.
sact ItemHammerWait : 0x141
/// Walking with a Hammer.
sact ItemHammerMove : 0x142
/// Jumping or falling with a Hammer.
sact ItemHammerAir : 0x143
/// Standing with a Golden Hammer (?).
sact ItemHammerWait_1 : 0x144
/// Walking with a Golden Hammer (?).
sact ItemHammerMove_1 : 0x145
/// Jumping or falling with a Golden Hammer (?).
sact ItemHammerAir_1 : 0x146
/// Riding a Warp Star (?).
sact ItemDragoonRide : 0x147
/// Jumping with a Screw Attack.
sact ItemScrew : 0x148
/// Double jumping with a Screw Attack (?).
sact ItemScrew_1 : 0x149
/// Falling after using a Screw Attack.
sact ItemScrewFall : 0x14A
sact ItemKick : 0x14B
/// Jumping after completing the Dragoon.
sact ItemDragoonGet : 0x14C
/// Riding the Dragoon.
sact ItemDragoonRide_1 : 0x14D
/// Growing from a Super Mushroom/Lightning.
sact ItemBig : 0x14E
/// Shrinking from a Poison Mushroom/Lightning.
sact ItemSmall : 0x14F
/// Standing while holding a shooting item.
sact ItemLegsWait : 0x150
/// Walking slowly while holding a shooting item.
sact ItemLegsSlowF : 0x151
/// Walking medium speed while holding a shooting item.
sact ItemLegsMiddleF : 0x152
/// Walking quickly while holding a shooting item.
sact ItemLegsFastF : 0x153
/// Stopping while holding a shooting item.
sact ItemLegsBrakeF : 0x154
/// Dashing while holding a shooting item.
sact ItemLegsDashF : 0x155
/// Reversing slowly while holding a shooting item.
sact ItemLegsSlowB : 0x156
/// Reversing medium speed while holding a shooting item.
sact ItemLegsMiddleB : 0x157
/// Reversing quickly while holding a shooting item.
sact ItemLegsFastB : 0x158
/// Stopping from reversing while holding a shooting item.
sact ItemLegsBrakeB : 0x159
/// Dashing backwards while holding a shooting item.
sact ItemLegsDashB : 0x15A
/// Preparing to jump while holding a shooting item.
sact ItemLegsJumpSquat : 0x15B
/// Landing while holding a shooting item.
sact ItemLegsLanding : 0x15C
/// Shooting a Ray Gun (?).
sact ItemShoot : 0x15D
/// Shooting a Ray Gun (?) while in the air.
sact ItemShootAir : 0x15E
sact ItemShoot_1 : 0x15F
sact ItemShootAir_1 : 0x160
/// Shooting a Fire Flower (?).
sact ItemShoot_2 : 0x161
/// Shooting a Fire Flower (?) while in the air.
sact ItemShootAir_2 : 0x162
/// Taking hold of a Super Scope.
sact ItemScopeStart : 0x163
/// Shooting weak Super Scope shots.
sact ItemScopeRapid : 0x164
/// Shooting a charged Super Scope shot.
sact ItemScopeFire : 0x165
/// Putting down a Super Scope.
sact ItemScopeEnd : 0x166
/// Taking hold of a Super Scope while in the air.
sact ItemScopeAirStart : 0x167
/// Shooting weak Super Scope shots while in the air.
sact ItemScopeAirRapid : 0x168
/// Shooting a charged Super Scope shot while in the air.
sact ItemScopeAirFire : 0x169
/// Putting down a Super Scope while in the air.
sact ItemScopeAirEnd : 0x16A
sact ItemScopeStart_1 : 0x16B
sact ItemScopeRapid_1 : 0x16C
sact ItemScopeFire_1 : 0x16D
sact ItemScopeEnd_1 : 0x16E
sact ItemScopeAirStart_1 : 0x16F
sact ItemScopeAirRapid_1 : 0x170
sact ItemScopeAirFire_1 : 0x171
sact ItemScopeAirEnd_1 : 0x172
/// Holding a Cracker Launcher.
sact ItemLauncher : 0x173
/// Firing a Cracker Launcher.
sact ItemLauncherFire : 0x174
/// Firing a Cracker Launcher while in the air.
sact ItemLauncherAirFire : 0x175
sact ItemLauncher_1 : 0x176
sact ItemLauncherFire_1 : 0x177
sact ItemLauncherAirFire_1 : 0x178
/// Falling while holding a Cracker Launcher.
sact ItemLauncherFall : 0x179
sact ItemLauncherAir : 0x17A
/// Throwing up an assist trophy.
sact ItemAssist : 0x17B
/// Idle with curry.
sact GekikaraWait : 0x17C
/// Screw Attack jump.
sact ItemScrew_2 : 0x17D
/// Riding Slide Launcher? (the thing in SSE and Target Test 3)
sact Guard_1 : 0x17E
/// Idle on ladder.
sact LadderWait : 0x17F
/// Climbing a ladder.
sact LadderUp : 0x180
/// Descending a ladder.
sact LadderDown : 0x181
/// Getting onto a ladder (facing right).
sact LadderCatchR : 0x182
/// Getting onto a ladder (facing left).
sact LadderCatchL : 0x183
/// Getting onto a ladder from the air (facing right).
sact LadderCatchAirR : 0x184
/// Getting onto a ladder from the air (facing left).
sact LadderCatchAirL : 0x185
/// Reaching the top of a ladder (facing right).
sact LadderCatchEndR : 0x186
/// Reaching the top of a ladder (facing left).
sact LadderCatchEndL : 0x187
sact RopeCatch : 0x188
sact RopeFishing : 0x189
/// Caught in Wario's Chomp (?)
sact SpecialNBittenStart : 0x18A
sact SpecialNBitten : 0x18B
sact SpecialNBittenEnd : 0x18C
sact SpecialAirNBittenStart : 0x18D
sact SpecialAirNBitten : 0x18E
sact SpecialAirNBittenEnd : 0x18F
sact SpecialNDxBittenStart : 0x190
sact SpecialNDxBitten : 0x191
sact SpecialNDxBittenEnd : 0x192
sact SpecialAirNDxBittenStart : 0x193
sact SpecialAirNDxBitten : 0x194
sact SpecialAirNDxBittenEnd : 0x195
sact SpecialNBigBittenStart : 0x196
sact SpecialNBigBitten : 0x197
sact SpecialNBigBittenEnd : 0x198
sact SpecialAirNBigBittenStart : 0x199
sact SpecialAirNBigBitten : 0x19A
sact SpecialAirNBigBittenEnd : 0x19B
/// Caught in Falcon Dive (?)
sact SpecialHiCapture : 0x19C
sact SpecialHiDxCapture : 0x19D
/// Caught in Monkey Flip (?)
sact SpecialSStickCapture : 0x19E
/// Being attacked by Diddy during a Monkey Flip (?)
sact SpecialSStickAttackCapture : 0x19F
/// Being jumped on by Diddy during a Monkey Flip (?)
sact SpecialSStickJumpCapture : 0x1A0
sact SpecialSDxStickCapture : 0x1A1
sact SpecialSDxStickAttackCapture : 0x1A2
sact SpecialSDXStickJumpCapture : 0x1A3
/// Held in DK's Cargo
sact ThrownZitabata : 0x1A4
sact ThrownDxZitabata : 0x1A5
sact ThrownGirlZitabata : 0x1A6
/// Being thrown out of DK's Cargo
sact ThrownFF : 0x1A7
sact ThrownFB : 0x1A8
sact ThrownFHi : 0x1A9
sact ThrownFLw : 0x1AA
sact ThrownDxFF : 0x1AB
sact ThrownDxFB : 0x1AC
sact ThrownDxFHi : 0x1AD
sact ThrownDxFLw : 0x1AE
/// Caught in Dark Dive
sact GanonSpecialHiCapture : 0x1AF
sact GanonSpecialHiDxCapture : 0x1B0
/// Caught in grounded Flame Choke (?)
sact SpecialSCapture : 0x1B1
/// Caught in aerial Flame Choke (?)
sact SpecailAirSCatchCapture : 0x1B2
sact SpecialAirSFallCapture : 0x1B3
sact SpecialAirSCapture : 0x1B4
sact SpecialSDxCapture : 0x1B5
sact SpecailAirSDxCatchCapture : 0x1B6
sact SpecialAirSDxFallCapture : 0x1B7
sact SpecialAirSDxCapture : 0x1B8
/// Trapped in Yoshi's Egg.
sact SpecialNEgg : 0x1B9
/// Something to do with being held in a side special move that's not in the process of throwing (Flying Slam?)
sact SpecialSZitabata : 0x1BA
sact SpecialSDxZitabata : 0x1BB
/// Up taunt, facing right.
sact AppealHiR : 0x1BC
/// Up taunt, facing left.
sact AppealHiL : 0x1BD
/// Side taunt, facing right.
sact AppealSR : 0x1BE
/// Side taunt, facing left.
sact AppealSL : 0x1BF
/// Down taunt, facing right.
sact AppealLwR : 0x1C0
/// Down taunt, facing left.
sact AppealLwL : 0x1C1
/// Entrance, facing right.
sact EntryR : 0x1C2
/// Entrance, facing left.
sact EntryL : 0x1C3
/// Victory 1 animation on results screen.
sact Win1 : 0x1C4
/// Victory 1 looping animation, comes after Win1.
sact Win1Wait : 0x1C5
/// Victory 2 animation on results screen.
sact Win2 : 0x1C6
/// Victory 2 looping animation, comes after Win2.
sact Win2Wait : 0x1C7
/// Victory 3 animation on results screen.
sact Win3 : 0x1C8
/// Victory 3 looping animation, comes after Win3.
sact Win3Wait : 0x1C9
/// Losing animation on results screen.
sact Lose : 0x1CA
/// Facial expression when being hit/tumbling.
sact DamageFace : 0x1CB
sact Dark : 0x1CC
sact Spycloak : 0x1CD

// ACTION STUFF FOR RECOVERIES
sact ACTIONx100 : 0x200
sact ACTIONx101 : 0x201
sact ACTIONx102 : 0x202
sact ACTIONx103 : 0x203
sact ACTIONx104 : 0x204
sact ACTIONx105 : 0x205
sact ACTIONx106 : 0x206
sact ACTIONx107 : 0x207
sact ACTIONx108 : 0x208
sact ACTIONx109 : 0x209
sact ACTIONx10A : 0x20A
sact ACTIONx10B : 0x20B
sact ACTIONx10C : 0x20C
sact ACTIONx10D : 0x20D
sact ACTIONx10E : 0x20E
sact ACTIONx10F : 0x20F
sact ACTIONx110 : 0x210
sact ACTIONx111 : 0x211
sact ACTIONx112 : 0x212
sact ACTIONx113 : 0x213
sact ACTIONx114 : 0x214
sact ACTIONx115 : 0x215
sact ACTIONx116 : 0x216
sact ACTIONx117 : 0x217
sact ACTIONx118 : 0x218
sact ACTIONx119 : 0x219
sact ACTIONx11A : 0x21A
sact ACTIONx11B : 0x21B
sact ACTIONx11C : 0x21C
sact ACTIONx11D : 0x21D
sact ACTIONx11E : 0x21E
sact ACTIONx11F : 0x21F
sact ACTIONx120 : 0x220
sact ACTIONx121 : 0x221
sact ACTIONx122 : 0x222
sact ACTIONx123 : 0x223
sact ACTIONx124 : 0x224
sact ACTIONx125 : 0x225
sact ACTIONx126 : 0x226
sact ACTIONx127 : 0x227
sact ACTIONx128 : 0x228
sact ACTIONx129 : 0x229
sact ACTIONx12A : 0x22A
sact ACTIONx12B : 0x22B
sact ACTIONx12C : 0x22C
sact ACTIONx12D : 0x22D
sact ACTIONx12E : 0x22E
sact ACTIONx12F : 0x22F
sact ACTIONx130 : 0x230
sact ACTIONx131 : 0x231
sact ACTIONx132 : 0x232
sact ACTIONx133 : 0x233
sact ACTIONx134 : 0x234
sact ACTIONx135 : 0x235
sact ACTIONx136 : 0x236
sact ACTIONx137 : 0x237
sact ACTIONx138 : 0x238
sact ACTIONx139 : 0x239
sact ACTIONx13A : 0x23A
sact ACTIONx13B : 0x23B
sact ACTIONx13C : 0x23C
sact ACTIONx13D : 0x23D
sact ACTIONx13E : 0x23E
sact ACTIONx13F : 0x23F
sact ACTIONx140 : 0x240