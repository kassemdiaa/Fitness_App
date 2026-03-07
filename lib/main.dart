import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/config/theme/theme_maneger.dart';
import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/features/auth/Logic/auth_cubit.dart';
import 'package:fitness_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/Logic/emailensure_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => EmailensureCubit(),
        ),
      ],
      child: FitnessApp(),
    ),
  );
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(416, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManeger.dark,
        darkTheme: ThemeManeger.dark,
        themeMode: ThemeMode.dark,
        initialRoute: RoutesManager.loginScreen,
        onGenerateRoute: RoutesManager.getRoute,
      ),
    );
  }
}
