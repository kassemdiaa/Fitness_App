import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:fitness_app/features/auth/ui/widgets/custom_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginOrRegisterScreen extends StatelessWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.Purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 100.w),
            SizedBox(height: 30.h),
            Image.asset('assets/images/start.png', width: 300.w),
            SizedBox(height: 60.h),
            CustomAuthButton(
              bgColor: ColorsManager.lightPurple,
              fgColor: ColorsManager.white,
              text: 'Login',
              route: RoutesManager.loginScreen,
            ),
            SizedBox(height: 20.h),
            CustomAuthButton(
              bgColor: ColorsManager.white,
              fgColor: ColorsManager.black,
              text: 'Register',
              route: RoutesManager.registerScreen,
            ),
          ],
        ),
      ),
    );
  }
}
