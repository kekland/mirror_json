import '../parser.dart';

class IntParser extends Parser<int> {
  @override
  get associatedTypeSymbol => #int;

  @override
  int fromJson(dynamic data, [Symbol typeArgumentSymbol]) {
    if(data is num) {
      return data.toInt();
    }
    return null;
  }

  @override
  toJson(int data, [Symbol typeArgumentSymbol]) {
    return data;
  }
}