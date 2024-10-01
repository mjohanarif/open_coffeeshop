import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:open_coffeeshop/module/weather/weather.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class GetWeatherForecastUsecase
    implements UseCaseFuture<Failure, WeatherResponse, void> {
  final WeatherRepository repository;

  GetWeatherForecastUsecase({required this.repository});

  @override
  FutureOr<Either<Failure, WeatherResponse>> call(void params) {
    return repository.getWeatherForecast();
  }
}
