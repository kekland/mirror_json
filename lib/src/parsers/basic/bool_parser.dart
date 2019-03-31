import '../parser.dart';

/// A ready-to-use parser. See [Parser] for more info.
class BoolParser extends Parser<bool> {
  @override
  get associatedType => bool;

  @override
  get associatedTypeSymbol => #bool;

  @override
  bool fromJson(dynamic data, {Symbol typeSymbol, Type type}) {
    if (data is bool) {
      return data;
    }
    return null;
  }

  @override
  toJson(bool data, {Symbol typeSymbol, Type type}) {
    return data;
  }
}
