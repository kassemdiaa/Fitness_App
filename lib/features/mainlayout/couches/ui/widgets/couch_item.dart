import 'package:fitness_app/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CouchItem extends StatelessWidget {
  const CouchItem({
    super.key,
    required this.name,
    required this.imagePath,
    required this.experience,
    required this.startPudget,
    required this.rate,
  });
  final String name;
  final String imagePath;
  final String experience;
  final int startPudget;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorsManager.lightPurple,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                experience,
                style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Text(rate.toString(),style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),),
                  SizedBox(width: 6.w),
                  Image.asset(
                    'assets/images/rate.png',
                    width: 50.w,
                    color: ColorsManager.green,
                  ),
                ],
              ),

              Text(
                'Start from ${startPudget.toString()}\$',
                style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20.r),
            child: Image.asset(imagePath, width: 100.w),
          ),
        ],
      ),
    );
  }
}
