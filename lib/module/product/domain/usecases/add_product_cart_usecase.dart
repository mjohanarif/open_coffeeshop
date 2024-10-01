import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class AddProductCartUsecase
    implements
        UseCaseFuture<Failure, CartOrderModel, (ProductModel, CartOrderModel)> {
  final ProductsRepository repository;

  AddProductCartUsecase({required this.repository});

  @override
  FutureOr<Either<Failure, CartOrderModel>> call(
    (ProductModel, CartOrderModel) params,
  ) {
    return repository.addProductCart(params);
  }
}
