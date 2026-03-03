import 'package:fitness_app/core/SharedWidgets/CustomTextFormField.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:fitness_app/features/auth/ui/forget_password/ForgetPassItemsUi.dart';
import 'package:fitness_app/core/SharedWidgets/CustomeTextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/RoutesManager.dart';
import '../../../../core/colors_manager.dart';
class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
      body: Forgetpassui(),
    );
  }
}