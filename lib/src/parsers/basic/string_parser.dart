import '../parser.dart';

/// A ready-to-use parser. See [Parser] for more info.
class StringParser extends Parser<String> {
  @override
  get associatedType => String;

  @override
  get associatedTypeSymbol => #String;

  @override
  String fromJson(dynamic data, {Symbol typeSymbol, Type type}) {
    if (data is String) {
      return data;
    }
    return null;
  }

  @override
  toJson(String data, {Symbol typeSymbol, Type type}) {
    return data;
  }
}
