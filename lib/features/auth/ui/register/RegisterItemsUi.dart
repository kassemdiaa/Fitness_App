import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/features/auth/Logic/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/SharedWidgets/CustomTextFormField.dart';
import '../../../../core/SharedWidgets/CustomeTextButton.dart';
import '../../../../core/colors_manager.dart';
import '../../../../core/fonts_manager.dart';

class Registeritemsui extends StatefulWidget {
  const Registeritemsui({super.key});

  @override
  State<Registeritemsui> createState() => _RegisteritemsuiState();
}

class _RegisteritemsuiState extends State<Registeritemsui> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  bool _isValidEmail(String email)
  {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }
  void _registerWithEmail()
  {
    if (nameController.text.trim().isEmpty || emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("All fields are required"),
          backgroundColor: ColorsManager.red,
        ),
      );
      return;
    }

    if (!_isValidEmail(emailController.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid email format"),
          backgroundColor: ColorsManager.red,
        ),
      );
      return;
    }

    if (passwordController.text.trim() != confirmController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match"),
          backgroundColor: ColorsManager.red,
        ),
      );
      return;
    }
    context.read<AuthCubit>().SignUP(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }
  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

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
              child: Text(
                "Create your account",
                style: FontsStyles.welcomeAuthtext.copyWith(
                  color: ColorsManager.white.withOpacity(0.7),
                ),
                maxLines: 2,
              ),
            ),
            SizedBox(height: 23.h),
            Padding(
              padding: REdgeInsets.all(15.0),
              child: Custometextforemfield(
                hint: "Name",
                label: "UserName",
                color: ColorsManager.white,
                controller: nameController,
              ),
            ),
            Padding(
              padding: REdgeInsets.all(15.0),
              child: Custometextforemfield(
                hint: "mail",
                label: "Email",
                color: ColorsManager.white,
                controller: emailController,
              ),
            ),
            Padding(
              padding: REdgeInsets.all(15.0),
              child: Custometextforemfield(
                hint: "Password",
                label: "Password",
                color: ColorsManager.white,
                prefixIcon: CupertinoIcons.eye,
                controller: passwordController,
              ),
            ),
            Padding(
              padding: REdgeInsets.all(15.0),
              child: Custometextforemfield(
                hint: "Confirm password",
                label: "Confirm password",
                color: ColorsManager.white,
                prefixIcon: CupertinoIcons.eye,
                controller: confirmController,
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 22.w),
              child: BlocConsumer<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CustomElevatedButton(
                    onPressed: _registerWithEmail,
                    title: "Register",
                    backgroundColor: ColorsManager.white,
                    foregroundColor: ColorsManager.black,
                  );
                },
                listener: (context, state) {
                  if (state is Authenticated) {
                    Navigator.pushReplacementNamed(context,
                      RoutesManager.loginScreen,
                    );
                  }
                  if (state is UnAuthenticated) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Registration failed. Please try again."),
                        backgroundColor: ColorsManager.red,
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?", style: FontsStyles.Entermail.copyWith(color: ColorsManager.white,),
                ),
                TextButton(
                  onPressed: () {Navigator.pushReplacementNamed(
                      context,
                      RoutesManager.loginScreen,
                    );
                  },
                  child: Text("Login Now", style: FontsStyles.Entermail.copyWith(color: ColorsManager.Lemon,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}