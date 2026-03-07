import 'package:fitness_app/features/auth/ui/OTP/OtpPage.dart';
import 'package:fitness_app/features/auth/ui/forget_password/forget_password_screen.dart';
import 'package:fitness_app/features/auth/ui/forget_password/password_changed_screen.dart';
import 'package:fitness_app/features/auth/ui/forget_password/reset_password_screen.dart';
import 'package:fitness_app/features/auth/ui/login/login_screen.dart';
import 'package:fitness_app/features/auth/ui/login/login_sucssesfully_screen.dart';
import 'package:fitness_app/features/auth/ui/login_or_register/login_or_register_screen.dart';
import 'package:fitness_app/features/auth/ui/register/register_screen.dart';
import 'package:fitness_app/features/mainlayout/couches/ui/screens/couches_screen.dart';
import 'package:fitness_app/features/mainlayout/home/ui/home_screen.dart';
import 'package:fitness_app/features/mainlayout/home/ui/workout_deitails.dart/success_screen.dart';
import 'package:fitness_app/features/mainlayout/mainlayout.dart';
import 'package:fitness_app/features/mainlayout/profile/ui/profile_screen.dart';
import 'package:fitness_app/features/splash/splash.dart';
import 'package:flutter/cupertino.dart';

class RoutesManager {
  static const String onboardingScreen = '/onboarding';
  static const String chooseAuth = '/choose';
  static const String loginScreen = '/login';
  static const String loginScreenSucessfully = '/loginsucess';
  static const String passwordChanged = '/passwordchanged';
  static const String resetpassword = '/resetPassword';
  static const String registerScreen = '/register';
  static const String forgetPass = '/forgetPass';
  static const String profileScreen = '/profile';
  static const String layoutScreen = '/layout';
  static const String homeScreen = '/home';
  static const String favorites = '/favourites';
  static const String article = '/article';
  static const String splash = '/splash';
  static const String otp = '/Otp';
  static const String successScreen = '/successScreen';
  static const String couchScreen = '/couchScreen';
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return CupertinoPageRoute(builder: (_) => Splash());
      case chooseAuth:
        return CupertinoPageRoute(builder: (_) => LoginOrRegisterScreen());
      case forgetPass:
        return CupertinoPageRoute(builder: (_) => ForgetPasswordScreen());
      case passwordChanged:
        return CupertinoPageRoute(builder: (_) => PasswordChangedScreen());
      case resetpassword:
        return CupertinoPageRoute(builder: (_) => ResetPasswordScreen());
      case loginScreenSucessfully:
        return CupertinoPageRoute(builder: (_) => LoginSucssesfullyScreen());
      case loginScreen:
        return CupertinoPageRoute(builder: (_) => LoginScreen());
      case registerScreen:
        return CupertinoPageRoute(builder: (_) => RegisterScreen());
      case profileScreen:
        return CupertinoPageRoute(builder: (_) => ProfileScreen());
      case layoutScreen:
        return CupertinoPageRoute(builder: (_) => Mainlayout());
      case homeScreen:
        return CupertinoPageRoute(builder: (_) => HomeScreen());
      case otp:
        return CupertinoPageRoute(builder: (_) => Otppage());
      case successScreen:
        return CupertinoPageRoute(builder: (_) => SuccessScreen());
        case couchScreen:
        return CupertinoPageRoute(builder: (_) => CouchesScreen());
      }
    return null;
  }
}
