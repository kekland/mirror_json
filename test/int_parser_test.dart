import 'package:json_parser/json_parser.dart';
import 'package:test/test.dart';

void main() {
  group('int_parser', () {
    var parser = IntParser();

    test('.toJson()', () {
      dynamic value = 3;
      expect(parser.toJson(value), equals(3));
    });

    test('.fromJson()', () {
      dynamic value = 3;
      expect(parser.fromJson(value), equals(3));
    });
  });
}
