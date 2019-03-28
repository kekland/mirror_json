import '../annotations/parseable.annotation.dart';
import '../json_parser.dart';
import 'parser.dart';
import 'dart:mirrors';

class ClassParserAction {
  String fieldName;
  Symbol symbol;
  Symbol parserSymbol;
  Type type;

  ClassParserAction({this.symbol, this.parserSymbol, this.type}) {
    this.fieldName = MirrorSystem.getName(symbol);
  }
}

class ClassParser<T> extends Parser<T> {
  ClassMirror classTypeMirror;
  Map<Symbol, ClassParserAction> actions;

  @override
  Symbol get associatedTypeSymbol => classTypeMirror.simpleName;

  factory ClassParser.fromType(Type R) {
    var mirror = reflectType(ClassParser, [R]);
    var instanceMirror = (mirror as ClassMirror).newInstance(Symbol(''), [], {#preheat: true, #register: true});
    return instanceMirror.reflectee;
  }

  ClassParser({bool preheat = true, bool register = true}) {
    classTypeMirror = reflectClass(T);

    if (preheat) {
      if (register) GlobalJsonParserInstance.queueParser(associatedTypeSymbol);

      _preheat();

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
      actions[name] = ClassParserAction(
        parserSymbol: typeName,
        symbol: name,
      );
    } else if (mirror.type is ClassMirror && _isParseable(mirror.type)) {
      ClassParser.fromType(mirror.type.reflectedType);
      actions[name] = ClassParserAction(
        parserSymbol: typeName,
        symbol: name,
      );
    }
  }

  void _preheat() {
    actions = {};

    for (var mirror in classTypeMirror.declarations.values) {
      if (mirror is VariableMirror) {
        _preheatVariable(mirror);
      }
    }
  }

  @override
  T fromJson(json, [Symbol typeArgumentSymbol]) {
    InstanceMirror mirror = (reflectType(T) as ClassMirror).newInstance(Symbol(''), []);
    actions.forEach((name, action) {
      var data = json[action.fieldName];
      mirror.setField(name, GlobalJsonParserInstance.getParser(action.parserSymbol).fromJson(data));
    });
    return mirror.reflectee;
  }

  @override
  toJson(T data, [Symbol typeArgumentSymbol]) {
    InstanceMirror mirror = reflect(data);
    Map json = {};
    actions.forEach((name, action) {
      var data = mirror.getField(name).reflectee;
      json[action.fieldName] = GlobalJsonParserInstance.getParser(action.parserSymbol).toJson(data);
    });
    return json;
  }
}
