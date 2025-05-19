#let NextScriptBase

NextScriptBase = NextScript & 0x7ff0

if Equal CPUType hex(0x14)
  var0 = OPos * Direction
  if var0 < 0 && Rnd < 0.75
    if Equal NextScriptBase 0x6020
      NextScript = DSpecialAir
    elif Equal NextScriptBase 0x6010
      NextScript = DSpecial
    endif
  endif
elif Equal CPUType hex(0x13)
  Disable NSpecial
  Disable NSpecialAir
elif Equal CPUType hex(0x1c)
  // force Sheik
  if IsCharOf Sheik
    Disable DSpecial
    Disable DSpecialAir
  elif IsCharOf Zelda && Equal IsOnStage true
    if Equal NextScriptBase 0x6020
      NextScript = DSpecialAir 
    elif Equal NextScriptBase 0x6010
      NextScript = DSpecial
    endif
  endif
endif

// if about to use attack
if Equal NextScriptBase AerialBase || Equal NextScriptBase GroundBase
  if IsCharOf Mario || IsCharOf Pikachu || IsCharOf Popo || IsCharOf Nana 
    var0 = ExactYCoord + YSpeed * 8 - ExactOYCoord + YSpeed * 5
    var1 = OHurtboxSize * 0.5 + 30
    if var1 < var0
      Disable NSpecial
      Disable NSpecialAir
    endif
  elif IsCharOf Samus || IsCharOf Fox || IsCharOf Falco || IsCharOf Lucario || IsCharOf Wolf
    if Equal OIsOnStage true
      var0 = ExactYCoord + YSpeed * 8 - ExactOYCoord + YSpeed * 5
      var1 = OHurtboxSize * 0.5 + 10
      if var1 < var0
        var0 = AIPDFloat2 & 1.2
        if IsCharOf Lucario && XDistLE var0
        else
          Disable NSpecial
          Disable NSpecialAir
        endif
      endif
    endif
  endif
endif

// high above stage and recovering?
if LevelValue > LV6 
&& [[TARGET AI STAT 0x50 & 0x800000 == true]]
&& {Equal NextScriptBase GroundBase || Equal NextScriptBase AerialBase} 
&& !(Equal NextScript slot21) // main recovery
  Disable Non-Projectiles
endif

#let xVariance
#let yVariance
if Equal NextScriptBase GroundBase
  CalcXYVariance xVariance yVariance
elif Equal NextScriptBase 0x6020
  #let diceRollResult
  diceRollResult = AtkDiceRoll slot19
  
  if Equal OIsOnStage false 
  && NextScript >= slot11_sp && NextScript <= slot15_sp 
  && !(Equal diceRollResult 0) 
  && Equal Direction OPos
    var0 = (100 - ODamage) * 0.006 + 0.2
    // ODamage < 33
    if var0 < 0.2
      var0 = 0.2
    endif
    var1 = var0 * 0.01
    var2 = LevelValue * var1
    if var1 < var2
      NextScript = slot19
    endif
  endif
  if Equal NextScript slot21
    NextScript = USpecialAir
    if HasWaft // TODO: investigate this - chrAIStat 1
      var0 = LevelValue + Rnd * 30
      if 50 < var0
        nextScript = SSpecialAir
      endif
    endif
  elif IsCharOf Link || IsCharOf ToonLink
    if Equal ChrStat[1] true && LevelValue > LV6
      Disable SSpecialAir
    endif
  elif IsCharOf Kirby
    if Equal NextScript slot16
      if HatNotProjectile
        Disable NSpecialAir
      endif
    elif NextScript >= slot11_sp && NextScript <= slot15_sp
      if HatNotTransition
        Disable NSpecialAir
      endif
    endif
  elif IsCharOf Fox || IsCharOf Falco || IsCharOf Wolf
    if Equal IsOnStage true
      if DistFrontEdge <= 120 && DistToOEdge >= 120
        var0 = LevelValue * 0.02
        if Rnd < var0
          Disable SSpecialAir
          Disable USpecialAir 
        endif
      endif
    endif
  elif IsCharOf Pikachu
  || IsCharOf Luigi
  || IsCharOf CaptainFalcon
  || IsCharOf Peach
  || IsCharOf Ganon
  || IsCharOf Wario
  || IsCharOf MetaKnight
  || IsCharOf Diddy
  || IsCharOf Ike
  || IsCharOf Sonic
  || IsCharOf WarioMan
    if Equal IsOnStage true
      if DistFrontEdge <= 80 && DistToOEdge >= 80
        var0 = LevelValue * 0.02
        if Rnd < var0
          Disable SSpecialAir
        endif
      endif
    endif
  elif IsCharOf Bowser
    if OIsCharOf GigaBowser
      Disable SSpecialAir
    endif
  elif IsCharOf GameWatch
    // bucket not full
    if Equal ChrStat[1] false
      Disable DSpecialAir
    endif 
  elif IsCharOf Olimar
    // has no pikmin
    if Equal ChrStat[1] true
      Disable FAir
      Disable BAir
      Disable UAir
      Disable DAir
      Disable SSpecialAir
      Disable USpecialAir
      Disable DSpecialAirAir
    endif
  elif IsCharOf ROB
    // ROB top already out?
    if Equal ChrStat[1] false && LevelValue > LV6
      Disable DSpecialAir
    endif
  elif IsCharOf Snake
    // sticky not attached?
    if Equal ChrStat[1] true
      Disable DSpecialAir
    endif
  endif

  if Equal FtStat[0x50] & 0b0100_0000_0000 true
    Disable NSpecialAir
  endif
  if Equal OActionCategory acat_hurt
    Disable Grab
  endif

  if Equal CPUtype hex(0x12)
    Disable DSpecialAir
  elif Equal CPUType hex(0x14)
    Disable NSpecialAir
  endif 

  if IsCharOf Diddy
    // has thrown 2 banana
    if Equal AiStat[4] true && LevelValue > LV6
      Disable DSpecialAir
    endif
  elif IsCharOf Lucas
  || IsCharOf Olimar
  || IsCharOf ZeroSuitSamuz
  || IsCharOf Pit
  || IsCharOf MetaKnight
  || IsCharOf Wario
  || IsCharOf Ganon
  || IsCharOf Falco
  || IsCharOf GameWatch
  || IsCharOf Marth
  || IsCharOf Nana
  || IsCharOf Popo
  || IsCharOf Sheik
  || IsCharOf Zelda
  || IsCharOf Peach
  || IsCharOf Koopa
  || IsCharOf Ness
  || IsCharOf Captain
  || IsCharOf Luigi
  || IsCharOf Pikachu
  || IsCharOf Fox
  || IsCharOf Kirby
  || IsCharOf Yoshi
  || IsCharOf Samus
  || IsCharOf Link
  || IsCharOf Donkey
  || IsCharOf Mario
    if IsCharOf Wario || IsCharOf WarioMan
      if Equal ChrStat[2] true 
      && (Equal NextScript slot15_sp || Equal NextScript slot11_sp)
      && Rnd < 0.4
        Disable FAir
        Disable BAir
        Disable UAir
        Disable DAir
        Disable SSpecialAir
        Disable USpecialAir
        Disable DSpecialAirAir
      endif
    elif IsCharOf Pikachu && LevelValue >= LV7 
      if !(XDistLE 20) 
        var0 = ExactYCoord
      else
        var0 = ExactOYCoord
      endif
      if ODoesNotPassThroughThunderBoltRange
        Disable DSpecialAir
      endif
    endif
    if NextScript < slot21 || slot22 < NextScript
      var0 = false
      if Equal IsOnStage false
        var0 = true      
      elif True
        // check if at risk of going off an edge
        if XSpeed < 0.1
          if XSpeed > -0.1
            if DistFrontEdge < 10 || DistBackEdge < 10
              var0 = true
            endif
          elif DistBackEdge < (XSpeed * -24 + 15)
            var0 = true
          endif
        elif DistFrontEdge < (XSpeed * 24 + 15)
          var0 = true
        endif
        if Equal var0 false
          if IsCharOf Ganon 
          || IsCharOf Sheik 
          || IsCharOf CaptainFalcon 
          || IsCharOf Sonic 
          || IsCharOf ZeroSuitSamus
            if Direction < 0
              var1 = 10
            else
              var1 = 30
            endif
            if var1 <= DistBackEdge
              if Direction > 0
                var1 = 10
              else
                var1 = 30
              endif
              if var1 <= DistFrontEdge
                Seek stillFalse
                Jump
              endif
            endif
            var0 = true
          endif
        endif 
        
        label stillFalse
        if Equal var0 true
          Disable All Non-Meteor/sfall Options
          GetNearestCliff var1 var2
          if (YCoord < var2 + 10) || (YCoord < BBoundary + 60)
            Disable DAir
          endif
        endif 
      endif
    endif
    PreChkAirAttackHit NextScript
    NextScript = result of slot roll
    if Equal NextScript 0x603c
      NextScript = 0x3060
    endif
  endif
elif Equal NextScriptBase GroundBase


endif