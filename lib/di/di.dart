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
import 'package:sultan_mebel/future/login/data/datasource/lodin_remote_datasouce.dart';
import 'package:sultan_mebel/future/login/data/repositories/login_repositories_impl.dart';
import 'package:sultan_mebel/future/login/domain/repositories/login_repositories.dart';
import 'package:sultan_mebel/future/login/presentation/bloc/login_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  // Blocs
  di.registerFactory(
    () => HomeBloc(
      repository: di(),
    ),
  );
  di.registerFactory(
    () => LoginBloc(
      repository: di(),
    ),
  );

  // Repositories
  di.registerFactory<CategoryRepository>(
    () => CategoryRepositoriesImpl(
      categoryRemoteDataSourceImpl: di(),
      networkInfo: di(),
    ),
  );
  di.registerFactory<LoginRepository>(
    () => LoginRepositoryImpl(
      remoteDataSourceImpl: di(),
      networkInfo: di(),
    ),
  );

  // Datasources
  di.registerLazySingleton<CategoryRemoteDataSourceImpl>(
    () => CategoryRemoteDataSourceImpl(
      dio: di(),
    ),
  );
  di.registerLazySingleton<LoginRemoteDataSourceImpl>(
    () => LoginRemoteDataSourceImpl(
      dio: di(),
    ),
  );

  // Netqork Opstions
  final options = BaseOptions(
      baseUrl: 'https://www.youtube.com/',
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        // 'Content-Type': 'application/x-www-form-urlencoded',
        'accept': 'application/json'
      });

  Dio dio = Dio(options);

  // dio.interceptors.add();

  di.registerSingleton<Dio>(dio);

  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));

  // Network Info
  di.registerLazySingleton(() => InternetConnectionChecker());
  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));

  // Local Data Managment cache
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);

  // Local data management
}
