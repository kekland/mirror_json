import '../parser.dart';

class DoubleParser extends Parser<double> {
  @override
  get associatedTypeSymbol => #double;

  @override
  double fromJson(dynamic data, [Type type]) {
    if(data is num) {
      return data.toDouble();
    }
    return null;
  }

  @override
  toJson(double data, [Type type]) {
    return data;
  }
}