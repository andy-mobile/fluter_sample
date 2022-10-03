import '../websocket_event_dto.dart';

class RequestDTO implements WebsocketEventDTO {
  final String? forget;

  const RequestDTO(this.forget);

  RequestDTO.fromJson(Map<String, dynamic> json) : forget = json['forget'];

  Map<String, dynamic> toJson() => {'forget': forget};
}
