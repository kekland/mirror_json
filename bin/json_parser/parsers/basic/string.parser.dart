import '../parser.dart';

class StringParser extends Parser<String> {
  get associatedTypeSymbol => #String;
  
  @override
  String fromJson(dynamic data) {
    if(data is String) {
      return data;
    }
    return null;
  }

  @override
  toJson(String data) {
    return data;
  }
}