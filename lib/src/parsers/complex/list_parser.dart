import 'dart:mirrors';
import 'package:mirror_json/src/global_instance.dart';
import '../parser.dart';

/// A ready-to-use parser. See [Parser] for more info.
class ListParser extends Parser<List> {
  @override
  get associatedType => List;

  @override
  get associatedTypeSymbol => #List;

  @override
  List fromJson(dynamic data, {Symbol typeArgumentSymbol, Type type}) {
    if (data is List) {
      var typeMirror = reflectType(type);
      var mirror = (reflectType(type) as ClassMirror).newInstance(Symbol(''), []);
      var argumentType = typeMirror.typeArguments.isNotEmpty ? typeMirror.typeArguments.first : null;

      data.forEach((obj) {
        var parser = GlobalJsonParserInstance.getParser(argumentType.simpleName);
        mirror.reflectee.add(parser.fromJson(
          obj,
          typeArgumentSymbol: argumentType.simpleName,
          type: argumentType.reflectedType,
        ));
      });
      return mirror.reflectee;
    }
    return null;
  }

  @override
  toJson(List data, {Symbol typeArgumentSymbol, Type type}) {
    List returnList = [];
    var typeMirror = reflectType(type);
    var argumentType = typeMirror.typeArguments.isNotEmpty ? typeMirror.typeArguments.first : null;

    data.forEach((obj) {
      var parser = GlobalJsonParserInstance.getParser(argumentType.simpleName);
      returnList.add(parser.toJson(
        obj,
        typeArgumentSymbol: argumentType.simpleName,
        type: argumentType.reflectedType,
      ));
    });
    return returnList;
  }
}
