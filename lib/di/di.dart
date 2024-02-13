import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sultan_mebel/core/platform/network_info.dart';
import 'package:sultan_mebel/core/platform/pretty_dio_logger.dart';
import 'package:sultan_mebel/future/client/data/data_source/remote_datasource/client_remote_datasource.dart';
import 'package:sultan_mebel/future/client/data/repositories/client_repositories_impl.dart';
import 'package:sultan_mebel/future/client/domain/repositories/client_repositories.dart';
import 'package:sultan_mebel/future/client/presentation/bloc/client_bloc.dart';
import 'package:sultan_mebel/future/clients_page/data/data_source/clients_remote_data_source.dart';
import 'package:sultan_mebel/future/clients_page/data/repositories/clients_repositories_impl.dart';
import 'package:sultan_mebel/future/clients_page/domain/repositories/clients_repositories.dart';
import 'package:sultan_mebel/future/clients_page/presentation/bloc/clients_bloc_bloc.dart';
import 'package:sultan_mebel/future/home/data/datasourses/ramote_datasource/category_remote_datasource.dart';
import 'package:sultan_mebel/future/home/data/repositories/category_repositories_impl.dart';
import 'package:sultan_mebel/future/home/domain/repositories/category_repositories.dart';
import 'package:sultan_mebel/future/home/presentation/bloc/home_bloc.dart';
import 'package:sultan_mebel/future/login/data/datasource/lodin_remote_datasouce.dart';
import 'package:sultan_mebel/future/login/data/repositories/login_repositories_impl.dart';
import 'package:sultan_mebel/future/login/domain/repositories/login_repositories.dart';
import 'package:sultan_mebel/future/login/presentation/bloc/login_bloc.dart';
import 'package:sultan_mebel/future/product/data/datasource/remote_datasource/product_remote_datasource.dart';
import 'package:sultan_mebel/future/product/data/repositories_impl/product_repository_impl.dart';
import 'package:sultan_mebel/future/product/domain/repositories/product_repository.dart';
import 'package:sultan_mebel/future/product/presentation/bloc/product_bloc.dart';
import 'package:sultan_mebel/future/products/data/datasource/products_remote_datasource.dart';
import 'package:sultan_mebel/future/products/data/datasource/warehouse_remote_datasurce.dart';
import 'package:sultan_mebel/future/products/data/repositories/products_repositories_impl.dart';
import 'package:sultan_mebel/future/products/data/repositories/warehouse_repositories_impl.dart';
import 'package:sultan_mebel/future/products/domain/repositories/products_repositories.dart';
import 'package:sultan_mebel/future/products/domain/repositories/warehouse_repositories.dart';
import 'package:sultan_mebel/future/products/presentation/bloc/warehouse_bloc/warehouse_bloc.dart';

import '../future/products/presentation/bloc/products/products_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  // Blocs
  di.registerFactory(
    () => HomeBloc(repository: di()),
  );
  di.registerFactory(
    () => LoginBloc(repository: di()),
  );
  di.registerFactory(
    () => ProductsBloc(repository: di()),
  );
  di.registerFactory(
    () => WarehouseBloc(repository: di()),
  );
  di.registerFactory(
    () => ProductBloc(
      repository: di(),
    ),
  );
  di.registerFactory(
    () => ClientsBloc(
      repository: di(),
    ),
  );
  di.registerFactory(
    () => ClientBloc(
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
  di.registerFactory<ProductsRepositories>(
    () => ProductRepositoriesImpl(
      productRemoteDataSouceImpl: di(),
      networkInfo: di(),
    ),
  );
  di.registerFactory<WarehouseRepository>(
    () => WarehouseRepositoriesImpl(
      wareHouseRemoteDataSourceImpl: di(),
      networkInfo: di(),
    ),
  );
  di.registerFactory<ProductRepository>(
    () => ProductRepositoryImpl(
      productRemoteDatasource: di(),
      networkInfo: di(),
    ),
  );
  di.registerFactory<ClientsRepositories>(
    () => ClientsRepositoriesImpl(
      clientsRemoteDataSourceImpl: di(),
      networkInfo: di(),
    ),
  );
  di.registerFactory<ClientRepositories>(
    () => ClientRepositoriesImpl(
      clientRemoteDataSourceImpl: di(),
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
  di.registerLazySingleton<ProductsRemoteDataSourceImpl>(
    () => ProductsRemoteDataSourceImpl(
      dio: di(),
    ),
  );
  di.registerLazySingleton<WareHouseRemoteDataSourceImpl>(
    () => WareHouseRemoteDataSourceImpl(
      dio: di(),
    ),
  );
  di.registerLazySingleton<ProductRemoteDatasourceImpl>(
    () => ProductRemoteDatasourceImpl(
      dio: di(),
    ),
  );
  di.registerLazySingleton<ClientsRemoteDataSourceImpl>(
    () => ClientsRemoteDataSourceImpl(
      dio: di(),
    ),
  );
  di.registerLazySingleton<ClientRemoteDataSourceImpl>(
    () => ClientRemoteDataSourceImpl(
      dio: di(),
    ),
  );

  // Netqork Opstions
  final options = BaseOptions(
      baseUrl: 'https://mebel-x8oi.onrender.com/',
      // baseUrl: 'https://karimjonofficial.pythonanywhere.com/',
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
