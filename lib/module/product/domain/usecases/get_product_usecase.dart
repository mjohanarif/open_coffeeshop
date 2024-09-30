import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class GetProductUsecase
    implements UseCaseFuture<Failure, ProductsReponse, void> {
  final ProductsRepository repository;

  GetProductUsecase({required this.repository});

  @override
  FutureOr<Either<Failure, ProductsReponse>> call(void params) {
    return repository.getProducts();
  }
}
