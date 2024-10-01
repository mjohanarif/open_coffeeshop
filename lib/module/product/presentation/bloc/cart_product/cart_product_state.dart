part of 'cart_product_bloc.dart';

@freezed
class CartProductState with _$CartProductState {
  const factory CartProductState.initial() = _Initial;
  const factory CartProductState.loading() = _Loading;
  const factory CartProductState.success(CartOrderModel data) = _Success;
}
