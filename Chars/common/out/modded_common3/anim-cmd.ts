/*
 * This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
 */
import KaitaiStream from 'kaitai-struct/KaitaiStream'

export class AnimCmd {
  _is_le?: boolean;

  constructor(
    readonly _io: KaitaiStream,
    readonly _parent?: unknown,
    readonly _root?: AnimCmd,
  ) {
    this._root ??= this;

    this._read();
  }

  _read() {
    this.command = [];
    {
      let _, _buf, i = 0;
      do {
        _ = new AnimCmd.Command(this._io, this, this._root);
        this.command.push(_);
        i++;
      } while (!( ((_.namespace == 0) && (_.code == 0) && (_.numArguments == 0) && (_.modifier == 0) && (_.argOffset == 0)) ));
    }
  }

  command: Array<AnimCmd.Command>;
}

export namespace AnimCmd {
  export class Argument {
    _is_le?: boolean;

    constructor(
      readonly _io: KaitaiStream,
      readonly _parent?: AnimCmd.Command,
      readonly _root?: AnimCmd,
    ) {

      this._read();
    }

    _read() {
      this.type = (this._io.readU4be()) as any
      this.content = (this._io.readU4be()) as any
    }

    type: AnimCmd.Argument.ArgType;
    content: number;
  }
}
export namespace AnimCmd.Argument {
  export enum ArgType {
    INT = 0,
    SCALAR = 1,
    OFFSET = 2,
    BOOL = 3,
    FILE = 4,
    VARIABLE = 5,
    REQUIREMENT = 6,
  }
}

export namespace AnimCmd {
  export class Command {
    _is_le?: boolean;

    constructor(
      readonly _io: KaitaiStream,
      readonly _parent?: AnimCmd,
      readonly _root?: AnimCmd,
    ) {

      this._read();
    }

    _read() {
      this.namespace = (this._io.readU1()) as any
      this.code = (this._io.readU1()) as any
      this.numArguments = (this._io.readU1()) as any
      this.modifier = (this._io.readU1()) as any
      this.argOffset = (this._io.readS4be()) as any
    }

    private _arguments: Array<AnimCmd.Argument>;
    get arguments(): Array<AnimCmd.Argument> {
      if (typeof this._arguments !== 'undefined')
        return this._arguments;
      let _pos = this._io.pos;
      this._io.seek((this.argOffset as any));
      this._arguments = [];
      for (let i = 0; i < (this.numArguments as any); i++) {
        this._arguments.push(new AnimCmd.Argument(this._io, this, this._root));
      }
      this._io.seek(_pos);
      return this._arguments;
    }

    namespace: number;
    code: number;
    numArguments: number;
    modifier: number;
    argOffset: number;
  }
}
