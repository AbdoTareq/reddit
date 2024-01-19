import 'package:get_it/get_it.dart';
import 'package:reddit/export.dart';
import 'package:reddit/features/post/datasource/post_remote_datasource.dart';
import 'package:reddit/features/post/presentation/post_cubit.dart';
import 'package:reddit/features/post/repos/post_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - posts
  // Bloc
  sl.registerLazySingleton<PostCubit>(() => PostCubit(sl<PostRepository>()));

  // Usecases

  // Repository
  sl.registerLazySingleton<PostRepository>(() => PostRepository(sl()));

  // Datasources
  sl.registerLazySingleton<PostRemoteDatasource>(() => PostRemoteDatasource());

  // Core

  // External
  sl.registerLazySingleton(() => GetStorage());
}
