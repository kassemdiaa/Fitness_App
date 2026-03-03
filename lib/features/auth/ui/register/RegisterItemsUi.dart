import 'package:fitness_app/core/RoutesManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/SharedWidgets/CustomTextFormField.dart';
import '../../../../core/SharedWidgets/CustomeTextButton.dart';
import '../../../../core/colors_manager.dart';
import '../../../../core/fonts_manager.dart';
import '../../../../core/images_manager.dart';

class Registeritemsui extends StatefulWidget {
  const Registeritemsui({super.key});

  @override
  State<Registeritemsui> createState() => _RegisteritemsuiState();
}

class _RegisteritemsuiState extends State<Registeritemsui> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.all(22.0),
              child: Image.asset('assets/images/logo.png', width: 50.w),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: REdgeInsets.all(22.0),
              child: Text("Welcome back! Glad to see you, Again!", style: FontsStyles.welcomeAuthtext.copyWith(
                color: ColorsManager.white.withOpacity(0.7),
              ),
                maxLines: 2,
              ),
            ),
            SizedBox(height: 23.h),
            Padding(
              padding: REdgeInsets.all(15.0),
              child: Custometextforemfield(hint: "Name",
                label: "UserName",
                color: ColorsManager.white,
              ),
            ),
            Padding(
              padding: REdgeInsets.all(15.0),
              child: Custometextforemfield(hint: "mail",
                label: "Email",
                color: ColorsManager.white,
              ),
            ),
            Padding(
              padding: REdgeInsets.all(15.0),
              child: Custometextforemfield(hint: "Password", label: "Password",
                color: ColorsManager.white,
                prefixIcon: CupertinoIcons.eye,
              ),
            ),
            Padding(
              padding: REdgeInsets.all(15.0),
              child: Custometextforemfield(hint: "Confirm password", label: "Confirm password",
                color: ColorsManager.white,
                prefixIcon: CupertinoIcons.eye,
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 22.w),
              child: CustomElevatedButton(onPressed: () {
                Navigator.pushNamed(context, RoutesManager.loginScreen);
              }, title: "Register",
                backgroundColor: ColorsManager.white,
                foregroundColor: ColorsManager.black,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",style: FontsStyles.Entermail.copyWith(
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
      ),
    );
  }
}
