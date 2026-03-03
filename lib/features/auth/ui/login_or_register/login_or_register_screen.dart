import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/SharedWidgets/CustomeTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginOrRegisterScreen extends StatelessWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.Purple,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 100.w),
              SizedBox(height: 30.h),
              Image.asset('assets/images/start.png', width: 300.w),
              SizedBox(height: 60.h),
             CustomElevatedButton(
                backgroundColor: ColorsManager.lightPurple,
                foregroundColor: ColorsManager.white,
                onPressed: () {
                  Navigator.pushNamed(context, RoutesManager.loginScreen);
                },
                title: 'Login',
              ),
              SizedBox(height: 20.h),
              CustomElevatedButton(
                backgroundColor: ColorsManager.white,
                foregroundColor: ColorsManager.black,
                onPressed: () {
                  Navigator.pushNamed(context, RoutesManager.registerScreen);
                },
                title: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
