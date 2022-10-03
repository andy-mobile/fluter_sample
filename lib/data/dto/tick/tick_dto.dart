import 'request_dto.dart';
import 'subscription_dto.dart';
import 'index.dart';
import '../websocket_event_dto.dart';

class TickDTO extends WebsocketEventDTO {
  RequestDTO? _echoRequest;
  String? _msgType;
  SubscriptionDTO? _subscription;
  TickSpotDataDTO? _tick;

  TickDTO(RequestDTO echoRequest, String msgType,
      SubscriptionDTO subscription, TickSpotDataDTO tick) {
    _echoRequest = echoRequest;
    _msgType = msgType;
    _subscription = subscription;
    _tick = tick;
  }

  RequestDTO? get echoRequest => _echoRequest;

  String? get msgType => _msgType;

  SubscriptionDTO? get subscription => _subscription;

  TickSpotDataDTO? get tick => _tick;

  TickDTO.fromJson(Map<String, dynamic> json) {
    _msgType = json['msg_type'];

    var echoReqMap = json['echo_req'] as Map<String, dynamic>;
    _echoRequest = RequestDTO.fromJson(echoReqMap);

    var subscriptionMap = json['subscription'] as Map<String, dynamic>;
    _subscription = SubscriptionDTO.fromJson(subscriptionMap);

    var tickMap = json['tick'] as Map<String, dynamic>;
    _tick = TickSpotDataDTO.fromJson(tickMap);
  }
}
