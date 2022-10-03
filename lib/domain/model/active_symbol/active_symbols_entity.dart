import 'package:equatable/equatable.dart';

import 'symbol_entity.dart';
import '../websocket_event.dart';
export 'symbol_entity.dart';

class ActiveSymbolsEntity extends Equatable implements WebsocketEventModel {
  final List<SymbolEntity> activeSymbols;

  const ActiveSymbolsEntity(this.activeSymbols);

  @override
  List<Object> get props => [activeSymbols];
}
