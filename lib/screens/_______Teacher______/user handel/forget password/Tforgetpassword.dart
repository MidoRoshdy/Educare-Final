// ignore_for_file: file_names, use_build_context_synchronously

import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/forget%20password/provider/Tforgetpasswordprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TForgetPasswordPage extends StatelessWidget {
  const TForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  Assets.colorhome,
                  fit: BoxFit.fill,
                  width: 100.w,
                  height: 22.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Iconsax.arrow_left4,
                                  color: Colors.white,
                                )),
                            Image.asset(
                              Assets.logoonx2,
                              height: 4.h,
                            )
                          ]),
                      Divider(
                        height: 1.h,
                        color: Colors.transparent,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.05,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        softWrap: true,
                        "Please enter your email address associated with  ",
                        style: TextStyle(
                            color: const Color(0xff7D7D7D),
                            fontSize: 10.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        softWrap: true,
                        "your account ... ",
                        style: TextStyle(
                            color: const Color(0xff7D7D7D),
                            fontSize: 10.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 4.h,
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: EdgeInsets.all(1.w),
                margin: EdgeInsets.only(top: 3.5.h, bottom: 2.h),
                alignment: Alignment.center,
                height: 8.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1.sp, color: Colors.grey)),
                child: TextField(
                  controller: context
                      .read<TForgetPasswordProvider>()
                      .state
                      .forgetpasswordController,
                  style: TextStyle(fontSize: 14.sp),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    prefixIcon: Icon(
                      Iconsax.sms,
                    ),
                    prefixIconColor: Colors.grey,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Try another way",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff3970C1),
                        fontSize: 10.sp,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 20, top: 10),
        child: InkWell(
          onTap: () async {
            await FirebaseAuth.instance.sendPasswordResetEmail(
                email: context
                    .read<TForgetPasswordProvider>()
                    .state
                    .forgetpasswordController
                    .text);
            Navigator.of(context).pushNamed(AppRoutes.teacher_checkemailpage);
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
                'Request password reset',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
