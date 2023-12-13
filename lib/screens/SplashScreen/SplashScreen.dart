import 'package:educare/core/Assets.dart';
import 'package:flutter/material.dart';

import '../../core/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    handleData(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Center(child: Image.asset(Assets.blursplash)),
            Center(child: Image.asset(Assets.splashimage))
          ],
        ),
      ),
    );
  }

  Future<void> handleData(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.onboarding, (route) => false);
  }
}
