import '../parser.dart';

class NumParser extends Parser<num> {
  get associatedTypeSymbol => #num;

  @override
  num fromJson(dynamic data) {
    if(data is num) {
      return data;
    }
    return null;
  }

  @override
  toJson(num data) {
    return data;
  }
}