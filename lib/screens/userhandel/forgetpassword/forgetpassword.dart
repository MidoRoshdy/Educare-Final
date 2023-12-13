import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset(
            Assets.logoonx2,
            scale: 0.7.h,
          ),
        ],
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left_2, size: 15.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                VerticalDivider(
                  width: 2.w,
                  color: Colors.transparent,
                ),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: const Color(0xff000000),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Divider(
              height: 4.h,
              color: Colors.transparent,
            ),
            Row(
              children: [
                VerticalDivider(
                  width: 2.w,
                  color: Colors.transparent,
                ),
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        softWrap: true,
                        "Please enter your email address associated with your account ... ",
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
            Container(
              padding: EdgeInsets.all(1.w),
              margin: EdgeInsets.only(top: 3.5.h, bottom: 2.h),
              alignment: Alignment.center,
              height: 8.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.sp, color: Colors.grey)),
              child: TextField(
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
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalDivider(
                  width: 30.w,
                  color: Colors.transparent,
                ),
                Text(
                  "Try another way",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xff7D7D7D),
                      fontSize: 10.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Divider(
              height: 1.h,
              color: Colors.transparent,
            ),
            SizedBox(
              width: 90.w,
              height: 7.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.checkemailpage, (route) => false);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: (AppColours.text),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  "Request password reset",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Divider(
              height: 3.h,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
