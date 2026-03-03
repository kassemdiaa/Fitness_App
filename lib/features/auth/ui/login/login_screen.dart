import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/core/SharedWidgets/CustomTextFormField.dart';
import 'package:fitness_app/core/SharedWidgets/CustomeTextButton.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.Purple,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: SizedBox(
          width: 44.w,
          height: 44.h,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13.r),
                  topRight: Radius.circular(13.r),
                  bottomLeft: Radius.circular(13.r),
                  bottomRight: Radius.circular(13.r),
                ),
                border: Border.all(
                  color: ColorsManager.white,
                  width: 1.w,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
              child: Icon(
                CupertinoIcons.arrow_left,
                color: ColorsManager.white,
                weight: 7.w,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Image.asset('assets/images/logo.png', width: 50.w)],
            ),
            SizedBox(height: 26.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/loginwelcome.png', width: 300.w),
              ],
            ),
            SizedBox(height: 26.h),
            Custometextforemfield(
              hint: 'Enter your Email',
              label: 'Email',
              color: ColorsManager.white,
            ),
            SizedBox(height: 16.h),
            Custometextforemfield(
              hint: 'Enter your Password',
              label: 'Password',
              color: ColorsManager.white,
              prefixIcon: CupertinoIcons.eye,
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesManager.forgetPass);
                  },
                  child: Text(
                    'forget password?',
                    style: GoogleFonts.montserratAlternates(
                      color: ColorsManager.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            CustomElevatedButton(
              backgroundColor: ColorsManager.white,
              foregroundColor: ColorsManager.black,
              onPressed: () {
                Navigator.pushNamed(context, RoutesManager.registerScreen);
              },
              title: 'Login',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: FontsStyles.Entermail.copyWith(
                    color: ColorsManager.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesManager.registerScreen);
                  },
                  child: Text(
                    "Register Now",
                    style: FontsStyles.Entermail.copyWith(
                      color: ColorsManager.Lemon,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
