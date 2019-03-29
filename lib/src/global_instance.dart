import 'parsers/complex/list_parser.dart';
import 'parsers/parser.dart';
import 'parsers/basic/basic_parser.dart';

class GlobalJsonParserInstance {
  static Map<Symbol, Parser> parsers;
  static List<Symbol> queuedParsers;

  static initialize({bool includeBasicParsers = true}) {
    parsers = {};
    queuedParsers = [];
    if (includeBasicParsers) {
      addParser(BoolParser());
      addParser(DateTimeParser());
      addParser(DoubleParser());
      addParser(IntParser());
      addParser(NumParser());
      addParser(StringParser());
      addParser(ListParser());
      addParser(DynamicParser());
    }
  }

  static void queueParser(Symbol symbol) {
    if (!queuedParsers.contains(symbol)) {
      queuedParsers.add(symbol);
    }
  }

  static void dequeueParser(Symbol symbol) {
    if (queuedParsers.contains(symbol)) {
      queuedParsers.remove(symbol);
    }
  }

  static void addParser(Parser parser) {
    parsers.putIfAbsent(parser.associatedTypeSymbol, () => parser);
    dequeueParser(parser.associatedTypeSymbol);
  }

  static bool hasParser(Symbol symbol, {bool allowQueued = true}) {
    return parsers.containsKey(symbol) || (allowQueued && queuedParsers.contains(symbol));
  }

  static Parser getParser(Symbol symbol) {
    if (hasParser(symbol, allowQueued: false)) {
      return parsers[symbol];
    }
    return null;
  }
}
