import '../json_parser/annotations/parseable.annotation.dart';
import '../json_parser/json_parser.dart';
import '../json_parser/parsers/class.parser.dart';

@JsonParseable()
class Human {
  Name name;
  int age;
  List<int> testList;

  Human({this.name, this.age, this.testList});
}

@JsonParseable()
class Name {
  String first;
  String middle;
  String last;

  Name({this.first, this.middle, this.last});
}

void test() {
  GlobalJsonParserInstance.initialize();
  var parser = new ClassParser<Human>();
  var human = parser.fromJson({
    "age": 18,
    "name": {"first": "ee", "last": "bb"},
    "testList": [0, 1, 2, 3, 4]
  });

  print(human.testList);
  print(parser.toJson(human));
}
