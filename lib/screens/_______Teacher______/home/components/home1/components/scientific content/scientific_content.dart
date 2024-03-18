import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_ScientificContent extends StatefulWidget {
  const T_ScientificContent({super.key});

  @override
  State<T_ScientificContent> createState() => _T_ScientificContentState();
}

class _T_ScientificContentState extends State<T_ScientificContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              child: Stack(children: [
        Image.asset(
          Assets.scientificcontentcolor,
          fit: BoxFit.fill,
          width: 100.w,
          height: 25.h,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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

              Text("Math",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.sp,
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

              ////////////////apllied reviewed contacted////////////////////
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
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
                                    Image.asset(Assets.math,
                                        fit: BoxFit.cover,
                                        width: 35.w,
                                        height: 30.h,
                                        color: Colors.black.withOpacity(0.5)),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          backgroundImage:
                                              AssetImage(Assets.math),
                                          radius: 17.sp,
                                          backgroundColor:
                                              const Color(0xffD9D9D9),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "Lecture 1",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                AppRoutes.teacher_content);
                                          },
                                          child: const CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Color(0xff168B45),
                                            child: Icon(
                                              Icons.arrow_right_alt_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 1,
                        color: Colors.transparent,
                      );
                    },
                    itemCount: 10),
              ),
            ]))
      ]))),
    );
  }
}
