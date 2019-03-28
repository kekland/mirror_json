import '../parser.dart';

class IntParser extends Parser<int> {
  get associatedTypeSymbol => #int;

  @override
  int fromJson(dynamic data) {
    if(data is num) {
      return data.toInt();
    }
    return null;
  }

  @override
  toJson(int data) {
    return data;
  }
}