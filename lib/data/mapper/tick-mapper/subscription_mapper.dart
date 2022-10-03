import 'package:deriv/core/base/mapper.dart';
import 'package:deriv/data/dto/tick/index.dart';
import 'package:deriv/domain/model/tick/index.dart';

class SubscriptionMapper implements Mapper<SubscriptionDTO, SubscriptionEntity>{
  @override
  SubscriptionEntity map(SubscriptionDTO value) {
     return SubscriptionEntity(value.id);
  }
}