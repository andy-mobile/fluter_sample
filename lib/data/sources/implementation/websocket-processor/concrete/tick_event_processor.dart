import '../base/event_processor.dart';
import 'package:deriv/data/dto/websocket_event_dto.dart';
import 'package:deriv/data/dto/tick/index.dart';
import '../base/event_type.dart';

class TickEventProcessor extends EventProcessor {
  static const String _eventType = "tick";

  TickEventProcessor(EventType context) {
    this.context = context;
  }

  @override
  WebsocketEventDTO proceed(Map<String, dynamic> json) {
    return TickDTO.fromJson(json);
  }

  @override
  bool canProcess() {
    return _eventType == context.getEventType();
  }
}
