import '../parser.dart';

/// A ready-to-use parser. See [Parser] for more info.
class DateTimeParser extends Parser<DateTime> {
  @override
  get associatedType => DateTime;

  @override
  get associatedTypeSymbol => #DateTime;

  @override
  DateTime fromJson(dynamic data, {Symbol typeSymbol, Type type}) {
    // TODO: implement fromJson
    return null;
  }

  @override
  toJson(DateTime data, {Symbol typeSymbol, Type type}) {
    // TODO: implement toJson
    return null;
  }
}
