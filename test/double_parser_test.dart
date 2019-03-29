import 'package:json_parser/json_parser.dart';
import 'package:test/test.dart';

void main() {
  group('double_parser', () {
    var parser = DoubleParser();

    test('.toJson()', () {
      dynamic value = 3.0;
      expect(parser.toJson(value), equals(3.0));
    });

    test('.fromJson()', () {
      dynamic value = 3.0;
      expect(parser.fromJson(value), equals(3.0));
    });
  });
}
