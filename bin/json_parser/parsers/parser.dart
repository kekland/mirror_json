abstract class Parser<T> {
  Symbol get associatedTypeSymbol;
  dynamic toJson(T data, [Symbol typeArgumentSymbol]);

  T fromJson(dynamic json, [Symbol typeArgumentSymbol]);
}