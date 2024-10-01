import 'dart:convert';

import 'package:open_coffeeshop/module/weather/weather.dart';
import 'package:open_coffeeshop/shared/shared.dart';

abstract class WeatherLocalDataSource {
  Future<WeatherResponse> getWeatherForecast();
  Future<String> saveWeatherForecast(WeatherResponse weather);
  Future<bool> isDataTomorrowSaved();
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final CacheHandler cacheHandler;

  WeatherLocalDataSourceImpl({required this.cacheHandler});

  @override
  Future<WeatherResponse> getWeatherForecast() async {
    try {
      final result = await cacheHandler.getCache(
        boxKey: Constant.weatherKey,
      );

      if (result == null) {
        throw CacheException(message: "Can't get Weather Forecast data");
      }

      return WeatherResponse.fromJson(jsonDecode(result));
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }

  @override
  Future<String> saveWeatherForecast(WeatherResponse weather) async {
    try {
      final result = await cacheHandler.setCache(
        boxKey: Constant.weatherKey,
        value: jsonEncode(weather.toJson()),
      );

      if (result == null) {
        throw CacheException(message: "Can't save weathers data");
      }

      return 'Success saving weather';
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }

  @override
  Future<bool> isDataTomorrowSaved() async {
    try {
      if (await cacheHandler.cache.boxExists(Constant.weatherKey)) {
        final result = await cacheHandler.getCache(
          boxKey: Constant.weatherKey,
        );
        final weatherData = WeatherResponse.fromJson(jsonDecode(result));
        return (weatherData.daily.time.last.isAfter(DateTime.now()))
            ? true
            : false;
      } else {
        return false;
      }
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }
}
