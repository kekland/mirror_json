import '../parser.dart';

class NumParser extends Parser<num> {
  @override
  get associatedTypeSymbol => #num;

  @override
  num fromJson(dynamic data, [Type type]) {
    if(data is num) {
      return data;
    }
    return null;
  }

  @override
  toJson(num data, [Type type]) {
    return data;
  }
}