import 'package:get_it/get_it.dart';
import 'package:reddit/export.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - posts
  // Bloc

  // Usecases

  // Repository

  // Datasources

  //! Core

  //! External
  sl.registerLazySingleton(() => GetStorage());
}
