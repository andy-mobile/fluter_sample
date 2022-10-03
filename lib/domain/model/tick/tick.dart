import 'package:equatable/equatable.dart';
import '../websocket_event.dart';

class TickSpotDataEntity extends Equatable implements WebsocketEventModel {
  final double ask;
  final double bid;
  final int epoch;
  final String id;
  final num pipSize;
  final double quote;
  final String symbol;

  const TickSpotDataEntity(
    this.ask,
    this.bid,
    this.epoch,
    this.id,
    this.pipSize,
    this.quote,
    this.symbol,
  );

  @override
  List<Object> get props => [
        ask,
        bid,
        epoch,
        id,
        pipSize,
        quote,
        symbol,
      ];
}
