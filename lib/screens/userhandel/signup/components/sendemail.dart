import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenAppPage extends StatelessWidget {
  const OpenAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final websiteuri = Uri.parse("https://mail.google.com/mail/u/0/#inbox");
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
                        Assets.sendemail,
                        scale: 2.sp,
                      ),
                    ),
                    Divider(
                      height: 2.h,
                      color: Colors.transparent,
                    ),
                    Text(
                      "Check your Email",
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
                          child: Text("We have sent a reset password to your ",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColours.neutral500)),
                        ),
                      ],
                    ),
                    Text(" email address",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColours.neutral500))
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    await launchUrl(websiteuri, mode: LaunchMode.inAppWebView);
                  },
                  child: Text("Open Email App",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColours.neutral500)),
                ),
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),
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
                      "continue",
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
