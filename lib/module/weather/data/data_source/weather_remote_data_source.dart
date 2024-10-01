import 'package:dio/dio.dart';
import 'package:open_coffeeshop/module/weather/weather.dart';
import 'package:open_coffeeshop/shared/shared.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherResponse> getWeatherForecast();
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherResponse> getWeatherForecast() async {
    try {
      final response = await client
          .get('&latitude=-7.56300484624703&longitude=112.23980903264643');

      return WeatherResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        message: e.response != null
            ? 'Error ${e.response!.statusCode}: ${e.response!.statusMessage}'
            : e.message ?? 'Server Error',
      );
    }
  }
}
