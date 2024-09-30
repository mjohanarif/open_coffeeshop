// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_reponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductsReponse _$ProductsReponseFromJson(Map<String, dynamic> json) {
  return _ProductsReponse.fromJson(json);
}

/// @nodoc
mixin _$ProductsReponse {
  String get status => throw _privateConstructorUsedError;
  List<ProductModel> get data => throw _privateConstructorUsedError;

  /// Serializes this ProductsReponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductsReponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductsReponseCopyWith<ProductsReponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsReponseCopyWith<$Res> {
  factory $ProductsReponseCopyWith(
          ProductsReponse value, $Res Function(ProductsReponse) then) =
      _$ProductsReponseCopyWithImpl<$Res, ProductsReponse>;
  @useResult
  $Res call({String status, List<ProductModel> data});
}

/// @nodoc
class _$ProductsReponseCopyWithImpl<$Res, $Val extends ProductsReponse>
    implements $ProductsReponseCopyWith<$Res> {
  _$ProductsReponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsReponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsReponseImplCopyWith<$Res>
    implements $ProductsReponseCopyWith<$Res> {
  factory _$$ProductsReponseImplCopyWith(_$ProductsReponseImpl value,
          $Res Function(_$ProductsReponseImpl) then) =
      __$$ProductsReponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, List<ProductModel> data});
}

/// @nodoc
class __$$ProductsReponseImplCopyWithImpl<$Res>
    extends _$ProductsReponseCopyWithImpl<$Res, _$ProductsReponseImpl>
    implements _$$ProductsReponseImplCopyWith<$Res> {
  __$$ProductsReponseImplCopyWithImpl(
      _$ProductsReponseImpl _value, $Res Function(_$ProductsReponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsReponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$ProductsReponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductsReponseImpl implements _ProductsReponse {
  const _$ProductsReponseImpl(
      {required this.status, required final List<ProductModel> data})
      : _data = data;

  factory _$ProductsReponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsReponseImplFromJson(json);

  @override
  final String status;
  final List<ProductModel> _data;
  @override
  List<ProductModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ProductsReponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsReponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ProductsReponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsReponseImplCopyWith<_$ProductsReponseImpl> get copyWith =>
      __$$ProductsReponseImplCopyWithImpl<_$ProductsReponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsReponseImplToJson(
      this,
    );
  }
}

abstract class _ProductsReponse implements ProductsReponse {
  const factory _ProductsReponse(
      {required final String status,
      required final List<ProductModel> data}) = _$ProductsReponseImpl;

  factory _ProductsReponse.fromJson(Map<String, dynamic> json) =
      _$ProductsReponseImpl.fromJson;

  @override
  String get status;
  @override
  List<ProductModel> get data;

  /// Create a copy of ProductsReponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsReponseImplCopyWith<_$ProductsReponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
