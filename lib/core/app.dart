import 'package:deriv/presentation/mainscreen/main_screen_cubit.dart';
import 'package:deriv/presentation/mainscreen/main_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:deriv/core/di/injector_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deriv/core/values/colors.dart' as colors;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: colors.primaryColor,
        primaryColorDark: colors.primaryColorDark,
        accentColor: colors.accentColor,
      ),
      home: BlocProvider(
        create: (_) => inject<MainScreenCubit>(),
        child: const MainScreenWidget(title: 'Price Tracker'),
      ),
    );
  }
}
