// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyWeatherModelImpl _$$DailyWeatherModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyWeatherModelImpl(
      time: (json['time'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      weatherCode: (json['weather_code'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$DailyWeatherModelImplToJson(
        _$DailyWeatherModelImpl instance) =>
    <String, dynamic>{
      'time': instance.time.map((e) => e.toIso8601String()).toList(),
      'weather_code': instance.weatherCode,
    };
