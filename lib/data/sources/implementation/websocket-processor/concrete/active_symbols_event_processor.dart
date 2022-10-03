import '../base/event_processor.dart';
import 'package:deriv/data/dto/websocket_event_dto.dart';
import 'package:deriv/data/dto/active-symbols/index.dart';
import '../base/event_type.dart';

class ActiveSymbolsEventProcessor extends EventProcessor {
  static const String _eventType = "active_symbols";

  ActiveSymbolsEventProcessor(EventType context) {
    this.context = context;
  }

  @override
  WebsocketEventDTO proceed(Map<String, dynamic> json) {
    return ActiveSymbolsDTO.fromJson(json);
  }

  @override
  bool canProcess() {
    return _eventType == context.getEventType();
  }
}
