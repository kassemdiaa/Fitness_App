import 'package:fitness_app/config/theme/theme_maneger.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManeger.light,
      darkTheme: ThemeManeger.dark,
      themeMode: ThemeMode.dark,
    );
  }
}