/// An interface for any parser.
/// 
/// You can see [BoolParser] or [StringParser] as an example.

abstract class Parser<T> {
  /// A type that this Parser is associated with.
  Type get associatedType;

  /// Symbol of the [associatedType].
  Symbol get associatedTypeSymbol;

  /// Convert an instance of **T** to JSON.
  dynamic toJson(T data, {Symbol typeArgumentSymbol, Type type});

  /// Create an instance of **T** from JSON.
  T fromJson(dynamic json, {Symbol typeArgumentSymbol, Type type});
}
