import 'package:mirror_json/mirror_json.dart';

@JsonParseable()
class Human {
  Name name;
  int age;

  Human({this.name, this.age});

  operator ==(dynamic other) {
    if (other is Human) {
      return name == other.name && age == other.age;
    }
    return false;
  }
}

@JsonParseable()
class Name {
  String first;
  String middle;
  String last;

  Name({this.first, this.middle, this.last});
  
  operator ==(dynamic other) {
    if (other is Name) {
      return first == other.first && middle == other.middle && last == other.last;
    }
    return false;
  }
}
