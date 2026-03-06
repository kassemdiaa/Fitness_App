import 'package:fitness_app/core/SharedWidgets/CustomTextFormField.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:fitness_app/features/auth/ui/forget_password/ForgetPassItemsUi.dart';
import 'package:fitness_app/core/SharedWidgets/CustomeTextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/RoutesManager.dart';
import '../../../../core/colors_manager.dart';
import '../../Logic/emailensure_cubit.dart';
class ForgetPasswordScreen extends StatefulWidget {
   ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics:  BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
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
                  Custometextforemfield(
                      hint: "Enter Email",
                      label: "Email",
                      color: ColorsManager.white.withOpacity(0.6),
                      controller: emailController,
                  ),
                  SizedBox(height: 20.h,),
                  BlocConsumer<EmailensureCubit, EmailensureState>(
                    listenWhen: (previous, current) => current is RightEmail || current is Emailwrong,
                    listener: (context, state) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      if (state is RightEmail) {
                          Navigator.pushNamed(context, RoutesManager.otp);
                      } else if (state is Emailwrong) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is Emailensureloading) {
                        return const Center(child: CircularProgressIndicator(color: Colors.white));
                      }
                      return CustomElevatedButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          final emailText = emailController.text.trim();
                          if (emailText.isNotEmpty) {
                            context.read<EmailensureCubit>().VerifyEmail(emailText);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please enter your email")),
                            );
                          }
                        },
                        title: "Send Verification Code",
                        backgroundColor: ColorsManager.white,
                        foregroundColor: ColorsManager.black,
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}