import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_weather_model.freezed.dart';
part 'daily_weather_model.g.dart';

@freezed
class DailyWeatherModel with _$DailyWeatherModel {
  const factory DailyWeatherModel({
    required List<DateTime> time,
    @JsonKey(name: 'weather_code') required List<int> weatherCode,
  }) = _DailyWeatherModel;

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherModelFromJson(json);
}
