import '../websocket_event_dto.dart';

class RequestDTO extends WebsocketEventDTO {
  final String? ticks;
  final int? subscribe;

  RequestDTO(this.ticks, this.subscribe);

  RequestDTO.fromJson(Map<String, dynamic> json)
      : subscribe = json['subscribe'],
        ticks = json['ticks'];

  Map<String, dynamic> toJson() => {'subscribe': subscribe, 'ticks': ticks};
}
