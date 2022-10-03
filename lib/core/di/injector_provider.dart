import 'package:deriv/domain/interactor/binary_interactor.dart';
import 'package:deriv/presentation/mainscreen/main_screen_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:deriv/data/sources/index.dart';
import 'package:deriv/data/repository/binary_repository_impl.dart';
import 'package:deriv/domain/repository/binary_repository.dart';
import 'package:deriv/data/mapper/index.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {
  inject.registerSingleton(ForgetMapper());
  inject.registerSingleton(TickerMapper());
  inject.registerSingleton(ActiveSymbolsMapper());
  inject.registerSingleton(WebsocketEventProcessor());

  inject.registerSingleton<BinaryApiDatasource>(BinaryApiDatasourceImpl());
  inject.registerSingleton<BinaryRepository>(BinaryRepositoryImpl());

  inject.registerSingleton(BinaryInteractor());

  inject.registerSingleton(MainScreenCubit());

}
