import 'package:deriv/data/dto/websocket_event_dto.dart';
import 'event_type.dart';

abstract class EventProcessor implements EventType {
  String type = "";

  late EventType context;

  void preProceed(Map<String, dynamic> json) {
    type = json['msg_type'];
  }

  WebsocketEventDTO proceed(Map<String, dynamic> json);

  @override
  String getEventType() {
    return type;
  }

  bool canProcess() => false;
}
