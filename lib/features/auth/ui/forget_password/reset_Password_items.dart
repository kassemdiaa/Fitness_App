import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/core/SharedWidgets/CustomTextFormField.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:fitness_app/core/SharedWidgets/CustomeTextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordItems extends StatelessWidget {
  const ResetPasswordItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 22.h,),
          Text("Create New Password",style: FontsStyles.welcomeAuthtext.copyWith(
            color: ColorsManager.white.withOpacity(0.8)
          ),),
          Padding(
            padding:  REdgeInsets.all(12.0),
            child: Text("Your new password must be unique from those previously used.",style: FontsStyles.warringForgetpass.copyWith(
              color: ColorsManager.white.withOpacity(0.8),
            ),maxLines: 2,),
          ),
          Padding(
            padding:REdgeInsets.all(14.0),
            child: Custometextforemfield(hint: "New Password", label: "New Password", color:ColorsManager.white.withOpacity(0.8)),
          ),
          Padding(
            padding:REdgeInsets.all(14.0),
            child: Custometextforemfield(hint: "Confirm Password", label: "Confirm Password", color:ColorsManager.white.withOpacity(0.8)),
          ),
          SizedBox(height: 10.h,),
          CustomElevatedButton(onPressed: (){
            Navigator.pushNamed(context, RoutesManager.passwordChanged);
          },
              title: "Reset Password", backgroundColor: ColorsManager.white, foregroundColor: ColorsManager.black)
        ],
      ),
    ));
  }
}
