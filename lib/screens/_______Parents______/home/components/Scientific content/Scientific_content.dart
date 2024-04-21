// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, file_names

import 'package:educare/core/Assets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class P_ScientificContent extends StatefulWidget {
  const P_ScientificContent({super.key});

  @override
  State<P_ScientificContent> createState() => _T_NotificationPageState();
}

class _T_NotificationPageState extends State<P_ScientificContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                Assets.colorhome,
                fit: BoxFit.fill,
                width: 100.w,
                height: 20.h,
              ),
              Column(
                children: [
                  Divider(
                    height: 1.h,
                    color: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Iconsax.arrow_left_2,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            Assets.logoonx2,
                            height: 4.h,
                          )
                        ]),
                  ),
                  Text("Scientific Content",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700)),
                  Divider(
                    height: 4.h,
                    color: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 42.0.w,
                                height: 23.0.h,
                                decoration: BoxDecoration(
                                  color: Color(0xff9E3E3E),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      Assets.arabic,
                                      fit: BoxFit.fill,
                                      width: 42.w,
                                      height: 24.h,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 40, horizontal: 10)),
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Color(0xffD9D9D9),
                                          backgroundImage: AssetImage(
                                            Assets.arabic,
                                          ),
                                        ),
                                        Text(
                                          'Arabic',
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 42.0.w,
                                height: 23.0.h,
                                decoration: BoxDecoration(
                                  color: Color(0xff168B45),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          Assets.math,
                                          fit: BoxFit.fill,
                                          width: 42.w,
                                          height: 23.h,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 40, horizontal: 10)),
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Color(0xffD9D9D9),
                                          backgroundImage: AssetImage(
                                            Assets.math,
                                          ),
                                        ),
                                        Text(
                                          'Math',
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                        Divider(
                          height: 2.h,
                          color: Colors.transparent,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 42.0.w,
                              height: 23.0.h,
                              decoration: BoxDecoration(
                                color: Color(0xff00B091),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        Assets.science,
                                        fit: BoxFit.fill,
                                        width: 42.w,
                                        height: 23.h,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 40, horizontal: 10)),
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Color(0xffD9D9D9),
                                        backgroundImage: AssetImage(
                                          Assets.science,
                                        ),
                                      ),
                                      Text(
                                        'Sciences',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 42.0.w,
                              height: 23.0.h,
                              decoration: BoxDecoration(
                                color: Color(0xffA50294),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        Assets.computer,
                                        fit: BoxFit.fill,
                                        width: 42.w,
                                        height: 23.h,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 40, horizontal: 10)),
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Color(0xffD9D9D9),
                                        backgroundImage: AssetImage(
                                          Assets.computer,
                                        ),
                                      ),
                                      Text(
                                        'Computer',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 2.h,
                          color: Colors.transparent,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 42.0.w,
                                height: 23.0.h,
                                decoration: BoxDecoration(
                                  color: Color(0xff8F7F2A),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          Assets.english,
                                          fit: BoxFit.fill,
                                          width: 42.w,
                                          height: 23.h,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 40, horizontal: 10)),
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Color(0xffD9D9D9),
                                          backgroundImage: AssetImage(
                                            Assets.english,
                                          ),
                                        ),
                                        Text(
                                          'English',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 42.0.w,
                                height: 23.0.h,
                                decoration: BoxDecoration(
                                  color: Color(0xff1039A3),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          Assets.religon,
                                          fit: BoxFit.fill,
                                          width: 42.w,
                                          height: 23.h,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 40, horizontal: 10)),
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Color(0xffD9D9D9),
                                          backgroundImage: AssetImage(
                                            Assets.religon,
                                          ),
                                        ),
                                        Text(
                                          'Religion',
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                        Divider(
                          height: 2.h,
                          color: Colors.transparent,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 42.0.w,
                              height: 23.0.h,
                              decoration: BoxDecoration(
                                color: Color(0xff1A9EBB),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        Assets.history,
                                        fit: BoxFit.fill,
                                        width: 41.w,
                                        height: 23.h,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 40, horizontal: 10)),
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Color(0xffD9D9D9),
                                        backgroundImage: AssetImage(
                                          Assets.history,
                                        ),
                                      ),
                                      Text(
                                        'History',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
