import '../parser.dart';

/// A ready-to-use parser. See [Parser] for more info.
class IntParser extends Parser<int> {
  @override
  get associatedType => int;

  @override
  get associatedTypeSymbol => #int;

  @override
  int fromJson(dynamic data, {Symbol typeSymbol, Type type}) {
    if (data is num) {
      return data.toInt();
    }
    return null;
  }

  @override
  toJson(int data, {Symbol typeSymbol, Type type}) {
    return data;
  }
}
