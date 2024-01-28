// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './AnimCmd'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./AnimCmd'));
  } else {
    root.Movedef = factory(root.KaitaiStream, root.AnimCmd);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream, AnimCmd) {
var Movedef = (function() {
  function Movedef(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this._debug = {};

  }
  Movedef.prototype._read = function() {
    this._debug.header = { start: this._io.pos, ioOffset: this._io.byteOffset };
    this._raw_header = this._io.readBytes(32);
    var _io__raw_header = new KaitaiStream(this._raw_header);
    this.header = new SakuraiHeader(_io__raw_header, this, this._root);
    this.header._read();
    this._debug.header.end = this._io.pos;
    this._debug.body = { start: this._io.pos, ioOffset: this._io.byteOffset };
    this._raw_body = this._io.readBytes((this.header.size - 32));
    var _io__raw_body = new KaitaiStream(this._raw_body);
    this.body = new SakuraiBody(_io__raw_body, this, this._root);
    this.body._read();
    this._debug.body.end = this._io.pos;
  }

  var SakuraiHeader = Movedef.SakuraiHeader = (function() {
    function SakuraiHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this._debug = {};

    }
    SakuraiHeader.prototype._read = function() {
      this._debug.size = { start: this._io.pos, ioOffset: this._io.byteOffset };
      this.size = this._io.readS4be();
      this._debug.size.end = this._io.pos;
      this._debug.lookupEntryOffset = { start: this._io.pos, ioOffset: this._io.byteOffset };
      this.lookupEntryOffset = this._io.readS4be();
      this._debug.lookupEntryOffset.end = this._io.pos;
      this._debug.lookupEntryCount = { start: this._io.pos, ioOffset: this._io.byteOffset };
      this.lookupEntryCount = this._io.readS4be();
      this._debug.lookupEntryCount.end = this._io.pos;
      this._debug.sectionCount = { start: this._io.pos, ioOffset: this._io.byteOffset };
      this.sectionCount = this._io.readS4be();
      this._debug.sectionCount.end = this._io.pos;
      this._debug.externalSubroutineCount = { start: this._io.pos, ioOffset: this._io.byteOffset };
      this.externalSubroutineCount = this._io.readS4be();
      this._debug.externalSubroutineCount.end = this._io.pos;
      this._debug.padding = { start: this._io.pos, ioOffset: this._io.byteOffset };
      this.padding = this._io.readBytesFull();
      this._debug.padding.end = this._io.pos;
    }

    return SakuraiHeader;
  })();

  var SakuraiBody = Movedef.SakuraiBody = (function() {
    function SakuraiBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this._debug = {};

    }
    SakuraiBody.prototype._read = function() {
    }

    var LookupEntry = SakuraiBody.LookupEntry = (function() {
      function LookupEntry(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this._debug = {};

      }
      LookupEntry.prototype._read = function() {
        this._debug.entryOffset = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.entryOffset = this._io.readS4be();
        this._debug.entryOffset.end = this._io.pos;
      }

      return LookupEntry;
    })();

    var ExternalSubroutine = SakuraiBody.ExternalSubroutine = (function() {
      function ExternalSubroutine(_io, _parent, _root, entry, stringTablePos) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this.entry = entry;
        this.stringTablePos = stringTablePos;
        this._debug = {};

      }
      ExternalSubroutine.prototype._read = function() {
      }
      Object.defineProperty(ExternalSubroutine.prototype, 'name', {
        get: function() {
          if (this._m_name !== undefined)
            return this._m_name;
          var _pos = this._io.pos;
          this._io.seek((this.stringTablePos + this.entry.stringOffset));
          this._debug._m_name = { start: this._io.pos, ioOffset: this._io.byteOffset };
          this._m_name = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ascii");
          this._debug._m_name.end = this._io.pos;
          this._io.seek(_pos);
          return this._m_name;
        }
      });
      Object.defineProperty(ExternalSubroutine.prototype, 'offsets', {
        get: function() {
          if (this._m_offsets !== undefined)
            return this._m_offsets;
          var _pos = this._io.pos;
          this._io.seek(this.entry.offsetLinkedList);
          this._debug._m_offsets = { start: this._io.pos, ioOffset: this._io.byteOffset };
          this._m_offsets = [];
          this._debug._m_offsets.arr = [];
          var i = 0;
          do {
            this._debug._m_offsets.arr[this._m_offsets.length] = { start: this._io.pos, ioOffset: this._io.byteOffset };
            var _ = this._io.readS4be();
            this._m_offsets.push(_);
            this._debug._m_offsets.arr[this._m_offsets.length - 1].end = this._io.pos;
            i++;
          } while (!(_ == 0));
          this._debug._m_offsets.end = this._io.pos;
          this._io.seek(_pos);
          return this._m_offsets;
        }
      });

      return ExternalSubroutine;
    })();

    var ArcFighterData = SakuraiBody.ArcFighterData = (function() {
      function ArcFighterData(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this._debug = {};

      }
      ArcFighterData.prototype._read = function() {
        this._debug.subactionFlagsStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.subactionFlagsStart = this._io.readS4be();
        this._debug.subactionFlagsStart.end = this._io.pos;
        this._debug.modelVisibilityStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.modelVisibilityStart = this._io.readS4be();
        this._debug.modelVisibilityStart.end = this._io.pos;
        this._debug.attributeStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.attributeStart = this._io.readS4be();
        this._debug.attributeStart.end = this._io.pos;
        this._debug.sseAttributeStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.sseAttributeStart = this._io.readS4be();
        this._debug.sseAttributeStart.end = this._io.pos;
        this._debug.miscSectionOffset = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.miscSectionOffset = this._io.readS4be();
        this._debug.miscSectionOffset.end = this._io.pos;
        this._debug.commonActionFlagsStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.commonActionFlagsStart = this._io.readS4be();
        this._debug.commonActionFlagsStart.end = this._io.pos;
        this._debug.actionFlagsStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.actionFlagsStart = this._io.readS4be();
        this._debug.actionFlagsStart.end = this._io.pos;
        this._debug.unknown7 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unknown7 = this._io.readS4be();
        this._debug.unknown7.end = this._io.pos;
        this._debug.actionInterrupts = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.actionInterrupts = this._io.readS4be();
        this._debug.actionInterrupts.end = this._io.pos;
        this._debug.entryActionsStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.entryActionsStart = this._io.readS4be();
        this._debug.entryActionsStart.end = this._io.pos;
        this._debug.exitActionsStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.exitActionsStart = this._io.readS4be();
        this._debug.exitActionsStart.end = this._io.pos;
        this._debug.actionPreStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.actionPreStart = this._io.readS4be();
        this._debug.actionPreStart.end = this._io.pos;
        this._debug.subactionMainStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.subactionMainStart = this._io.readS4be();
        this._debug.subactionMainStart.end = this._io.pos;
        this._debug.subactionGfxStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.subactionGfxStart = this._io.readS4be();
        this._debug.subactionGfxStart.end = this._io.pos;
        this._debug.subactionSfxStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.subactionSfxStart = this._io.readS4be();
        this._debug.subactionSfxStart.end = this._io.pos;
        this._debug.subactionOtherStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.subactionOtherStart = this._io.readS4be();
        this._debug.subactionOtherStart.end = this._io.pos;
        this._debug.anchoredItemPositions = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.anchoredItemPositions = this._io.readS4be();
        this._debug.anchoredItemPositions.end = this._io.pos;
        this._debug.gooeyBombPositions = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.gooeyBombPositions = this._io.readS4be();
        this._debug.gooeyBombPositions.end = this._io.pos;
        this._debug.boneRef1 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.boneRef1 = this._io.readS4be();
        this._debug.boneRef1.end = this._io.pos;
        this._debug.boneRef2 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.boneRef2 = this._io.readS4be();
        this._debug.boneRef2.end = this._io.pos;
        this._debug.entryActionOverridesStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.entryActionOverridesStart = this._io.readS4be();
        this._debug.entryActionOverridesStart.end = this._io.pos;
        this._debug.exitActionOverridesStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.exitActionOverridesStart = this._io.readS4be();
        this._debug.exitActionOverridesStart.end = this._io.pos;
        this._debug.unknown22 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unknown22 = this._io.readS4be();
        this._debug.unknown22.end = this._io.pos;
        this._debug.samusArmCannonPositions = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.samusArmCannonPositions = this._io.readS4be();
        this._debug.samusArmCannonPositions.end = this._io.pos;
        this._debug.unknown24 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unknown24 = this._io.readS4be();
        this._debug.unknown24.end = this._io.pos;
        this._debug.staticArticlesStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.staticArticlesStart = this._io.readS4be();
        this._debug.staticArticlesStart.end = this._io.pos;
        this._debug.entryArticlesStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.entryArticlesStart = this._io.readS4be();
        this._debug.entryArticlesStart.end = this._io.pos;
        this._debug.flags1 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.flags1 = this._io.readS4be();
        this._debug.flags1.end = this._io.pos;
        this._debug.flags2 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.flags2 = this._io.readS4be();
        this._debug.flags2.end = this._io.pos;
      }

      return ArcFighterData;
    })();

    var Section = SakuraiBody.Section = (function() {
      Section.SectionType = Object.freeze({
        ANIM_CMD: 1,
        DATA_COMMON: 2,
        DATA: 3,

        1: "ANIM_CMD",
        2: "DATA_COMMON",
        3: "DATA",
      });

      function Section(_io, _parent, _root, entry, stringTablePos) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this.entry = entry;
        this.stringTablePos = stringTablePos;
        this._debug = {};

      }
      Section.prototype._read = function() {
      }
      Object.defineProperty(Section.prototype, 'name', {
        get: function() {
          if (this._m_name !== undefined)
            return this._m_name;
          var _pos = this._io.pos;
          this._io.seek((this.stringTablePos + this.entry.stringOffset));
          this._debug._m_name = { start: this._io.pos, ioOffset: this._io.byteOffset };
          this._m_name = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ascii");
          this._debug._m_name.end = this._io.pos;
          this._io.seek(_pos);
          return this._m_name;
        }
      });
      Object.defineProperty(Section.prototype, 'data', {
        get: function() {
          if (this._m_data !== undefined)
            return this._m_data;
          var _pos = this._io.pos;
          this._io.seek(this.entry.contentOffset);
          this._debug._m_data = { start: this._io.pos, ioOffset: this._io.byteOffset };
          switch (( ((this.name.substring(0, 12) == "gameAnimCmd_") || (this.name.substring(0, 14) == "effectAnimCmd_") || (this.name.substring(0, 19) == "statusAnimCmdGroup_") || (this.name.substring(0, 17) == "statusAnimCmdPre_") || (this.name.substring(0, 14) == "statusAnimCmd_"))  ? Movedef.SakuraiBody.Section.SectionType.ANIM_CMD : (this.name == "dataCommon" ? Movedef.SakuraiBody.Section.SectionType.DATA_COMMON : Movedef.SakuraiBody.Section.SectionType.DATA))) {
          case Movedef.SakuraiBody.Section.SectionType.ANIM_CMD:
            this._m_data = new AnimCmd(this._io, this, null);
            this._m_data._read();
            break;
          case Movedef.SakuraiBody.Section.SectionType.DATA:
            this._m_data = new ArcFighterData(this._io, this, this._root);
            this._m_data._read();
            break;
          case Movedef.SakuraiBody.Section.SectionType.DATA_COMMON:
            this._m_data = new ArcFighterDataCommon(this._io, this, this._root);
            this._m_data._read();
            break;
          default:
            this._m_data = this._io.readU4be();
            break;
          }
          this._debug._m_data.end = this._io.pos;
          this._io.seek(_pos);
          return this._m_data;
        }
      });

      return Section;
    })();

    var ExternalSubroutineEntry = SakuraiBody.ExternalSubroutineEntry = (function() {
      function ExternalSubroutineEntry(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this._debug = {};

      }
      ExternalSubroutineEntry.prototype._read = function() {
        this._debug.offsetLinkedList = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.offsetLinkedList = this._io.readS4be();
        this._debug.offsetLinkedList.end = this._io.pos;
        this._debug.stringOffset = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.stringOffset = this._io.readS4be();
        this._debug.stringOffset.end = this._io.pos;
      }

      return ExternalSubroutineEntry;
    })();

    var LookupTable = SakuraiBody.LookupTable = (function() {
      function LookupTable(_io, _parent, _root, lookupCount, sectionCount, externalSubroutineCount) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this.lookupCount = lookupCount;
        this.sectionCount = sectionCount;
        this.externalSubroutineCount = externalSubroutineCount;
        this._debug = {};

      }
      LookupTable.prototype._read = function() {
        this._debug.entries = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.entries = [];
        this._debug.entries.arr = [];
        for (var i = 0; i < this.lookupCount; i++) {
          this._debug.entries.arr[i] = { start: this._io.pos, ioOffset: this._io.byteOffset };
          var _t_entries = new LookupEntry(this._io, this, this._root);
          _t_entries._read();
          this.entries.push(_t_entries);
          this._debug.entries.arr[i].end = this._io.pos;
        }
        this._debug.entries.end = this._io.pos;
        this._debug.sections = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.sections = [];
        this._debug.sections.arr = [];
        for (var i = 0; i < this.sectionCount; i++) {
          this._debug.sections.arr[i] = { start: this._io.pos, ioOffset: this._io.byteOffset };
          var _t_sections = new SectionEntry(this._io, this, this._root);
          _t_sections._read();
          this.sections.push(_t_sections);
          this._debug.sections.arr[i].end = this._io.pos;
        }
        this._debug.sections.end = this._io.pos;
        this._debug.externalSubroutines = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.externalSubroutines = [];
        this._debug.externalSubroutines.arr = [];
        for (var i = 0; i < this.externalSubroutineCount; i++) {
          this._debug.externalSubroutines.arr[i] = { start: this._io.pos, ioOffset: this._io.byteOffset };
          var _t_externalSubroutines = new ExternalSubroutineEntry(this._io, this, this._root);
          _t_externalSubroutines._read();
          this.externalSubroutines.push(_t_externalSubroutines);
          this._debug.externalSubroutines.arr[i].end = this._io.pos;
        }
        this._debug.externalSubroutines.end = this._io.pos;
        if (this.stringTablePos < 0) {
          this._debug._unnamed3 = { start: this._io.pos, ioOffset: this._io.byteOffset };
          this._unnamed3 = this._io.readBytes(0);
          this._debug._unnamed3.end = this._io.pos;
        }
      }
      Object.defineProperty(LookupTable.prototype, 'stringTablePos', {
        get: function() {
          if (this._m_stringTablePos !== undefined)
            return this._m_stringTablePos;
          this._debug._m_stringTablePos = {  };
          this._m_stringTablePos = this._io.pos;
          return this._m_stringTablePos;
        }
      });

      return LookupTable;
    })();

    var ArcFighterDataCommon = SakuraiBody.ArcFighterDataCommon = (function() {
      function ArcFighterDataCommon(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this._debug = {};

      }
      ArcFighterDataCommon.prototype._read = function() {
        this._debug.globalIcs = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.globalIcs = this._io.readS4be();
        this._debug.globalIcs.end = this._io.pos;
        this._debug.globalIcsSse = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.globalIcsSse = this._io.readS4be();
        this._debug.globalIcsSse.end = this._io.pos;
        this._debug.ics = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.ics = this._io.readS4be();
        this._debug.ics.end = this._io.pos;
        this._debug.icsSse = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.icsSse = this._io.readS4be();
        this._debug.icsSse.end = this._io.pos;
        this._debug.entryActionsStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.entryActionsStart = this._io.readS4be();
        this._debug.entryActionsStart.end = this._io.pos;
        this._debug.exitActionsStart = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.exitActionsStart = this._io.readS4be();
        this._debug.exitActionsStart.end = this._io.pos;
        this._debug.flashOverlayArray = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.flashOverlayArray = this._io.readS4be();
        this._debug.flashOverlayArray.end = this._io.pos;
        this._debug.unk7 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unk7 = this._io.readS4be();
        this._debug.unk7.end = this._io.pos;
        this._debug.unk8 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unk8 = this._io.readS4be();
        this._debug.unk8.end = this._io.pos;
        this._debug.unk9 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unk9 = this._io.readS4be();
        this._debug.unk9.end = this._io.pos;
        this._debug.unk10 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unk10 = this._io.readS4be();
        this._debug.unk10.end = this._io.pos;
        this._debug.unk11 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unk11 = this._io.readS4be();
        this._debug.unk11.end = this._io.pos;
        this._debug.unk12 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unk12 = this._io.readS4be();
        this._debug.unk12.end = this._io.pos;
        this._debug.unk13 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unk13 = this._io.readS4be();
        this._debug.unk13.end = this._io.pos;
        this._debug.unk14 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unk14 = this._io.readS4be();
        this._debug.unk14.end = this._io.pos;
        this._debug.unk15 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unk15 = this._io.readS4be();
        this._debug.unk15.end = this._io.pos;
        this._debug.unk16 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unk16 = this._io.readS4be();
        this._debug.unk16.end = this._io.pos;
        this._debug.unk17 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unk17 = this._io.readS4be();
        this._debug.unk17.end = this._io.pos;
        this._debug.rgbaColor = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.rgbaColor = this._io.readS4be();
        this._debug.rgbaColor.end = this._io.pos;
        this._debug.flashOverlayOffset = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.flashOverlayOffset = this._io.readS4be();
        this._debug.flashOverlayOffset.end = this._io.pos;
        this._debug.screenTints = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.screenTints = this._io.readS4be();
        this._debug.screenTints.end = this._io.pos;
        this._debug.legBones = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.legBones = this._io.readS4be();
        this._debug.legBones.end = this._io.pos;
        this._debug.unk22 = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.unk22 = this._io.readS4be();
        this._debug.unk22.end = this._io.pos;
      }

      return ArcFighterDataCommon;
    })();

    var SectionEntry = SakuraiBody.SectionEntry = (function() {
      function SectionEntry(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this._debug = {};

      }
      SectionEntry.prototype._read = function() {
        this._debug.contentOffset = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.contentOffset = this._io.readS4be();
        this._debug.contentOffset.end = this._io.pos;
        this._debug.stringOffset = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this.stringOffset = this._io.readS4be();
        this._debug.stringOffset.end = this._io.pos;
      }

      return SectionEntry;
    })();
    Object.defineProperty(SakuraiBody.prototype, 'lookupEntries', {
      get: function() {
        if (this._m_lookupEntries !== undefined)
          return this._m_lookupEntries;
        var _pos = this._io.pos;
        this._io.seek(this._parent.header.lookupEntryOffset);
        this._debug._m_lookupEntries = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this._m_lookupEntries = new LookupTable(this._io, this, this._root, this._parent.header.lookupEntryCount, this._parent.header.sectionCount, this._parent.header.externalSubroutineCount);
        this._m_lookupEntries._read();
        this._debug._m_lookupEntries.end = this._io.pos;
        this._io.seek(_pos);
        return this._m_lookupEntries;
      }
    });
    Object.defineProperty(SakuraiBody.prototype, 'sections', {
      get: function() {
        if (this._m_sections !== undefined)
          return this._m_sections;
        var _pos = this._io.pos;
        this._io.seek(0);
        this._debug._m_sections = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this._m_sections = [];
        this._debug._m_sections.arr = [];
        for (var i = 0; i < this._parent.header.sectionCount; i++) {
          this._debug._m_sections.arr[i] = { start: this._io.pos, ioOffset: this._io.byteOffset };
          var _t__m_sections = new Section(this._io, this, this._root, this.lookupEntries.sections[i], this.lookupEntries.stringTablePos);
          _t__m_sections._read();
          this._m_sections.push(_t__m_sections);
          this._debug._m_sections.arr[i].end = this._io.pos;
        }
        this._debug._m_sections.end = this._io.pos;
        this._io.seek(_pos);
        return this._m_sections;
      }
    });

    return SakuraiBody;
  })();

  return Movedef;
})();
return Movedef;
}));
