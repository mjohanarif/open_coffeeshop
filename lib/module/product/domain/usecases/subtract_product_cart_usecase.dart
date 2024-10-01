import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class SubtractProductCartUsecase
    implements
        UseCaseFuture<Failure, CartOrderModel, (ProductModel, CartOrderModel)> {
  final ProductsRepository repository;

  SubtractProductCartUsecase({required this.repository});

  @override
  FutureOr<Either<Failure, CartOrderModel>> call(
    (ProductModel, CartOrderModel) params,
  ) {
    return repository.subtractProductCart(params);
  }
}
