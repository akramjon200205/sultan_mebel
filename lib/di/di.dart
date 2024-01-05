import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sultan_mebel/core/platform/network_info.dart';
import 'package:sultan_mebel/core/platform/pretty_dio_logger.dart';
import 'package:sultan_mebel/future/home/data/datasourses/ramote_datasource/category_remote_datasource.dart';
import 'package:sultan_mebel/future/home/data/repositories/category_repositories_impl.dart';
import 'package:sultan_mebel/future/home/domain/repositories/category_repositories.dart';
import 'package:sultan_mebel/future/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(
    () => HomeBloc(
      repository: sl(),
    ),
  );

  // Repositories
  sl.registerFactory<CategoryRepository>(
    () => CategoryRepositoriesImpl(
      categoryRemoteDataSourceImpl: sl(),
      networkInfo: sl(),
    ),
  );

  // Datasources
  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(
      dio: sl(),
    ),
  );

  // Netqork Opstions
  final options = BaseOptions(
      baseUrl: 'https://mebel-x8oi.onrender.com/',
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        // 'Content-Type': 'application/x-www-form-urlencoded',
        'accept': 'application/json'
      });

  Dio dio = Dio(options);

  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));

  // Network Info
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Local Data Managment cache
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Local data management
}
