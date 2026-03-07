import 'package:fitness_app/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key, required this.text, required this.ontap});
  final String text;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          Text(
            text,
            style: GoogleFonts.montserratAlternates(
              color: ColorsManager.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          SvgPicture.asset('assets/svgs/arrow-back-simple.svg',width: 18.w,),
        ],
      ),
    );
  }
}
