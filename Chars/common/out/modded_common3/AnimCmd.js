// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.AnimCmd = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
var AnimCmd = (function() {
  function AnimCmd(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this._debug = {};

  }
  AnimCmd.prototype._read = function() {
    this._debug.command = { start: this._io.pos, ioOffset: this._io.byteOffset };
    this.command = [];
    this._debug.command.arr = [];
    var i = 0;
    do {
      this._debug.command.arr[this.command.length] = { start: this._io.pos, ioOffset: this._io.byteOffset };
      var _t_command = new Command(this._io, this, this._root);
      _t_command._read();
      var _ = _t_command;
      this.command.push(_);
      this._debug.command.arr[this.command.length - 1].end = this._io.pos;
      i++;
    } while (!( ((_.namespace == 0) && (_.code == 0) && (_.numArguments == 0) && (_.modifier == 0) && (_.argOffset == 0)) ));
    this._debug.command.end = this._io.pos;
  }

  var Argument = AnimCmd.Argument = (function() {
    Argument.ArgType = Object.freeze({
      INT: 0,
      SCALAR: 1,
      OFFSET: 2,
      BOOL: 3,
      FILE: 4,
      VARIABLE: 5,
      REQUIREMENT: 6,

      0: "INT",
      1: "SCALAR",
      2: "OFFSET",
      3: "BOOL",
      4: "FILE",
      5: "VARIABLE",
      6: "REQUIREMENT",
    });

    function Argument(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this._debug = {};

    }
    Argument.prototype._read = function() {
      this._debug.type = { start: this._io.pos, ioOffset: this._io.byteOffset, enumName: "AnimCmd.Argument.ArgType" };
      this.type = this._io.readU4be();
      this._debug.type.end = this._io.pos;
      this._debug.content = { start: this._io.pos, ioOffset: this._io.byteOffset };
      this.content = this._io.readU4be();
      this._debug.content.end = this._io.pos;
    }

    return Argument;
  })();

  var Command = AnimCmd.Command = (function() {
    function Command(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this._debug = {};

    }
    Command.prototype._read = function() {
      this._debug.namespace = { start: this._io.pos, ioOffset: this._io.byteOffset };
      this.namespace = this._io.readU1();
      this._debug.namespace.end = this._io.pos;
      this._debug.code = { start: this._io.pos, ioOffset: this._io.byteOffset };
      this.code = this._io.readU1();
      this._debug.code.end = this._io.pos;
      this._debug.numArguments = { start: this._io.pos, ioOffset: this._io.byteOffset };
      this.numArguments = this._io.readU1();
      this._debug.numArguments.end = this._io.pos;
      this._debug.modifier = { start: this._io.pos, ioOffset: this._io.byteOffset };
      this.modifier = this._io.readU1();
      this._debug.modifier.end = this._io.pos;
      this._debug.argOffset = { start: this._io.pos, ioOffset: this._io.byteOffset };
      this.argOffset = this._io.readS4be();
      this._debug.argOffset.end = this._io.pos;
    }
    Object.defineProperty(Command.prototype, 'arguments', {
      get: function() {
        if (this._m_arguments !== undefined)
          return this._m_arguments;
        var _pos = this._io.pos;
        this._io.seek((this._io.pos + this.argOffset));
        this._debug._m_arguments = { start: this._io.pos, ioOffset: this._io.byteOffset };
        this._m_arguments = [];
        this._debug._m_arguments.arr = [];
        for (var i = 0; i < this.numArguments; i++) {
          this._debug._m_arguments.arr[i] = { start: this._io.pos, ioOffset: this._io.byteOffset };
          var _t__m_arguments = new Argument(this._io, this, this._root);
          _t__m_arguments._read();
          this._m_arguments.push(_t__m_arguments);
          this._debug._m_arguments.arr[i].end = this._io.pos;
        }
        this._debug._m_arguments.end = this._io.pos;
        this._io.seek(_pos);
        return this._m_arguments;
      }
    });

    return Command;
  })();

  return AnimCmd;
})();
return AnimCmd;
}));
