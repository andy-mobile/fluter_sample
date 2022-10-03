import 'package:deriv/core/exception/index.dart';
import 'package:deriv/data/dto/forget/forget_response_dto.dart';
import 'package:deriv/data/dto/tick/index.dart';
import 'package:deriv/data/mapper/index.dart';
import 'package:deriv/data/sources/index.dart';
import 'package:deriv/data/dto/active-symbols/index.dart';
import 'package:deriv/domain/model/websocket_event.dart';
import 'package:deriv/domain/repository/binary_repository.dart';
import 'package:deriv/core/di/injector_provider.dart';

class BinaryRepositoryImpl extends BinaryRepository {
  final ActiveSymbolsMapper _symbolsMapper = inject<ActiveSymbolsMapper>();
  final ForgetMapper _forgetMapper = inject<ForgetMapper>();
  final TickerMapper _tickerMapper = inject<TickerMapper>();
  final BinaryApiDatasource _apiDatasource = inject<BinaryApiDatasource>();

  @override
  Stream<WebsocketEventModel> subscribe() =>
      _apiDatasource.subscribe().map((event) {
        WebsocketEventModel model;

        if (event is ActiveSymbolsDTO) {
          model = _symbolsMapper.map(event);
        } else if (event is ForgetResponseDTO) {
          model = _forgetMapper.map(event);
        } else if (event is TickDTO) {
          return _tickerMapper.map(event);
        } else {
          throw UnknownTypeException();
        }

        return model;
      });

  @override
  void connect() => _apiDatasource.connect();

  @override
  void getActiveSymbols(String activeSymbols, String productType) {
    _apiDatasource.getActiveSymbols(activeSymbols, productType);
  }

  @override
  void getTick(String ticks, int subscribe) {
    _apiDatasource.getTick(ticks, subscribe);
  }

  @override
  void setForget(String forget) {
    _apiDatasource.setForget(forget);
  }
}