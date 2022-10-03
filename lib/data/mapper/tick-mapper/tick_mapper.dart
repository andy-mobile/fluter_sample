import 'package:deriv/core/base/mapper.dart';
import 'package:deriv/core/exception/index.dart';
import 'package:deriv/data/dto/tick/tick_spot_data_dto.dart';
import 'package:deriv/domain/model/tick/index.dart';

class TickSpotDataMapper implements Mapper<TickSpotDataDTO, TickSpotDataEntity> {
  @override
  TickSpotDataEntity map(TickSpotDataDTO value) {
    TickSpotDataEntity model;
    try {
      model = TickSpotDataEntity(
        double.parse(value.ask!.toString()),
        double.parse(value.bid!.toString()),
        int.parse(value.epoch!.toString()),
        value.id!,
        value.pipSize!,
        double.parse(value.quote!.toString()),
        value.symbol!,
      );
    } catch (exception) {
      throw MapperException(exception);
    }

    return model;
  }
}
