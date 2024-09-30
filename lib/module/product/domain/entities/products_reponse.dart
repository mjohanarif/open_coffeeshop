import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_coffeeshop/module/product/domain/entities/product_model.dart';

part 'products_reponse.freezed.dart';
part 'products_reponse.g.dart';

@freezed
class ProductsReponse with _$ProductsReponse {
  const factory ProductsReponse({
    required String status,
    required List<ProductModel> data,
  }) = _ProductsReponse;

  factory ProductsReponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsReponseFromJson(json);
}
