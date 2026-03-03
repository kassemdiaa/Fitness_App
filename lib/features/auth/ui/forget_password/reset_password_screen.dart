import 'package:fitness_app/features/auth/ui/forget_password/reset_Password_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors_manager.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Container(
          width: 44.w,
          height: 44.h,
          child: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(13.r),topRight: Radius.circular(13.r),bottomLeft: Radius.circular(13.r),bottomRight: Radius.circular(13.r)),
                border: Border.all(color: ColorsManager.white,width:1.w,strokeAlign: BorderSide.strokeAlignInside)
            ),
            child: Icon(CupertinoIcons.arrow_left,color: ColorsManager.white,
              weight: 7.w,
            ),
          )),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ResetPasswordItems(),
    );
  }
}