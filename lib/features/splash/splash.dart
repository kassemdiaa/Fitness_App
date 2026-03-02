import 'dart:async';

import 'package:fitness_app/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/RoutesManager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // wait for 5 seconds then navigate to login screen
    Timer(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, RoutesManager.chooseAuth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.Purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png',width: 100.w,),
            ],
          ),
          SizedBox(height: 50.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/welcome.png',width: 300.w,),
            ],
          ),
        ],
      ),
    );
  }
}
