import 'package:mirror_json/mirror_json.dart';
import 'package:test/test.dart';

void main() {
  group('bool_parser', () {
    var parser = BoolParser();

    test('.toJson()', () {
      dynamic value = false;
      expect(parser.toJson(value), equals(false));
    });

    test('.fromJson()', () {
      dynamic value = false;
      expect(parser.fromJson(value), equals(false));
    });
  });
}
