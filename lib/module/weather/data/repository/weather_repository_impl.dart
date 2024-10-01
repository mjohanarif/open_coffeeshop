import 'package:dartz/dartz.dart';
import 'package:open_coffeeshop/module/weather/weather.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, WeatherResponse>> getWeatherForecast() async {
    try {
      if (await localDataSource.isDataTomorrowSaved()) {
        final result = await localDataSource.getWeatherForecast();

        return Right(result);
      } else {
        final result = await remoteDataSource.getWeatherForecast();

        localDataSource.saveWeatherForecast(result);

        return Right(result);
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
