abstract class Parser<T> {
  Symbol get associatedTypeSymbol;
  dynamic toJson(T data, [Type type]);

  T fromJson(dynamic json, [Type type]);
}