import 'package:deriv/core/exception/event_processor_exception.dart';
import 'package:deriv/data/dto/websocket_event_dto.dart';
import 'base/event_processor.dart';
import './concrete/index.dart';

class WebsocketEventProcessor extends EventProcessor {
  final List<EventProcessor> _eventProcessors = [];

  WebsocketEventProcessor() {
    _eventProcessors.add(ActiveSymbolsEventProcessor(this));
    _eventProcessors.add(TickEventProcessor(this));
    _eventProcessors.add(ForgetEventProcessor(this));
  }

  @override
  WebsocketEventDTO proceed(Map<String, dynamic> json) {
    preProceed(json);

    WebsocketEventDTO? websocketEvent;

    for (EventProcessor processor in _eventProcessors) {
      if (processor.canProcess()) {
        websocketEvent = processor.proceed(json);
        break;
      }
    }

    if (websocketEvent == null) {
      throw EventProcessorException();
    }
    return websocketEvent;
  }
}
