import 'package:equatable/equatable.dart';

import 'index.dart';
import '../websocket_event.dart';

class TickEntity extends Equatable implements WebsocketEventModel {
  final SubscriptionEntity subscription;
  final TickSpotDataEntity tick;

  const TickEntity(this.subscription, this.tick);

  @override
  List<Object> get props => [
        subscription,
        tick,
      ];
}
