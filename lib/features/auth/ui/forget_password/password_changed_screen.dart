import 'dart:async';

import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:fitness_app/core/lottie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/RoutesManager.dart';

class PasswordChangedScreen extends StatefulWidget {
  const PasswordChangedScreen({super.key});

  @override
  State<PasswordChangedScreen> createState() => _PasswordChangedScreenState();
}

class _PasswordChangedScreenState extends State<PasswordChangedScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, RoutesManager.loginScreen);
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
          Text("Password Changed",style: FontsStyles.hookNewsDetailes.copyWith(
            color: ColorsManager.white,
          ),),
          Text("Your password has been changed successfully.",style: FontsStyles.newsDetailes.copyWith(
            color: ColorsManager.white,
          ),maxLines: 3,),
        ],
      ),
    );
  }
}