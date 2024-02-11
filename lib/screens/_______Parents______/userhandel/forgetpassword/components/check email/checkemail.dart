import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckEmailpage extends StatelessWidget {
  CheckEmailpage({super.key});
  final websiteuri = Uri.parse("https://mail.google.com/mail/u/0/#inbox");
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
                      height: 6.h,
                      color: Colors.transparent,
                    ),
                    Text(
                      "Check your Email",
                      style: TextStyle(
                        fontSize: 18.sp,
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
            Navigator.of(context).pushNamed(AppRoutes.Parents_verifypasspage);
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
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
