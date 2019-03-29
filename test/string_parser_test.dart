import 'package:mirror_json/mirror_json.dart';
import 'package:test/test.dart';

void main() {
  group('string_parser', () {
    var parser = StringParser();

    test('.toJson()', () {
      dynamic value = "hello, world!";
      expect(parser.toJson(value), equals("hello, world!"));
    });

    test('.fromJson()', () {
      dynamic value = "hello, world!";
      expect(parser.fromJson(value), equals("hello, world!"));
    });
  });
}
