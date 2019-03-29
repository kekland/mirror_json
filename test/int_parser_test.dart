import 'package:mirror_json/mirror_json.dart';
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
