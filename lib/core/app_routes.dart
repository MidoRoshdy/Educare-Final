// ignore_for_file: constant_identifier_names

import 'package:educare/screens/_______Parents______/Message/message.dart';
import 'package:educare/screens/_______Parents______/Notification/Notification.dart';
import 'package:educare/screens/_______Parents______/attendance/attendance.dart';
import 'package:educare/screens/_______Parents______/home/components/home1/home1.dart';
import 'package:educare/screens/_______Parents______/profile/profile.dart';
import 'package:educare/screens/_______Parents______/userhandel/another%20child/anotherchild.dart';
import 'package:educare/screens/_______Parents______/userhandel/choose%20student/choosestudent.dart';
import 'package:educare/screens/_______Teacher______/home/T_home.dart';
import 'package:educare/screens/_______Teacher______/home/components/Message/T_message.dart';
import 'package:educare/screens/_______Teacher______/home/components/QR/T_QR.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/T_home_1.dart';
import 'package:educare/screens/_______Teacher______/home/components/notification/T_notification.dart';
import 'package:educare/screens/_______Teacher______/home/components/profile/T_Profile.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/forget%20password/Tforgetpassword.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/forget%20password/components/check%20email/checkemail.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/forget%20password/components/create%20pass/createpassword.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/forget%20password/components/succes%20pass/successpassword.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/forget%20password/components/verifyemailpass/verifypass.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/login/Tlogin.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/signup/Tsignup.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/signup/components/Tcheckemailregister.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/signup/components/Tsetupaccount.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/signup/components/Tverify.dart';
import 'package:educare/screens/_______for%20all%20user______/choose%20user/chosseuser.dart';
import 'package:educare/screens/_______Parents______/userhandel/forgetpassword/components/check%20email/checkemail.dart';
import 'package:educare/screens/_______Parents______/userhandel/forgetpassword/components/verifyemailpass/verifypass.dart';
import 'package:educare/screens/_______Parents______/userhandel/signup/components/checkemailregister.dart';
import 'package:educare/screens/_______Parents______/userhandel/signup/components/setupaccount.dart';
import 'package:educare/screens/_______Parents______/userhandel/signup/components/verify.dart';
import 'package:flutter/material.dart';

import '../screens/_______for all user______/SplashScreen/SplashScreen.dart';
import '../screens/_______Parents______/home/home.dart';
import '../screens/_______for all user______/onboarding/onboarding.dart';
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
  //////////////////////parents//////////////////////////////////////
  static const String parents_login = "parentslogin";
  //create account and choose
  static const String Parents_createaccount = "Parentscreateaccount";
  static const String Parents_verifyemailregister =
      "Parentsverifyemailregister";
  static const String Parents_checkemailregister = "Parentscheckemailregister";
  static const String Parents_setupaccount = "Parentssetupaccount";
  //reset password and email send
  static const String Parents_createpassword = "Parentscreatepassword";
  static const String Parents_forgetPassword = "ParentsforgetPassword";
  static const String Parents_emailSent = "ParentsemailSent";
  static const String Parents_chooseNewPass = "ParentschooseNewPass";
  static const String Parents_sucesspassword = "Parentssucesspassword";
  static const String Parents_checkemailpage = "Parentscheckemailpage";
  static const String Parents_verifypasspage = "Parentsverifypasspage";
  //homescreen

  static const String Parents_choosestudent = "Parentschoosestudent";
  static const String Parents_anotherchild = "Parentsanotherchild";
  static const String Parents_home = "Parentshome";
  static const String Parents_homepage = "Parentshomepage";
  static const String Parents_notification = "Parentsnotification";
  static const String Parents_message = "Parentsmessage";
  static const String Parents_attendance = "Parentsattendance";
  static const String Parents_profile = "Parentsprofile";
  //////////////////////teacher//////////////////////////////////////
  //login
  static const String teacher_login = "teacherlogin";
  //register
  static const String teacher_register = "teacherregister";
  static const String teacher_verifyemailregister =
      "teacherverifyemailregister";
  static const String teacher_checkemailregister = "teachercheckemailregister";
  static const String teacher_setupaccount = "teachersetupaccount";
//reset password and email send
  static const String teacher_createpassword = "teachercreatepassword";
  static const String teacher_forgetPassword = "teacherforgetPassword";
  // static const String teacher_emailSent = "teacheremailSent";
  // static const String teacher_chooseNewPass = "teacherchooseNewPass";
  static const String teacher_sucesspassword = "teachersucesspassword";
  static const String teacher_checkemailpage = "teachercheckemailpage";
  static const String teacher_verifypasspage = "teacherverifypasspage";
  //homescreen
  static const String teacher_home = "teacherhome";
  static const String teacher_homepage = "teacherhomepage";
  static const String teacher_notification = "teachernotification";
  static const String teacher_message = "teachermessage";
  static const String teacher_QR = "teacherQR";
  static const String teacher_profile = "teacherprofile";
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
      case Parents_createaccount:
        return MaterialPageRoute(
          builder: (context) {
            return const CreateAccount();
          },
        );
      case Parents_checkemailregister:
        return MaterialPageRoute(
          builder: (context) {
            return const CheckEmailRegister();
          },
        );
      case Parents_verifyemailregister:
        return MaterialPageRoute(
          builder: (context) {
            return const VerificationEmailRegister();
          },
        );
      case Parents_setupaccount:
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
      case parents_login:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginPage();
          },
        );
      case Parents_createpassword:
        return MaterialPageRoute(
          builder: (context) {
            return const CreatePassword();
          },
        );
      case Parents_forgetPassword:
        return MaterialPageRoute(
          builder: (context) {
            return const ForgetPasswordPage();
          },
        );
      case Parents_checkemailpage:
        return MaterialPageRoute(
          builder: (context) {
            return CheckEmailpage();
          },
        );
      case Parents_verifypasspage:
        return MaterialPageRoute(
          builder: (context) {
            return const VerifyPassPage();
          },
        );
      case Parents_sucesspassword:
        return MaterialPageRoute(
          builder: (context) {
            return const SuccessPassword();
          },
        );
      case Parents_choosestudent:
        return MaterialPageRoute(
          builder: (context) {
            return const ChooseStudent();
          },
        );
      case Parents_anotherchild:
        return MaterialPageRoute(
          builder: (context) {
            return const AnotherChild();
          },
        );
      case Parents_home:
        return MaterialPageRoute(
          builder: (context) {
            return const Home();
          },
        );
      case Parents_homepage:
        return MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        );
      case Parents_notification:
        return MaterialPageRoute(
          builder: (context) {
            return const NotificationPage();
          },
        );
      case Parents_attendance:
        return MaterialPageRoute(
          builder: (context) {
            return const AttendancePage();
          },
        );
      case Parents_message:
        return MaterialPageRoute(
          builder: (context) {
            return const MessagePage();
          },
        );
      case Parents_profile:
        return MaterialPageRoute(
          builder: (context) {
            return const ProfilePage();
          },
        );
      ////////////////////////////////////teacher ////////////////////////////
      case teacher_login:
        return MaterialPageRoute(
          builder: (context) {
            return const TLoginPage();
          },
        );
      case teacher_register:
        return MaterialPageRoute(
          builder: (context) {
            return const TCreateAccount();
          },
        );
      case teacher_verifyemailregister:
        return MaterialPageRoute(
          builder: (context) {
            return const TVerificationEmailRegister();
          },
        );
      case teacher_checkemailregister:
        return MaterialPageRoute(
          builder: (context) {
            return const TCheckEmailRegister();
          },
        );
      case teacher_setupaccount:
        return MaterialPageRoute(
          builder: (context) {
            return const TSetUpAccount();
          },
        );
      case teacher_forgetPassword:
        return MaterialPageRoute(
          builder: (context) {
            return const TForgetPasswordPage();
          },
        );
      case teacher_checkemailpage:
        return MaterialPageRoute(
          builder: (context) {
            return TCheckEmailpage();
          },
        );

      case teacher_verifypasspage:
        return MaterialPageRoute(
          builder: (context) {
            return const TVerifyPassPage();
          },
        );
      case teacher_createpassword:
        return MaterialPageRoute(
          builder: (context) {
            return const TCreatePassword();
          },
        );
      case teacher_sucesspassword:
        return MaterialPageRoute(
          builder: (context) {
            return const TSuccessPassword();
          },
        );
      case teacher_home:
        return MaterialPageRoute(
          builder: (context) {
            return const THome();
          },
        );
      case teacher_homepage:
        return MaterialPageRoute(
          builder: (context) {
            return const T_HomePage();
          },
        );
      case teacher_message:
        return MaterialPageRoute(
          builder: (context) {
            return const T_MessagePage();
          },
        );
      case teacher_QR:
        return MaterialPageRoute(
          builder: (context) {
            return const T_QRPage();
          },
        );
      case teacher_notification:
        return MaterialPageRoute(
          builder: (context) {
            return const T_NotificationPage();
          },
        );
      case teacher_profile:
        return MaterialPageRoute(
          builder: (context) {
            return const T_ProfilePage();
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
