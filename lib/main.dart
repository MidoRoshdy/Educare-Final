import 'package:educare/screens/SplashScreen/provider/splashprovider.dart';
import 'package:educare/screens/home/provider/homeprovider.dart';
import 'package:educare/screens/onboarding/provider/onboardingprovider.dart';
import 'package:educare/screens/userhandel/forgetpassword/provider/forgetpasswordprovider.dart';
import 'package:educare/screens/userhandel/login/provider/loginprovider.dart';
import 'package:educare/screens/userhandel/signup/provider/signupprovder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'core/app_routes.dart';

void main() {
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
