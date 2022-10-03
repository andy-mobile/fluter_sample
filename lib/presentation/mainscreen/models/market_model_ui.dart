import 'package:equatable/equatable.dart';

class MarketModel extends Equatable {
  final String marketName;
  final String marketId;

  const MarketModel(
    this.marketName,
    this.marketId,
  );

  @override
  List<Object?> get props => [
        marketName,
        marketId,
      ];
}
