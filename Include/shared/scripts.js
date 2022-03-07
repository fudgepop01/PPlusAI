
let _out = "";

const clearOut = () => _out = "";
const out = (content) => _out += `${content}\n`;
const cout = (content) => _out += `// ${content}\n`;

const moveUsageTracker = new Set();

export const clearMovesUsed = () => {
  moveUsageTracker.clear();
  return "";
}

export const genPersonalityStrings = () => {
  clearOut();
  const items = Object.entries($globals).filter(([k, v]) => {
    return k.startsWith("pt_");
  });
  items.sort(([a, _], [b, __]) => a.localeCompare(b));
  let toLog = items.map(([a, b]) => a);
  console.log(toLog);
  out(`str "PERSONALITY"`);
  for (const [k, v] of items) {
    out(`str "${v}"`);
  }
  return _out;
}

export const generateMovesUsed = () => {
  clearOut();
  const moves = moveUsageTracker.values();
  // for (const move of moves) {
  //   console.log(move)
  // }
  for (const {origin, moveName, IASA_src, xOffset_src, yOffset_src, xRange_src, yRange_src, hitFrame_src, lastHitFrame_src} of moves) {
    const mn = moveName.toLowerCase();
    out("");
    out(`label ${mn}`)
    // out(`LOGSTR str("${moveName}")`);
    if (moveName.toLowerCase() === origin.toLowerCase()) out(`lastAttack = val${origin}`);
    if (IASA_src.startsWith(mn)) out(`move_IASA = ${IASA_src}`)
    if (xOffset_src.startsWith(mn)) out(`move_xOffset = ${xOffset_src}`)
    if (yOffset_src.startsWith(mn)) out(`move_yOffset = ${yOffset_src}`)
    if (xRange_src.startsWith(mn)) out(`move_xRange = ${xRange_src}`)
    if (yRange_src.startsWith(mn)) out(`move_yRange = ${yRange_src}`)
    if (hitFrame_src.startsWith(mn)) out(`move_hitFrame = ${hitFrame_src}`)
    if (lastHitFrame_src.startsWith(mn)) out(`move_lastHitFrame = ${lastHitFrame_src}`)
    out("Return")
  }
  return _out;
}

export const generateMovesUsedKB = () => {
  clearOut();
  const moves = moveUsageTracker.values();
  // for (const move of moves) {
  //   console.log(move)
  // }
  for (const {origin, moveName, IASA_src, xOffset_src, yOffset_src, xRange_src, yRange_src, hitFrame_src, lastHitFrame_src, dmg, angle, bkb, kbg, isWeightDependent} of moves) {
    const mn = moveName.toLowerCase();
    out("");
    out(`label ${mn}`)
    // out(`LOGSTR str("${moveName}")`);
    if (moveName.toLowerCase() === origin.toLowerCase()) out(`lastAttack = val${origin}`);
    if (xOffset_src.startsWith(mn)) out(`move_xOffset = ${xOffset_src}`)
    if (yOffset_src.startsWith(mn)) out(`move_yOffset = ${yOffset_src}`)
    if (xRange_src.startsWith(mn)) out(`move_xRange = ${xRange_src}`)
    if (yRange_src.startsWith(mn)) out(`move_yRange = ${yRange_src}`)
    if (hitFrame_src.startsWith(mn)) out(`move_hitFrame = ${hitFrame_src}`)
    if (lastHitFrame_src.startsWith(mn)) out(`move_lastHitFrame = ${lastHitFrame_src}`)
    out(`CalcKnockback move_currKnockback ODamage ${dmg} ${bkb} ${kbg} OWeight ${isWeightDependent ? '1' : '0'}`);
    out(`move_angle = ${angle}`)
    out(`Goto __ANGLE_FIX__`)
    out("Return")
  }
  out("")
  out("label __ANGLE_FIX__")
  out(`if Equal OAirGroundState 1`);
  out(`  if Equal move_angle 361`)
  out(`    if move_currKnockback < 32`)
  out(`      move_angle = move_currKnockback * 0.03125 * 44`);
  out(`    else`)
  out(`      move_angle = 44`);
  out(`    endif`)
  out(`  elif Equal move_angle -361`)
  out(`    if move_currKnockback < 32`)
  out(`      move_angle = 180 - move_currKnockback * 0.03125 * 44`);
  out(`    else`)
  out(`      move_angle = 136`);
  out(`    endif`)
  out(`  endif`)
  out(`elif Equal move_angle 361`);
  out(`  move_angle = 45`);
  out(`elif Equal move_angle -361`);
  out(`  move_angle = 135`);
  out(`endif`);
  out("Return");
  return _out;
}

export const generateAllMovesGoto = () => {
  clearOut();
  const moves = Object.values(getMoveData());
  // for (const move of moves) {
  //   console.log(move)
  // }
  for (const {origin, moveName, IASA_src, xOffset_src, yOffset_src, xRange_src, yRange_src, hitFrame_src, lastHitFrame_src, dmg, bkb, kbg} of moves) {
    const mn = moveName.toLowerCase();
    out("");
    out(`label ${mn}`)
    // out(`LOGSTR str("${moveName}")`);
    if (moveName.toLowerCase() === origin.toLowerCase()) out(`lastAttack = val${origin}`);
    if (IASA_src.startsWith(mn)) out(`move_IASA = ${IASA_src}`)
    if (xOffset_src.startsWith(mn)) out(`move_xOffset = ${xOffset_src}`)
    if (yOffset_src.startsWith(mn)) out(`move_yOffset = ${yOffset_src}`)
    if (xRange_src.startsWith(mn)) out(`move_xRange = ${xRange_src}`)
    if (yRange_src.startsWith(mn)) out(`move_yRange = ${yRange_src}`)
    if (hitFrame_src.startsWith(mn)) out(`move_hitFrame = ${hitFrame_src}`)
    if (lastHitFrame_src.startsWith(mn)) out(`move_lastHitFrame = ${lastHitFrame_src}`)
    out("Return")
  }
  return _out; 
}

export const LV9Check = (action) => {
  clearOut();
  out("if Equal LevelValue LV9");
  out(action);
  out("endif");
  
  return _out;
}


export const generateAllMovesGotoKB = () => {
  clearOut();
  const moves = Object.values(getMoveData());
  // for (const move of moves) {
  //   console.log(move)
  // }
  for (const {origin, moveName, IASA_src, xOffset_src, yOffset_src, xRange_src, yRange_src, hitFrame_src, lastHitFrame_src, dmg, angle, bkb, kbg, isWeightDependent} of moves) {
    const mn = moveName.toLowerCase();
    out("");
    out(`label ${mn}`)
    // out(`LOGSTR str("${moveName}")`);
    if (moveName.toLowerCase() === origin.toLowerCase()) out(`lastAttack = val${origin}`);
    if (xOffset_src.startsWith(mn)) out(`move_xOffset = ${xOffset_src}`)
    if (yOffset_src.startsWith(mn)) out(`move_yOffset = ${yOffset_src}`)
    if (xRange_src.startsWith(mn)) out(`move_xRange = ${xRange_src}`)
    if (yRange_src.startsWith(mn)) out(`move_yRange = ${yRange_src}`)
    if (hitFrame_src.startsWith(mn)) out(`move_hitFrame = ${hitFrame_src}`)
    if (lastHitFrame_src.startsWith(mn)) out(`move_lastHitFrame = ${lastHitFrame_src}`)
    out(`CalcKnockback move_currKnockback ODamage ${dmg} ${bkb} ${kbg} OWeight ${isWeightDependent ? '1' : '0'}`);
    out(`move_angle = ${angle}`)
    out(`Goto __ANGLE_FIX__`)
    out("Return")
  }
  out("")
  out("label __ANGLE_FIX__")
  out(`if Equal OAirGroundState 1`);
  out(`  if Equal move_angle 361`)
  out(`    if move_currKnockback < 32`)
  out(`      move_angle = move_currKnockback * 0.03125 * 44`);
  out(`    else`)
  out(`      move_angle = 44`);
  out(`    endif`)
  out(`  elif Equal move_angle -361`)
  out(`    if move_currKnockback < 32`)
  out(`      move_angle = 180 - move_currKnockback * 0.03125 * 44`);
  out(`    else`)
  out(`      move_angle = 136`);
  out(`    endif`)
  out(`  endif`)
  out(`elif Equal move_angle 361`);
  out(`  move_angle = 45`);
  out(`elif Equal move_angle -361`);
  out(`  move_angle = 135`);
  out(`endif`);
  out("Return");
  return _out; 
}

export const ifNEQThen = (in1, in2, out) => {
  
  let lets = globals.lets;
  let thing = lets[in1] ?? in1;
  let otherThing = lets[in2] ?? in2;
  if (thing != otherThing) return out;
  else return "";
}

export const genLastAttackDir = () => {
  clearOut();
  const moves = Object.values(getMoveData());
  const dirs = {
    [-1]: [],
    [0]: [],
    [1]: []
  };
  for (const [idx, {moveName, xOffset, xRange}] of moves.entries()) {
    let dirX = 0;
    if (xOffset + xRange > parseFloat($globals[`DIRX_FRONT`])) dirX = 1
    else if (xOffset + xRange < parseFloat($globals[`DIRX_BACK`])) dirX = -1
    dirs[dirX].push(idx);
    console.log(`X: ${moveName} ${dirX} [${xOffset + xRange}]`)
  }
  let str = "if !(True)";
  for (const val of dirs[-1]) { str += ` || Equal lastAttack ${val}`; }
  out(str);
  out("  chr_trait_return = -1");
  str = "elif !(True)";
  for (const val of dirs[0]) { str += ` || Equal lastAttack ${val}`; }
  out(str);
  out("  chr_trait_return = 0");
  str = "elif !(True)";
  for (const val of dirs[1]) { str += ` || Equal lastAttack ${val}`; }
  out(str);
  out("  chr_trait_return = 1");
  out("endif")

  return _out;
}

export const genLastAttackDirY = () => {
  clearOut();
  const moves = Object.values(getMoveData());
  const dirs = {
    [-1]: [],
    [0]: [],
    [1]: []
  };
  for (const [idx, {origin, moveName, yOffset, yRange}] of moves.entries()) {
    let yBottom = (origin.toLowerCase().endsWith('air')) ? $globals[`DIRY_BELOW_AIR`] : $globals[`DIRY_BELOW_GROUND`];
    let dirY = 0;
    if (yRange - yOffset > parseFloat($globals[`DIRY_ABOVE`])) dirY = 1
    else if (yRange - yOffset < parseFloat(yBottom)) dirY = -1
    dirs[dirY].push(idx);
    console.log(`Y: ${moveName} ${dirY} [${yRange - yOffset}]`)
  }
  let str = "if !(True)";
  for (const val of dirs[-1]) { str += ` || Equal lastAttack ${val}`; }
  out(str);
  out("  chr_trait_return = -1");
  str = "elif !(True)";
  for (const val of dirs[0]) { str += ` || Equal lastAttack ${val}`; }
  out(str);
  out("  chr_trait_return = 0");
  str = "elif !(True)";
  for (const val of dirs[1]) { str += ` || Equal lastAttack ${val}`; }
  out(str);
  out("  chr_trait_return = 1");
  out("endif")

  return _out;
}

export const genLastAttackDirAerials = (varName) => {
  clearOut();
  const moves = Object.values(getMoveData());
  const dirs = {
    [-1]: [],
    [0]: [],
    [1]: []
  };
  for (const [idx, {origin, xOffset, xRange}] of moves.entries()) {
    if(origin.toLowerCase().endsWith('air')) {
      let dirX = 0;
      if (xOffset + xRange > parseFloat($globals[`DIRX_FRONT`])) dirX = 1
      else if (xOffset + xRange < parseFloat($globals[`DIRX_BACK`])) dirX = -1
      dirs[dirX].push(idx);
    }
  }
  let str = "if !(True)";
  for (const val of dirs[-1]) { str += ` || Equal lastAttack ${val}`; }
  out(str);
  out(`  ${varName} = -1`);
  str = "elif !(True)";
  for (const val of dirs[0]) { str += ` || Equal lastAttack ${val}`; }
  out(str);
  out(`  ${varName} = 0`);
  str = "elif !(True)";
  for (const val of dirs[1]) { str += ` || Equal lastAttack ${val}`; }
  out(str);
  out(`  ${varName} = 1`);
  out("endif")

  return _out;
}

// "KBONLY"
// well, that was a lie
export const generateAllMovesGotoKBONLY = () => {
  clearOut();
  const moves = Object.values(getMoveData());
  // for (const move of moves) {
  //   console.log(move)
  // }
  for (const {origin, moveName, IASA_src, xOffset, yOffset, xRange, yRange, hitFrame, lastHitFrame, dmg, angle, bkb, kbg, isWeightDependent} of moves) {
    const mn = moveName.toLowerCase();
    out("");
    out(`label ${mn}`)
    // out(`LOGSTR str("${moveName}")`);
    out(`hitFrame = ${hitFrame}`)
    if (["fthrow", "dthrow", "uthrow", "bthrow"].includes(mn)) {
      out(`duration = ${hitFrame + parseInt($globals[`${moveName}_IASA`]) - parseInt($globals[`${moveName}_throwFrame`])}`)
    } else {
      out(`duration = ${lastHitFrame - hitFrame}`)
    }
    // shoutouts to preprocessing
    // let dirX = 0;
    // if (xOffset + xRange > parseFloat($globals[`DIRX_FRONT`])) dirX = 1
    // else if (xOffset + xRange < parseFloat($globals[`DIRX_BACK`])) dirX = -1
    // console.log(`X: ${moveName}; ${xOffset + xRange}; ${dirX}`);
    // out(`dirX = ${dirX}`)
    // let dirY = 0;
    // if ((yRange - yOffset) > parseFloat($globals[`DIRY_ABOVE`])) dirY = 1;
    // else if ((yRange - yOffset) < parseFloat($globals[`DIRY_BELOW`])) dirY = -1
    // out(`dirY = ${dirY}`)
    // console.log(`Y: ${moveName}; ${yRange - yOffset}; ${dirY}`);
    // out(`disjointX = ${xOffset > 0 ? xOffset + xRange * 2 - parseFloat($globals[`DIRX_FRONT`]) : xOffset + parseFloat($globals[`DIRX_BACK`])}`);

    // out(`move_xStart = ${xOffset}`)
    // out(`move_xEnd = ${xOffset + xRange}`);
    // out(`move_ystart = ${yOffset * -1}`)
    // out(`move_xEnd = ${(yRange - yOffset)}`);

    out(`CalcKnockback move_currKnockback ODamage ${dmg} ${bkb} ${kbg} OWeight ${isWeightDependent ? '1' : '0'}`);
    out(`move_angle = ${angle}`)
    out(`Goto __ANGLE_FIX__`)
    out("Return")
  }
}

export const pushVarAsValue = (variable) => {
  clearOut();
  let item = parseInt((currentScopeItems.lets[variable] ?? variable).substring(3));
  out(`STACK_PUSH ${item} 0`);

  return _out;
}

export const tempVar = (name, source) => {
  clearOut();
  let thing = globals.lets;
  let rawVar = currentScopeItems.lets[source] || thing[source] || source;
  out(`#let ${name} = ${rawVar}`)
  // console.log(_out);
  return _out;
}

export const generateFetchMoveData = () => {
  clearOut();
  const moves = Object.values(getMoveData());

  out(`if lastAttack >= 0 && lastAttack < ${moves.length}`)
  out(`GotoByValue lastAttack`)
  out(`Goto __ANGLE_FIX__`)
  out(`else`)
  out(`SetVarByNum STACK_POP -1`)
  out(`SetVarByNum STACK_POP -1`)
  out(`SetVarByNum STACK_POP -1`)
  out(`SetVarByNum STACK_POP -1`)
  out(`SetVarByNum STACK_POP -1`)
  out(`SetVarByNum STACK_POP -1`)
  out(`SetVarByNum STACK_POP -1`)
  out(`SetVarByNum STACK_POP -1`)
  out(`SetVarByNum STACK_POP -1`)
  out(`SetVarByNum STACK_POP -1`)
  out(`SetVarByNum STACK_POP -1`)
  out(`SetVarByNum STACK_POP -1`)
  out(`anotherTempVar = -1`)
  out(`endif`)
  out(`if !(True)`)
  for (const [idx, {origin, moveName, IASA_src, xOffset, yOffset, xRange, yRange, hitFrame, lastHitFrame, dmg, angle, bkb, kbg, isWeightDependent, IASA}] of moves.entries()) {
    const mn = moveName.toLowerCase();
    out("");
    out(`// ${mn}`)
    out(`label ${mn}`)
    // angle var
    out(`immediateTempVar = STACK_POP`);
    out(`SetVarByNum STACK_POP ${xOffset}`)
    out(`SetVarByNum STACK_POP ${yOffset}`)
    out(`SetVarByNum STACK_POP ${xRange}`)
    out(`SetVarByNum STACK_POP ${yRange}`)
    out(`SetVarByNum STACK_POP ${hitFrame}`)
    // duration
    if (["fthrow", "dthrow", "uthrow", "bthrow"].includes(mn)) {
      out(`SetVarByNum STACK_POP ${hitFrame + parseInt($globals[`${moveName}_IASA`]) - parseInt($globals[`${moveName}_throwFrame`])}`)
    } else {
      out(`SetVarByNum STACK_POP ${lastHitFrame - hitFrame}`)
    }
    out(`SetVarByNum STACK_POP ${IASA}`)
    out(`SetVarByNum STACK_POP ${dmg}`);
    out(`SetVarByNum STACK_POP ${isWeightDependent}`);
    out(`SetVarByNum STACK_POP ${bkb}`);
    out(`SetVarByNum STACK_POP ${kbg}`);
    out(`STACK_PUSH immediateTempVar 0`);
    out(`immediateTempVar = ${angle}`);
    out(`CalcKnockback anotherTempVar ODamage ${dmg} ${bkb} ${kbg} OWeight ${isWeightDependent}`);
    out(`Return`)
  }
  out(`endif`);
  out("Return")
  return _out; 
}

export const generateAllMovesGotoLocONLY = () => {
  clearOut();
  const moves = Object.values(getMoveData());
  // for (const move of moves) {
  //   console.log(move)
  // }
  for (const {origin, moveName, IASA_src, xOffset_src, yOffset_src, xRange_src, yRange_src, hitFrame_src, lastHitFrame_src, dmg, angle, bkb, kbg, isWeightDependent} of moves) {
    const mn = moveName.toLowerCase();
    out("");
    out(`label ${mn}`)
    if (xOffset_src.startsWith(mn)) out(`move_xOffset = ${xOffset_src}`)
    if (yOffset_src.startsWith(mn)) out(`move_yOffset = ${yOffset_src}`)
    if (hitFrame_src.startsWith(mn)) out(`move_hitFrame = ${hitFrame_src}`)
    if (lastHitFrame_src.startsWith(mn)) out(`move_lastHitFrame = ${lastHitFrame_src}`)
    out("Return")
  }
  return _out;
}

export const generateAllMovesGotoLocRange = () => {
  clearOut();
  const moves = Object.values(getMoveData());
  // for (const move of moves) {
  //   console.log(move)
  // }
  for (const {origin, moveName, moveVariant, IASA_src, xOffset, xRange, xOffset_src, yOffset_src, xRange_src, yRange_src, hitFrame_src, lastHitFrame_src, dmg, angle, bkb, kbg, isWeightDependent} of moves) {
    const mn = moveName.toLowerCase();
    out("");
    out(`label ${mn}`)
    if (IASA_src.startsWith(mn)) out(`move_IASA = ${IASA_src}`)
    if (xOffset_src.startsWith(mn)) out(`move_xOffset = ${xOffset_src}`)
    if (yOffset_src.startsWith(mn)) out(`move_yOffset = ${yOffset_src}`)
    let dirX = 0;
    if (xOffset + xRange > 5) dirX = 1
    else if (xOffset + xRange < -3) dirX = -1
    console.log(`${moveName}; ${xOffset + xRange}; ${dirX}`);
    out(`dirX = ${dirX}`)
    if (xRange_src.startsWith(mn)) out(`move_xRange = ${xRange_src}`)
    if (yRange_src.startsWith(mn)) out(`move_yRange = ${yRange_src}`)
    if (hitFrame_src.startsWith(mn)) out(`move_hitFrame = ${hitFrame_src}`)
    if (lastHitFrame_src.startsWith(mn)) out(`move_lastHitFrame = ${lastHitFrame_src}`)
    out(`moveVariant = ${moveVariant}`);
    out("Return")
  }
  return _out;
}


export const generateMoveSnippets = () => {
  clearOut();
  const moves = Object.values(getMoveData());
  for (const [idx, {origin, moveName, moveVariant, lastHitFrame}] of moves.entries()) {
    out(`${idx > 0 ? 'elif' : 'if'} Equal lastAttack ${idx}`);
    out(`lastHitFrame = ${lastHitFrame}`);
    switch(origin.toLowerCase()) {
      case 'nair':
      case 'jab123': out('Button A'); break;
      case 'dashattack': out('Goto execDA'); break;
      case 'ftilt': 
        out('Button A'); 
        out('Goto getHeight')
        out('Stick 0.7 immediateTempVar'); 
        break;
      case 'utilt': out('Button A'); out('Stick 0 0.7'); break;
      case 'dair': out('Button A'); out('Stick 0 (-0.6)'); break;
      case 'dtilt': out('Button A'); out('Stick 0 (-0.7)'); break;
      case 'fair':
      case 'fsmash': 
        out('Button A'); 
        out('Goto getHeight')
        out('Stick 1'); 
        break;
      case 'uair':
      case 'usmash': out('Button A'); out('Stick 0 1'); break;
      case 'bair': out('Button A'); out('Stick (-1) 0'); break;
      case 'dsmash': out('Button A'); out('Stick 0 (-1)'); break;
      case 'nspecialair':
      case 'nspecial': out('Button B'); break;
      case 'sspecialair':
      case 'sspecial': out('Button B'); out('AbsStick OPos'); break;
      case 'uspecialair':
      case 'uspecial': out('Button B'); out('Stick 0 1'); break;
      case 'dspecialair':
      case 'dspecial': out('Button B'); out('Stick 0 (-0.7)'); break;
      case 'grab': out('Button R|A'); break;
    }
    if (moveVariant !== 0) {
      // out(`LOGSTR str("-------")`);
      // out(`LOGVAL PlayerNum`);
      // out(`LOGSTR str("${moveName.toLowerCase()}")`);
      out(`Seek ${moveName.toLowerCase()}`);
    } else {
      // out(`LOGSTR str("-------")`);
      // out(`LOGVAL PlayerNum`);
      // out(`LOGSTR str("${moveName.toLowerCase()}")`);
      out(`Seek ${origin.toLowerCase()}`);
    }
    out('Return');
  }
  out('endif');
  out('');
  out('// IMPLEMENTATIONS');
  out('if !(True)')
  for (const [idx, {origin, moveName, moveVariant}] of moves.entries()) {
    if (moveVariant !== 0) {
      out(`label ${moveName.toLowerCase()}`);
      out('Goto PFC')
      if (origin.toLowerCase().includes("special")) {
        out("if AnimFrame >= 2 && AnimFrame <= 7")
        out("  AbsStick OPos")
        out("endif")
      }
      out(`{${moveName.toUpperCase()}}`);
      out('Goto common_checks')
      out(`Seek ${moveName.toLowerCase()}`);
    } else {
      out(`label ${origin.toLowerCase()}`);
      out('Goto PFC')
      if (origin.toLowerCase().includes("special")) {
        out("if AnimFrame >= 2 && AnimFrame <= 7")
        out("  AbsStick OPos")
        out("endif")
      }
      out(`{${origin.toUpperCase()}}`);
      out('Goto common_checks')
      out(`Seek ${origin.toLowerCase()}`);
    }
    out ('Return');
  }
  out('endif')

  return _out;
}

export const ifMoveRequiresIdleGround = () => {
  clearOut();
  let str = "if !(True) ";
  const moves = Object.values(getMoveData());
  for (const [idx, {origin, moveName, moveVariant}] of moves.entries()) {
    switch (origin.toLowerCase()) {
      case 'jab123':
      case 'ftilt':
      case 'dtilt':
      case 'utilt':
      case 'dsmash':
      case 'fsmash':
      case 'nspecial':
      case 'dspecial':
        str += ` || Equal lastAttack ${idx}`;
        break;
      default:
        break;
    } 
  }
  
  out(str);
  return _out;
}

export const generateChecks = (labelName) => {
  clearOut();
  const moves = Object.values(getMoveData());

  out(`if !(True)`)
  for (const [idx, {origin, moveName, moveVariant, xRange, xOffset}] of moves.entries()) {
    if (moveName.toLowerCase() == "grab") continue;
    out(`label ${moveName}`)
    // out(`immediateTempVar = (${4 + Math.floor(1.35 * 8 / moves.length * 100) / 100} - PlayerCount) * 0.25`);
    // out(`if DiceCount < 100`)
    out(`lastAttack = ${idx}`);
    out(`Goto __FETCH_DATA__`)
    // out(`disjointX = ${(xRange + xOffset > 0) ? `${xRange + xOffset} - Width` : `${xRange + xOffset} + Width`}`);
    out(`Goto ${labelName}`);
    // out("endif");
    // out(`Return`)
  }
  out(`endif`)
  out(`if !(True)`)
  out(`label __FETCH_DATA__`)
  out(`GET_MOVE_DATA(move_angle, move_xOffset, move_yOffset, move_xRange, move_yRange, move_hitFrame, move_duration, move_IASA, move_knockback)`)
  // out(`GET_CHAR_TRAIT(dirX, chr_get_moveDir)`)
  // out(`GET_CHAR_TRAIT(dirY, chr_get_moveDirY)`)
  out(`Return`)
  out(`endif`)

  return _out;
}

export const generateInitialAttackDiceRolls = () => {
  clearOut();
  const moves = Object.values(getMoveData());

  const moveRoots = {};
  for (const [idx, {origin}] of moves.entries()) {
    if (!moveRoots[origin]) moveRoots[origin] = [];
    moveRoots[origin].push(idx);
  }

  out(`DynamicDiceClear dslot0`)
  for (const [idx, {origin}] of moves.entries()) {
    out(`DynamicDiceAdd dslot0 ${idx} ${1 / moveRoots[origin].length}`);
  }

  return _out;
}

export const ifLastOrigin = (origin, isElif) => {
  clearOut();
  const moves = Object.values(getMoveData());

  const outIdxes = moves.map((m, i) => (m.origin.toLowerCase() == origin.toLowerCase()) ? i : undefined).filter(m => !!m);
  let builder = (isElif === "true") ? "elif !(True)" :  "if !(True)";
  for (const idx of outIdxes) {
    builder += ` || Equal lastAttack ${idx}`;
  }
  out(builder);
  return _out;
}

export const ifLastAttack = (moveName) => {
  clearOut();
  const moves = Object.values(getMoveData());

  const idx = moves.findIndex(m => m.moveName.toLowerCase() == moveName.toLowerCase());

  out(`if Equal lastAttack ${idx}`);
  return _out;
}

export const setLastAttack = (moveName) => {
  clearOut();
  const moves = Object.values(getMoveData());

  const idx = moves.findIndex(m => m.moveName.toLowerCase() == moveName.toLowerCase());
  // console.log(idx);

  out(`lastAttack = ${idx}`);
  return _out;
}

export const addToDice = (slot, moveName, weight) => {
  clearOut();
  const moves = Object.values(getMoveData());

  const idx = moves.findIndex(m => m.moveName.toLowerCase() == moveName.toLowerCase());
  // console.log("idx:" + idx);
  // console.log(moves[idx].moveName);

  out(`DynamicDiceAdd dslot${slot} ${idx} ${weight}`);
  return _out;
}

export const addOriginToDice = (slot, origin, weight) => {
  clearOut();
  const moves = Object.values(getMoveData()).map((m, i) => [i, m]).filter(([_, m]) => m.origin.toLowerCase() == origin.toLowerCase());
  for (const [i, m] of moves) {
    out(`DynamicDiceAdd dslot${slot} ${i} ${1 / moves.length}`);
  }
  return _out;
}

export const elifLastAttack = (moveName) => {
  clearOut();
  const moves = Object.values(getMoveData());

  const idx = moves.findIndex(m => m.moveName.toLowerCase() == moveName.toLowerCase());

  out(`elif Equal lastAttack ${idx}`);
  return _out;
}

export const getMoveLocationParams = () => {
  clearOut();
  const moves = Object.values(getMoveData());
  for (const [idx, {origin, moveName, moveVariant}] of moves.entries()) {
    out(`${idx > 0 ? 'elif' : 'if'} Equal lastAttack ${idx}`);
    out(`Goto ${origin.toLowerCase()}`);
    if (moveVariant !== 0) {
      out(`Goto ${moveName.toLowerCase()}`);
    }
  }
  out ('endif')
  return _out;
}

export const ifAerialAttack = () => {
  clearOut();
  let str = "if !(True) ";
  const moves = Object.values(getMoveData());

  for (const [idx, {origin, moveName, moveVariant}] of moves.entries()) {
    if (origin.toLowerCase().endsWith('air')) {
      // console.log(`moveName: ${moveName}`)
      str += `|| Equal lastAttack ${idx}`;
    }
  }
  
  out(str);
  return _out;
}

export const printMoveName = () => {
  clearOut();
  const moves = Object.values(getMoveData());
  for (const [idx, {origin, moveName, moveVariant}] of moves.entries()) {
    out(`${idx > 0 ? 'elif' : 'if'} Equal lastAttack ${idx}`);
    if (moveVariant !== 0) {
      out(`LOGSTR str("${moveName}") // ${moveName}`) 
    } else {
      out(`LOGSTR str("${origin}") // ${origin}`)
    }
  }
  out ('endif')
  return _out;
}

let _moveData = undefined;
const getMoveData = () => {
  if (_moveData) return _moveData;

  const moves = {};
  for (const [name, value] of Object.entries($globals)) {
    if (value === "9999.9999" || !name.endsWith("_damage_info")) continue;

    let isWeightDependent = false;
    let [origin, dmg, bkb, kbg, angle] = value.split("|");
    dmg = parseFloat(dmg);
    if (bkb.startsWith("w")) {
      isWeightDependent = true;
      bkb = bkb.substr(1);
    }
    bkb = parseFloat(bkb);
    kbg = parseFloat(kbg);
    angle = parseFloat(angle);
    if (angle < 0 && angle != -361) {
      angle *= -1;
      if (angle > 180) angle = (angle - 180) * 2;
      else angle = 180 - angle;
    }

    const moveName = name.substring(0, name.length - "_damage_info".length);
    let moveVariant = 0;
    if (Object.keys($globals).includes(`mv_${moveName}`)) {
      moveVariant = $globals[`mv_${moveName}`];
    }

    const parent = origin.toLowerCase();
    const IASA_src = `${$globals[`${moveName}_IASA`] ? moveName : parent}_IASA`;
    const IASA = parseFloat($globals[IASA_src]);
    const xOffset_src = `${$globals[`${moveName}_xOffset`] ? moveName : parent}_xOffset`;
    const xOffset = parseFloat($globals[xOffset_src]);
    const yOffset_src = `${$globals[`${moveName}_yOffset`] ? moveName : parent}_yOffset`;
    const yOffset = parseFloat($globals[yOffset_src]);
    const xRange_src = `${$globals[`${moveName}_xRange`] ? moveName : parent}_xRange`;
    const xRange = parseFloat($globals[xRange_src]);
    const yRange_src = `${$globals[`${moveName}_yRange`] ? moveName : parent}_yRange`;
    const yRange = parseFloat($globals[yRange_src]);
    const hitFrame_src = `${$globals[`${moveName}_hitFrame`] ? moveName : parent}_hitFrame`;
    const hitFrame = parseFloat($globals[hitFrame_src]);
    const lastHitFrame_src = `${$globals[`${moveName}_lastHitFrame`] ? moveName : parent}_lastHitFrame`;
    const lastHitFrame = parseFloat($globals[lastHitFrame_src]);
    moves[moveName.toLowerCase()] = { 
      origin, isWeightDependent, moveName, moveVariant, dmg, bkb, kbg, angle, 
      IASA, IASA_src, 
      xOffset, xOffset_src,
      yOffset, yOffset_src,
      xRange, xRange_src,
      yRange, yRange_src,
      hitFrame, hitFrame_src,
      lastHitFrame, lastHitFrame_src 
    };
  }
  _moveData = moves;
  return moves;
}

export const generateDefinedVariants = (moveName) => {
  clearOut();
  const moves = Object.values(getMoveData()).filter(({origin}) => {
    return origin === moveName
  }).sort((a, b) => a.moveVariant - b.moveVariant);

  for (const m of moves) {
    if (m.moveVariant === 0) out(`lastAttack = val${m.origin}`);
    if (m.moveVariant !== 0) out(`if Equal moveVariant mv_${m.moveName}`)
    
    const mn = m.moveName.toLowerCase();
    if (m.IASA_src.toLowerCase().startsWith(mn)) out(`move_IASA = ${m.IASA_src}`)
    if (m.xOffset_src.toLowerCase().startsWith(mn)) out(`move_xOffset = ${m.xOffset_src}`)
    if (m.yOffset_src.toLowerCase().startsWith(mn)) out(`move_yOffset = ${m.yOffset_src}`)
    if (m.xRange_src.toLowerCase().startsWith(mn)) out(`move_xRange = ${m.xRange_src}`)
    if (m.yRange_src.toLowerCase().startsWith(mn)) out(`move_yRange = ${m.yRange_src}`)
    if (m.hitFrame_src.toLowerCase().startsWith(mn)) out(`move_hitFrame = ${m.hitFrame_src}`)
    if (m.lastHitFrame_src.toLowerCase().startsWith(mn)) out(`move_lastHitFrame = ${m.lastHitFrame_src}`)

    if (m.moveVariant !== 0) out(`endif`)
  }

  return _out;
}

const updateTrackedMoves = (moves) => {
  const allMoves = getMoveData();
  for (const m of moves) { 
    if (m.moveVariant !== 0) {
      // console.log(m.moveName, m.origin);
      // console.log(allMoves[m.origin.toLowerCase()]);
      moveUsageTracker.add(allMoves[m.origin.toLowerCase()])
    }
    moveUsageTracker.add(m); 
  }
}

const commonRecoveryBase = (AIHubConditions) => `
  if ${AIHubConditions}
    currGoal = cg_nothing
    Call MainHub
  endif
  {COMMON_RECOVERY_BASE}
`;

const customRecoveryBase = (AIHubConditions) => `
  if ${AIHubConditions}
    currGoal = cg_nothing
    Call MainHub
  endif
  {CUSTOM_RECOVERY_BASE}
`;

export const makeRecovery = (move) => {
  if (!$globals["recovery_moves"]) return "";

  const moves = $globals["recovery_moves"].split("|");
  if (!moves.includes(move)) return `// move "${move}" not found`;
  clearOut();
  
  const [kind] = $globals[`${move}_recovery_info`].split("|");
  const subactionCheck = $globals[`${move}_subaction_check`];
  switch (kind) {
    case "common":
      out(commonRecoveryBase(subactionCheck));
      break;
    case "custom":
      out(customRecoveryBase(subactionCheck));
      break;
    default:
      return `// move kind "${kind}" not found`;
  }
  return _out;
}

const knockbackCalc = (dmg, atkDmg, bkb, kbg, isWeightDependent) => {
  if (isWeightDependent) {
    dmg = 0;
    atkDmg = 0;
  }
  return (kbg / 100) * (1.4 * (((atkDmg + 2) * ((atkDmg - atkDmg * 0.2) + Math.floor(dmg)))/20) * 1 + 18) + bkb
}

const minKnockbackDamage = (desiredKnockback, atkDmg, bkb, kbg, isWeightDependent) => {
  if (kbg === 0) return 1000;
  if (isWeightDependent) {
    const kb = knockbackCalc(0, 0, bkb, kbg, true);
    if (kb > desiredKnockback) {
      return 0;
    } else {
      return 1000;
    }
  }
  // shoutouts to the following URL lmao
  // https://www.wolframalpha.com/input/?i=solve+for+D%2C+K+%3D+%28G+%2F+100%29+*+%281.4+*+%28%28%28A+%2B+2%29+*+%28%28A+-+A+*+0.2%29+%2B+D%29%29%2F20%29+*+1+%2B+18%29+%2B+B
  const outDamage = Math.ceil(-(4 * ((7 * atkDmg * atkDmg + 14 * atkDmg + 2250) * kbg + 12500 * bkb - 12500 * desiredKnockback))/(35 * (atkDmg + 2) * kbg))
  return outDamage;
}

const outputRandMove = (moves, context) => {
  
  if (context === "Goto") updateTrackedMoves(moves);
  for (const [idx, {origin, moveName, moveVariant, yOffset}] of moves.entries()) {
    let append = "";
    if (origin.toLowerCase().endsWith("air") && yOffset <= -2) append += `&& OYDistBackEdge < -5`;
    if (idx === 0) {
      out(`globTempVar = Rnd * ${moves.length}`);
      out(`if globTempVar < 1 ${(!(origin.toLowerCase().endsWith("air") || origin.toLowerCase().endsWith("special"))) ? " && YDistBackEdge > -3" : ""} ${append}`)
    } else {
      out(`elif ${idx} < globTempVar && globTempVar < ${idx + 1} ${!(origin.toLowerCase().endsWith("air")) ? "&& YDistBackEdge > -10 && YDistBackEdge > -10" : ""} ${append}`);
    }
    if (moveVariant !== 0) out(`moveVariant = mv_${moveName}`);
    out(context === "Goto" ? `Goto ${origin.toLowerCase()}` : `CallI ${origin}`);
    if (context === "Goto" && moveVariant !== 0) {
      out(`Goto ${moveName.toLowerCase()}`);
    }
    if (idx + 1 === moves.length) {
      out("endif")
    }
  }
  return _out;
}

export const pickRandMove = (options, context) => {
  clearOut();
  const possibilities = options.split("|").map(opt => opt.toLowerCase());
  const moveList = Object.values(getMoveData()).filter(({moveName}) => {
    return possibilities.includes(moveName);
  })
  return outputRandMove(moveList, context);
}

let CurrMoves;

export const refreshMoves = () => {
  CurrMoves = Object.values(getMoveData());
  return '';
}

export const filterMoveAngle = (min, max) => {
  min = parseFloat(min);
  max = parseFloat(max);
  CurrMoves = CurrMoves.filter(({angle}) => {
    if (angle === 361) angle = 44
    return min <= angle && angle <= max;
  })
  return '';
}

export const filterMoveDamage = (min, max) => {
  min = parseFloat(min);
  max = parseFloat(max);
  CurrMoves = CurrMoves.filter(({dmg}) => {
    return min <= dmg && dmg <= max
  })
  return '';
}

export const filterMoveHitFrame = (max) => {
  max = parseFloat(max);
  CurrMoves = CurrMoves.filter(({hitFrame}) => hitFrame <= max);
  return '';
}

export const filterMoveXMinMax = (min, max) => {
  min = parseFloat(min);
  max = parseFloat(max);
  CurrMoves = CurrMoves.filter(({xOffset, xRange}) => min <= (xOffset + xRange) && (xOffset + xRange) <= max);
  return '';
}

export const filterMoveYMinMax = (min, max) => {
  min = parseFloat(min);
  max = parseFloat(max);
  CurrMoves = CurrMoves.filter(({yOffset, yRange}) => min <= (yOffset + yRange) && (yOffset + yRange) <= max);
  return '';
}

export const filterMoveEndlag = (max) => {
  max = parseFloat(max);
  CurrMoves = CurrMoves.filter(({IASA, lastHitFrame, origin}) => {
    return (IASA - lastHitFrame) < max || origin.endsWith("Air")
  })
  return '';
}

export const excludeMovesNamed = (moveNames) => {
  moveNames = moveNames.split("|");
  CurrMoves = CurrMoves.filter(({moveName}) => {
    return !moveNames.includes(moveName.toLowerCase());
  })
  return '';
}

export const excludeMovesNotNamed = (moveNames) => {
  moveNames = moveNames.split("|");
  CurrMoves = CurrMoves.filter(({moveName}) => {
    return moveNames.includes(moveName.toLowerCase());
  })
  return '';
}

export const excludeMovesOrigin = (origins) => {
  origins = origins.toLowerCase().split("|");
  CurrMoves = CurrMoves.filter(({origin}) => {
    return !origins.includes(origin.toLowerCase());
  })
  return '';
}

export const excludeMovesNotOrigin = (origins) => {
  origins = origins.toLowerCase().split("|");
  CurrMoves = CurrMoves.filter(({origin}) => {
    return origins.includes(origin.toLowerCase());
  })
  return '';
}

export const outputWithKnockbackThresholds = (min, max, context) => {
  clearOut();
  if (!CurrMoves[0]) return '';
  if (context === "Goto") updateTrackedMoves(CurrMoves);
  min = parseFloat(min);
  max = parseFloat(max);
  CurrMoves = CurrMoves.filter((m) => {
    let minKb = m.bkb
    if (m.angle >= 250 && m.angle <= 290) minKb *= 2;
    const minDmg = minKnockbackDamage(min, m.dmg, minKb, m.kbg, m.isWeightDependent);
    if (minDmg >= 1000) return false;
    const maxDmg = minKnockbackDamage(max, m.dmg, m.bkb, m.kbg, m.isWeightDependent);
    m.minDmg = minDmg;
    m.maxDmg = maxDmg;
    return true;
  });

  CurrMoves.sort((a, b) => b.minDmg - a.minDmg);

  // let grabWasOutput = false;
  // out(`immediateTempVar = 0.3`);
  // out(`if !(SamePlane) || YDistBackEdge < -10`)
  // out(`immediateTempVar = 0.1`)
  // out(`endif`)
  for (const {origin, moveName, moveVariant, minDmg, maxDmg, yOffset, angle} of CurrMoves) {
    // if (origin === "Grab") {
    //   if (grabWasOutput) continue;
    //   else grabWasOutput = true;
    // }
    let bias = 0;
    if (80 <= angle && angle <= 100) bias = 0.15;
    else if (75 <= angle && angle <= 105) bias = 0.1;
    else if (70 <= angle && angle <= 110) bias = 0.05;
    else if (0 <= angle && angle <= 20) bias = 0.15;
    else if (0 <= angle && angle <= 45) bias = 0.1;

    let conditional = "True";
    if (minDmg > 0) conditional += ` && ${minDmg} <= ODmgXWeight`;
    if (maxDmg < 500) conditional += ` && ODmgXWeight <= ${maxDmg}`;
    let append = `&& Rnd < ${(0.3 + bias).toFixed(2)}`;
    if (origin === "Grab") {
      append = `&& Rnd < 0.12 && OCurrAction <= hex(0x45)`;
    }
    if (origin.toLowerCase().endsWith("air") && yOffset <= -2) append += ` && OYDistBackEdge < -15`;
    if (!(origin.toLowerCase().endsWith("air") || origin.toLowerCase().endsWith("special"))) append += ` && YDistBackEdge > -6`;
    out(`if ${conditional} ${append}`);
    if (moveVariant !== 0) out(`moveVariant = mv_${moveName}`);
    out(context === "Goto" ? `Goto ${origin.toLowerCase()}` : `CallI ${origin}`);
    if (context === "Goto" && moveVariant !== 0) {
      out(`Goto ${moveName.toLowerCase()}`);
    }
    out(`endif`);
  }

  return _out;
}

export const output = (context) => {
  clearOut();
  if (!CurrMoves[0]) return '';
  if (context === "Goto") updateTrackedMoves(CurrMoves);

  return outputRandMove(CurrMoves, context);
}

export const outputWithKBChecks = () => {
  
}

export const generateThrowDMG = (min, dir) => {
  clearOut();
  min = parseFloat(min);
  dir = parseFloat(dir);

  CurrMoves = Object.values(getMoveData());
  CurrMoves = CurrMoves.filter((m) => {
    if (!m.moveName.endsWith("throw")) return false;

    let minKb = m.bkb
    if (m.angle >= 250 && m.angle <= 290) minKb *= 2;
    if (dir === "b" || dir === "f") {
      minKb *= Math.cos(m.angle * Math.PI / 180)
    } else if (dir === "u") {
      minKb *= Math.sin(m.angle * Math.PI / 180)
    }    
    const minDmg = minKnockbackDamage(min, m.dmg, minKb, m.kbg, m.isWeightDependent);
    m.minDmg = minDmg;
    return true;
  });

  for (const {moveName, minDmg, angle} of CurrMoves) {
    let output = "";
    switch (moveName.toLowerCase()) {
      case 'uthrow': output += 'uThrowDMG = '; break;
      case 'dthrow': output += 'dThrowDMG = '; break;
      case 'fthrow': output += 'fThrowDMG = '; break;
      case 'bthrow': output += 'bThrowDMG = '; break;
    }

    if ((dir === "b" && ((angle <= 90 && angle >= 0) || (angle > 270 && angle <= 360)))
      || (dir === "f" && (angle > 90 && angle < 270))) {
      output += 9999;
    } else {
      output += minDmg;
    }
    out(output);
  }

  return _out;
}