import '../websocket_event_dto.dart';

class RequestDTO implements WebsocketEventDTO {
  final String? activeSymbols;
  final String? productType;

  const RequestDTO(this.activeSymbols, this.productType);

  RequestDTO.fromJson(Map<String, dynamic> json)
      : activeSymbols = json['active_symbols'],
        productType = json['product_type'];

  Map<String, dynamic> toJson() => {
        'active_symbols': activeSymbols,
        'product_type': productType,
      };
}
