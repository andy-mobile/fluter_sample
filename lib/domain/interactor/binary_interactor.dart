import 'package:deriv/core/di/injector_provider.dart';
import 'package:deriv/domain/model/websocket_event.dart';
import 'package:deriv/domain/repository/binary_repository.dart';

class BinaryInteractor {
  final BinaryRepository _binaryRepository = inject<BinaryRepository>();

  Stream<WebsocketEventModel> subscribe() => _binaryRepository.subscribe();

  void connect() => _binaryRepository.connect();

  void getActiveSymbols(String activeSymbols, String productType) {
    _binaryRepository.getActiveSymbols(activeSymbols, productType);
  }

  void getTick(String ticks, int subscribe) {
    _binaryRepository.getTick(ticks, subscribe);
  }

  void setForget(String forget) {
    _binaryRepository.setForget(forget);
  }
}
