import 'package:deriv/core/base/mapper.dart';
import 'package:deriv/core/exception/index.dart';
import 'package:deriv/data/dto/tick/index.dart';
import 'package:deriv/data/mapper/index.dart';
import 'package:deriv/domain/model/tick/index.dart';

class TickerMapper implements Mapper<TickDTO, TickEntity> {
  final SubscriptionMapper _subscriptionMapper = SubscriptionMapper();
  final TickSpotDataMapper _tickMapper = TickSpotDataMapper();

  @override
  TickEntity map(TickDTO value) {
    TickEntity model;

    try {
      var subscription = _subscriptionMapper.map(value.subscription!);
      var tick = _tickMapper.map(value.tick!);
      model = TickEntity(subscription, tick);
    } catch (exception) {
      throw MapperException(exception);
    }

    return model;
  }
}
