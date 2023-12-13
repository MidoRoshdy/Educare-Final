import 'package:educare/screens/userhandel/forgetpassword/components/check%20email/checkemail.dart';
import 'package:educare/screens/userhandel/forgetpassword/components/verifyemailpass/verifypass.dart';
import 'package:educare/screens/userhandel/signup/components/sendemail.dart';
import 'package:educare/screens/userhandel/signup/components/setupaccount.dart';
import 'package:educare/screens/userhandel/signup/components/verify.dart';
import 'package:flutter/material.dart';

import '../screens/SplashScreen/SplashScreen.dart';
import '../screens/home/home.dart';
import '../screens/onboarding/onboarding.dart';
import '../screens/userhandel/forgetpassword/components/create pass/createpassword.dart';
import '../screens/userhandel/forgetpassword/components/succes pass/successpassword.dart';
import '../screens/userhandel/forgetpassword/forgetpassword.dart';
import '../screens/userhandel/login/login.dart';
import '../screens/userhandel/signup/signup.dart';

class AppRoutes {
  static const String splash = "/";
  //OnBoarding
  static const String onboarding = "onboarding";
  static const String page2 = "OnBoarding_page2";
  static const String page3 = "OnBoarding_page3";
  //userhandel
  static const String login = "login";
  //create account and choose
  static const String createaccount = "createaccount";
  static const String verifyemailregister = "verifyemailregister";
  static const String setupaccount = "setupaccount";
  //reset password and email send
  static const String createpassword = "createpassword";
  static const String forgetPassword = "forgetPassword";
  static const String emailSent = "emailSent";
  static const String chooseNewPass = "chooseNewPass";
  static const String sucesspassword = "sucesspassword";
  static const String openapppage = "openapppage";
  static const String checkemailpage = "checkemailpage";
  static const String verifypasspage = "verifypasspage";
  //homescreen
  static const String home = "home";

  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case onboarding:
        return MaterialPageRoute(
          builder: (context) {
            return OnBoarding();
          },
        );
      case page2:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case page3:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case createaccount:
        return MaterialPageRoute(
          builder: (context) {
            return const CreateAccount();
          },
        );
      case openapppage:
        return MaterialPageRoute(
          builder: (context) {
            return const OpenAppPage();
          },
        );
      case verifyemailregister:
        return MaterialPageRoute(
          builder: (context) {
            return const VerificationEmailRegister();
          },
        );
      case setupaccount:
        return MaterialPageRoute(
          builder: (context) {
            return const SetUpAccount();
          },
        );
      case login:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginPage();
          },
        );
      case createpassword:
        return MaterialPageRoute(
          builder: (context) {
            return const CreatePassword();
          },
        );
      case forgetPassword:
        return MaterialPageRoute(
          builder: (context) {
            return const ForgetPasswordPage();
          },
        );
      case checkemailpage:
        return MaterialPageRoute(
          builder: (context) {
            return CheckEmailpage();
          },
        );
      case verifypasspage:
        return MaterialPageRoute(
          builder: (context) {
            return const VerifyPassPage();
          },
        );
      case sucesspassword:
        return MaterialPageRoute(
          builder: (context) {
            return const SuccessPassword();
          },
        );
      case home:
        return MaterialPageRoute(
          builder: (context) {
            return const Home();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text("No route defined for ${setting.name}"),
              ),
            );
          },
        );
    }
  }
}
