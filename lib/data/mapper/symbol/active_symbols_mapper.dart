import 'package:deriv/core/base/mapper.dart';
import 'package:deriv/data/dto/active-symbols/active_symbols_dto.dart';
import 'package:deriv/domain/model/active_symbol/active_symbols_entity.dart';
import 'symbol_mapper.dart';

class ActiveSymbolsMapper implements Mapper<ActiveSymbolsDTO, ActiveSymbolsEntity> {
  final SymbolMapper _symbolMapper = SymbolMapper();

  @override
  ActiveSymbolsEntity map(ActiveSymbolsDTO item) {
    var symbols = List<SymbolEntity>.empty(growable: true);

    item.activeSymbols?.forEach((element) {
      var symbol = _symbolMapper.map(element);
      symbols.add(symbol);
    });

    return ActiveSymbolsEntity(symbols);
  }
}
