import '../parser.dart';

class DateTimeParser extends Parser<DateTime> {
  @override
  get associatedTypeSymbol => #DateTime;

  @override
  DateTime fromJson(dynamic data, {Symbol typeArgumentSymbol, Type type}) {
    // TODO: implement fromJson
    return null;
  }

  @override
  toJson(DateTime data, {Symbol typeArgumentSymbol, Type type}) {
    // TODO: implement toJson
    return null;
  }
}