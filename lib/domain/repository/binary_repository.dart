import 'dart:async';
import '../model/websocket_event.dart';

abstract class BinaryRepository {
  Stream<WebsocketEventModel> subscribe();

  void connect();

  void getActiveSymbols(String activeSymbols, String productType);

  void getTick(String ticks, int subscribe);

  void setForget(String forget);
}
