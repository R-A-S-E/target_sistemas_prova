import 'package:get_it/get_it.dart';
import 'package:target_sistemas_prova/src/modules/home/data/datasourcers/home_datasource.dart';
import 'package:target_sistemas_prova/src/modules/home/data/repositories/home_repository_impl.dart';
import 'package:target_sistemas_prova/src/modules/home/domain/repositories/home_repository.dart';
import 'package:target_sistemas_prova/src/modules/home/presentation/controller/home_controller.dart';
import 'package:target_sistemas_prova/src/modules/login/data/datasourcers/login_datasource.dart';
import 'package:target_sistemas_prova/src/modules/login/data/repositories/login_repository_impl.dart';
import 'package:target_sistemas_prova/src/modules/login/domain/repositories/login_repository.dart';
import 'package:target_sistemas_prova/src/modules/login/presentation/controller/login_controller.dart';

GetIt di = GetIt.I;

void registerDependencies() {
  ///DATASOURCE
  di.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());
  di.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());

  ///REPOSITORY

  di.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(di.get()));
  di.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(di.get()));

  ///CONTROLLER

  di.registerLazySingleton<LoginController>(() => LoginController(di.get()));
  di.registerLazySingleton<HomeController>(() => HomeController(di.get()));
}
