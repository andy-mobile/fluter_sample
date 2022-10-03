import '../websocket_event_dto.dart';

class SubscriptionDTO extends WebsocketEventDTO {
  final String id;

  SubscriptionDTO(this.id);

  SubscriptionDTO.fromJson(Map<String, dynamic> json) : id = json['id'];

  Map<String, dynamic> toJson() => {'id': id};
}
