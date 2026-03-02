import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
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
            Image.asset('assets/images/logo.png',width: 100.w,),
            SizedBox(height: 30.h,),
            Image.asset('assets/images/start.png',width: 300.w,),
            SizedBox(height: 60.h,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesManager.loginScreen);
              },
              
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 150.w,vertical: 20.h),
                backgroundColor: ColorsManager.lightPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(27.5.r),
                ),
                
              ),
        
              child: Text(
                'Login',
                style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesManager.registerScreen);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 140.w,vertical: 20.h),
                backgroundColor: ColorsManager.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(27.5.r),
                ),
              ),
              child: Text(
                'Register',
                style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
