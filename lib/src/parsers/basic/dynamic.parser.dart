
import '../parser.dart';

class DynamicParser extends Parser<dynamic> {
  @override
  Symbol get associatedTypeSymbol => #dynamic;

  @override
  fromJson(json, {Symbol typeArgumentSymbol, Type type}) {
    return json;
  }

  @override
  toJson(data, {Symbol typeArgumentSymbol, Type type}) {
    return data;
  }
}