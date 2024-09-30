import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class SearchProductUsecase
    implements UseCaseFuture<Failure, ProductsReponse, String> {
  final ProductsRepository repository;

  SearchProductUsecase({required this.repository});

  @override
  FutureOr<Either<Failure, ProductsReponse>> call(String params) {
    return repository.searchProducts(params);
  }
}
