import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({super.key,required this.bgColor,required this.fgColor, required this.text, required this.route});
  final String text;
  final String route;
  final Color bgColor;
  final Color fgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, route);
                },

                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  backgroundColor: bgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(27.5.r),
                  ),
                ),

                child: Text(
                  text,
                  style: GoogleFonts.montserratAlternates(
                    color: fgColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
  }
}