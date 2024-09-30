// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductsReponseImpl _$$ProductsReponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductsReponseImpl(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductsReponseImplToJson(
        _$ProductsReponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
