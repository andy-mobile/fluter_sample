import 'package:equatable/equatable.dart';

class SymbolEntity extends Equatable {
  final bool allowForwardStarting;
  final String displayName;
  final bool exchangeIsOpen;
  final bool isTradingSuspended;
  final String market;
  final String marketDisplayName;
  final double pip;
  final String submarket;
  final String submarketDisplayName;
  final String symbol;
  final String symbolType;

  const SymbolEntity(
    this.allowForwardStarting,
    this.displayName,
    this.exchangeIsOpen,
    this.isTradingSuspended,
    this.market,
    this.marketDisplayName,
    this.pip,
    this.submarket,
    this.submarketDisplayName,
    this.symbol,
    this.symbolType,
  );

  @override
  List<Object?> get props => [
        allowForwardStarting,
        displayName,
        exchangeIsOpen,
        isTradingSuspended,
        market,
        marketDisplayName,
        pip,
        submarket,
        submarketDisplayName,
        symbol,
        symbolType,
      ];
}
