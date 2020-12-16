#const walkInitVel = 9999.9999
#const walkAcc = 9999.9999
#const walkMaxVel = 9999.9999
#const groundFric = 9999.9999
#const dashInitVel = 9999.9999
#const dashRunTermVel = 9999.9999
#const groundedMaxXVel = 9999.9999
#const dashCancelFrameWindow = 9999.9999
#const guardOnMaxMomentum = 9999.9999
#const jumpSquatFrames = 9999.9999
#const jumpXInitVel = 9999.9999
#const jumpYInitVel = 9999.9999
#const jumpXGroundMult = 9999.9999
#const fastFallSpeed = 9999.9999
#const gravity = 9999.9999
#const weight = 9999.9999
#const shieldSize = 9999.9999

#const maxYEdgeDistWithJump = 9999.9999
#const maxYEdgeDist = 9999.9999
#const maxYEdgeDistJumpNoUpB = 9999.9999
#const oWalkingDist = 9999.9999
#const shortEdgeRange = 9999.9999
#const edgeRange = 9999.9999
#const calloutSpeed = 9999.9999

#const jumpIfOWithin = 9999.9999
#const SHIfOBeyond = 9999.9999
#const FHIfOBeyond = 9999.9999
#const DJIfOWithin = 9999.9999
#const DJIfOBeyond = 9999.9999

#const techChaseCloseDist = 9999.9999
#const techChaseFarDist = 9999.9999

#const dashCountMax = 9999.9999
#const dashForceTurnFrame = 9999.9999
#const dashDanceMinFrames = 9999.9999
#const DDWaveDash = 9999.9999

#const minBaseReactionTime = 9999.9999
#const maxBaseReactionTime = 9999.9999

#let globTempVar = var17

// used when planning / executing moves
#let move_xOffset = var9
#let move_yOffset = var10
#let move_xRange = var11
#let move_yRange = var12
#let move_hitFrame = var13
#let move_lastHitFrame = var14
#let move_IASA = var15


// recorded after the move is executed / hits;
// will not interfere with move position type
#let hit_knockback = var16


// used in various places to tell what part the routine should jump to
// effectively used to communicate between scripts
#let movePart = var18
// what variation of the move to use. Important when a move
// has multiple or complex uses (such as grab)
#let moveVariant = var19
// used in many places to store what the last attack was.
// must be set manually.
#let lastAttack = var20
// I don't think I've used this once - but it might be important
// at some point so I'll keep it around.
#let lastScript = var21

#const techRollVulFrame = 21

#const valJab123 = 24625
#const valFTilt = 24626
#const valUTilt = 24627
#const valDTilt = 24628
#const valFSmash = 24629
#const valUSmash = 24630
#const valDSmash = 24631
#const valNSp = 24632
#const valSSp = 24633
#const valUSp = 24634
#const valDSp = 24635
#const valGrab = 24636

#const valNAir = 24641
#const valFAir = 24642
#const valBAir = 24643
#const valUAir = 24644
#const valDAir = 24645
#const valNSpAir = 24646
#const valSSpAir = 24647
#const valUSpAir = 24648
#const valDSpAir = 24649

#let noCombo = var19
#const noComboVal = 256

// AI "mode" values
#const md_attack = 1
#const md_defend = 2

// AI taunt values
#const utaunt = 1
#const staunt = 2
#const dtaunt = 3

// controls the approach the AI uses. It's okay because MOVES shouldn't care
// about what script was called previously - only what move they are.
#let approachType = var16
#const at_attack = 1 // default
#const at_defend = 2
#const at_edgeguard = 3
#const at_throwOut = 4
#const at_ledgeRefresh = 5

// AI values
#const LV1 = 0
#const LV2 = 15
#const LV3 = 21
#const LV4 = 31
#const LV5 = 42
#const LV6 = 48
#const LV7 = 60
#const LV8 = 75
#const LV9 = 100

// this works because it's used exclusively in 1.as and aerial attacks
// where it's used IMMEDIATELY before being modified
#let shouldFastFall = var2

#const mv_fthrow = 1
#const mv_dthrow = 2
#const mv_bthrow = 3
#const mv_uthrow = 4