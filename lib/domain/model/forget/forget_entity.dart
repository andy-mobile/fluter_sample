import 'package:equatable/equatable.dart';
import '../websocket_event.dart';

class ForgetEntity extends Equatable implements WebsocketEventModel {
  final int forget;

  const ForgetEntity(this.forget);

  @override
  List<Object?> get props => [
        forget,
      ];
}
