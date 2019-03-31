import 'package:mirror_json/mirror_json.dart';
import 'package:test/test.dart';

import 'test_class.dart';

void main() {
  group('json', () {
    var parser = IntParser();

    group('.toJson()', () {
      test(' class', () {
        GlobalJsonParserInstance.initialize();
        var parser = ClassParser<Human>();
        var human = Human(name: Name(first: 'first', last: 'last'), age: 18);
        var json = Json.toJson(human);
        expect(json, {
          'name': {'first': 'first', 'middle': null, 'last': 'last'},
          'age': 18
        });
      });
    });

    group('.fromJson()', () {
      test('class', () {
        var human = Human(name: Name(first: 'first', last: 'last'), age: 18);
        var parser = ClassParser<Human>();
        var json = {
          'name': {'first': 'first', 'middle': null, 'last': 'last'},
          'age': 18
        };
        var convertedJson = Json.fromJson<Human>(json);

        expect(human, convertedJson);
      });
    });
  });
}
