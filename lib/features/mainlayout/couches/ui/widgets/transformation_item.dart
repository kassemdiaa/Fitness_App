import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/data/models/couches_models/couch_model.dart';
import 'package:fitness_app/data/models/couches_models/transformation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TransformationItem extends StatelessWidget {
  const TransformationItem({super.key, required this.transformation});
  final TransformationModel transformation;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: ColorsManager.lightPurple,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(transformation.beforeImagePath, width: 150.w),
              SizedBox(width: 16.w),
              Image.asset(transformation.afterImagePath, width: 150.w),
            ],
          ),
          SizedBox(height: 20.w,),
          Text(
            transformation.description,
            style: GoogleFonts.montserratAlternates(
              color: ColorsManager.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h,),
          Text(
            transformation.time,
            style: GoogleFonts.montserratAlternates(
              color: ColorsManager.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
