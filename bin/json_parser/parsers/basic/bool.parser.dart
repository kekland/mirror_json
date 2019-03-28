import '../parser.dart';

class BoolParser extends Parser<bool> {
  get associatedTypeSymbol => #bool;

  @override
  bool fromJson(dynamic data) {
    if(data is bool) {
      return data;
    }
    return null;
  }

  @override
  toJson(bool data) {
    return data;
  }
}