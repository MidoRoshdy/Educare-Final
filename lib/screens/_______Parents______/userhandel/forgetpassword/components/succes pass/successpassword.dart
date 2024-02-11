import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/app_routes.dart';

class SuccessPassword extends StatelessWidget {
  const SuccessPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Iconsax.arrow_left4)),
                        Image.asset(
                          Assets.logoonx2,
                          height: 4.h,
                        )
                      ]),
                ),
                Divider(
                  height: 10.h,
                  color: Colors.transparent,
                ),
                Column(
                  children: [
                    Center(
                      child: Image.asset(
                        Assets.passwordsuccess,
                        scale: 1.8.sp,
                      ),
                    ),
                    Divider(
                      height: 6.h,
                      color: Colors.transparent,
                    ),
                    Text(
                      "Password changed succesfully!",
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    Divider(
                      height: 1.h,
                      color: Colors.transparent,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VerticalDivider(
                          width: 2.w,
                          color: Colors.transparent,
                        ),
                        Flexible(
                          child: Text("Your password has been changed",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColours.neutral500)),
                        ),
                      ],
                    ),
                    Text(" successfully, we will let you know if there ",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColours.neutral500)),
                    Text(" are more problems with your account",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColours.neutral500))
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 20, top: 15),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.parents_login);
          },
          child: Container(
            height: 48,
            width: 343,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xff2E3192),
            ),
            child: const Center(
              child: Text(
                'confirm',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
