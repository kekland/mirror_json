import 'package:mirror_json/mirror_json.dart';
import 'package:test/test.dart';

import 'test_class.dart';

void main() {
  group('json', () {
    GlobalJsonParserInstance.initialize();
    var parser = ClassParser<Human>();
    group('.toJson()', () {
      test(' class', () {
        var human = Human(name: Name(first: 'first', last: 'last'), age: 18);
        var json = Json.toJson<Human>(human);
        expect(json, {
          'name': {'first': 'first', 'middle': null, 'last': 'last'},
          'age': 18
        });
      });

      test(' list', () {
        var human1 = Human(name: Name(first: 'first', last: 'last'), age: 18);
        var human2 = Human(name: Name(first: 'first', last: 'last'), age: 19);
        List<Human> list = [human1, human2];
        var json = Json.toJson<List>(list);

        expect(json, [
          {
            'name': {'first': 'first', 'middle': null, 'last': 'last'},
            'age': 18
          },
          {
            'name': {'first': 'first', 'middle': null, 'last': 'last'},
            'age': 19
          }
        ]);
      });
    });

    group('.fromJson()', () {
      test('class', () {
        var human = Human(name: Name(first: 'first', last: 'last'), age: 18);
        var json = {
          'name': {'first': 'first', 'middle': null, 'last': 'last'},
          'age': 18
        };
        var convertedJson = Json.fromJson<Human>(json);

        expect(human, convertedJson);
      });

      test(' list', () {
        var human1 = Human(name: Name(first: 'first', last: 'last'), age: 18);
        var human2 = Human(name: Name(first: 'first', last: 'last'), age: 19);

        List<Human> list = [human1, human2];

        var json = [
          {
            'name': {'first': 'first', 'middle': null, 'last': 'last'},
            'age': 18
          },
          {
            'name': {'first': 'first', 'middle': null, 'last': 'last'},
            'age': 19
          }
        ];

        var convertedHumans = Json.fromJson<List<Human>>(json);

        expect(convertedHumans, list);
      });
    });
  });
}
