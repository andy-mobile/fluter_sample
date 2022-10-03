part of 'main_screen_cubit.dart';

abstract class MainScreenState extends Equatable {
  const MainScreenState();

  @override
  List<Object> get props => [];
}

class MainScreenInitial extends MainScreenState {
  const MainScreenInitial();
}

class MainScreenStateReady extends MainScreenState {
  final List<AssetModel> assets;
  final List<MarketModel> markets;
  final bool hasProgress;
  final double? price;
  final String? subscription;
  final AssetModel? selectedAsset;
  final MarketModel? selectedMarket;
  final Map<MarketModel, List<SymbolEntity>> mapMarketToSymbols;
  final PriceColor priceColor;

  const MainScreenStateReady({
    required this.assets,
    required this.markets,
    required this.hasProgress,
    required this.price,
    required this.subscription,
    required this.selectedAsset,
    required this.selectedMarket,
    required this.mapMarketToSymbols,
    required this.priceColor,
  });

  MainScreenStateReady copyWith({
    List<AssetModel>? assets,
    List<MarketModel>? markets,
    bool? hasProgress,
    double? price,
    String? subscription,
    Map<MarketModel, List<SymbolEntity>>? mapMarketToSymbols,
    PriceColor? priceColor,
    required AssetModel? selectedAsset,
    required MarketModel? selectedMarket,
  }) =>
      MainScreenStateReady(
        assets: assets ?? this.assets,
        markets: markets ?? this.markets,
        hasProgress: hasProgress ?? this.hasProgress,
        price: price ?? this.price,
        priceColor: priceColor ?? this.priceColor,
        subscription: subscription ?? this.subscription,
        selectedAsset: selectedAsset,
        selectedMarket: selectedMarket,
        mapMarketToSymbols: mapMarketToSymbols ?? this.mapMarketToSymbols,
      );

  @override
  List<Object> get props => [
        assets,
        markets,
        hasProgress,
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is MainScreenStateReady &&
          runtimeType == other.runtimeType &&
          assets == other.assets &&
          markets == other.markets &&
          hasProgress == other.hasProgress &&
          price == other.price &&
          subscription == other.subscription &&
          selectedAsset == other.selectedAsset &&
          selectedMarket == other.selectedMarket &&
          mapMarketToSymbols == other.mapMarketToSymbols &&
          priceColor == other.priceColor;

  @override
  int get hashCode =>
      super.hashCode ^
      assets.hashCode ^
      markets.hashCode ^
      hasProgress.hashCode ^
      price.hashCode ^
      subscription.hashCode ^
      selectedAsset.hashCode ^
      selectedMarket.hashCode ^
      mapMarketToSymbols.hashCode ^
      priceColor.hashCode;
}
