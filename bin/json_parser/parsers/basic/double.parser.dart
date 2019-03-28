import '../parser.dart';

class DoubleParser extends Parser<double> {
  get associatedTypeSymbol => #double;
  
  @override
  double fromJson(dynamic data) {
    if(data is num) {
      return data.toDouble();
    }
    return null;
  }

  @override
  toJson(double data) {
    // TODO: implement toJson
    return null;
  }
}