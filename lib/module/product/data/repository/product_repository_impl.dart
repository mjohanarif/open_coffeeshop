import 'package:dartz/dartz.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class ProductRepositoryImpl implements ProductsRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, ProductsReponse>> getProducts() async {
    if (await localDataSource.isDataSavedLocally()) {
      return await getProductsLocal();
    } else {
      try {
        final result = await localDataSource.getDataProducts();

        localDataSource.saveProducts(result);
        return Right(result);
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, ProductsReponse>> getProductsLocal() async {
    try {
      final result = await localDataSource.getlocalProducts();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, ProductsReponse>> searchProducts(String query) async {
    try {
      final result = await localDataSource.searchProducts(query);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, CartOrderModel>> addProductCart(
    (ProductModel, CartOrderModel) params,
  ) async {
    final result = await localDataSource.addProductCart(params);

    return Right(result);
  }

  @override
  Future<Either<Failure, CartOrderModel>> subtractProductCart(
    (ProductModel, CartOrderModel) params,
  ) async {
    final result = await localDataSource.subtractProductCart(params);

    return Right(result);
  }

  @override
  Future<Either<Failure, CartOrderModel>> deleteProductCart(
    (ProductModel, CartOrderModel) params,
  ) async {
    final result = await localDataSource.deleteProductCart(params);

    return Right(result);
  }
}
