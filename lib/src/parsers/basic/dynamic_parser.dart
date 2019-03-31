import '../parser.dart';

/// A ready-to-use parser. See [Parser] for more info.
class DynamicParser extends Parser<dynamic> {
  @override
  get associatedType => dynamic;

  @override
  Symbol get associatedTypeSymbol => #dynamic;

  @override
  fromJson(json, {Symbol typeSymbol, Type type}) {
    return json;
  }

  @override
  toJson(data, {Symbol typeSymbol, Type type}) {
    return data;
  }
}
