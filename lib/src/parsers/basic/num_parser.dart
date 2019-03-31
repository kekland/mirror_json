import '../parser.dart';

/// A ready-to-use parser. See [Parser] for more info.
class NumParser extends Parser<num> {
  @override
  get associatedType => num;

  @override
  get associatedTypeSymbol => #num;

  @override
  num fromJson(dynamic data, {Symbol typeSymbol, Type type}) {
    if (data is num) {
      return data;
    }
    return null;
  }

  @override
  toJson(num data, {Symbol typeSymbol, Type type}) {
    return data;
  }
}
