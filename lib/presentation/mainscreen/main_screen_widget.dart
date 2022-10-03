import 'package:deriv/core/di/injector_provider.dart';
import 'package:deriv/presentation/mainscreen/main_screen_cubit.dart';
import 'package:deriv/presentation/mainscreen/models/asset_model_ui.dart';
import 'package:deriv/presentation/mainscreen/models/market_model_ui.dart';
import 'package:deriv/presentation/mainscreen/models/price_color.dart';
import 'package:deriv/presentation/widgets/loading_widget.dart';
import 'package:deriv/presentation/widgets/start_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenWidget extends StatefulWidget {
  final String title;

  const MainScreenWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenWidget();
}

class _MainScreenWidget extends State<MainScreenWidget> {
  final mainScreenCubit = inject<MainScreenCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        Widget childWidget;
        if (state is MainScreenInitial) {
          mainScreenCubit.onInit();
          childWidget = const StartLoadingWidget();
        } else if (state is MainScreenStateReady) {
          childWidget = buildMainScreen(context, state);
        } else {
          childWidget = Container();
        }
        return Container(
          color: Colors.white70,
          child: childWidget,
        );
      },
    ));
  }

  Widget buildMainScreen(
    BuildContext context,
    MainScreenStateReady state,
  ) {
    Widget priceWidget;

    if (state.hasProgress) {
      priceWidget = LoadingWidget();
    } else {
      priceWidget = buildPriceWidget(state);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
              alignment: AlignmentDirectional.center,
              child: buildMarketsDropDownMenu(context, state),
            ),
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
              alignment: AlignmentDirectional.center,
              // color: Colors.green,
              child: buildAssetsDropDownMenu(context, state),
            ),
            FittedBox(
              // padding: EdgeInsets.only(top: 10.0),
              fit: BoxFit.fill,
              child: Container(
                margin: const EdgeInsets.all(20.0),
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(40.0),
                child: priceWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPriceWidget(final MainScreenStateReady state) {
    var text = state.price != null ? "Price ${state.price}" : "";
    return Text(
      text,
      style: TextStyle(
        color: state.priceColor.value,
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget buildMarketsDropDownMenu(
    BuildContext context,
    MainScreenStateReady state,
  ) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white60,
      ),
      dropdownColor: Colors.white,
      elevation: 4,
      style: const TextStyle(color: Colors.black87, fontSize: 14),
      hint: const Text("Select Market"),
      //we can use from state-it depend of localization
      value: state.selectedMarket,
      items: dropdownMarketItems(state),
      onChanged: (MarketModel? newValue) {
        mainScreenCubit.onMarketChanged(newValue);
      },
    );
  }

  List<DropdownMenuItem<MarketModel>> dropdownMarketItems(
    MainScreenStateReady state,
  ) {
    var items = state.markets.map(
      (item) => DropdownMenuItem(
        value: item,
        child: Text(item.marketName),
      ),
    );
    List<DropdownMenuItem<MarketModel>> menuItems = [...items];
    return menuItems;
  }

  Widget buildAssetsDropDownMenu(
    BuildContext context,
    MainScreenStateReady state,
  ) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
      ),
      dropdownColor: Colors.white,
      elevation: 4,
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 14,
      ),
      hint: const Text("Select Asset"),
      //we can use from state-it depend of localization
      value: state.selectedAsset,
      items: dropdownAssetItems(state),
      onChanged: (AssetModel? newValue) {
        mainScreenCubit.onAssetChanged(newValue);
      },
    );
  }

  List<DropdownMenuItem<AssetModel>> dropdownAssetItems(
    MainScreenStateReady state,
  ) {
    var items = state.assets.map(
      (item) => DropdownMenuItem(
        value: item,
        child: Text(item.displayName),
      ),
    );
    List<DropdownMenuItem<AssetModel>> menuItems = [...items];
    return menuItems;
  }
}
