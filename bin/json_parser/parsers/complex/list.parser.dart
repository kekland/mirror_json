import 'dart:mirrors';

import '../../json_parser.dart';
import '../parser.dart';

class ListParser extends Parser<List> {
  @override
  get associatedTypeSymbol => #List;

  @override
  List fromJson(dynamic data, {Symbol typeArgumentSymbol, Type type}) {
    if (data is List) {
      var mirror = (reflectType(List, [type]) as ClassMirror).newInstance(Symbol(''), []);
      data.forEach((obj) {
        mirror.reflectee.add(GlobalJsonParserInstance.getParser(typeArgumentSymbol).fromJson(
          obj,
          typeArgumentSymbol: typeArgumentSymbol,
          type: type,
        ));
      });
      return mirror.reflectee;
    }
    return null;
  }

  @override
  toJson(List data, {Symbol typeArgumentSymbol, Type type}) {
    List returnData = [];
    
    data.forEach((obj) {
      returnData.add(GlobalJsonParserInstance.getParser(typeArgumentSymbol).toJson(
        obj,
        typeArgumentSymbol: typeArgumentSymbol,
        type: type,
      ));
    });

    return returnData;
  }
}
