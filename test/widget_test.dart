import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:open_coffeeshop/module/weather/data/data_source/weather_remote_data_source.dart';
import 'package:open_coffeeshop/shared/shared.dart';

Future<void> main() async {
  WeatherRemoteDataSource remoteDataSource = WeatherRemoteDataSourceImpl(
    client: Dio()
      ..options = BaseOptions(baseUrl: Constant.apiUrl)
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true)),
  );
  final response = await remoteDataSource.getWeatherForecast();
  log(response.toString());
}
