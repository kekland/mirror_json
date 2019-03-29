abstract class Parser<T> {
  Type get associatedType;
  Symbol get associatedTypeSymbol;
  dynamic toJson(T data, {Symbol typeArgumentSymbol, Type type});

  T fromJson(dynamic json, {Symbol typeArgumentSymbol, Type type});
}
