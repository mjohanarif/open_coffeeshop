import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:open_coffeeshop/module/weather/weather.dart';
import 'package:open_coffeeshop/shared/shared.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forecast'),
      ),
      body: BlocBuilder<GetWeatherForecastBloc, GetWeatherForecastState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox(),
            success: (data) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (DateUtils.isSameDay(
                              data.daily.time[index], DateTime.now()))
                            const Text(
                              'Today, ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          else
                            const Text(
                              'Tomorrow, ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          Text(
                            DateFormat('EEEE dd-MM-yyyy')
                                .format(data.daily.time[index]),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const AppSpacing(v: 4),
                      RichText(
                        text: TextSpan(
                          text: 'Forecast for the day : ',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  weatherFromInt(data.daily.weatherCode[index]),
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => AppSpacing.v16(),
                itemCount: data.daily.time.length,
              );
            },
          );
        },
      ),
    );
  }
}
