import 'package:dartz/dartz.dart';
import 'package:open_coffeeshop/module/weather/weather.dart';
import 'package:open_coffeeshop/shared/shared.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherResponse>> getWeatherForecast();
}
