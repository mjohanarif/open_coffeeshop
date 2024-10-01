// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyWeatherModel _$DailyWeatherModelFromJson(Map<String, dynamic> json) {
  return _DailyWeatherModel.fromJson(json);
}

/// @nodoc
mixin _$DailyWeatherModel {
  List<DateTime> get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather_code')
  List<int> get weatherCode => throw _privateConstructorUsedError;

  /// Serializes this DailyWeatherModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyWeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyWeatherModelCopyWith<DailyWeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyWeatherModelCopyWith<$Res> {
  factory $DailyWeatherModelCopyWith(
          DailyWeatherModel value, $Res Function(DailyWeatherModel) then) =
      _$DailyWeatherModelCopyWithImpl<$Res, DailyWeatherModel>;
  @useResult
  $Res call(
      {List<DateTime> time,
      @JsonKey(name: 'weather_code') List<int> weatherCode});
}

/// @nodoc
class _$DailyWeatherModelCopyWithImpl<$Res, $Val extends DailyWeatherModel>
    implements $DailyWeatherModelCopyWith<$Res> {
  _$DailyWeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyWeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? weatherCode = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      weatherCode: null == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyWeatherModelImplCopyWith<$Res>
    implements $DailyWeatherModelCopyWith<$Res> {
  factory _$$DailyWeatherModelImplCopyWith(_$DailyWeatherModelImpl value,
          $Res Function(_$DailyWeatherModelImpl) then) =
      __$$DailyWeatherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DateTime> time,
      @JsonKey(name: 'weather_code') List<int> weatherCode});
}

/// @nodoc
class __$$DailyWeatherModelImplCopyWithImpl<$Res>
    extends _$DailyWeatherModelCopyWithImpl<$Res, _$DailyWeatherModelImpl>
    implements _$$DailyWeatherModelImplCopyWith<$Res> {
  __$$DailyWeatherModelImplCopyWithImpl(_$DailyWeatherModelImpl _value,
      $Res Function(_$DailyWeatherModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyWeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? weatherCode = null,
  }) {
    return _then(_$DailyWeatherModelImpl(
      time: null == time
          ? _value._time
          : time // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      weatherCode: null == weatherCode
          ? _value._weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyWeatherModelImpl implements _DailyWeatherModel {
  const _$DailyWeatherModelImpl(
      {required final List<DateTime> time,
      @JsonKey(name: 'weather_code') required final List<int> weatherCode})
      : _time = time,
        _weatherCode = weatherCode;

  factory _$DailyWeatherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyWeatherModelImplFromJson(json);

  final List<DateTime> _time;
  @override
  List<DateTime> get time {
    if (_time is EqualUnmodifiableListView) return _time;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_time);
  }

  final List<int> _weatherCode;
  @override
  @JsonKey(name: 'weather_code')
  List<int> get weatherCode {
    if (_weatherCode is EqualUnmodifiableListView) return _weatherCode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weatherCode);
  }

  @override
  String toString() {
    return 'DailyWeatherModel(time: $time, weatherCode: $weatherCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyWeatherModelImpl &&
            const DeepCollectionEquality().equals(other._time, _time) &&
            const DeepCollectionEquality()
                .equals(other._weatherCode, _weatherCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_time),
      const DeepCollectionEquality().hash(_weatherCode));

  /// Create a copy of DailyWeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyWeatherModelImplCopyWith<_$DailyWeatherModelImpl> get copyWith =>
      __$$DailyWeatherModelImplCopyWithImpl<_$DailyWeatherModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyWeatherModelImplToJson(
      this,
    );
  }
}

abstract class _DailyWeatherModel implements DailyWeatherModel {
  const factory _DailyWeatherModel(
      {required final List<DateTime> time,
      @JsonKey(name: 'weather_code')
      required final List<int> weatherCode}) = _$DailyWeatherModelImpl;

  factory _DailyWeatherModel.fromJson(Map<String, dynamic> json) =
      _$DailyWeatherModelImpl.fromJson;

  @override
  List<DateTime> get time;
  @override
  @JsonKey(name: 'weather_code')
  List<int> get weatherCode;

  /// Create a copy of DailyWeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyWeatherModelImplCopyWith<_$DailyWeatherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
