import 'parsers/parser.dart';
import 'parsers/basic/basic.parser.dart';

class GlobalJsonParser {
  static List<Parser> parsers;

  initialize({bool includeBasicParsers = true}) {
    parsers = [];
    if (includeBasicParsers) {
      parsers.add(BoolParser());
      parsers.add(DateTimeParser());
      parsers.add(DoubleParser());
      parsers.add(IntParser());
      parsers.add(NumParser());
      parsers.add(StringParser());
    }
  }
}
