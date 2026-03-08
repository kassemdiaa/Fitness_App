import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/data/models/couches_models/couch_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({super.key, required this.couch});
  final CouchModel couch;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: ColorsManager.lightPurple,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text('1 Month',style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),),
              Spacer(),
              Text('${couch.budgets['1 Month'].toString()}\$',style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),),
            ],
          ),
          Row(
            children: [
              Text('3 Months',style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),),
              Spacer(),
              Text('${couch.budgets['3 Months'].toString()}\$',style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),),
            ],
          ),
          Row(
            children: [
              Text('6 Months',style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),),
              Spacer(),
              Text('${couch.budgets['6 Months'].toString()}\$',style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),),
            ],
          ),
          Row(
            children: [
              Text('1 Year',style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),),
              Spacer(),
              Text('${couch.budgets['1 Year'].toString()}\$',style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),),
            ],
          ),
          
        ],
      ),
    );
  }
}
