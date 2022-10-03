import 'request_dto.dart';
import '../websocket_event_dto.dart';

class ForgetResponseDTO  implements WebsocketEventDTO {
  int? _forget;
  String? _msgType;
  RequestDTO? _echoReq;

  ForgetResponseDTO(int forget, String msgType, RequestDTO echoReq) {
    _echoReq = echoReq;
    _msgType = msgType;
    _forget = forget;
  }

  int? get forget => _forget;
  String? get msgType => _msgType;
  RequestDTO? get echoReq => _echoReq;

  ForgetResponseDTO.fromJson(Map<String, dynamic> json){
    _forget = json['forget'];
    _msgType = json['msg_type'];
    var echoReqMap = json['echo_req'] as Map<String, dynamic>;
    _echoReq = RequestDTO.fromJson(echoReqMap);
  }
}
