import 'package:deriv/core/exception/base_exception.dart';

class EventProcessorException extends BaseException {
  Object? exception;

  EventProcessorException({this.exception})
      : super("Event Processor Exception ${exception.toString()}");
}
