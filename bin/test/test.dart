import '../json_parser/annotations/parseable.annotation.dart';
import '../json_parser/json_parser.dart';
import '../json_parser/parsers/class.parser.dart';

@JsonParseable()
class Human {
  Name name;
  int age;

  Human({this.name, this.age});
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
    "name": {"first": "ee", "last": "bb"}
  });

  print(human);
  var time = DateTime.now().millisecondsSinceEpoch;
  for (var i = 0; i < 100000; i++) {
    parser.toJson(human);
  }
  print(DateTime.now().millisecondsSinceEpoch - time);
}
