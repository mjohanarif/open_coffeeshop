import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_coffeeshop/module/weather/domain/entities/daily_weather_model.dart';

part 'weather_response.freezed.dart';
part 'weather_response.g.dart';

@freezed
class WeatherResponse with _$WeatherResponse {
  const factory WeatherResponse({
    required String timezone,
    required DailyWeatherModel daily,
  }) = _WeatherResponse;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
