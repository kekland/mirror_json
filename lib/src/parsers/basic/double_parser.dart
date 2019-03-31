import '../parser.dart';

/// A ready-to-use parser. See [Parser] for more info.
class DoubleParser extends Parser<double> {
  @override
  get associatedType => double;

  @override
  get associatedTypeSymbol => #double;

  @override
  double fromJson(dynamic data, {Symbol typeSymbol, Type type}) {
    if (data is num) {
      return data.toDouble();
    }
    return null;
  }

  @override
  toJson(double data, {Symbol typeSymbol, Type type}) {
    return data;
  }
}
