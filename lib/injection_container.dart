import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app/features/posts/data/data_sources/local_data_source.dart';
import 'package:posts_app/features/posts/data/data_sources/remote_data_source.dart';
import 'package:posts_app/features/posts/data/repositories/post_repository_implementation.dart';
import 'package:posts_app/features/posts/domain/repositories/post_repository.dart';
import 'package:posts_app/features/posts/domain/usecases/add_post_use_case.dart';
import 'package:posts_app/features/posts/domain/usecases/delete_post_use_case.dart';
import 'package:posts_app/features/posts/domain/usecases/get_all_posts_use_case.dart';
import 'package:posts_app/features/posts/domain/usecases/ubdate_post_use_case.dart';
import 'package:posts_app/features/posts/presentation/bloc/add_ubdate_delete_post_bloc/add_ubdate_delete_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/bloc/posts/get_refresh_posts_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_state.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // bloc
  sl.registerFactory(() => GetRefreshPostsBloc(getAllPostsUseCase: sl()));
  sl.registerFactory(() => AddUbdateDeletePostBloc(
      addPostUseCase: sl(), updatePostUseCase: sl(), deletePostUseCase: sl()));
  // Use Cases
  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => AddPostUseCase(sl()));
  sl.registerLazySingleton(() => UbdatePostUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));
  

  // repositories
  sl.registerLazySingleton<PostsRepository>(() => PostRepositoryImplementation(
      isConnectedToInternet: sl(),
      localDataSource: sl(),
      remoteDataSource: sl()));

  // data sources
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplementation(pref: sl()));
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplemntation(client: sl()));
  // core
  sl.registerLazySingleton(() => NetworkStateImplementation(sl()));

  // external packages
  sl.registerLazySingleton(() => InternetConnectionChecker());
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
