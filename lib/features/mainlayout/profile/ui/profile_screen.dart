import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/features/mainlayout/profile/ui/widgets/settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.Purple,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 50.w,),
              Container(
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: ColorsManager.pink, width: 4.w),
                  borderRadius: BorderRadius.circular(100.r),
                ),
                // child: ClipRRect(
                //   borderRadius: BorderRadiusGeometry.circular(70.r),
                //   child: Image.asset('name'),
                // ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Kassem',
                style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                '180 cm',
                style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.lightGray,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '62 KG',
                style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.lightGray,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.w,),
              Row(
                children: [
                  Text(
                    'App Settings',
                    style: GoogleFonts.montserratAlternates(
                      color: ColorsManager.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                  color: ColorsManager.lightPurple,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Column(
                  children: [
                    SettingsItem(text: 'Account Informations', ontap: () {}),
                    SizedBox(height: 8.h),
                    Divider(),
                    SizedBox(height: 8.h),
                    SettingsItem(text: 'Notifications', ontap: () {}),
                    SizedBox(height: 8.h),
                    Divider(),
                    SizedBox(height: 8.h),
                    SettingsItem(text: 'Text Size', ontap: () {}),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Text(
                    'Support',
                    style: GoogleFonts.montserratAlternates(
                      color: ColorsManager.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                  color: ColorsManager.lightPurple,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Column(
                  children: [
                    SettingsItem(text: 'Terms Of Service', ontap: () {}),
                    SizedBox(height: 8.h),
                    Divider(),
                    SizedBox(height: 8.h),
                    SettingsItem(text: 'Privacy Policy', ontap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
