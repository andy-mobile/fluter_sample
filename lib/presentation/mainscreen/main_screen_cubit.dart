import 'dart:collection';

import 'package:deriv/core/base/collections.dart';
import 'package:deriv/core/di/injector_provider.dart';
import 'package:deriv/domain/interactor/binary_interactor.dart';
import 'package:deriv/domain/model/forget/forget_entity.dart';
import 'package:deriv/domain/model/tick/index.dart';
import 'package:deriv/domain/model/websocket_event.dart';
import 'package:deriv/presentation/mainscreen/models/asset_model_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/model/active_symbol/active_symbols_entity.dart';
import 'models/market_model_ui.dart';
import 'models/price_color.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(const MainScreenInitial());

  final _interactor = inject<BinaryInteractor>();

  void onInit() {
    _interactor.connect();

    _interactor.subscribe().listen((event) {
      proceedEvent(event);
    }, onError: (exception) async {
      print("onError ${exception}");
    }, onDone: () async {
      print("onDone");
    });

    _interactor.getActiveSymbols("brief", "basic");
  }

  void onAssetChanged(AssetModel? value) {
    var currentState = state as MainScreenStateReady;

    if (currentState.selectedAsset == value) return;

    if (currentState.subscription != null) {
      _interactor.setForget(currentState.subscription!);
    }

    var newState = currentState.copyWith(
      selectedAsset: value,
      selectedMarket: currentState.selectedMarket,
      hasProgress: true,
      price: null,
    );
    emit(newState);

    _interactor.getTick(value!.symbolId, 1);
  }

  void onMarketChanged(MarketModel? value) {
    var currentState = state as MainScreenStateReady;
    if (currentState.selectedMarket == value) return;

    if (currentState.subscription != null) {
      _interactor.setForget(currentState.subscription!);
    }

    var newState = currentMarketOnStateMapper(value!, currentState);
    emit(newState);
  }

  void proceedEvent(WebsocketEventModel event) {
    MainScreenStateReady? newState;
    if (event is ActiveSymbolsEntity) {
      newState = activeSymbolsModelToStateMapper(event);
    } else if (event is TickEntity) {
      newState = tickerToStateMapper(event);
    } else if (event is ForgetEntity) {}

    if (newState != null) {
      emit(newState);
    }
  }


  MainScreenStateReady tickerToStateMapper(TickEntity event) {
    // Sorry. I didn`t get what is mean :Text: Shows the current price. The default colour is grey. It changes to red if the price goes down and green if it goes up. The text colour goes back to grey if the price is unchanged.
    // So it just test and I make it like this
    var currentState = (state as MainScreenStateReady);
    var previousPrice = currentState.price;
    double newPrice = event.tick.quote;

    PriceColor priceColor;
    if (previousPrice == null) {
      priceColor = PriceColor.gray;
    } else if (newPrice == previousPrice) {
      priceColor = PriceColor.gray;
    } else if (previousPrice > newPrice) {
      priceColor = PriceColor.red;
    } else {
      priceColor = PriceColor.green;
    }

    return currentState.copyWith(
      selectedAsset: currentState.selectedAsset,
      selectedMarket: currentState.selectedMarket,
      subscription: event.subscription.id,
      hasProgress: false,
      priceColor: priceColor,
      price: event.tick.quote,
    );
  }

  MainScreenStateReady currentMarketOnStateMapper(
    MarketModel market,
    MainScreenStateReady currentState,
  ) {
    var symbols = currentState.mapMarketToSymbols[market] ?? List.empty();

    var assets = symbols.map((symbol) => AssetModel(
          symbol.displayName,
          symbol.symbol,
        ));

    return currentState.copyWith(
      selectedAsset: null,
      selectedMarket: market,
      assets: [...assets],
      price: null,
    );
  }

  MainScreenStateReady activeSymbolsModelToStateMapper(
      ActiveSymbolsEntity model) {
    var mapMarketToSymbols = model.activeSymbols
        .where((element) => element.exchangeIsOpen)
        .groupBy((value) => MarketModel(
              value.marketDisplayName,
              value.market,
            ));

    return MainScreenStateReady(
      assets: List.empty(),
      markets: [...mapMarketToSymbols.keys],
      hasProgress: false,
      price: null,
      priceColor: PriceColor.gray,
      subscription: null,
      mapMarketToSymbols: mapMarketToSymbols,
      selectedAsset: null,
      selectedMarket: null,
    );
  }
}
