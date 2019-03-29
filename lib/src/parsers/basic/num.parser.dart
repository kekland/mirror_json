import '../parser.dart';

class NumParser extends Parser<num> {
  @override
  get associatedTypeSymbol => #num;

  @override
  num fromJson(dynamic data, {Symbol typeArgumentSymbol, Type type}) {
    if (data is num) {
      return data;
    }
    return null;
  }

  @override
  toJson(num data, {Symbol typeArgumentSymbol, Type type}) {
    return data;
  }
}
