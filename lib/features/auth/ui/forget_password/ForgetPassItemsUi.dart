import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/RoutesManager.dart';
import '../../../../core/SharedWidgets/CustomTextFormField.dart';
import '../../../../core/colors_manager.dart';
import '../../../../core/fonts_manager.dart';
import '../../../../core/SharedWidgets/CustomeTextButton.dart';

class Forgetpassui extends StatefulWidget {
  const Forgetpassui({super.key});

  @override
  State<Forgetpassui> createState() => _ForgetpassuiState();
}

class _ForgetpassuiState extends State<Forgetpassui> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: REdgeInsets.all(22.0),
            child: Column(
              children: [
                Text("Forgot Password?",style: FontsStyles.welcomeAuthtext.copyWith(
                    color: ColorsManager.white.withOpacity(0.7)
                ),),
                SizedBox(height: 11.h,),
                Text("Don't worry! It occurs . Please enter the email address linked with your account.",style: FontsStyles.newsDetailes.copyWith(
                    color: ColorsManager.white.withOpacity(0.9)
                ),maxLines: 3,),
              ],
            ),
          ),
          SizedBox(height: 11.h,),
          Padding(
            padding: REdgeInsets.all(18.0),
            child: Custometextforemfield(
                hint: "Enter Email",
                label: "Email",
                color: ColorsManager.white.withOpacity(0.6)),
          ),
          SizedBox(height: 13.h,),
          CustomElevatedButton(onPressed: (){
            Navigator.pushNamed(context, RoutesManager.resetpassword);
          },title: "Reset Password Page",
              backgroundColor: ColorsManager.white,
              foregroundColor: ColorsManager.black
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Remember Password ?",style: FontsStyles.Entermail.copyWith(
                  color: ColorsManager.white
              ),),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, RoutesManager.loginScreen);
              }, child:Text("Login Now",style: FontsStyles.Entermail.copyWith(
                  color: ColorsManager.Lemon
              ),))
            ],
          ),
        ],
      ),
    );
  }
}
