import 'package:deriv/core/exception/index.dart';
import 'package:deriv/core/exception/websocket_exception.dart';
import 'package:deriv/core/values/constants.dart';
import 'package:deriv/data/sources/index.dart';
import 'package:web_socket_channel/io.dart';
import 'package:deriv/core/di/injector_provider.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:deriv/data/dto/websocket_event_dto.dart';
import 'dart:async';
import 'package:deriv/data/dto/active-symbols/index.dart' as active_symbols;
import 'dart:convert';
import 'package:deriv/data/dto/tick/index.dart' as tick_request;
import 'package:deriv/data/dto/forget/index.dart' as forget_request;

class BinaryApiDatasourceImpl extends BinaryApiDatasource {
  final _websocketController = StreamController<WebsocketEventDTO>.broadcast();
  final _websocketEventProcessor = inject<WebsocketEventProcessor>();

  IOWebSocketChannel? _channel;

  @override
  Stream<WebsocketEventDTO> subscribe() => _websocketController.stream;

  @override
  void connect() {
    _channel = null;
    _channel = IOWebSocketChannel.connect(
      Constants.endpoint,
      pingInterval: const Duration(seconds: Constants.pingIntervalSec),
    );
    _channel?.stream.listen((event) {
      try {
        Map<String, dynamic> json = jsonDecode(event);
        var temp = _websocketEventProcessor.proceed(json);
        _websocketController.sink.add(temp);
      } catch (exception) {
        _websocketController.sink
            .addError(EventProcessorException(exception: exception));
      }
    }, onError: (exception) async {
      _websocketController.sink
          .addError(WebSocketException(exception: exception));
    }, onDone: () async {
      connect();
    });
  }

  @override
  void disconnect() {
    _channel?.sink.add(status.goingAway);
    _channel = null;
  }

  @override
  void getActiveSymbols(String activeSymbols, String productType) {
    var request = active_symbols.RequestDTO(
      activeSymbols,
      productType,
    ).toJson();
    sendRequest(request);
  }

  @override
  void getTick(String ticks, int subscribe) {
    var request = tick_request.RequestDTO(
      ticks,
      subscribe,
    ).toJson();
    sendRequest(request);
  }

  @override
  void setForget(String forget) {
    var request = forget_request.RequestDTO(forget).toJson();
    sendRequest(request);
  }

  void sendRequest(Map<String, dynamic> request) {
    var json = jsonEncode(request).toString();
    _channel?.sink.add(json);
  }
}
