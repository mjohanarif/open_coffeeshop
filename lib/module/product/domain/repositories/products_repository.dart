import 'package:dartz/dartz.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

abstract class ProductsRepository {
  Future<Either<Failure, ProductsReponse>> getProducts();
  Future<Either<Failure, ProductsReponse>> getProductsLocal();
  Future<Either<Failure, ProductsReponse>> searchProducts(String query);
  Future<Either<Failure, CartOrderModel>> addProductCart(
      (ProductModel, CartOrderModel) params);
  Future<Either<Failure, CartOrderModel>> subtractProductCart(
      (ProductModel, CartOrderModel) params);
  Future<Either<Failure, CartOrderModel>> deleteProductCart(
      (ProductModel, CartOrderModel) params);
}
