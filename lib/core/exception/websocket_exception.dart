import 'package:deriv/core/exception/base_exception.dart';

class WebSocketException extends BaseException {
  Object? exception;

  WebSocketException({this.exception}) : super(exception.toString());
}
