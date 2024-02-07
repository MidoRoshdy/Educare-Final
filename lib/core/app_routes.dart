import 'package:educare/screens/_______Parents______/Message/message.dart';
import 'package:educare/screens/_______Parents______/Notification/Notification.dart';
import 'package:educare/screens/_______Parents______/attendance/attendance.dart';
import 'package:educare/screens/_______Parents______/home/components/home1/home1.dart';
import 'package:educare/screens/_______Parents______/profile/profile.dart';
import 'package:educare/screens/_______Parents______/userhandel/another%20child/anotherchild.dart';
import 'package:educare/screens/_______Parents______/userhandel/choose%20student/choosestudent.dart';
import 'package:educare/screens/choose%20user/chosseuser.dart';
import 'package:educare/screens/_______Parents______/userhandel/forgetpassword/components/check%20email/checkemail.dart';
import 'package:educare/screens/_______Parents______/userhandel/forgetpassword/components/verifyemailpass/verifypass.dart';
import 'package:educare/screens/_______Parents______/userhandel/signup/components/checkemailregister.dart';
import 'package:educare/screens/_______Parents______/userhandel/signup/components/setupaccount.dart';
import 'package:educare/screens/_______Parents______/userhandel/signup/components/verify.dart';
import 'package:flutter/material.dart';

import '../screens/SplashScreen/SplashScreen.dart';
import '../screens/_______Parents______/home/home.dart';
import '../screens/onboarding/onboarding.dart';
import '../screens/_______Parents______/userhandel/forgetpassword/components/create pass/createpassword.dart';
import '../screens/_______Parents______/userhandel/forgetpassword/components/succes pass/successpassword.dart';
import '../screens/_______Parents______/userhandel/forgetpassword/forgetpassword.dart';
import '../screens/_______Parents______/userhandel/login/login.dart';
import '../screens/_______Parents______/userhandel/signup/signup.dart';

class AppRoutes {
  static const String splash = "/";
  //OnBoarding
  static const String onboarding = "onboarding";
  static const String page2 = "OnBoarding_page2";
  static const String page3 = "OnBoarding_page3";
  //userhandel
  static const String chooseuser = "chooseuser";
  static const String login = "login";
  //create account and choose
  static const String createaccount = "createaccount";
  static const String verifyemailregister = "verifyemailregister";
  static const String checkemailregister = "checkemailregister";
  static const String setupaccount = "setupaccount";
  //reset password and email send
  static const String createpassword = "createpassword";
  static const String forgetPassword = "forgetPassword";
  static const String emailSent = "emailSent";
  static const String chooseNewPass = "chooseNewPass";
  static const String sucesspassword = "sucesspassword";
  static const String checkemailpage = "checkemailpage";
  static const String verifypasspage = "verifypasspage";
  //homescreen
  static const String choosestudent = "choosestudent";
  static const String anotherchild = "anotherchild";
  static const String home = "home";
  static const String homepage = "homepage";
  static const String notification = "notification";
  static const String message = "message";
  static const String attendance = "attendance";
  static const String profile = "profile";

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
      case checkemailregister:
        return MaterialPageRoute(
          builder: (context) {
            return const CheckEmailRegister();
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
      case chooseuser:
        return MaterialPageRoute(
          builder: (context) {
            return const ChooseUser();
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
      case choosestudent:
        return MaterialPageRoute(
          builder: (context) {
            return const ChooseStudent();
          },
        );
      case anotherchild:
        return MaterialPageRoute(
          builder: (context) {
            return const AnotherChild();
          },
        );
      case home:
        return MaterialPageRoute(
          builder: (context) {
            return const Home();
          },
        );
      case homepage:
        return MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        );
      case notification:
        return MaterialPageRoute(
          builder: (context) {
            return const NotificationPage();
          },
        );
      case attendance:
        return MaterialPageRoute(
          builder: (context) {
            return const AttendancePage();
          },
        );
      case message:
        return MaterialPageRoute(
          builder: (context) {
            return const MessagePage();
          },
        );
      case profile:
        return MaterialPageRoute(
          builder: (context) {
            return const ProfilePage();
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
