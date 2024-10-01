import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_coffeeshop/module/product/product.dart';

part 'cart_product_model.freezed.dart';
part 'cart_product_model.g.dart';

@freezed
class CartProductModel with _$CartProductModel {
  const factory CartProductModel({
    required int total,
    required ProductModel products,
  }) = _CartProductModel;

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);
}
