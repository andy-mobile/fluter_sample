import '../websocket_event_dto.dart';

class SymbolDTO implements WebsocketEventDTO {
  final int? allowForwardStarting;
  final String? displayName;
  final int? exchangeIsOpen;
  final int? isTradingSuspended;
  final String? market;
  final String? marketDisplayName;
  final double? pip;
  final String? submarket;
  final String? submarketDisplayName;
  final String? symbol;
  final String? symbolType;

  SymbolDTO(
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

  SymbolDTO.fromJson(Map<String, dynamic> json)
      : allowForwardStarting = json['allow_forward_starting'],
        displayName = json['display_name'],
        exchangeIsOpen = json['exchange_is_open'],
        isTradingSuspended = json['is_trading_suspended'],
        market = json['market'],
        marketDisplayName = json['market_display_name'],
        pip = json['pip'],
        submarket = json['submarket'],
        submarketDisplayName = json['submarket_display_name'],
        symbol = json['symbol'],
        symbolType = json['symbol_type'];

  Map<String, dynamic> toJson() => {
        'allow_forward_starting': allowForwardStarting,
        'display_name': displayName,
        'exchange_is_open': exchangeIsOpen,
        'is_trading_suspended': isTradingSuspended,
        'market': market,
        'market_display_name': marketDisplayName,
        'pip': pip,
        'submarket': submarket,
        'submarket_display_name': submarketDisplayName,
        'symbol': symbol,
        'symbol_type': symbolType,
      };
}
