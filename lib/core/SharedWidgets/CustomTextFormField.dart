import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class Custometextforemfield extends StatelessWidget {
  Custometextforemfield(
      {super.key,required this.hint,
        required this.label,this.prefixIcon,
        this.suffixIcon,required this.color,
        this.onChanged, this.controller,
        this.maxLines=1,this.validator});
  String hint;
  String label;
  Color color;
  IconData? suffixIcon;
  IconData? prefixIcon;
  int maxLines;
  TextEditingController? controller;
  String? Function(String?)? validator;
  dynamic onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: ColorsManager.lightBlue,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: FontsStyles.Entermail.copyWith(
          color: ColorsManager.white.withOpacity(0.6),
        ),
        hintText: hint,
        hintStyle: FontsStyles.Entermail.copyWith(
          color: ColorsManager.white.withOpacity(0.6),
        ),
        suffixIcon: suffixIcon!=null ? Icon(suffixIcon,color: color,) : null,
        prefixIcon: prefixIcon!=null ? Icon(prefixIcon,color: color,) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(75.r),
          borderSide: BorderSide(color: ColorsManager.white.withOpacity(0.9)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(75.r),
          borderSide: BorderSide(color: ColorsManager.white.withOpacity(0.1), width: 1.5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(75.r),
          borderSide: BorderSide(color: ColorsManager.Purple, width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 2),
        ),
        filled: true,
        fillColor: ColorsManager.white.withOpacity(0.30),
      ),
    );
  }
}