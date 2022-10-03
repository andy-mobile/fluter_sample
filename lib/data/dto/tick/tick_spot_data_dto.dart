import '../websocket_event_dto.dart';

class TickSpotDataDTO extends WebsocketEventDTO {
  final num? ask;
  final num? bid;
  final num? epoch;
  final String? id;
  final num? pipSize;
  final num? quote;
  final String? symbol;

  TickSpotDataDTO(
    this.ask,
    this.bid,
    this.epoch,
    this.id,
    this.pipSize,
    this.quote,
    this.symbol,
  );

  TickSpotDataDTO.fromJson(Map<String, dynamic> json)
      : ask = json['ask'],
        bid = json['bid'],
        epoch = json['epoch'],
        id = json['id'],
        pipSize = json['pip_size'],
        quote = json['quote'],
        symbol = json['symbol'];

  Map<String, dynamic> toJson() => {
        'ask': ask,
        'bid': bid,
        'epoch': epoch,
        'id': id,
        'pip_size': pipSize,
        'quote': quote,
        'symbol': symbol
      };
}
