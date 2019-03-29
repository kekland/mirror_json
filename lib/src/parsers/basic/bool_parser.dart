import '../parser.dart';

/// A ready-to-use parser. See [Parser] for more info.
class BoolParser extends Parser<bool> {
  @override
  get associatedType => bool;

  @override
  get associatedTypeSymbol => #bool;

  @override
  bool fromJson(dynamic data, {Symbol typeArgumentSymbol, Type type}) {
    if (data is bool) {
      return data;
    }
    return null;
  }

  @override
  toJson(bool data, {Symbol typeArgumentSymbol, Type type}) {
    return data;
  }
}
