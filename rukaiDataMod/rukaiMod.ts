// ==UserScript==
// @name         Rukai Data Extractor
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  generates various stats that fudge can then copy/paste
// @author       fudgepop01
// @match        https://rukaidata.com/P+/*
// @icon         https://www.google.com/s2/favicons?domain=rukaidata.com
// @grant        none
// ==/UserScript==

interface ScriptBlock {
  block: any;
  offset: number;
}

type HitEffect = number 
  | "Normal" 
  | "None" 
  | "Slash" 
  | "Electric"
  | "Freezing"
  | "Flame"
  | "Coin"
  | "Reverse" 
  | "Trip"
  | "Sleep"
  | "Bury"
  | "Stun"
  | "Flower"
  | "Grass"
  | "Water"
  | "Darkness"
  | "Paralyze"
  | "Aura"
  | "Plunge"
  | "Down"
  | "Flinchless"

type HitSfx = number
  | "Unique"
  | "Punch"
  | "Kick"
  | "Slash"
  | "Coin"
  | "HomeRunBat"
  | "Paper"
  | "Shock"
  | "Burn"
  | "Splash"
  | "Explosion"
  | "Thud"
  | "Slam"
  | "Thwomp"
  | "MagicZap"
  | "Shell"
  | "Slap"
  | "Pan"
  | "Club"
  | "Racket"
  | "Aura"
  | "NessBat"

interface HitboxValues {
  Hit: {
    aerial: boolean
    angle_flipping: number
      | "AttackerPosition" 
      | "MovementDir" 
      | "LeftDir" 
      | "AttackerDir" 
      | "AttackerDirReverse"
      | "HitboxPosition"
      | "FaceZaxis"
    bkb: number;
    can_be_absorbed: boolean;
    can_be_reflected: boolean;
    can_be_shielded: boolean;
    can_hit1: boolean;
    can_hit2: boolean;
    can_hit3: boolean;
    can_hit4: boolean;
    can_hit5: boolean;
    can_hit6: boolean;
    can_hit7: boolean;
    can_hit8: boolean;
    can_hit9: boolean;
    can_hit10: boolean;
    can_hit11: boolean;
    can_hit12: boolean;
    can_hit13: boolean;
    clang: boolean;
    damage: number;
    direct: boolean;
    effect: HitEffect;
    enabled: boolean;
    flinchless: boolean;
    freeze_frame_disable: boolean;
    ground: boolean;
    hitbox_id: number;
    hitlag_mult: number;
    ignore_invincibility: boolean;
    kbg: number;
    rehit_rate: number;
    remain_grabbed: boolean;
    sdi_mult: number;
    set_id: number;
    shield_damage: number;
    size: number;
    sound: HitSfx;
    sound_level: number;
    sse_type: number
      | "None"
      | "Head"
      | "Body"
      | "Butt"
      | "Hand"
      | "Elbow"
      | "Foot"
      | "Knee"
      | "Throwing"
      | "Weapon"
      | "Sword"
      | "Hammer"
      | "Explosive"
      | "Spin"
      | "Bite"
      | "Magic"
      | "Pk"
      | "Bow"
      | "NessBat"
      | "Umbrella"
      | "Pimin"
      | "Water"
      | "Whip"
      | "Tail"
      | "Energy";
    stretches_to_bone: boolean;
    trajectory: number;
    tripping_rate: number;
    wdsk: number;
  }
}

interface Position { x: number; y: number; z: number; }
interface PositionW { x: number; y: number; z: number; w: number; }
interface PositionMatrix { x: PositionW; y: PositionW; z: PositionW; w: PositionW; }
interface PositionLRUD { left: number; right: number; up: number; down: number; }

interface SubactionData {
  name: string;
  animation_flags: any;
  bad_interrupts: boolean;
  frames: {
    airbourne: boolean;
    ecb: {
      bottom: number;
      top: number;
      left: number;
      right: number;
      transn_x: number;
      transn_y: number;
    };
    edge_slide: "SlideOff" | "StayOn" | "Airbourne" | number;
    grab_interrupt_damage?: number;
    hit_boxes: {
      hitbox_id: number;
      next_pos?: Position;
      next_size?: number;
      next_values?: HitboxValues;
      prev_pos?: Position;
      prev_size?: number;
      prev_values?: HitboxValues;
    }[];
    hitbox_sets_rehit: boolean[];
    hurt_boxes: {
      bone_matrix: PositionMatrix;
      state: number
        | "Normal"
        | "Invincible"
        | "IntangibleFlashing"
        | "IntangibleNoFlashing"
        | "IntangibleQuickFlashing";
      hurt_box: {
        bone_index: number;
        enabled: boolean;
        grabbable: boolean;
        offset: Position;
        radius: number;
        stretch: Position;
        trap_item_hittable: boolean;
        zone: "Normal" | string | number;
      };
    }[];
    interruptible: boolean;
    landing_lag: boolean;
    ledge_grab_box?: PositionLRUD;
    reverse_direction: boolean;
    rumble?: [number, number];
    rumble_loop?: [number, number];
    slope_contour_full?: [number, number];
    slope_contour_stand?: number;
    throw?: {
      damage: number;
      trajectory: number;
      kbg: number;
      wdsk: number;
      bkb: number;
      effect: HitEffect;
      sfx: HitSfx;
      grab_target: number
        | "None"
        | "GroundedOnly"
        | "AerialOnly"
        | "AerialAndGrounded";
      i_frames: number;
      weight_dependent_speed: boolean;
    };
    x_pos: number;
    x_vel_modify: "None"
      | "Set"
      | "Add";
    x_vel_temp: number;
    y_pos: number;
    y_vel_modify: "None"
    | "Set"
    | "Add";
  }[];
  iasa: number;
  landing_lag?: number;
  scripts: {
    script_main: ScriptBlock;
    script_gfx: ScriptBlock;
    script_sfx: ScriptBlock;
    script_other: ScriptBlock;
  }
}

interface RawChildren {
  iasa?: number;
  xOffset?: number;
  yOffset?: number;
  xRange?: number;
  yRange?: number;
  hitFrame?: number;
  lastHitFrame?: number;
  damageInfo: {
    rootName: string;
    damage: number;
    bkb: string;
    kbg: number;
    angle: number;
  };
}

interface RawOutput {
  iasa: number;
  xOffset: number;
  yOffset: number;
  xRange: number;
  yRange: number;
  hitFrame: number;
  lastHitFrame: number;
  damageInfo: {
    rootName: string;
    damage: number;
    bkb: string;
    kbg: number;
    angle: number;
  };
  children: RawChildren[];
}

interface BBox {
  minX: number;
  maxX: number;
  minY: number;
  maxY: number;
}

interface AttackData {
  damage: number;
  bkb: number;
  kbg: number;
  angle: number;
  wdsk: number;
}

interface FrameBounds {
  startFrame: number;
  endFrame: number;
  bboxes: {
    [key: number]: BBox;
  }
  attackData: {
    [key: number]: AttackData;
  }
}

const roundToDec = (num: number, decimals: number) => {
  const multiplier = Math.pow(10, decimals);
  return Math.round(num * multiplier) / multiplier;
}

const getSubactionName = () => {
  return location.pathname.substring(location.pathname.lastIndexOf("/") + 1, location.pathname.lastIndexOf("."));
}
const getNameFromPage = () => {
  const loc = location.pathname.substring(location.pathname.lastIndexOf("/") + 1, location.pathname.lastIndexOf("."));
  switch (loc) {
    case "Attack11": 
    case "Attack12": 
    case "Attack13": return "Jab123";
    case "AttackS3S": return "FTilt";
    case "AttackHi3": return "UTilt";
    case "AttackLw3": return "DTilt";
    case "AttackS4S": return "FSmash";
    case "AttackHi4": return "USmash";
    case "AttackLw4": return "DSmash";
    case "AttackDash": return "DashAttack";
    case "SpecialN": return "NSpecial";
    case "SpecialS": return "SSpecial";
    case "SpecialHi": return "USpecial";
    case "SpecialLw": return "DSpecial";
    case "SpecialAirN": return "NSpecialAir";
    case "SpecialAirS": return "SSpecialAir";
    case "SpecialAirHi": return "USpecialAir";
    case "SpecialAirLw": return "DSpecialAir";
    case "Catch": 
    case "ThrowF": 
    case "ThrowLw":
    case "ThrowB":
    case "ThrowHi": return "Grab";
    case "AttackAirN": return "NAir";
    case "AttackAirF": return "FAir";
    case "AttackAirB": return "BAir";
    case "AttackAirHi": return "UAir";
    case "AttackAirLw": return "DAir";
  }
  return "";
}

let rerender: () => void;

type buttonWithParent = (HTMLButtonElement & {parent: HTMLButtonElement});
class HitboxSelector {
  private allBBoxes: (BBox & {startFrame: number, endFrame: number})[] = [];
  private bboxGroups: number[][] = [];
  private selectedBBoxes: {[hitboxID: number]: boolean} = [];
  private selectedAttackData: number;
  private attackData: AttackData[] = [];

  private bboxGroupButtons: HTMLButtonElement[] = [];
  private bboxIdButtons: buttonWithParent[] = [];
  private attackDataButtons: HTMLButtonElement[] = [];
  private selectionName: HTMLInputElement = document.createElement("input");

  constructor(
    private bounds: FrameBounds[],
    private parent: DataCalculator, 
    target: HTMLElement,
  ) {
    this.selectionName.className = "name-picker";
    this.selectionName.onchange = () => this.parent.output();
    this.selectionName.placeholder = "variant name here";

    const pickerContainer = document.createElement("div");
    pickerContainer.className = "picker-container";
    pickerContainer.appendChild(this.selectionName);

    const bboxPicker = document.createElement("div");
    bboxPicker.className = "bbox-picker";
    const attackDataPicker = document.createElement("div");
    attackDataPicker.className = "attackData-picker";
    for (const [idx, group] of bounds.entries()) {
      const currPicker = document.createElement("div");
      const groupBtn = document.createElement("button");
      groupBtn.innerText = `group ${idx}`;
      
      this.bboxGroups.push([]);
      const idPicker = document.createElement("div");
      for (const bbox of Object.values(group.bboxes)) {
        const id = this.allBBoxes.length;
        this.bboxGroups[idx].push(id);
        const idSelect = document.createElement("button") as buttonWithParent;
        idSelect.innerText = `${id}`;
        idSelect.onclick = () => this.changeBBoxStatus(id);
        idSelect.parent = groupBtn;
        this.bboxIdButtons.push(idSelect);

        this.selectedBBoxes[id] = false;
        
        this.allBBoxes.push({...bbox, startFrame: group.startFrame, endFrame: group.endFrame});
        idPicker.appendChild(idSelect);
      }

      groupBtn.onclick = () => {
        this.changeBBoxGroupStatus(idx);
      }
      this.bboxGroupButtons.push(groupBtn);

      currPicker.appendChild(groupBtn);
      currPicker.appendChild(idPicker);
      bboxPicker.appendChild(currPicker);

      for (const atkd of Object.values(group.attackData)) {
        const hb = this.attackData.length;
        const hbSelect = document.createElement("button");
        hbSelect.innerText = `${hb}`;
        hbSelect.onclick = () => this.selectAttackData(hb);
        this.attackData.push(atkd);
        this.attackDataButtons.push(hbSelect);
        attackDataPicker.appendChild(hbSelect);
      }
    }

    pickerContainer.appendChild(bboxPicker);
    pickerContainer.appendChild(attackDataPicker);
    target.appendChild(pickerContainer);
  }

  private changeBBoxGroupStatus = (groupIdx: number) => {
    let shouldSelectAll = false;
    for (const idx of this.bboxGroups[groupIdx]) {
      if (!this.selectedBBoxes[idx]) {
        shouldSelectAll = true;
        break;
      }
    }
    for (const idx of this.bboxGroups[groupIdx]) {
      this.selectedBBoxes[idx] = shouldSelectAll;
      this.bboxIdButtons[idx].setAttribute("selected", `${shouldSelectAll}`);
    }
    this.bboxGroupButtons[groupIdx].setAttribute("selected", `${shouldSelectAll}`);
    this.parent.output();
  }

  private changeBBoxStatus = (bbox: number) => {
    this.bboxIdButtons[bbox].setAttribute("selected", `${!this.selectedBBoxes[bbox]}`);
    this.selectedBBoxes[bbox] = !this.selectedBBoxes[bbox];
    if (!this.selectedBBoxes[bbox]) this.bboxIdButtons[bbox].parent.setAttribute("selected", "false");
    this.parent.output();
  }

  private selectAttackData = (hb: number) => {
    if (this.selectedAttackData != undefined) this.attackDataButtons[this.selectedAttackData].setAttribute("selected", "false");
    this.attackDataButtons[hb].setAttribute("selected", "true");
    this.selectedAttackData = hb;
    this.parent.output();
  }

  public getName = () => {
    return this.selectionName.value;
  }
  public getSelectedBBox = (): BBox => {
    let selected = this.allBBoxes.filter((_, idx) => this.selectedBBoxes[idx]);
    if (selected.length === 0) selected = this.allBBoxes;
    return {
      minX: Math.min(...selected.map(b => b.minX)),
      maxX: Math.max(...selected.map(b => b.maxX)),
      minY: Math.min(...selected.map(b => b.minY)),
      maxY: Math.max(...selected.map(b => b.maxY))
    }
  }
  public getStartFrame = () => {
    let selected = this.allBBoxes.filter((_, idx) => this.selectedBBoxes[idx]);
    if (selected.length === 0) selected = this.allBBoxes;
    return Math.min(...selected.map(b => b.startFrame));
  }
  public getEndFrame = () => {
    let selected = this.allBBoxes.filter((_, idx) => this.selectedBBoxes[idx]);
    if (selected.length === 0) selected = this.allBBoxes;
    const result = Math.max(...selected.map(b => b.endFrame));
    return (result !== -1) ? result : this.parent.data.frames.length; 
  }
  public getAttackData = () => {
    const atkdIdx = this.selectedAttackData;
    if (atkdIdx != undefined) {
      const { damage, angle, bkb, kbg, wdsk } = this.attackData[atkdIdx];
      return `${damage}|${wdsk ? `w${wdsk}` : bkb}|${kbg}|${angle}`;
    } else {
      return "0|0|0|0";
    }
  }
}

let customBBox: BBox;
class DataCalculator {
  private rootName: HTMLInputElement = document.createElement("input");

  private selectorBase: HTMLElement = document.createElement("div");
  private selectors: HitboxSelector[] = [];

  private rootElement: HTMLElement = document.createElement("div");
  private resultBox: HTMLTextAreaElement = document.createElement("textarea");

  private baseRegionData: FrameBounds[];
  constructor(
    public data: SubactionData, 
    target: HTMLElement
  ) {
    this.rootElement.id = "custom-element";
    console.log(data);

    const nameContainer = document.createElement("div");
    nameContainer.style.display = "flex";
    nameContainer.style.flexDirection = "row";

    const addBtn = document.createElement("button");
    addBtn.onclick = () => {
      this.selectors.push(new HitboxSelector(this.baseRegionData, this, this.selectorBase));
    }
    addBtn.innerText = "+";
    nameContainer.appendChild(addBtn);

    const remBtn = document.createElement("button");
    remBtn.onclick = () => {
      if (this.selectors.length > 1) {
        this.selectorBase.lastChild.remove();
        this.selectors.pop();
        this.output();
      }
    }
    remBtn.innerText = "-";
    nameContainer.appendChild(remBtn);

    this.rootName.placeholder = "root name here";
    nameContainer.appendChild(this.rootName);

    this.rootElement.appendChild(nameContainer);
    this.selectorBase.id = "custom-selectors";
    this.rootElement.appendChild(this.selectorBase);
    // this.frames.onchange = () => this.output();
    // this.rootElement.appendChild(this.frames);
    // this.hitboxIDs.placeholder = "hitbox IDs here (csv)";
    // this.rootElement.appendChild(this.hitboxIDs);
    // this.variantNames.placeholder = "variant names here (csv)"
    // this.rootElement.appendChild(this.variantNames);

    // const button = document.createElement("button");
    // button.id = "custom-button";
    // button.innerText = "Submit";
    // button.onclick = () => this.calcGiven();
    // this.rootElement.appendChild(button);
    this.resultBox.id = "custom-result";
    this.rootElement.appendChild(this.resultBox);
    
    target.prepend(this.rootElement);
    this.calcVariousBounds();
    this.selectors.push(new HitboxSelector(this.baseRegionData, this, this.selectorBase));
    this.output();
  }

  private newBBox = (): BBox => ({
    minX: 500,
    maxX: -500,
    minY: 500,
    maxY: -500
  });

  private calcVariousBounds = () => {
    const frameBounds: FrameBounds[] = [];

    for (const [i, frame] of this.data.frames.entries()) {
      let newFrameBounds = false;
      if (frame.hit_boxes.length > 0 && frameBounds.length === 0) {
        newFrameBounds = true;
      } else if (frameBounds.length > 0) {
        if (frame.hit_boxes.length !== Object.entries(frameBounds[frameBounds.length - 1].attackData).length) {
          frameBounds[frameBounds.length - 1].endFrame = i;
          newFrameBounds = true;
        } else {
          for (const [id, atkd] of Object.entries(frameBounds[frameBounds.length - 1].attackData)) {
            for (const { hitbox_id, next_values } of frame.hit_boxes) {
              if (parseInt(id) === hitbox_id) {
                if (atkd.angle !== next_values.Hit.trajectory
                  || atkd.bkb !== next_values.Hit.bkb
                  || atkd.damage !== next_values.Hit.damage
                  || atkd.kbg !== next_values.Hit.kbg
                  || atkd.wdsk !== next_values.Hit.wdsk) {
                    frameBounds[frameBounds.length - 1].endFrame = i;
                    newFrameBounds = true;
                }
              }
            }
          }
        }
      }

      if (newFrameBounds) {
        frameBounds.push({
          startFrame: i + 1,
          endFrame: -1,
          bboxes: {},
          attackData: {}
        });
      }


      for (const hb of frame.hit_boxes) {
        const currFB = frameBounds[frameBounds.length - 1];
        if (!currFB.bboxes[hb.hitbox_id]) currFB.bboxes[hb.hitbox_id] = this.newBBox();
        const currBB = currFB.bboxes[hb.hitbox_id];
        if (hb.next_pos) {
          const radius = hb.next_size;
          const correctedPos = {
            x: hb.next_pos.z + frame.x_pos,
            y: hb.next_pos.y + frame.y_pos,
            z: hb.next_pos.x
          };
          if (-hb.next_size < correctedPos.z && correctedPos.z < hb.next_size) {
            if (currBB.minX > correctedPos.x - radius) currBB.minX = correctedPos.x - radius;
            if (currBB.maxX < correctedPos.x + radius) currBB.maxX = correctedPos.x + radius;
            if (currBB.minY > correctedPos.y - radius) currBB.minY = correctedPos.y - radius;
            if (currBB.maxY < correctedPos.y + radius) currBB.maxY = correctedPos.y + radius;
          }

          if (!currFB.attackData[hb.hitbox_id] && hb.next_values.Hit) {
            currFB.attackData[hb.hitbox_id] = {
              damage: hb.next_values.Hit.damage,
              bkb: hb.next_values.Hit.bkb,
              kbg: hb.next_values.Hit.kbg,
              angle: hb.next_values.Hit.trajectory,
              wdsk: hb.next_values.Hit.wdsk
            }
          }
        }
        if (hb.prev_pos) {
          const radius = hb.prev_size;
          const correctedPos = {
            x: hb.prev_pos.z + frame.x_pos,
            y: hb.prev_pos.y + frame.y_pos,
            z: hb.prev_pos.x
          };
          if (-hb.prev_size < correctedPos.z && correctedPos.z < hb.prev_size) {
            if (currBB.minX > correctedPos.x - radius) currBB.minX = correctedPos.x - radius;
            if (currBB.maxX < correctedPos.x + radius) currBB.maxX = correctedPos.x + radius;
            if (currBB.minY > correctedPos.y - radius) currBB.minY = correctedPos.y - radius;
            if (currBB.maxY < correctedPos.y + radius) currBB.maxY = correctedPos.y + radius;
          }
        }
      }
    }

    this.baseRegionData = frameBounds.filter((v) => {
      return Object.entries(v.bboxes).length !== 0;
    });
  }

  public output = () => {
    let out = "";
    let append = (s: string) => {out += `${s}\n`};
    let round = (num: number) => roundToDec(num, 2);
    const rootName = (this.rootName.value.length > 0) ? this.rootName.value : getNameFromPage();
    for (const [idx, selector] of this.selectors.entries()) {
      let name = selector.getName();
      const bbox = selector.getSelectedBBox();
      if (idx === 0) {
        append(`${getSubactionName()} unk=${this.data.iasa || 0},start=${selector.getStartFrame()},end=${selector.getEndFrame()},xmin=${round(bbox.minX).toFixed(2)},xmax=${round(bbox.maxX).toFixed(2)},ymin=${round(bbox.minY).toFixed(2)},ymax=${round(bbox.maxY).toFixed(2)}`);
        append("==========================");
        name = rootName.toLowerCase();
        append(`#const ${name}_IASA = ${this.data.iasa || (this.data.frames.length + 1)}`)
        customBBox = bbox;
      } else {
        append(`#const mv_${name} = ${idx}`);
      }
      append(`#const ${name}_xOffset = ${round(bbox.minX)}`);
      append(`#const ${name}_yOffset = ${round(bbox.minY) * -1}`);
      append(`#const ${name}_xRange = ${round((bbox.maxX - bbox.minX) / 2)}`);
      append(`#const ${name}_yRange = ${round((bbox.maxY - bbox.minY) / 2)}`);
      append(`#const ${name}_hitFrame = ${selector.getStartFrame()}`);
      append(`#const ${name}_lastHitFrame = ${selector.getEndFrame()}`);
      append(`#const ${name}_damage_info = ${rootName}|${selector.getAttackData()}`);
      append("---------------------------");
    }
    this.resultBox.innerHTML = out;
    rerender();
    // this.resultBox.innerHTML = JSON.stringify(this.baseRegionData, null, 2);
  }
}

const styling = `
  #custom-element {
    width: 100%;
    height: 420px;
    border: 2px solid #FFF;
    display: flex;
    flex-direction: column;
  }
  #custom-result {
    font-family: monospace;
    background-color: black;
    color: #DDD;
    flex-grow: 1;
  }
  #custom-selectors {
    max-height: 100px;
    overflow-y: scroll;
  }
  #custom-selectors > div:first-child > input {
    display: none;
  }

  .picker-container {
    display: flex;
    flex-direction: column;
  }

  .bbox-picker {
    display: flex;
    flex-direction: row;
  }

  .bbox-picker > div {
    flex-grow: 1;
    display: flex;
    flex-direction: column;
  }

  .bbox-picker > div > div {
    display: flex; 
    flex-direction: row;
  }

  .bbox-picker button {
    flex-grow: 1;
    border: 1px solid black;
    background-color: #DDD;
  }

  .bbox-picker button[selected="true"] {
    background-color: #999;
  }

  .attackData-picker {
    display: flex;
    flex-direction: row;
  }
  .attackData-picker button {
    flex-grow: 1;
    border: 1pxx solid black;
    background-color: #FDD;
  }
  .attackData-picker button[selected="true"] {
    background-color: #F99;
  }
`;


(function() {
  'use strict';
  const style = document.createElement("style");
  style.innerText = styling;
  document.head.appendChild(style);
  let sActData: SubactionData;
  if (window["fighter_render"]) {

    sActData = window["fighter_render"].subaction_data as SubactionData;
    const original = window["fighter_render"].setup_frame as () => void;
    rerender = window["fighter_render"].setup_frame = () => {
      original.call(window["fighter_render"]);
      const scene = window["fighter_render"].scene_overlay as THREE.Scene;
      if (customBBox) {
        const material = new THREE.MeshBasicMaterial({ color: 0x00ff00, transparent: true, opacity: 0.15, side: THREE.DoubleSide });
        const vertices = [
          0, customBBox.maxY, customBBox.minX,
          0, customBBox.maxY, customBBox.maxX,
          0, customBBox.minY, customBBox.minX,
          0, customBBox.minY, customBBox.maxX
        ];
        const indices = [
          0, 1, 2,
          1, 2, 3
        ];
        const geometry = new THREE.BufferGeometry();
        geometry.addAttribute('position', new THREE.BufferAttribute(new Float32Array(vertices), 3));
        geometry.setIndex(indices);
  
        const mesh = new THREE.Mesh(geometry, material);
        // mesh.position.z = sActData.frames[window["fighter_render"].frame_index].x_pos;
        // mesh.position.y = sActData.frames[window["fighter_render"].frame_index].y_pos;
        mesh.renderOrder = 8;
        scene.add(mesh);
  
        const inner_material = new THREE.MeshBasicMaterial({ color: 0x00ff00, transparent: true, opacity: 0.8, side: THREE.DoubleSide });
        const thickness = -0.2;
        const inner_vertices = [
            0, customBBox.maxY, customBBox.minX, // top left: 0
            0, customBBox.maxY, customBBox.maxX, // top right: 1
            0, customBBox.minY, customBBox.minX, // bottom left: 2
            0, customBBox.minY, customBBox.maxX, // bottom right: 3
            0, customBBox.maxY - thickness, customBBox.minX + thickness, // inner top left: 4
            0, customBBox.maxY - thickness, customBBox.maxX - thickness, // inner top right: 5
            0, customBBox.minY + thickness, customBBox.minX + thickness, // inner bottom left: 6
            0, customBBox.minY + thickness, customBBox.maxX - thickness // inner bottom right: 7
        ];
        const inner_indices = [
            0, 1, 4,
            4, 1, 5,
            1, 3, 5,
            7, 3, 5,
            7, 6, 3,
            2, 3, 6,
            2, 0, 4,
            4, 6, 2
        ];
  
        const inner_geometry = new THREE.BufferGeometry();
        inner_geometry.addAttribute('position', new THREE.BufferAttribute(new Float32Array(inner_vertices), 3));
        inner_geometry.setIndex(inner_indices);
  
        const outline = new THREE.Mesh(inner_geometry, inner_material);
        outline.renderOrder = 9
        scene.add(outline);
      }
    }
    
    new DataCalculator(
      sActData,
      document.querySelector("body > div > div > div")
    );
  } else {
    // sActData = window["subaction_data"] as SubactionData;
  }
  
})();