import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class SetUpAccount extends StatelessWidget {
  const SetUpAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Iconsax.arrow_left4)),
                      Image.asset(
                        Assets.logoonx2,
                        height: 5.h,
                      )
                    ]),
                Divider(
                  height: 20.h,
                  color: Colors.transparent,
                ),
                Column(
                  children: [
                    Center(
                      child: Image.asset(
                        Assets.createacountsucces,
                        scale: 2.sp,
                      ),
                    ),
                    Divider(
                      height: 2.h,
                      color: Colors.transparent,
                    ),
                    Text(
                      "Your account has been set up!",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
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
                          child: Text(
                              "We have customized feeds according to your ",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColours.neutral500)),
                        ),
                      ],
                    ),
                    Text("preferences",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColours.neutral500))
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 90.w,
                  height: 7.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.login, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColours.text,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Divider(
                  height: 2.h,
                  color: Colors.transparent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
