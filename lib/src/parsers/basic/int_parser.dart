import '../parser.dart';

class IntParser extends Parser<int> {
  @override
  get associatedType => int;

  @override
  get associatedTypeSymbol => #int;

  @override
  int fromJson(dynamic data, {Symbol typeArgumentSymbol, Type type}) {
    if (data is num) {
      return data.toInt();
    }
    return null;
  }

  @override
  toJson(int data, {Symbol typeArgumentSymbol, Type type}) {
    return data;
  }
}
