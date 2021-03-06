import 'dart:mirrors';

import 'parsers/complex/list_parser.dart';
import 'parsers/parser.dart';
import 'parsers/basic/basic_parser.dart';

/// This class holds all the current [Parser]s and manages them.
class GlobalJsonParserInstance {
  /// Map of baked parsers, where the key for every parser is their type's symbol.
  static Map<Symbol, Parser> parsers;

  /// List of queued (non-baked, but ready to be baked) parsers.
  ///
  /// Used to solve circular dependencies.
  static List<Symbol> queuedParsers;

  /// Initialize the parser.
  ///
  /// If [includeBasicParsers] is true, it will automatically add all parsers under `parsers/basic`,
  /// such as [BoolParser], [DoubleParser], etc.
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
      addParser(ListParser(), [#_GrowableList]);
      addParser(DynamicParser());
    }
  }

  /// Queue an unbaked parser.
  ///
  /// [symbol] must be a symbol that is associated with this parser.
  static void queueParser(Symbol symbol) {
    if (!queuedParsers.contains(symbol)) {
      queuedParsers.add(symbol);
    }
  }

  /// Remove a parser from queue list.
  ///
  /// Usually called when the parser is baked and ready to use.
  ///
  /// [symbol] must be a symbol that is associated with this parser.
  static void dequeueParser(Symbol symbol) {
    if (queuedParsers.contains(symbol)) {
      queuedParsers.remove(symbol);
    }
  }

  /// Add a parser to the map.
  static void addParser(Parser parser, [List<Symbol> aliases]) {
    parsers.putIfAbsent(parser.associatedTypeSymbol, () => parser);
    if (aliases != null) {
      for (var alias in aliases) {
        parsers.putIfAbsent(alias, () => parser);
      }
    }
    dequeueParser(parser.associatedTypeSymbol);
  }

  /// Does parser with [symbol] as its associated symbol exist?
  ///
  /// If [allowQueued] is true, returns true if there is such a parser in
  /// queue.
  static bool hasParser(Symbol symbol, {bool allowQueued = true}) {
    return parsers.containsKey(symbol) || (allowQueued && queuedParsers.contains(symbol));
  }

  /// Get a parser with [symbol] as its associated symbol.
  ///
  /// Returns `null` if none exist.
  static Parser getParser(Symbol symbol) {
    if (hasParser(symbol, allowQueued: false)) {
      return parsers[symbol];
    }
    return null;
  }

  /// Get a parser with [type] as its associated type.
  ///
  /// Returns `null` if none exist.
  static Parser getParserByType(Type type) {
    var symbol = MirrorSystem.getSymbol(type.toString());
    return getParser(symbol);
  }
}

/// A class for convenience JSON features.
///
/// Adds methods like `.toJson()`, `.fromJson()`.
class Json {
  /// Convert a JSON object (Map, List) to an instance of [T].
  ///
  /// Throws if no parser for [T] was found.
  static T fromJson<T>(dynamic json) {
    var mirror = reflectType(T);

    Parser parser = GlobalJsonParserInstance.getParser(mirror.simpleName);
    if (parser == null) {
      throw new Exception('Parser for ${mirror.simpleName} was not initialized.');
    }

    return parser.fromJson(
      json,
      type: T,
      typeSymbol: mirror.simpleName,
    );
  }

  /// Convert an object to a JSON object (Map, List).
  ///
  /// Throws if no parser for [object]'s type was found..
  static dynamic toJson<T>(dynamic object) {
    var mirror = reflectType(T);

    Parser parser = GlobalJsonParserInstance.getParser(mirror.simpleName);

    if (parser == null) {
      throw new Exception('Parser for ${mirror.simpleName} was not initialized.');
    }

    return parser.toJson(
      object,
      type: object.runtimeType,
      typeSymbol: mirror.simpleName,
    );
  }
}
