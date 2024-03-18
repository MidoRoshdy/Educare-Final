// ignore_for_file: avoid_print, unused_import
import 'package:educare/screens/_______Teacher______/home/provider/T_homeprovider.dart';
import 'package:educare/screens/_______for%20all%20user______/SplashScreen/provider/splashprovider.dart';
import 'package:educare/screens/_______Parents______/home/provider/homeprovider.dart';
import 'package:educare/screens/_______Parents______/userhandel/choose%20student/provider/chosestudentprovider.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/forget%20password/Tforgetpassword.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/forget%20password/provider/Tforgetpasswordprovider.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/login/provider/Tloginprovider.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/signup/provider/Tsignupprovider.dart';
import 'package:educare/screens/_______for%20all%20user______/onboarding/provider/onboardingprovider.dart';
import 'package:educare/screens/_______Parents______/userhandel/another%20child/provider/anotherchildprovider.dart';
import 'package:educare/screens/_______Parents______/userhandel/forgetpassword/provider/forgetpasswordprovider.dart';
import 'package:educare/screens/_______Parents______/userhandel/login/provider/loginprovider.dart';
import 'package:educare/screens/_______Parents______/userhandel/signup/provider/signupprovder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, DeviceType deviceType) {
      print(orientation);
      return MultiProvider(
        providers: [
          ListenableProvider<SplashProvider>(create: (_) => SplashProvider()),
          ListenableProvider<OnBoardingProvider>(
              create: (_) => OnBoardingProvider()),
          ListenableProvider<LoginProvider>(create: (_) => LoginProvider()),
          ListenableProvider<CreateAccountProvider>(
              create: (_) => CreateAccountProvider()),
          ListenableProvider<ForgetPasswordProvider>(
              create: (_) => ForgetPasswordProvider()),
          ListenableProvider<HomeProvider>(create: (_) => HomeProvider()),
          ListenableProvider<AnotherChildProvider>(
              create: (_) => AnotherChildProvider()),
          ListenableProvider<ChooseStudentProvider>(
              create: (_) => ChooseStudentProvider()),
          /////teacher///
          ListenableProvider<TLoginProvider>(create: (_) => TLoginProvider()),
          ListenableProvider<TeacherCreateAccountProvider>(
              create: (_) => TeacherCreateAccountProvider()),
          ListenableProvider<TForgetPasswordProvider>(
              create: (_) => TForgetPasswordProvider()),
          ListenableProvider<THomeProvider>(create: (_) => THomeProvider()),
        ],
        child: MaterialApp(
          title: "Educare",
          initialRoute: AppRoutes.splash,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      );
    });
  }
}
