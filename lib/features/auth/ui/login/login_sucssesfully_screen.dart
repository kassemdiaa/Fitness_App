import 'dart:async';

import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:fitness_app/core/lottie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/RoutesManager.dart';

class LoginSucssesfullyScreen extends StatefulWidget {
  const LoginSucssesfullyScreen({super.key});

  @override
  State<LoginSucssesfullyScreen> createState() => _PasswordChangedScreenState();
}

class _PasswordChangedScreenState extends State<LoginSucssesfullyScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, RoutesManager.layoutScreen);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(LottieManager.returnPass),
          SizedBox(height: 10.h,),
          Text("Login Successfully",style: FontsStyles.hookNewsDetailes.copyWith(
            color: ColorsManager.white,
          ),),
          
        ],
      ),
    );
  }
}