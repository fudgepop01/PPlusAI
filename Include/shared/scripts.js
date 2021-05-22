
let _out = "";

const clearOut = () => _out = "";
const out = (content) => _out += `${content}\n`;
const cout = (content) => _out += `// ${content}\n`;

const moveUsageTracker = new Set();

export const clearMovesUsed = () => {
  moveUsageTracker.clear();
  return "";
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
    out(`LOGSTR str("${moveName}")`);
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

export const generateAllMovesGoto = () => {
  clearOut();
  const moves = Object.values(getMoveData());
  // for (const move of moves) {
  //   console.log(move)
  // }
  for (const {origin, moveName, IASA_src, xOffset_src, yOffset_src, xRange_src, yRange_src, hitFrame_src, lastHitFrame_src} of moves) {
    const mn = moveName.toLowerCase();
    out("");
    out(`label ${mn}`)
    out(`LOGSTR str("${moveName}")`);
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
    Call AIHub
  endif
  {COMMON_RECOVERY_BASE}
`;

const customRecoveryBase = (AIHubConditions) => `
  if ${AIHubConditions}
    Call AIHub
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
    if (origin.endsWith("air") && yOffset <= -2) append += `&& OYDistBackEdge < -15`;
    if (idx === 0) {
      out(`globTempVar = Rnd * ${moves.length}`);
      out(`if globTempVar < 1 ${!(origin.endsWith("air")) ? "&& OYDistBackEdge > -10" : ""} ${append}`)
    } else {
      out(`elif ${idx} < globTempVar && globTempVar < ${idx + 1} ${!(origin.endsWith("air")) ? "&& YDistBackEdge > -10" : ""} ${append}`);
    }
    if (moveVariant !== 0) out(`moveVariant = mv_${moveName}`);
    out(context === "Goto" ? `Goto ${moveName.toLowerCase()}` : `Call ${origin}`);
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
  origins = origins.split("|");
  CurrMoves = CurrMoves.filter(({origin}) => {
    return !origins.includes(origin.toLowerCase());
  })
  return '';
}

export const excludeMovesNotOrigin = (origins) => {
  origins = origins.split("|");
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
    if (origin.endsWith("air") && yOffset <= -2) append += ` && OYDistBackEdge < -15`;
    out(`if ${conditional} ${append}`);
    if (moveVariant !== 0) out(`moveVariant = mv_${moveName}`);
    out(context === "Goto" ? `Goto ${origin.toLowerCase()}` : `Call ${origin}`);
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