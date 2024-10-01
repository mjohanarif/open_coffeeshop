part of 'cart_product_bloc.dart';

@freezed
class CartProductEvent with _$CartProductEvent {
  const factory CartProductEvent.started() = _Started;
  const factory CartProductEvent.addProduct(ProductModel product) = _AddProduct;
  const factory CartProductEvent.subtractProduct(ProductModel product) =
      _SubtractProduct;
  const factory CartProductEvent.deleteProduct(ProductModel product) =
      _DeleteProduct;
}
