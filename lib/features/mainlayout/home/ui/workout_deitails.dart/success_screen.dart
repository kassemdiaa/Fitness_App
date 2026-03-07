import 'package:fitness_app/core/SharedWidgets/CustomeTextButton.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/lottie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentGeometry.center,
              children: [
                LottieBuilder.asset(LottieManager.fireWork, width: 400.w),
        
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
                  decoration: BoxDecoration(
                    color: ColorsManager.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LottieBuilder.asset(LottieManager.fire, width: 140.w),
                      SizedBox(height: 20.h),
                      Text(
                        textAlign: TextAlign.center,
                        'Training completed\nsuccessfully',
                        style: GoogleFonts.montserratAlternates(
                          color: ColorsManager.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h,),
            CustomElevatedButton(
              backgroundColor: ColorsManager.Iceblue,
              foregroundColor: ColorsManager.black,
              onPressed: () {
                Navigator.pop(context);
              },
              title: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
