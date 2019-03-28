import '../parser.dart';

class BoolParser extends Parser<bool> {
  @override
  get associatedTypeSymbol => #bool;

  @override
  bool fromJson(dynamic data, [Type type]) {
    if(data is bool) {
      return data;
    }
    return null;
  }

  @override
  toJson(bool data, [Type type]) {
    return data;
  }
}