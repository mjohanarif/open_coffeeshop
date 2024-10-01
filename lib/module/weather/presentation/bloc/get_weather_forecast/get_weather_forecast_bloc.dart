import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_coffeeshop/module/weather/weather.dart';

part 'get_weather_forecast_event.dart';
part 'get_weather_forecast_state.dart';
part 'get_weather_forecast_bloc.freezed.dart';

class GetWeatherForecastBloc
    extends Bloc<GetWeatherForecastEvent, GetWeatherForecastState> {
  final GetWeatherForecastUsecase getWeatherForecastUsecase;

  GetWeatherForecastBloc(this.getWeatherForecastUsecase)
      : super(const _Initial()) {
    on<_GetWeatherForecast>((event, emit) async {
      emit(const _Loading());

      final result = await getWeatherForecastUsecase(null);

      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
