abstract class Parser<T> {
  dynamic toJson(T data);

  T fromJson(dynamic json);
}

abstract class ComplexParser<T, C> extends Parser<T> {}