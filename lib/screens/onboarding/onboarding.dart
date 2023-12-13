import 'package:educare/screens/onboarding/components/page1.dart';
import 'package:educare/screens/onboarding/components/page2.dart';
import 'package:educare/screens/onboarding/components/page3.dart';
import 'package:educare/screens/onboarding/provider/onboardingprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});

  List<Widget> pages = [
    OnBoarding_page1(),
    OnBoarding_page2(),
    OnBoarding_page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView(
              controller:
                  context.read<OnBoardingProvider>().state.pagecontroller,
              children: pages),
        ),
      ],
    ));
  }
}
