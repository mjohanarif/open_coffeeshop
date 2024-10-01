import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_coffeeshop/module/product/domain/entities/cart_product_model.dart';

part 'cart_order_model.freezed.dart';
part 'cart_order_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CartOrderModel with _$CartOrderModel {
  const CartOrderModel._();

  const factory CartOrderModel({
    required List<CartProductModel> cartList,
  }) = _CartOrderModel;

  factory CartOrderModel.fromJson(Map<String, dynamic> json) =>
      _$CartOrderModelFromJson(json);

  int totalCart() {
    var total = 0;
    for (var element in cartList) {
      total += element.total;
    }
    return total;
  }

  int totalPriceCart() {
    int total = 0;
    for (var element in cartList) {
      total += (element.products.price * element.total);
    }
    return total;
  }
}
