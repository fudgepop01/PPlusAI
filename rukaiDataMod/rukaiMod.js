// ==UserScript==
// @name         Rukai Data Extractor
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  generates various stats that fudge can then copy/paste
// @author       fudgepop01
// @match        localhost:8000/*
// @icon         https://www.google.com/s2/favicons?domain=rukaidata.com
// @grant        none
// ==/UserScript==
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
var __values = (this && this.__values) || function(o) {
    var s = typeof Symbol === "function" && Symbol.iterator, m = s && o[s], i = 0;
    if (m) return m.call(o);
    if (o && typeof o.length === "number") return {
        next: function () {
            if (o && i >= o.length) o = void 0;
            return { value: o && o[i++], done: !o };
        }
    };
    throw new TypeError(s ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
var __read = (this && this.__read) || function (o, n) {
    var m = typeof Symbol === "function" && o[Symbol.iterator];
    if (!m) return o;
    var i = m.call(o), r, ar = [], e;
    try {
        while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
    }
    catch (error) { e = { error: error }; }
    finally {
        try {
            if (r && !r.done && (m = i["return"])) m.call(i);
        }
        finally { if (e) throw e.error; }
    }
    return ar;
};
var __spreadArray = (this && this.__spreadArray) || function (to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
        if (ar || !(i in from)) {
            if (!ar) ar = Array.prototype.slice.call(from, 0, i);
            ar[i] = from[i];
        }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
};
var roundToDec = function (num, decimals) {
    var multiplier = Math.pow(10, decimals);
    return Math.round(num * multiplier) / multiplier;
};
var getSubactionName = function () {
    var loc = location.pathname.substring(location.pathname.lastIndexOf("/") + 1, location.pathname.lastIndexOf("."));
    if (!loc.startsWith("Special")) {
        switch (loc) {
            case "AttackS3Hi": return "AttackS3Hi_AttackS3S_";
            case "AttackS3Lw": return "AttackS3Lw_AttackS3S_";
            case "AttackS4Hi": return "AttackS4Hi_AttackS4S_";
            case "AttackS4Lw": return "AttackS4Lw_AttackS4S_";
        }
        return loc;
    }
    var idxTablePos = 10;
    var subActPiece = "";
    while (idxTablePos > 0) {
        var component = document.querySelector("body > div > div > div > table > tbody > tr:nth-child(" + idxTablePos + ") > td:nth-child(2)");
        if (component != undefined) {
            subActPiece = component.innerHTML.toString().substring(2).toUpperCase();
            break;
        }
        idxTablePos -= 1;
    }
    return "subaction0x" + subActPiece;
};
var getRawSubactionValue = function () {
    var idxTablePos = 10;
    var subActPiece = "";
    while (idxTablePos > 0) {
        var component = document.querySelector("body > div > div > div > table > tbody > tr:nth-child(" + idxTablePos + ") > td:nth-child(2)");
        if (component != undefined) {
            subActPiece = component.innerHTML.toString().substring(2).toUpperCase();
            break;
        }
        idxTablePos -= 1;
    }
    return subActPiece;
};
var getCharacterName = function () {
    return location.pathname.substring(location.pathname.indexOf("Project+/") + 9, location.pathname.lastIndexOf("/subactions"));
};
var getNameFromPage = function () {
    var loc = location.pathname.substring(location.pathname.lastIndexOf("/") + 1, location.pathname.lastIndexOf("."));
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
        case "Catch": return "Grab";
        case "ThrowF": return "fthrow";
        case "ThrowLw": return "dthrow";
        case "ThrowB": return "bthrow";
        case "ThrowHi": return "uthrow";
        case "AttackAirN": return "NAir";
        case "AttackAirF": return "FAir";
        case "AttackAirB": return "BAir";
        case "AttackAirHi": return "UAir";
        case "AttackAirLw": return "DAir";
    }
    return "";
};
var rerender;
var HitboxSelector = /** @class */ (function () {
    function HitboxSelector(bounds, parent, target) {
        var e_1, _a;
        var _this = this;
        this.bounds = bounds;
        this.parent = parent;
        this.allBBoxes = [];
        this.bboxGroups = [];
        this.selectedBBoxes = [];
        this.attackData = [];
        this.bboxGroupButtons = [];
        this.bboxIdButtons = [];
        this.attackDataButtons = [];
        this.selectionName = document.createElement("input");
        this.changeBBoxGroupStatus = function (groupIdx) {
            var e_2, _a, e_3, _b;
            var shouldSelectAll = false;
            try {
                for (var _c = __values(_this.bboxGroups[groupIdx]), _d = _c.next(); !_d.done; _d = _c.next()) {
                    var idx = _d.value;
                    if (!_this.selectedBBoxes[idx]) {
                        shouldSelectAll = true;
                        break;
                    }
                }
            }
            catch (e_2_1) { e_2 = { error: e_2_1 }; }
            finally {
                try {
                    if (_d && !_d.done && (_a = _c["return"])) _a.call(_c);
                }
                finally { if (e_2) throw e_2.error; }
            }
            try {
                for (var _e = __values(_this.bboxGroups[groupIdx]), _f = _e.next(); !_f.done; _f = _e.next()) {
                    var idx = _f.value;
                    _this.selectedBBoxes[idx] = shouldSelectAll;
                    _this.bboxIdButtons[idx].setAttribute("selected", "" + shouldSelectAll);
                }
            }
            catch (e_3_1) { e_3 = { error: e_3_1 }; }
            finally {
                try {
                    if (_f && !_f.done && (_b = _e["return"])) _b.call(_e);
                }
                finally { if (e_3) throw e_3.error; }
            }
            _this.bboxGroupButtons[groupIdx].setAttribute("selected", "" + shouldSelectAll);
            _this.parent.output();
        };
        this.changeBBoxStatus = function (bbox) {
            _this.bboxIdButtons[bbox].setAttribute("selected", "" + !_this.selectedBBoxes[bbox]);
            _this.selectedBBoxes[bbox] = !_this.selectedBBoxes[bbox];
            if (!_this.selectedBBoxes[bbox])
                _this.bboxIdButtons[bbox].parent.setAttribute("selected", "false");
            _this.parent.output();
        };
        this.selectAttackData = function (hb) {
            if (_this.selectedAttackData != undefined)
                _this.attackDataButtons[_this.selectedAttackData].setAttribute("selected", "false");
            _this.attackDataButtons[hb].setAttribute("selected", "true");
            _this.selectedAttackData = hb;
            _this.parent.output();
        };
        this.getName = function () {
            return _this.selectionName.value;
        };
        this.getSelectedBBox = function () {
            var selected = _this.allBBoxes.filter(function (_, idx) { return _this.selectedBBoxes[idx]; });
            if (selected.length === 0)
                selected = _this.allBBoxes;
            return {
                minX: Math.min.apply(Math, __spreadArray([], __read(selected.map(function (b) { return b.minX; })), false)),
                maxX: Math.max.apply(Math, __spreadArray([], __read(selected.map(function (b) { return b.maxX; })), false)),
                minY: Math.min.apply(Math, __spreadArray([], __read(selected.map(function (b) { return b.minY; })), false)),
                maxY: Math.max.apply(Math, __spreadArray([], __read(selected.map(function (b) { return b.maxY; })), false))
            };
        };
        this.getStartFrame = function () {
            var selected = _this.allBBoxes.filter(function (_, idx) { return _this.selectedBBoxes[idx]; });
            if (selected.length === 0)
                selected = _this.allBBoxes;
            return Math.min.apply(Math, __spreadArray([], __read(selected.map(function (b) { return b.startFrame; })), false));
        };
        this.getEndFrame = function () {
            var selected = _this.allBBoxes.filter(function (_, idx) { return _this.selectedBBoxes[idx]; });
            if (selected.length === 0)
                selected = _this.allBBoxes;
            var result = Math.max.apply(Math, __spreadArray([], __read(selected.map(function (b) { return b.endFrame; })), false));
            return (result !== -1) ? result : _this.parent.data.frames.length;
        };
        this.getAttackData = function () {
            var atkdIdx = _this.selectedAttackData;
            if (atkdIdx != undefined) {
                var _a = _this.attackData[atkdIdx], damage = _a.damage, angle = _a.angle, bkb = _a.bkb, kbg = _a.kbg, wdsk = _a.wdsk;
                return damage + "|" + (wdsk ? "w" + wdsk : bkb) + "|" + kbg + "|" + angle;
            }
            else {
                return "0|0|0|0";
            }
        };
        this.selectionName.className = "name-picker";
        this.selectionName.onchange = function () { return _this.parent.output(); };
        this.selectionName.placeholder = "variant name here";
        var pickerContainer = document.createElement("div");
        pickerContainer.className = "picker-container";
        pickerContainer.appendChild(this.selectionName);
        var bboxPicker = document.createElement("div");
        bboxPicker.className = "bbox-picker";
        var attackDataPicker = document.createElement("div");
        attackDataPicker.className = "attackData-picker";
        var _loop_1 = function (idx, group) {
            var e_4, _e, e_5, _f;
            var currPicker = document.createElement("div");
            var groupBtn = document.createElement("button");
            groupBtn.innerText = "group " + idx;
            this_1.bboxGroups.push([]);
            var idPicker = document.createElement("div");
            var _loop_2 = function (bbox) {
                var id = this_1.allBBoxes.length;
                this_1.bboxGroups[idx].push(id);
                var idSelect = document.createElement("button");
                idSelect.innerText = "" + id;
                idSelect.onclick = function () { return _this.changeBBoxStatus(id); };
                idSelect.parent = groupBtn;
                this_1.bboxIdButtons.push(idSelect);
                this_1.selectedBBoxes[id] = false;
                this_1.allBBoxes.push(__assign(__assign({}, bbox), { startFrame: group.startFrame, endFrame: group.endFrame }));
                idPicker.appendChild(idSelect);
            };
            try {
                for (var _g = (e_4 = void 0, __values(Object.values(group.bboxes))), _h = _g.next(); !_h.done; _h = _g.next()) {
                    var bbox = _h.value;
                    _loop_2(bbox);
                }
            }
            catch (e_4_1) { e_4 = { error: e_4_1 }; }
            finally {
                try {
                    if (_h && !_h.done && (_e = _g["return"])) _e.call(_g);
                }
                finally { if (e_4) throw e_4.error; }
            }
            groupBtn.onclick = function () {
                _this.changeBBoxGroupStatus(idx);
            };
            this_1.bboxGroupButtons.push(groupBtn);
            currPicker.appendChild(groupBtn);
            currPicker.appendChild(idPicker);
            bboxPicker.appendChild(currPicker);
            var _loop_3 = function (atkd) {
                var hb = this_1.attackData.length;
                var hbSelect = document.createElement("button");
                hbSelect.innerText = "" + hb;
                hbSelect.onclick = function () { return _this.selectAttackData(hb); };
                this_1.attackData.push(atkd);
                this_1.attackDataButtons.push(hbSelect);
                attackDataPicker.appendChild(hbSelect);
            };
            try {
                for (var _j = (e_5 = void 0, __values(Object.values(group.attackData))), _k = _j.next(); !_k.done; _k = _j.next()) {
                    var atkd = _k.value;
                    _loop_3(atkd);
                }
            }
            catch (e_5_1) { e_5 = { error: e_5_1 }; }
            finally {
                try {
                    if (_k && !_k.done && (_f = _j["return"])) _f.call(_j);
                }
                finally { if (e_5) throw e_5.error; }
            }
        };
        var this_1 = this;
        try {
            for (var _b = __values(bounds.entries()), _c = _b.next(); !_c.done; _c = _b.next()) {
                var _d = __read(_c.value, 2), idx = _d[0], group = _d[1];
                _loop_1(idx, group);
            }
        }
        catch (e_1_1) { e_1 = { error: e_1_1 }; }
        finally {
            try {
                if (_c && !_c.done && (_a = _b["return"])) _a.call(_b);
            }
            finally { if (e_1) throw e_1.error; }
        }
        pickerContainer.appendChild(bboxPicker);
        pickerContainer.appendChild(attackDataPicker);
        target.appendChild(pickerContainer);
    }
    return HitboxSelector;
}());
var customBBox;
var DataCalculator = /** @class */ (function () {
    function DataCalculator(data, target) {
        var _this = this;
        this.data = data;
        this.rootName = document.createElement("input");
        this.selectorBase = document.createElement("div");
        this.selectors = [];
        this.rootElement = document.createElement("div");
        this.resultBox = document.createElement("textarea");
        this.newBBox = function () { return ({
            minX: 500,
            maxX: -500,
            minY: 500,
            maxY: -500
        }); };
        this.calcVariousBounds = function () {
            var e_6, _a, e_7, _b, e_8, _c, e_9, _d;
            var frameBounds = [];
            try {
                for (var _e = __values(_this.data.frames.entries()), _f = _e.next(); !_f.done; _f = _e.next()) {
                    var _g = __read(_f.value, 2), i = _g[0], frame = _g[1];
                    var newFrameBounds = false;
                    if (frame["throw"]) {
                        _this.throwData = {
                            frame: i,
                            damage: frame["throw"].damage,
                            bkb: frame["throw"].bkb,
                            kbg: frame["throw"].kbg,
                            angle: frame["throw"].trajectory,
                            wdsk: frame["throw"].wdsk
                        };
                    }
                    if (frame.hit_boxes.length > 0 && frameBounds.length === 0) {
                        newFrameBounds = true;
                    }
                    else if (frameBounds.length > 0) {
                        if (frame.hit_boxes.length !== Object.entries(frameBounds[frameBounds.length - 1].attackData).length) {
                            frameBounds[frameBounds.length - 1].endFrame = i;
                            newFrameBounds = true;
                        }
                        else {
                            try {
                                for (var _h = (e_7 = void 0, __values(Object.entries(frameBounds[frameBounds.length - 1].attackData))), _j = _h.next(); !_j.done; _j = _h.next()) {
                                    var _k = __read(_j.value, 2), id = _k[0], atkd = _k[1];
                                    try {
                                        for (var _l = (e_8 = void 0, __values(frame.hit_boxes)), _m = _l.next(); !_m.done; _m = _l.next()) {
                                            var _o = _m.value, hitbox_id = _o.hitbox_id, next_values = _o.next_values;
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
                                    catch (e_8_1) { e_8 = { error: e_8_1 }; }
                                    finally {
                                        try {
                                            if (_m && !_m.done && (_c = _l["return"])) _c.call(_l);
                                        }
                                        finally { if (e_8) throw e_8.error; }
                                    }
                                }
                            }
                            catch (e_7_1) { e_7 = { error: e_7_1 }; }
                            finally {
                                try {
                                    if (_j && !_j.done && (_b = _h["return"])) _b.call(_h);
                                }
                                finally { if (e_7) throw e_7.error; }
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
                    try {
                        for (var _p = (e_9 = void 0, __values(frame.hit_boxes)), _q = _p.next(); !_q.done; _q = _p.next()) {
                            var hb = _q.value;
                            var currFB = frameBounds[frameBounds.length - 1];
                            if (!currFB.bboxes[hb.hitbox_id])
                                currFB.bboxes[hb.hitbox_id] = _this.newBBox();
                            var currBB = currFB.bboxes[hb.hitbox_id];
                            if (hb.next_pos) {
                                var radius = hb.next_size;
                                var correctedPos = {
                                    x: hb.next_pos.z + frame.x_pos,
                                    y: hb.next_pos.y + frame.y_pos,
                                    z: hb.next_pos.x
                                };
                                if (-hb.next_size < correctedPos.z && correctedPos.z < hb.next_size) {
                                    if (currBB.minX > correctedPos.x - radius)
                                        currBB.minX = correctedPos.x - radius;
                                    if (currBB.maxX < correctedPos.x + radius)
                                        currBB.maxX = correctedPos.x + radius;
                                    if (currBB.minY > correctedPos.y - radius)
                                        currBB.minY = correctedPos.y - radius;
                                    if (currBB.maxY < correctedPos.y + radius)
                                        currBB.maxY = correctedPos.y + radius;
                                }
                                if (!currFB.attackData[hb.hitbox_id] && hb.next_values.Hit) {
                                    currFB.attackData[hb.hitbox_id] = {
                                        damage: hb.next_values.Hit.damage,
                                        bkb: hb.next_values.Hit.bkb,
                                        kbg: hb.next_values.Hit.kbg,
                                        angle: hb.next_values.Hit.trajectory,
                                        wdsk: hb.next_values.Hit.wdsk
                                    };
                                }
                            }
                            if (hb.prev_pos) {
                                var radius = hb.prev_size;
                                var correctedPos = {
                                    x: hb.prev_pos.z + frame.x_pos,
                                    y: hb.prev_pos.y + frame.y_pos,
                                    z: hb.prev_pos.x
                                };
                                if (-hb.prev_size < correctedPos.z && correctedPos.z < hb.prev_size) {
                                    if (currBB.minX > correctedPos.x - radius)
                                        currBB.minX = correctedPos.x - radius;
                                    if (currBB.maxX < correctedPos.x + radius)
                                        currBB.maxX = correctedPos.x + radius;
                                    if (currBB.minY > correctedPos.y - radius)
                                        currBB.minY = correctedPos.y - radius;
                                    if (currBB.maxY < correctedPos.y + radius)
                                        currBB.maxY = correctedPos.y + radius;
                                }
                            }
                        }
                    }
                    catch (e_9_1) { e_9 = { error: e_9_1 }; }
                    finally {
                        try {
                            if (_q && !_q.done && (_d = _p["return"])) _d.call(_p);
                        }
                        finally { if (e_9) throw e_9.error; }
                    }
                }
            }
            catch (e_6_1) { e_6 = { error: e_6_1 }; }
            finally {
                try {
                    if (_f && !_f.done && (_a = _e["return"])) _a.call(_e);
                }
                finally { if (e_6) throw e_6.error; }
            }
            _this.baseRegionData = frameBounds.filter(function (v) {
                return Object.entries(v.bboxes).length !== 0;
            });
        };
        this.output = function () {
            var e_10, _a;
            var _b;
            var out = "";
            var append = function (s) { out += s + "\n"; };
            var round = function (num) { return roundToDec(num, 2); };
            var rootName = (_this.rootName.value.length > 0) ? _this.rootName.value : getNameFromPage();
            if (['uthrow', 'bthrow', 'dthrow', 'fthrow'].includes(getNameFromPage()) && _this.throwData) {
                append("#const " + rootName + "_IASA = " + (_this.data.iasa || (_this.data.frames.length + 1)));
                append("#const " + rootName + "_throwFrame = " + _this.throwData.frame);
                append("#const " + rootName + "_damage_info = Grab|" + _this.throwData.damage + "|" + _this.throwData.bkb + "|" + _this.throwData.kbg + "|" + _this.throwData.angle);
            }
            else {
                try {
                    for (var _c = __values(_this.selectors.entries()), _d = _c.next(); !_d.done; _d = _c.next()) {
                        var _e = __read(_d.value, 2), idx = _e[0], selector = _e[1];
                        var name_1 = selector.getName();
                        var bbox = selector.getSelectedBBox();
                        if (idx === 0) {
                            var subactionData = getSubactionName() + " unk=" + (_this.data.iasa || 0) + ",start=" + selector.getStartFrame() + ",end=" + selector.getEndFrame() + ",xmin=" + round(bbox.minX).toFixed(2) + ",xmax=" + round(bbox.maxX).toFixed(2) + ",ymin=" + round(bbox.minY).toFixed(2) + ",ymax=" + round(bbox.maxY).toFixed(2);
                            if (selector.getStartFrame() !== Infinity) {
                                var stored = JSON.parse((_b = localStorage.getItem("Rukai-" + getCharacterName())) !== null && _b !== void 0 ? _b : "{}");
                                stored[getRawSubactionValue()] = subactionData;
                                localStorage.setItem("Rukai-" + getCharacterName(), JSON.stringify(stored));
                            }
                            append(subactionData);
                            append("==========================");
                            name_1 = rootName.toLowerCase();
                            append("#const " + name_1 + "_IASA = " + (_this.data.iasa || (_this.data.frames.length + 1)));
                            customBBox = bbox;
                        }
                        else {
                            append("#const mv_" + name_1 + " = " + idx);
                        }
                        append("#const " + name_1 + "_xOffset = " + round(bbox.minX));
                        append("#const " + name_1 + "_yOffset = " + round(bbox.minY) * -1);
                        append("#const " + name_1 + "_xRange = " + round((bbox.maxX - bbox.minX) / 2));
                        append("#const " + name_1 + "_yRange = " + round((bbox.maxY - bbox.minY) / 2));
                        append("#const " + name_1 + "_hitFrame = " + selector.getStartFrame());
                        append("#const " + name_1 + "_lastHitFrame = " + selector.getEndFrame());
                        append("#const " + name_1 + "_damage_info = " + rootName + "|" + selector.getAttackData());
                        append("---------------------------");
                    }
                }
                catch (e_10_1) { e_10 = { error: e_10_1 }; }
                finally {
                    try {
                        if (_d && !_d.done && (_a = _c["return"])) _a.call(_c);
                    }
                    finally { if (e_10) throw e_10.error; }
                }
            }
            _this.resultBox.innerHTML = out;
            rerender();
            // this.resultBox.innerHTML = JSON.stringify(this.baseRegionData, null, 2);
        };
        this.rootElement.id = "custom-element";
        console.log(data);
        var nameContainer = document.createElement("div");
        nameContainer.style.display = "flex";
        nameContainer.style.flexDirection = "row";
        var addBtn = document.createElement("button");
        addBtn.onclick = function () {
            _this.selectors.push(new HitboxSelector(_this.baseRegionData, _this, _this.selectorBase));
        };
        addBtn.innerText = "+";
        nameContainer.appendChild(addBtn);
        var remBtn = document.createElement("button");
        remBtn.onclick = function () {
            if (_this.selectors.length > 1) {
                _this.selectorBase.lastChild.remove();
                _this.selectors.pop();
                _this.output();
            }
        };
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
    return DataCalculator;
}());
var styling = "\n  #custom-element {\n    width: 100%;\n    height: 420px;\n    border: 2px solid #FFF;\n    display: flex;\n    flex-direction: column;\n  }\n  #custom-result {\n    font-family: monospace;\n    background-color: black;\n    color: #DDD;\n    flex-grow: 1;\n  }\n  #custom-selectors {\n    max-height: 100px;\n    overflow-y: scroll;\n  }\n  #custom-selectors > div:first-child > input {\n    display: none;\n  }\n\n  .picker-container {\n    display: flex;\n    flex-direction: column;\n  }\n\n  .bbox-picker {\n    display: flex;\n    flex-direction: row;\n  }\n\n  .bbox-picker > div {\n    flex-grow: 1;\n    display: flex;\n    flex-direction: column;\n  }\n\n  .bbox-picker > div > div {\n    display: flex; \n    flex-direction: row;\n  }\n\n  .bbox-picker button {\n    flex-grow: 1;\n    border: 1px solid black;\n    background-color: #DDD;\n  }\n\n  .bbox-picker button[selected=\"true\"] {\n    background-color: #999;\n  }\n\n  .attackData-picker {\n    display: flex;\n    flex-direction: row;\n  }\n  .attackData-picker button {\n    flex-grow: 1;\n    border: 1pxx solid black;\n    background-color: #FDD;\n  }\n  .attackData-picker button[selected=\"true\"] {\n    background-color: #F99;\n  }\n";
(function () {
    'use strict';
    var e_11, _a, e_12, _b, e_13, _c;
    var _d, _e, _f;
    if (location.pathname.includes("/subactions/")) {
        var subactionList = document.querySelector("body > div > div > nav.d-none.d-md-block.col-2.sidebar.sidebar-right");
        var specialsIDX = 0;
        var currCategoryIdx = 0;
        var currItem = void 0;
        while ((currItem = subactionList.children.item(specialsIDX)) != null && currItem.innerHTML != "Specials") {
            specialsIDX++;
        }
        var grabsIDX = 0;
        while ((currItem = subactionList.children.item(grabsIDX)) != null && currItem.innerHTML != "Grabs") {
            grabsIDX++;
        }
        subactionList.insertBefore(subactionList.children.item(specialsIDX), subactionList.children.item(grabsIDX + 2));
        subactionList.insertBefore(subactionList.children.item(specialsIDX + 1), subactionList.children.item(grabsIDX + 3));
        wloop: while ((currItem = subactionList.children.item(currCategoryIdx)) != null) {
            if (((_d = currItem.nextElementSibling) === null || _d === void 0 ? void 0 : _d.tagName) == "UL") {
                try {
                    for (var _g = (e_11 = void 0, __values(Array.from((_e = currItem.nextElementSibling) === null || _e === void 0 ? void 0 : _e.children))), _h = _g.next(); !_h.done; _h = _g.next()) {
                        var child = _h.value;
                        if (child.children[0].classList.contains("active"))
                            break wloop;
                    }
                }
                catch (e_11_1) { e_11 = { error: e_11_1 }; }
                finally {
                    try {
                        if (_h && !_h.done && (_a = _g["return"])) _a.call(_g);
                    }
                    finally { if (e_11) throw e_11.error; }
                }
            }
            currCategoryIdx++;
        }
        subactionList.insertBefore(subactionList.children.item(currCategoryIdx), subactionList.children.item(0));
        subactionList.insertBefore(subactionList.children.item(currCategoryIdx + 1), subactionList.children.item(1));
    }
    var style = document.createElement("style");
    style.innerText = styling;
    document.head.appendChild(style);
    var sActData;
    if (window["fighter_render"]) {
        sActData = window["fighter_render"].subaction_data;
        var original_1 = window["fighter_render"].setup_frame;
        rerender = window["fighter_render"].setup_frame = function () {
            original_1.call(window["fighter_render"]);
            var scene = window["fighter_render"].scene_overlay;
            if (customBBox) {
                var material = new THREE.MeshBasicMaterial({ color: 0x00ff00, transparent: true, opacity: 0.15, side: THREE.DoubleSide });
                var vertices = [
                    0, customBBox.maxY, customBBox.minX,
                    0, customBBox.maxY, customBBox.maxX,
                    0, customBBox.minY, customBBox.minX,
                    0, customBBox.minY, customBBox.maxX
                ];
                var indices = [
                    0, 1, 2,
                    1, 2, 3
                ];
                var geometry = new THREE.BufferGeometry();
                geometry.addAttribute('position', new THREE.BufferAttribute(new Float32Array(vertices), 3));
                geometry.setIndex(indices);
                var mesh = new THREE.Mesh(geometry, material);
                // mesh.position.z = sActData.frames[window["fighter_render"].frame_index].x_pos;
                // mesh.position.y = sActData.frames[window["fighter_render"].frame_index].y_pos;
                mesh.renderOrder = 8;
                scene.add(mesh);
                var inner_material = new THREE.MeshBasicMaterial({ color: 0x00ff00, transparent: true, opacity: 0.8, side: THREE.DoubleSide });
                var thickness = -0.2;
                var inner_vertices = [
                    0, customBBox.maxY, customBBox.minX,
                    0, customBBox.maxY, customBBox.maxX,
                    0, customBBox.minY, customBBox.minX,
                    0, customBBox.minY, customBBox.maxX,
                    0, customBBox.maxY - thickness, customBBox.minX + thickness,
                    0, customBBox.maxY - thickness, customBBox.maxX - thickness,
                    0, customBBox.minY + thickness, customBBox.minX + thickness,
                    0, customBBox.minY + thickness, customBBox.maxX - thickness // inner bottom right: 7
                ];
                var inner_indices = [
                    0, 1, 4,
                    4, 1, 5,
                    1, 3, 5,
                    7, 3, 5,
                    7, 6, 3,
                    2, 3, 6,
                    2, 0, 4,
                    4, 6, 2
                ];
                var inner_geometry = new THREE.BufferGeometry();
                inner_geometry.addAttribute('position', new THREE.BufferAttribute(new Float32Array(inner_vertices), 3));
                inner_geometry.setIndex(inner_indices);
                var outline = new THREE.Mesh(inner_geometry, inner_material);
                outline.renderOrder = 9;
                scene.add(outline);
            }
        };
        new DataCalculator(sActData, document.querySelector("body > div > div > div"));
        var collectedData = JSON.parse((_f = localStorage.getItem("Rukai-" + getCharacterName())) !== null && _f !== void 0 ? _f : "{}");
        var dataToSort = Object.entries(collectedData);
        var sorted = dataToSort.sort(function (a, b) { return (parseInt(a[0], 16) - parseInt(b[0], 16)); });
        var subactionList = "";
        try {
            for (var sorted_1 = __values(sorted), sorted_1_1 = sorted_1.next(); !sorted_1_1.done; sorted_1_1 = sorted_1.next()) {
                var _j = __read(sorted_1_1.value, 2), idx = _j[0], item = _j[1];
                subactionList += item + "\n";
            }
        }
        catch (e_12_1) { e_12 = { error: e_12_1 }; }
        finally {
            try {
                if (sorted_1_1 && !sorted_1_1.done && (_b = sorted_1["return"])) _b.call(sorted_1);
            }
            finally { if (e_12) throw e_12.error; }
        }
        console.log("ATKD:\n\n" + subactionList);
    }
    else {
        // sActData = window["subaction_data"] as SubactionData;
    }
    var heightOfJump = function (initVel, gravity) {
        var heightOfJump = (Math.pow(initVel, 2)) / (2 * gravity);
        return heightOfJump;
    };
    window["calcJumpHeights"] = function (jumpYInitVel, jumpYInitVelShort, airJumpYMultiplier, gravity) {
        ;
        var shortHop = Math.floor(heightOfJump(jumpYInitVelShort, gravity) * 100) / 100;
        var fullhop = Math.floor(heightOfJump(jumpYInitVel, gravity) * 100) / 100;
        var djump = Math.floor(heightOfJump(airJumpYMultiplier * jumpYInitVel, gravity) * 100) / 100;
        console.log("\n#const cs_shortHopHeight = " + shortHop + "\n#const cs_jumpHeight = " + fullhop + "\n#const cs_djumpHeight = " + djump + "\n    ");
    };
    var attrs = Array.from(document.getElementsByTagName("td")).map(function (el) { return el.innerText; });
    var jumpYInitVel = 0;
    var jumpYInitVelShort = 0;
    var airJumpYMultiplier = 0;
    var gravity = 0;
    try {
        for (var _k = __values(attrs.entries()), _l = _k.next(); !_l.done; _l = _k.next()) {
            var _m = __read(_l.value, 2), i = _m[0], attr = _m[1];
            switch (attr) {
                case "jump y init vel:":
                    jumpYInitVel = parseFloat(attrs[i + 1]);
                    break;
                case "jump y init vel short:":
                    jumpYInitVelShort = parseFloat(attrs[i + 1]);
                    break;
                case "air jump x mult:":
                    airJumpYMultiplier = parseFloat(attrs[i + 1]);
                    break;
                case "gravity:":
                    gravity = parseFloat(attrs[i + 1]);
                    break;
            }
        }
    }
    catch (e_13_1) { e_13 = { error: e_13_1 }; }
    finally {
        try {
            if (_l && !_l.done && (_c = _k["return"])) _c.call(_k);
        }
        finally { if (e_13) throw e_13.error; }
    }
    if (airJumpYMultiplier == 0)
        airJumpYMultiplier = 1;
    if (jumpYInitVel != 0) {
        window["calcJumpHeights"](jumpYInitVel, jumpYInitVelShort, airJumpYMultiplier, gravity);
    }
})();
