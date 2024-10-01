// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartOrderModelImpl _$$CartOrderModelImplFromJson(Map<String, dynamic> json) =>
    _$CartOrderModelImpl(
      cartList: (json['cartList'] as List<dynamic>)
          .map((e) => CartProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartOrderModelImplToJson(
        _$CartOrderModelImpl instance) =>
    <String, dynamic>{
      'cartList': instance.cartList,
    };
