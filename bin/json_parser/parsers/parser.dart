abstract class Parser<T> {
  Symbol get associatedTypeSymbol;
  dynamic toJson(T data);

  T fromJson(dynamic json);
}

abstract class ComplexParser<T, C> extends Parser<T> {}