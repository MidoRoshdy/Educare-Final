// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class P_ExamDegree extends StatefulWidget {
  const P_ExamDegree({super.key});

  @override
  State<P_ExamDegree> createState() => _P_ExamDegreeState();
}

class _P_ExamDegreeState extends State<P_ExamDegree> {
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
                  Text("Exams degree",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700)),
                  Divider(
                    height: 6.h,
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
                                width: 40.w,
                                height: 23.h,
                                decoration: BoxDecoration(
                                  color: Color(0xff9E3E3E),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      Assets.arabic,
                                      fit: BoxFit.cover,
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
                                          backgroundImage:
                                              AssetImage(Assets.arabic),
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
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      AppRoutes.parents_subject_degree);
                                },
                                child: Container(
                                  width: 40.0.w,
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
                                            width: 40.w,
                                            height: 23.h,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 40,
                                                  horizontal: 10)),
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
                              width: 40.0.w,
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
                                        width: 40.w,
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
                              width: 40.0.w,
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
                                        width: 40.w,
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
                                width: 40.0.w,
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
                                          width: 40.w,
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
                                width: 40.0.w,
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
                                          width: 40.w,
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
                              width: 40.0.w,
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
                                        width: 40.w,
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
