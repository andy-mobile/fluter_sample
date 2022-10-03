import 'dart:async';
import 'package:deriv/data/dto/websocket_event_dto.dart';

abstract class BinaryApiDatasource {
  Stream<WebsocketEventDTO> subscribe();

  void connect();

  void disconnect();

  void getActiveSymbols(String activeSymbols, String productType);

  void getTick(String ticks, int subscribe);

  void setForget(String forget);
}
