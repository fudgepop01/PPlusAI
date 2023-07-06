/*
 * This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
 */
import KaitaiStream from 'kaitai-struct/KaitaiStream'

export class Movedef {
  _is_le?: boolean;

  constructor(
    readonly _io: KaitaiStream,
    readonly _parent?: unknown,
    readonly _root?: Movedef,
  ) {
    this._root ??= this;

    this._read();
  }

  _read() {
    this._raw_header = (this._io.readBytes(32)) as any
    let _io__raw_header = new KaitaiStream(this._raw_header);
    this.header = (new Movedef.SakuraiHeader(_io__raw_header, this, this._root)) as any
    this._raw_body = (this._io.readBytes(((this.header as any).size - 32))) as any
    let _io__raw_body = new KaitaiStream(this._raw_body);
    this.body = (new Movedef.SakuraiBody(_io__raw_body, this, this._root)) as any
  }

  header: Movedef.SakuraiHeader;
  body: Movedef.SakuraiBody;
  _raw_header: Uint8Array;
  _raw_body: Uint8Array;
}

export namespace Movedef {
  export class SakuraiHeader {
    _is_le?: boolean;

    constructor(
      readonly _io: KaitaiStream,
      readonly _parent?: Movedef,
      readonly _root?: Movedef,
    ) {

      this._read();
    }

    _read() {
      this.size = (this._io.readS4be()) as any
      this.lookupEntryOffset = (this._io.readS4be()) as any
      this.lookupEntryCount = (this._io.readS4be()) as any
      this.sectionCount = (this._io.readS4be()) as any
      this.externalSubroutineCount = (this._io.readS4be()) as any
      this.padding = (this._io.readBytesFull()) as any
    }

    size: number;
    lookupEntryOffset: number;
    lookupEntryCount: number;
    sectionCount: number;
    externalSubroutineCount: number;
    padding: Uint8Array;
  }
}

export namespace Movedef {
  export class SakuraiBody {
    _is_le?: boolean;

    constructor(
      readonly _io: KaitaiStream,
      readonly _parent?: Movedef,
      readonly _root?: Movedef,
    ) {

      this._read();
    }

    _read() {
    }

    private _lookupEntries: Movedef.SakuraiBody.LookupTable;
    get lookupEntries(): Movedef.SakuraiBody.LookupTable {
      if (typeof this._lookupEntries !== 'undefined')
        return this._lookupEntries;
      let _pos = this._io.pos;
      this._io.seek((this._parent as any).header.lookupEntryOffset);
      this._lookupEntries = (new Movedef.SakuraiBody.LookupTable(this._io, this, this._root, (this._parent as any).header.lookupEntryCount, (this._parent as any).header.sectionCount, (this._parent as any).header.externalSubroutineCount)) as any
      this._io.seek(_pos);
      return this._lookupEntries;
    }

    private _sections: Array<Movedef.SakuraiBody.Section>;
    get sections(): Array<Movedef.SakuraiBody.Section> {
      if (typeof this._sections !== 'undefined')
        return this._sections;
      let _pos = this._io.pos;
      this._io.seek(0);
      this._sections = [];
      for (let i = 0; i < (this._parent as any).header.sectionCount; i++) {
        this._sections.push(new Movedef.SakuraiBody.Section(this._io, this, this._root, (this.lookupEntries as any).sections[i], (this.lookupEntries as any).stringTablePos));
      }
      this._io.seek(_pos);
      return this._sections;
    }

  }
}

export namespace Movedef.SakuraiBody {
  export class LookupEntry {
    _is_le?: boolean;

    constructor(
      readonly _io: KaitaiStream,
      readonly _parent?: Movedef.SakuraiBody.LookupTable,
      readonly _root?: Movedef,
    ) {

      this._read();
    }

    _read() {
      this.entryOffset = (this._io.readS4be()) as any
    }

    entryOffset: number;
  }
}

export namespace Movedef.SakuraiBody {
  export class ExternalSubroutine {
    _is_le?: boolean;

    constructor(
      readonly _io: KaitaiStream,
      readonly _parent: unknown | undefined,
      readonly _root: Movedef | undefined,
      entry: Movedef.SakuraiBody.ExternalSubroutineEntry,
      stringTablePos: number,
    ) {
      this.entry = entry;
      this.stringTablePos = stringTablePos;

      this._read();
    }

    _read() {
    }

    private _name: string;
    get name(): string {
      if (typeof this._name !== 'undefined')
        return this._name;
      let _pos = this._io.pos;
      this._io.seek(((this.stringTablePos as any) + (this.entry as any).stringOffset));
      this._name = (KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ascii")) as any
      this._io.seek(_pos);
      return this._name;
    }

    private _offsets: Array<number>;
    get offsets(): Array<number> {
      if (typeof this._offsets !== 'undefined')
        return this._offsets;
      let _pos = this._io.pos;
      this._io.seek((this.entry as any).offsetLinkedList);
      this._offsets = [];
      {
        let _, _buf, i = 0;
        do {
          _ = this._io.readS4be();
          this._offsets.push(_);
          i++;
        } while (!(_ == 0));
      }
      this._io.seek(_pos);
      return this._offsets;
    }

    entry: Movedef.SakuraiBody.ExternalSubroutineEntry;
    stringTablePos: number;
  }
}

export namespace Movedef.SakuraiBody {
  export class Section {
    _is_le?: boolean;

    constructor(
      readonly _io: KaitaiStream,
      readonly _parent: Movedef.SakuraiBody | undefined,
      readonly _root: Movedef | undefined,
      entry: Movedef.SakuraiBody.SectionEntry,
      stringTablePos: number,
    ) {
      this.entry = entry;
      this.stringTablePos = stringTablePos;

      this._read();
    }

    _read() {
    }

    private _name: string;
    get name(): string {
      if (typeof this._name !== 'undefined')
        return this._name;
      let _pos = this._io.pos;
      this._io.seek(((this.stringTablePos as any) + (this.entry as any).stringOffset));
      this._name = (KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ascii")) as any
      this._io.seek(_pos);
      return this._name;
    }

    private _data: Movedef.SakuraiBody.ArcFighterDataCommon | number;
    get data(): Movedef.SakuraiBody.ArcFighterDataCommon | number {
      if (typeof this._data !== 'undefined')
        return this._data;
      let _pos = this._io.pos;
      this._io.seek((this.entry as any).contentOffset);
      switch ((this.name as any)) {
        case "dataCommon": {
          this._data = (new Movedef.SakuraiBody.ArcFighterDataCommon(this._io, this, this._root)) as any
          break;
        }
        default: {
          this._data = (this._io.readU4be()) as any
          break;
        }
      }
      this._io.seek(_pos);
      return this._data;
    }

    entry: Movedef.SakuraiBody.SectionEntry;
    stringTablePos: number;
  }
}

export namespace Movedef.SakuraiBody {
  export class ExternalSubroutineEntry {
    _is_le?: boolean;

    constructor(
      readonly _io: KaitaiStream,
      readonly _parent?: Movedef.SakuraiBody.LookupTable,
      readonly _root?: Movedef,
    ) {

      this._read();
    }

    _read() {
      this.offsetLinkedList = (this._io.readS4be()) as any
      this.stringOffset = (this._io.readS4be()) as any
    }

    offsetLinkedList: number;
    stringOffset: number;
  }
}

export namespace Movedef.SakuraiBody {
  export class LookupTable {
    _is_le?: boolean;

    constructor(
      readonly _io: KaitaiStream,
      readonly _parent: Movedef.SakuraiBody | undefined,
      readonly _root: Movedef | undefined,
      lookupCount: number,
      sectionCount: number,
      externalSubroutineCount: number,
    ) {
      this.lookupCount = lookupCount;
      this.sectionCount = sectionCount;
      this.externalSubroutineCount = externalSubroutineCount;

      this._read();
    }

    _read() {
      this.entries = [];
      for (let i = 0; i < (this.lookupCount as any); i++) {
        this.entries.push(new Movedef.SakuraiBody.LookupEntry(this._io, this, this._root));
      }
      this.sections = [];
      for (let i = 0; i < (this.sectionCount as any); i++) {
        this.sections.push(new Movedef.SakuraiBody.SectionEntry(this._io, this, this._root));
      }
      this.externalSubroutines = [];
      for (let i = 0; i < (this.externalSubroutineCount as any); i++) {
        this.externalSubroutines.push(new Movedef.SakuraiBody.ExternalSubroutineEntry(this._io, this, this._root));
      }
      if ((this.stringTablePos as any) < 0) {
        this._unnamed3 = (this._io.readBytes(0)) as any
      }
    }

    private _stringTablePos: number;
    get stringTablePos(): number {
      if (typeof this._stringTablePos !== 'undefined')
        return this._stringTablePos;
      this._stringTablePos = ((this._io as any).pos) as any
      return this._stringTablePos;
    }

    entries: Array<Movedef.SakuraiBody.LookupEntry>;
    sections: Array<Movedef.SakuraiBody.SectionEntry>;
    externalSubroutines: Array<Movedef.SakuraiBody.ExternalSubroutineEntry>;
    _unnamed3: Uint8Array | undefined;
    lookupCount: number;
    sectionCount: number;
    externalSubroutineCount: number;
  }
}

export namespace Movedef.SakuraiBody {
  export class ArcFighterDataCommon {
    _is_le?: boolean;

    constructor(
      readonly _io: KaitaiStream,
      readonly _parent?: Movedef.SakuraiBody.Section,
      readonly _root?: Movedef,
    ) {

      this._read();
    }

    _read() {
      this.globalIcs = (this._io.readS4be()) as any
      this.globalIcsSse = (this._io.readS4be()) as any
      this.ics = (this._io.readS4be()) as any
      this.icsSse = (this._io.readS4be()) as any
      this.entryActionsStart = (this._io.readS4be()) as any
      this.exitActionsStart = (this._io.readS4be()) as any
      this.flashOverlayArray = (this._io.readS4be()) as any
      this.unk1 = (this._io.readS4be()) as any
      this.unk2 = (this._io.readS4be()) as any
      this.unk3 = (this._io.readS4be()) as any
      this.unk4 = (this._io.readS4be()) as any
      this.unk5 = (this._io.readS4be()) as any
      this.unk6 = (this._io.readS4be()) as any
      this.unk7 = (this._io.readS4be()) as any
      this.unk8 = (this._io.readS4be()) as any
      this.unk9 = (this._io.readS4be()) as any
      this.unk10 = (this._io.readS4be()) as any
      this.unk11 = (this._io.readS4be()) as any
      this.unk12 = (this._io.readS4be()) as any
      this.flashOverlayOffset = (this._io.readS4be()) as any
      this.screenTints = (this._io.readS4be()) as any
      this.legBones = (this._io.readS4be()) as any
      this.unk13 = (this._io.readS4be()) as any
      this.unk14 = (this._io.readS4be()) as any
      this.unk15 = (this._io.readS4be()) as any
      this.unk16 = (this._io.readS4be()) as any
    }

    globalIcs: number;
    globalIcsSse: number;
    ics: number;
    icsSse: number;
    entryActionsStart: number;
    exitActionsStart: number;
    flashOverlayArray: number;
    unk1: number;
    unk2: number;
    unk3: number;
    unk4: number;
    unk5: number;
    unk6: number;
    unk7: number;
    unk8: number;
    unk9: number;
    unk10: number;
    unk11: number;
    unk12: number;
    flashOverlayOffset: number;
    screenTints: number;
    legBones: number;
    unk13: number;
    unk14: number;
    unk15: number;
    unk16: number;
  }
}

export namespace Movedef.SakuraiBody {
  export class SectionEntry {
    _is_le?: boolean;

    constructor(
      readonly _io: KaitaiStream,
      readonly _parent?: Movedef.SakuraiBody.LookupTable,
      readonly _root?: Movedef,
    ) {

      this._read();
    }

    _read() {
      this.contentOffset = (this._io.readS4be()) as any
      this.stringOffset = (this._io.readS4be()) as any
    }

    contentOffset: number;
    stringOffset: number;
  }
}
