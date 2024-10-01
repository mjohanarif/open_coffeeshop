part of 'get_weather_forecast_bloc.dart';

@freezed
class GetWeatherForecastState with _$GetWeatherForecastState {
  const factory GetWeatherForecastState.initial() = _Initial;
  const factory GetWeatherForecastState.loading() = _Loading;
  const factory GetWeatherForecastState.success(WeatherResponse data) =
      _Success;
  const factory GetWeatherForecastState.error(String message) = _Error;
}
