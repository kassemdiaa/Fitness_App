import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/features/mainlayout/home/ui/workout_item.dart';
import 'package:fitness_app/providers/user_cradintials_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../core/RoutesManager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.Purple,
      body: Padding(
        padding:  REdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 70.h),
            Row(
              children: [
                Text('Welcome, ${context.read<UserCradintialsProvider>().userName} !',
                  style: GoogleFonts.montserrat(
                    color: ColorsManager.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                SvgPicture.asset('assets/svgs/notification.svg', width: 22.w),
              ],
            ),
            SizedBox(height: 50.h),
            WorkoutItem(
              imagePath: 'assets/images/TrainingforBeginner.png',
              ontap: () {
                Navigator.pushNamed(context, RoutesManager.workoutdetailes);
              },
            ),
            SizedBox(height: 30.h),
            WorkoutItem(
              imagePath: 'assets/images/BuildYourBoddy.png',
              ontap: () {
                Navigator.pushNamed(context, RoutesManager.workoutdetailes);
              },
            ),
          ],
        ),
      ),
    );
  }
}
