import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/core/SharedWidgets/CustomTextFormField.dart';
import 'package:fitness_app/core/SharedWidgets/CustomeTextButton.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:fitness_app/features/auth/Logic/auth_cubit.dart';
import 'package:fitness_app/providers/user_cradintials_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  void _LoginWithEmail() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("All fields are required"),
          backgroundColor: ColorsManager.red,
        ),
      );
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
    context.read<AuthCubit>().logIn(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }
 @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.Purple,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13.r),
                topRight: Radius.circular(13.r),
                bottomLeft: Radius.circular(13.r),
                bottomRight: Radius.circular(13.r),
              ),
              border: Border.all(
                color: ColorsManager.white,
                width: 1.w,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            child: Icon(
              CupertinoIcons.arrow_left,
              color: ColorsManager.white,
              weight: 7.w,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 50.w,
                    height: 60,
                  ),
                ],
              ),
              SizedBox(height: 26.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/loginwelcome.png', width: 300.w),
                ],
              ),
              SizedBox(height: 26.h),
              Custometextforemfield(
                hint: 'Username',
                label: 'Username',
                color: ColorsManager.white,
                controller: usernameController,
              ),
              SizedBox(height: 16.h),
              Custometextforemfield(
                hint: 'Enter your Email',
                label: 'Email',
                color: ColorsManager.white,
                controller: emailController,
              ),
              SizedBox(height: 16.h),
              Custometextforemfield(
                hint: 'Enter your Password',
                label: 'Password',
                color: ColorsManager.white,
                prefixIcon: CupertinoIcons.eye,
                controller: passwordController,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManager.forgetPass);
                    },
                    child: Text(
                      'forget password?',
                      style: GoogleFonts.montserratAlternates(
                        color: ColorsManager.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is Authenticated) {
                    context.read<UserCradintialsProvider>().changeName(usernameController.text.trim());
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesManager.layoutScreen,
                    );
                  }
                  if (state is UnAuthenticated) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Login failed. Please try again."),
                        backgroundColor: ColorsManager.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CustomElevatedButton(
                    backgroundColor: ColorsManager.white,
                    foregroundColor: ColorsManager.black,
                    onPressed: _LoginWithEmail,
                    title: 'Login',
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: FontsStyles.Entermail.copyWith(
                      color: ColorsManager.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RoutesManager.registerScreen,
                      );
                    },
                    child: Text(
                      "Register Now",
                      style: FontsStyles.Entermail.copyWith(
                        color: ColorsManager.Lemon,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
