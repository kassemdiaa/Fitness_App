import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class FontsStyles {
  static final TextStyle welcomeAuthtext=GoogleFonts.montserratAlternates(
      fontSize: 30.sp,fontWeight: FontWeight.bold);
  static final TextStyle Entermail=GoogleFonts.montserratAlternates(
      fontSize: 13.sp,fontWeight: FontWeight.w400);
  static final TextStyle forgetbuttontext=GoogleFonts.montserratAlternates(
      fontSize: 12.sp,fontWeight: FontWeight.w600 );
  static final TextStyle Loginbuttonstyle=GoogleFonts.montserratAlternates(
      fontSize: 15.sp,fontWeight: FontWeight.w400);
  static final TextStyle Already= GoogleFonts.urbanist(
      fontSize: 15.sp,fontWeight: FontWeight.w400);
  static final TextStyle warringForgetpass=GoogleFonts.montserratAlternates(
      fontSize: 13.sp,fontWeight: FontWeight.w300);
  static final TextStyle onBourdingtexts=GoogleFonts.montserratAlternates(
      fontSize: 24.sp,fontWeight: FontWeight.w600);
  static final TextStyle ChoosesOnBourding=GoogleFonts.montserratAlternates(
    fontSize: 12.sp,fontWeight: FontWeight.w500
  );
  static final TextStyle HomeWelcome= GoogleFonts.montserrat(
    fontWeight: FontWeight.bold,fontSize: 20.sp
  );
  static final TextStyle ScheduleHome=GoogleFonts.montserrat(
    fontSize: 11.sp,fontWeight: FontWeight.w400
  );
  static final TextStyle homeChoicesandDetailes=GoogleFonts.montserrat(
    fontWeight: FontWeight.w300,fontSize: 10.sp
  );
  static final TextStyle AppBar=GoogleFonts.montserrat(
    fontSize: 18.sp,fontWeight: FontWeight.w600
  );
  static final TextStyle hookNewsDetailes=GoogleFonts.montserrat(
      fontSize: 18.sp,fontWeight: FontWeight.w600
  );
  static final TextStyle newsDetailes=GoogleFonts.montserrat(
      fontSize: 12.sp,fontWeight: FontWeight.w600
  );
}