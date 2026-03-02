import 'package:fitness_app/config/theme/theme_maneger.dart';
import 'package:fitness_app/core/RoutesManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(416, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManeger.light,
        darkTheme: ThemeManeger.dark,
        themeMode: ThemeMode.dark,
        initialRoute: RoutesManager.splash,
        onGenerateRoute: RoutesManager.getRoute,
      ),
    );
  }
}
