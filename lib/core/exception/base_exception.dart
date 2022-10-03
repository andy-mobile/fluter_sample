class BaseException implements Exception {
  String? message;

  /// The exception that caused this one, if available.
  final Object? inner;

  BaseException([this.message]) : inner = null;

  BaseException.from(this.inner) : message = inner.toString();

  @override
  String toString() => message == null
      ? 'BaseException'
      : 'BaseException: $message';
}
