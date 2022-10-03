import 'symbol_dto.dart';
import 'request_dto.dart';
import '../websocket_event_dto.dart';

class ActiveSymbolsDTO  implements WebsocketEventDTO {
  List<SymbolDTO>? _activeSymbols;

  String? _msgType;

  RequestDTO? _echoRequest;

  ActiveSymbolsDTO(
      List<SymbolDTO> activeSymbols, String msgType, RequestDTO echoRequest) {
    _activeSymbols = activeSymbols;
    _msgType = msgType;
    _echoRequest = echoRequest;
  }

  List<SymbolDTO>? get activeSymbols => _activeSymbols;

  String? get msgType => _msgType;

  ActiveSymbolsDTO.fromJson(Map<String, dynamic> json) {
    _msgType = json['_msgType'];

    var requestjson = json['echo_req'] as Map<String, dynamic>;
    _echoRequest = RequestDTO.fromJson(requestjson);

      List<dynamic> items = json['active_symbols'] as List<dynamic>;
      _activeSymbols = items
          .map((data) => data as Map<String, dynamic>)
          .map((data) => SymbolDTO.fromJson(data))
          .toList();

  }
}
