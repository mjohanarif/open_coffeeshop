import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_coffeeshop/module/weather/weather.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherForecastBloc, GetWeatherForecastState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          success: (data) {
            var temp = data.daily.time.indexWhere(
              (e) => DateUtils.isSameDay(e, DateTime.now()),
            );
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.forecastPage,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Status : ${isOpen(data.daily.weatherCode[temp])}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Weather : ${weatherFromInt(data.daily.weatherCode[temp])}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    AppSpacing.v8(),
                    const Text(
                      'Click to see forecast',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
