import '../base/event_processor.dart';
import 'package:deriv/data/dto/websocket_event_dto.dart';
import 'package:deriv/data/dto/forget/index.dart';
import '../base/event_type.dart';

class ForgetEventProcessor extends EventProcessor {
  static const String _eventType = "forget";

  ForgetEventProcessor(EventType context) {
    this.context = context;
  }

  @override
  WebsocketEventDTO proceed(Map<String, dynamic> json) {
    return ForgetResponseDTO.fromJson(json);
  }

  @override
  bool canProcess() {
    return _eventType == context.getEventType();
  }
}
