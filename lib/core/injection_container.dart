import 'package:flutter_new_template/export.dart';
import 'package:get_it/get_it.dart';

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
