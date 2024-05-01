import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class P_SubjectDegree extends StatefulWidget {
  const P_SubjectDegree({super.key});

  @override
  State<P_SubjectDegree> createState() => _SubjectDegreeState();
}

class _SubjectDegreeState extends State<P_SubjectDegree> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Image.asset(
                Assets.scientificcontentcolor,
                fit: BoxFit.fill,
                width: 100.w,
                height: 25.h,
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
                      height: 4.h,
                      color: Colors.transparent,
                    ),
                    Text("Exams degree",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700)),
                    Divider(
                      height: 1.h,
                      color: Colors.transparent,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(Assets.math),
                      radius: 35,
                      backgroundColor: const Color(0xffD9D9D9),
                    ),
                    Divider(
                      height: 1.h,
                      color: Colors.transparent,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff81B783)),
                      height: 10.h,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 10.h,
                            width: 75.w,
                            child: Row(
                              children: [
                                const Spacer(),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(Assets.math),
                                      radius: 17.sp,
                                      backgroundColor: const Color(0xffD9D9D9),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  const Text(
                                    "Exam 1 ",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, AppRoutes.teacher_content);
                                      },
                                      child: const CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Color(0xff168B45),
                                          child: Text(
                                            '90',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff81B783)),
                      height: 10.h,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 10.h,
                            width: 75.w,
                            child: Row(
                              children: [
                                const Spacer(),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(Assets.math),
                                      radius: 17.sp,
                                      backgroundColor: const Color(0xffD9D9D9),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  const Text(
                                    "Exam 2 ",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {},
                                      child: const CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Color(0xff168B45),
                                          child: Text(
                                            '87',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
