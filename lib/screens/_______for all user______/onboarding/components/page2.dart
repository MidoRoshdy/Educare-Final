// ignore_for_file: camel_case_types

import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______for%20all%20user______/onboarding/provider/onboardingprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class OnBoarding_page2 extends StatelessWidget {
  OnBoarding_page2({super.key});
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Image.asset(
                  Assets.logoonx2,
                  height: 5.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.chooseuser, (route) => false);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        color: AppColours.neutral500,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                ),
              ]),
              Image.asset(
                Assets.onboarding2,
                scale: 2.sp,
              ),
              Divider(
                height: 2.h,
                color: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'We guarantee you',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
                        ),
                        Text(
                          ' easy',
                          style: TextStyle(
                              color: AppColours.textonboarding,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.values[0],
                              fontSize: 18.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          ' communication',
                          style: TextStyle(
                              color: AppColours.textonboarding,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp),
                        ),
                        Text(
                          ' with',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
                        ),
                      ],
                    ),
                    Text(
                      ' teachers',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 2.h,
                color: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, left: 16, right: 16),
                child: Text(
                  'We seek to facilitate the process of communication and      follow-up between schools and parents to ensure the           success and progress of students',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    height: 0,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 1.8.w,
                        height: 1.8.w,
                        decoration: BoxDecoration(
                            color: AppColours.text2,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        width: 1.2.w,
                      ),
                      Container(
                        width: 7.w,
                        height: 2.5.w,
                        decoration: BoxDecoration(
                            color: const Color(0xFF102693),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        width: 1.2.w,
                      ),
                      Container(
                        width: 1.8.w,
                        height: 1.8.w,
                        decoration: BoxDecoration(
                            color: AppColours.text2,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 35.w,
                    height: 6.h,
                    child: ElevatedButton(
                      onPressed: () async {
                        context
                            .read<OnBoardingProvider>()
                            .state
                            .pagecontroller
                            .nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF102693),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  topLeft: Radius.circular(30)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 12.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 5.h,
                color: Colors.transparent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
