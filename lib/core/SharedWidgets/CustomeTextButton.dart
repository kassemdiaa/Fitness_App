import 'package:fitness_app/core/fonts_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData? PrefixIcon;
  const CustomElevatedButton({
    super.key, required this.onPressed,
    required this.title, required this.backgroundColor,
    required this.foregroundColor, this.PrefixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: REdgeInsets.symmetric(horizontal: 80, vertical: 22),
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(28.r),
        ),
        textStyle: FontsStyles.forgetbuttontext.copyWith(
          color: foregroundColor
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (PrefixIcon != null) ...[
            Icon(PrefixIcon, color: foregroundColor),
            SizedBox(width: 10.w),
          ],
          Text(title,style: FontsStyles.forgetbuttontext,),
        ],
      ),
    );
  }
}