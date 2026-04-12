import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/core/SharedWidgets/CustomTextFormField.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:fitness_app/core/SharedWidgets/CustomeTextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordItems extends StatelessWidget {
   ResetPasswordItems({super.key});
  TextEditingController NewPass=TextEditingController();
  TextEditingController ConfirmNewPass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 22.h),
              Text(
                "Create New Password", style: FontsStyles.welcomeAuthtext.copyWith(
                  color: ColorsManager.white.withOpacity(0.8),
                ),
              ),
              Padding(
                padding: REdgeInsets.all(12.0),
                child: Text(
                  "Your new password must be unique from those previously used.",
                  style: FontsStyles.warringForgetpass.copyWith(
                    color: ColorsManager.white.withOpacity(0.8),
                  ),
                  maxLines: 2,
                ),
              ),
              Custometextforemfield(
                hint: "New Password",
                label: "New Password",
                controller: NewPass,
                color: ColorsManager.white.withOpacity(0.8),
              ),
              SizedBox(height: 10.h),
              Custometextforemfield(
                hint: "Confirm Password",
                label: "Confirm Password",
                controller: ConfirmNewPass,
                color: ColorsManager.white.withOpacity(0.8),
              ),
              SizedBox(height: 10.h),
              CustomElevatedButton(
                onPressed: () {
                  String pass = NewPass.text;
                  String confirm = ConfirmNewPass.text;
                  if (pass.isEmpty || confirm.isEmpty) {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fill all fields")));
                  }
                  if (pass != confirm) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fill all fields")));
                  }
                },
                title: "Reset Password",
                backgroundColor: ColorsManager.white,
                foregroundColor: ColorsManager.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
