import 'package:deriv/core/exception/base_exception.dart';

class MapperException extends BaseException {
  Object? exception;

  MapperException(this.exception) : super("error mapping ${exception.toString()}");
}
