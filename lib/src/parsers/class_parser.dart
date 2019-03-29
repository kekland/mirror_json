import 'package:mirror_json/src/global_instance.dart';
import '../annotations/parseable_annotation.dart';
import 'parser.dart';
import 'dart:mirrors';

/// An action to perform with some field in a class.
class ClassParserAction {
  String fieldName;
  Symbol symbol;
  Symbol parserSymbol;
  Parser parser;
  Symbol typeArgumentSymbol;
  Type typeArgument;

  ClassParserAction({this.symbol, this.parserSymbol, this.typeArgument}) {
    this.parser = GlobalJsonParserInstance.getParser(parserSymbol);
    this.fieldName = MirrorSystem.getName(symbol);
    if (this.typeArgument != null) {
      this.typeArgumentSymbol = reflectType(this.typeArgument).simpleName;
    }
  }

  fromJson(dynamic json) {
    return parser.fromJson(json, typeArgumentSymbol: typeArgumentSymbol, type: typeArgument);
  }

  toJson(dynamic object) {
    return parser.toJson(object, typeArgumentSymbol: typeArgumentSymbol, type: typeArgument);
  }
}

/// A ready-to-use parser for classes. See [Parser] for more info.
class ClassParser<T> extends Parser<T> {
  ClassMirror _classTypeMirror;
  Map<Symbol, ClassParserAction> _actions;

  @override
  get associatedType => _classTypeMirror.reflectedType;

  @override
  Symbol get associatedTypeSymbol => _classTypeMirror.simpleName;

  factory ClassParser.fromType(Type R) {
    var mirror = reflectType(ClassParser, [R]);
    var instanceMirror = (mirror as ClassMirror).newInstance(Symbol(''), [], {#preheat: true, #register: true});
    return instanceMirror.reflectee;
  }

  ClassParser({bool bake = true, bool register = true}) {
    _classTypeMirror = reflectClass(T);

    if (bake) {
      if (register) GlobalJsonParserInstance.queueParser(associatedTypeSymbol);

      _bake();

      if (register) GlobalJsonParserInstance.addParser(this);
    }
  }

  bool _isParseable(DeclarationMirror mirror) {
    return mirror.metadata.any((metadataMirror) => metadataMirror.reflectee is JsonParseable);
  }

  void _preheatVariable(VariableMirror mirror) {
    Symbol name = mirror.simpleName;
    Symbol typeName = mirror.type.simpleName;

    if (GlobalJsonParserInstance.hasParser(typeName)) {
      _actions[name] = ClassParserAction(
        parserSymbol: typeName,
        symbol: name,
        typeArgument: mirror.type.reflectedType,
      );
    } else if (mirror.type is ClassMirror && _isParseable(mirror.type)) {
      ClassParser.fromType(mirror.type.reflectedType);
      _actions[name] = ClassParserAction(
        parserSymbol: typeName,
        symbol: name,
        typeArgument: mirror.type.reflectedType,
      );
    }
  }

  void _bake() {
    _actions = {};

    for (var mirror in _classTypeMirror.declarations.values) {
      if (mirror is VariableMirror) {
        _preheatVariable(mirror);
      }
    }
  }

  @override
  T fromJson(json, {Symbol typeArgumentSymbol, Type type}) {
    InstanceMirror mirror = (reflectType(T) as ClassMirror).newInstance(Symbol(''), []);
    _actions.forEach((name, action) {
      var data = json[action.fieldName];
      mirror.setField(name, action.fromJson(data));
    });
    return mirror.reflectee;
  }

  @override
  toJson(T data, {Symbol typeArgumentSymbol, Type type}) {
    InstanceMirror mirror = reflect(data);
    Map json = {};
    _actions.forEach((name, action) {
      var data = mirror.getField(name).reflectee;
      json[action.fieldName] = action.toJson(data);
    });
    return json;
  }
}
