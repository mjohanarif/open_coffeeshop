import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';
import 'package:path_provider/path_provider.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  locator
    // Repository
    ..registerLazySingleton<ProductsRepository>(
      () => ProductRepositoryImpl(
        localDataSource: locator(),
      ),
    )

    // usecase
    ..registerLazySingleton(
      () => GetProductUsecase(
        repository: locator(),
      ),
    )
    ..registerLazySingleton(
      () => SearchProductUsecase(
        repository: locator(),
      ),
    )
    ..registerLazySingleton(
      () => AddProductCartUsecase(
        repository: locator(),
      ),
    )
    ..registerLazySingleton(
      () => SubtractProductCartUsecase(
        repository: locator(),
      ),
    )
    ..registerLazySingleton(
      () => DeleteProductCartUsecase(
        repository: locator(),
      ),
    )

    // data source
    ..registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl(
        cacheHandler: locator(),
      ),
    )

    // BLOC
    ..registerFactory(
      () => GetProductsBloc(locator()),
    )
    ..registerFactory(
      () => SearchProductBloc(locator()),
    )
    ..registerFactory(
      () => CartProductBloc(locator(), locator(), locator()),
    )

    // external
    ..registerLazySingleton(
      () => Dio()
        ..options = BaseOptions(
          baseUrl: Constant.apiUrl,
        )
        ..interceptors.addAll(
          [
            LogInterceptor(
              requestBody: true,
              responseBody: true,
            ),
          ],
        ),
    )
    ..registerLazySingleton(InternetConnectionChecker.new)
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(locator()),
    )
    ..registerLazySingleton(
      () => CacheHandler(
        cache: locator(),
      ),
    )
    ..registerLazySingleton<HiveInterface>(() => Hive);
  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init('${appDocDir.path}/db');
  }
}
