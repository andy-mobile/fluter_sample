import 'package:equatable/equatable.dart';
import '../websocket_event.dart';

class SubscriptionEntity extends Equatable implements WebsocketEventModel {
  final String id;

  const SubscriptionEntity(this.id);

  @override
  List<Object> get props => [id];
}
