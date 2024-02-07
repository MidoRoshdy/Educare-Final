import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Parents______/userhandel/signup/provider/signupprovder.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            //background image////
            Image.asset(
              Assets.colorhome,
              fit: BoxFit.fill,
              width: 100.w,
              height: 34.h,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(
                      height: 2.5.h,
                      color: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Spacer(),
                          Image.asset(Assets.logoonx2, height: 4.h),
                        ],
                      ),
                    ),
                    Divider(
                      height: 0.5.h,
                      color: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          const Text("Ziad Mohamed",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          VerticalDivider(
                            width: 37.w,
                            color: Colors.transparent,
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: AppColours.neutral300,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Iconsax.user),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        children: [
                          Text("Welcome Back :",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400)),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1.h,
                      color: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Container(
                            height: 4.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              color: AppColours.neutral200,
                              border: Border.all(color: AppColours.primary400),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              "2023-2024",
                              style: TextStyle(color: AppColours.primary700),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1.h,
                      color: Colors.transparent,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 26.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              color: AppColours.neutral100,
                              border: Border.all(color: AppColours.primary400),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 48.sp,
                                    width: 48.sp,
                                    decoration: BoxDecoration(
                                      color: AppColours.warning200,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Iconsax.teacher5,
                                      color: AppColours.warning800,
                                    ),
                                  ),
                                  Divider(
                                    height: 1.h,
                                    color: Colors.transparent,
                                  ),
                                  Text("2",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold)),
                                  Divider(
                                    height: 1.h,
                                    color: Colors.transparent,
                                  ),
                                  Text("Child",
                                      style: TextStyle(
                                          color: AppColours.primary700,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            )),
                        Container(
                            height: 26.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              color: AppColours.neutral100,
                              border: Border.all(color: AppColours.primary400),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 48.sp,
                                    width: 48.sp,
                                    decoration: BoxDecoration(
                                      color: Colors.purple[100],
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Iconsax.profile_2user,
                                      color: Colors.purple,
                                    ),
                                  ),
                                  Divider(
                                    height: 1.h,
                                    color: Colors.transparent,
                                  ),
                                  Text("89.6%",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold)),
                                  Divider(
                                    height: 1.h,
                                    color: Colors.transparent,
                                  ),
                                  Text(
                                    "Attendance",
                                    style: TextStyle(
                                        color: AppColours.primary700,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    Divider(
                      height: 2.h,
                      color: Colors.transparent,
                    ),
                    //first row of buttons//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColours.menuhome,
                              border: Border.all(color: AppColours.primary300),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 20.h,
                            width: 40.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35.sp,
                                    width: 35.sp,
                                    decoration: BoxDecoration(
                                      color: AppColours.neutral100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Iconsax.calendar,
                                      color: Colors.purple,
                                      size: 25.sp,
                                    ),
                                  ),
                                  Divider(
                                    height: 3.h,
                                    color: Colors.transparent,
                                  ),
                                  Row(
                                    children: [
                                      Text("Student schedule",
                                          style: TextStyle(
                                              color: AppColours.primary800,
                                              fontSize: 12.5.sp,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColours.menuhome,
                              border: Border.all(color: AppColours.primary300),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 20.h,
                            width: 40.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35.sp,
                                    width: 35.sp,
                                    decoration: BoxDecoration(
                                      color: AppColours.neutral100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Iconsax.book_1,
                                      color: Colors.purple,
                                      size: 25.sp,
                                    ),
                                  ),
                                  Divider(
                                    height: 3.h,
                                    color: Colors.transparent,
                                  ),
                                  Row(
                                    children: [
                                      Text("Scientific content",
                                          style: TextStyle(
                                              color: AppColours.primary800,
                                              fontSize: 12.5.sp,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //second row of buttons//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColours.primary300),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 20.h,
                            width: 40.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35.sp,
                                    width: 35.sp,
                                    decoration: BoxDecoration(
                                      color: AppColours.neutral100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Iconsax.receipt_edit,
                                      color: Colors.orange[800],
                                      size: 25.sp,
                                    ),
                                  ),
                                  Divider(
                                    height: 3.h,
                                    color: Colors.transparent,
                                  ),
                                  Text("Exams degree",
                                      style: TextStyle(
                                          color: AppColours.primary800,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColours.primary300),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 20.h,
                            width: 40.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35.sp,
                                    width: 35.sp,
                                    decoration: BoxDecoration(
                                      color: AppColours.neutral100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Iconsax.clipboard_tick,
                                      color: AppColours.menuhome3,
                                      size: 25.sp,
                                    ),
                                  ),
                                  Divider(
                                    height: 3.h,
                                    color: Colors.transparent,
                                  ),
                                  Text("Reports",
                                      style: TextStyle(
                                          color: AppColours.primary800,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //third row of buttons//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColours.menuhome,
                              border: Border.all(color: AppColours.primary300),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 20.h,
                            width: 40.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35.sp,
                                    width: 35.sp,
                                    decoration: BoxDecoration(
                                      color: AppColours.neutral100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Iconsax.magicpen,
                                      color: AppColours.menuhome2,
                                      size: 25.sp,
                                    ),
                                  ),
                                  Divider(
                                    height: 3.h,
                                    color: Colors.transparent,
                                  ),
                                  Text("Events",
                                      style: TextStyle(
                                          color: AppColours.primary800,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColours.menuhome,
                              border: Border.all(color: AppColours.primary300),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 20.h,
                            width: 40.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35.sp,
                                    width: 35.sp,
                                    decoration: BoxDecoration(
                                      color: AppColours.neutral100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Iconsax.edit,
                                      color: AppColours.menuhome3,
                                      size: 25.sp,
                                    ),
                                  ),
                                  Divider(
                                    height: 3.h,
                                    color: Colors.transparent,
                                  ),
                                  Text("Tickets",
                                      style: TextStyle(
                                          color: AppColours.primary800,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //fourth row of buttons//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColours.primary300),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 20.h,
                            width: 40.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35.sp,
                                    width: 35.sp,
                                    decoration: BoxDecoration(
                                      color: AppColours.neutral100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Iconsax.wallet_1,
                                      color: AppColours.menuhome3,
                                      size: 25.sp,
                                    ),
                                  ),
                                  Divider(
                                    height: 3.h,
                                    color: Colors.transparent,
                                  ),
                                  Text("Tuition Expenses",
                                      style: TextStyle(
                                          color: AppColours.primary800,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
