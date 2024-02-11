// ignore_for_file: camel_case_types

import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class OnBoarding_page3 extends StatelessWidget {
  OnBoarding_page3({super.key});
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
                Assets.onboarding3,
                scale: 2.sp,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'We prioritize your children\'s',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18.sp),
                    ),
                    Text('well-being and are here to ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        )),
                    Row(
                      children: [
                        Text(
                          'assist you ',
                          style: TextStyle(
                              color: AppColours.textonboarding,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp),
                        ),
                        Text(
                          'at every turn.',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, left: 16, right: 16),
                child: Text(
                  'Our utmost priority is ensuring the well-being of your children, and we are committed to providing assistance and support at every juncture to ensure their optimal growth and development.',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 10.sp),
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
                    ],
                  ),
                  SizedBox(
                    width: 35.w,
                    height: 6.h,
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.chooseuser, (route) => false);
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
