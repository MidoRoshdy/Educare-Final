import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class ChooseUser extends StatelessWidget {
  const ChooseUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          Assets.backgroundapp,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SafeArea(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Image.asset(
                    Assets.logoonx2,
                    scale: 4.sp,
                  )
                ]),
              ),
              Divider(
                height: 2.h,
                color: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Text("choose user :",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColours.text)),
                  ],
                ),
              ),
              Divider(
                height: 20.h,
                color: Colors.transparent,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 35.w,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColours.neutral200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Center(
                        child: Column(
                          children: [
                            Lottie.asset(
                              Assets.lottiteacher,
                              height: 15.h,
                              width: 35.w,
                            ),
                            Text(
                              "Teacher",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                    width: 35.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.login);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColours.neutral200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Center(
                        child: Column(
                          children: [
                            Lottie.asset(
                              Assets.lottieparent,
                              height: 15.h,
                              width: 35.w,
                            ),
                            Text(
                              "Parent",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 90.w,
                height: 7.h,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamed(AppRoutes.login);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColours.text,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "confirm",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Divider(
                height: 1.h,
                color: Colors.transparent,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
