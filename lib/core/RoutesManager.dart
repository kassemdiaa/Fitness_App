
import 'package:fitness_app/features/auth/forget_password/forget_password_screen.dart';
import 'package:fitness_app/features/auth/forget_password/password_changed_screen.dart';
import 'package:fitness_app/features/auth/forget_password/reset_password_screen.dart';
import 'package:fitness_app/features/auth/login/login_sucssesfully_screen.dart';
import 'package:fitness_app/features/auth/login_or_register/login_or_register_screen.dart';
import 'package:fitness_app/features/auth/register/register_screen.dart';
import 'package:fitness_app/features/mainlayout/home/LayoutScreen.dart';
import 'package:fitness_app/features/mainlayout/home/home_screen.dart';
import 'package:fitness_app/features/mainlayout/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/auth/login/login_screen.dart';

class RoutesManager {
  static const String onboardingScreen = '/onboarding';
  static const String chooseAuth = '/choose';
  static const String loginScreen = '/login';
  static const String loginScreenSucessfully = '/login';
  static const String passwordChanged = '/login';
  static const String resetpassword = '/resetPassword';
  static const String registerScreen = '/register';
  static const String forgetPass = '/forgetPass';
  static const String profileScreen = '/profile';
  static const String layoutScreen = '/layout';
  static const String homeScreen = '/home';
  static const String favorites='/favourites';
  static const String Article='/article';
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name)
    {
      case chooseAuth:
        return CupertinoPageRoute(builder: (_)=> LoginOrRegisterScreen());
      case forgetPass:
        return CupertinoPageRoute(builder: (_)=> ForgetPasswordScreen());
        case passwordChanged:
        return CupertinoPageRoute(builder: (_)=> PasswordChangedScreen());
      case resetpassword:
        return CupertinoPageRoute(builder: (_)=> ResetPasswordScreen());
      case loginScreenSucessfully:
        return CupertinoPageRoute(builder: (_)=> LoginSucssesfullyScreen());
      case loginScreen:
        return CupertinoPageRoute(builder: (_) => LoginScreen());
      case registerScreen:
        return CupertinoPageRoute(builder: (_) =>  RegisterScreen());
      case profileScreen:
        return CupertinoPageRoute(builder: (_) =>  ProfileScreen());
      case layoutScreen:
        return CupertinoPageRoute(builder: (_) => Layoutscreen());
      case homeScreen:
        return CupertinoPageRoute(builder: (_) =>  HomeScreen());
    }
  }
}