// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartOrderModel _$CartOrderModelFromJson(Map<String, dynamic> json) {
  return _CartOrderModel.fromJson(json);
}

/// @nodoc
mixin _$CartOrderModel {
  List<CartProductModel> get cartList => throw _privateConstructorUsedError;

  /// Serializes this CartOrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartOrderModelCopyWith<CartOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartOrderModelCopyWith<$Res> {
  factory $CartOrderModelCopyWith(
          CartOrderModel value, $Res Function(CartOrderModel) then) =
      _$CartOrderModelCopyWithImpl<$Res, CartOrderModel>;
  @useResult
  $Res call({List<CartProductModel> cartList});
}

/// @nodoc
class _$CartOrderModelCopyWithImpl<$Res, $Val extends CartOrderModel>
    implements $CartOrderModelCopyWith<$Res> {
  _$CartOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartList = null,
  }) {
    return _then(_value.copyWith(
      cartList: null == cartList
          ? _value.cartList
          : cartList // ignore: cast_nullable_to_non_nullable
              as List<CartProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartOrderModelImplCopyWith<$Res>
    implements $CartOrderModelCopyWith<$Res> {
  factory _$$CartOrderModelImplCopyWith(_$CartOrderModelImpl value,
          $Res Function(_$CartOrderModelImpl) then) =
      __$$CartOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CartProductModel> cartList});
}

/// @nodoc
class __$$CartOrderModelImplCopyWithImpl<$Res>
    extends _$CartOrderModelCopyWithImpl<$Res, _$CartOrderModelImpl>
    implements _$$CartOrderModelImplCopyWith<$Res> {
  __$$CartOrderModelImplCopyWithImpl(
      _$CartOrderModelImpl _value, $Res Function(_$CartOrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartList = null,
  }) {
    return _then(_$CartOrderModelImpl(
      cartList: null == cartList
          ? _value.cartList
          : cartList // ignore: cast_nullable_to_non_nullable
              as List<CartProductModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartOrderModelImpl extends _CartOrderModel {
  const _$CartOrderModelImpl({required this.cartList}) : super._();

  factory _$CartOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartOrderModelImplFromJson(json);

  @override
  final List<CartProductModel> cartList;

  @override
  String toString() {
    return 'CartOrderModel(cartList: $cartList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartOrderModelImpl &&
            const DeepCollectionEquality().equals(other.cartList, cartList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(cartList));

  /// Create a copy of CartOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartOrderModelImplCopyWith<_$CartOrderModelImpl> get copyWith =>
      __$$CartOrderModelImplCopyWithImpl<_$CartOrderModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartOrderModelImplToJson(
      this,
    );
  }
}

abstract class _CartOrderModel extends CartOrderModel {
  const factory _CartOrderModel(
      {required final List<CartProductModel> cartList}) = _$CartOrderModelImpl;
  const _CartOrderModel._() : super._();

  factory _CartOrderModel.fromJson(Map<String, dynamic> json) =
      _$CartOrderModelImpl.fromJson;

  @override
  List<CartProductModel> get cartList;

  /// Create a copy of CartOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartOrderModelImplCopyWith<_$CartOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
