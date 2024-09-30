import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_coffeeshop/injection.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/shared/shared.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();

  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(
      details.exceptionAsString(),
      error: details.exceptionAsString(),
      stackTrace: details.stack,
      name: 'ERROR',
    );
  };
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppDimension.init(context);
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 820),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => locator<GetProductsBloc>()
              ..add(const GetProductsEvent.getProducts()),
          ),
          BlocProvider(
            create: (context) => locator<SearchProductBloc>(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorSchemeSeed: AppColors.primary,
          ),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
        ),
      ),
    );
  }
}
