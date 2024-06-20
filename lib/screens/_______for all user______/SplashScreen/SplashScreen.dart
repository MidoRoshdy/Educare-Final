// ignore_for_file: use_build_context_synchronously, file_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/screens/_______for%20all%20user______/onboarding/components/page1.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    handleData(context);
    return AnimatedSplashScreen(
      splash: Scaffold(
        body: Stack(
          children: [
            Center(child: Image.asset(Assets.blursplash)),
            Center(child: Image.asset(Assets.splashimage))
          ],
        ),
      ),
      nextScreen: OnBoarding_page1(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 1700.sp,
      animationDuration: const Duration(seconds: 1),
    );
  }

  Future<void> handleData(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.onboarding, (route) => false);
  }
}
