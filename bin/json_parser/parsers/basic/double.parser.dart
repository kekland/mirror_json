import '../parser.dart';

class DoubleParser extends Parser<double> {
  @override
  get associatedTypeSymbol => #double;

  @override
  double fromJson(dynamic data, [Symbol typeArgumentSymbol]) {
    if(data is num) {
      return data.toDouble();
    }
    return null;
  }

  @override
  toJson(double data, [Symbol typeArgumentSymbol]) {
    return data;
  }
}