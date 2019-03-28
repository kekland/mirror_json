import '../parser.dart';

class StringParser extends Parser<String> {
  @override
  get associatedTypeSymbol => #String;

  @override
  String fromJson(dynamic data, [Type type]) {
    if(data is String) {
      return data;
    }
    return null;
  }

  @override
  toJson(String data, [Type type]) {
    return data;
  }
}