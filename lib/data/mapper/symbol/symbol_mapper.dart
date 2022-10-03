import 'package:deriv/core/base/mapper.dart';
import '../../dto/active-symbols/symbol_dto.dart';
import '../../../domain/model/active_symbol/symbol_entity.dart';

class SymbolMapper implements Mapper<SymbolDTO, SymbolEntity> {
  @override
  SymbolEntity map(SymbolDTO value) {
    return SymbolEntity(
      value.allowForwardStarting! == 1,
      value.displayName!,
      value.exchangeIsOpen! == 1,
      value.isTradingSuspended == 1,
      value.market!,
      value.marketDisplayName!,
      value.pip!,
      value.submarket!,
      value.submarketDisplayName!,
      value.symbol!,
      value.symbolType!
    );
  }
}
