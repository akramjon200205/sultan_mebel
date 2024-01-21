import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/routes.dart';
import 'package:sultan_mebel/di/di.dart';
import 'package:sultan_mebel/future/home/presentation/bloc/home_bloc.dart';
import 'package:sultan_mebel/future/login/presentation/bloc/login_bloc.dart';
import 'package:sultan_mebel/future/login/presentation/pages/login_page.dart';
import 'package:sultan_mebel/future/products/presentation/bloc/warehouse_bloc/warehouse_bloc.dart';

import 'di/di.dart' as sl;
import 'future/products/presentation/bloc/products/products_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.textColorBlack,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemStatusBarContrastEnforced: true,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => di<HomeBloc>()),
            BlocProvider(create: (_) => di<LoginBloc>()),
            BlocProvider(create: (_) => di<ProductsBloc>()),
            BlocProvider(create: (_) => di<WarehouseBloc>()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
            onGenerateRoute: (settings) => Routes.generateRoutes(settings),
          ),
        );
      },
    );
  }
}
