// ignore_for_file: prefer_const_constructors, sort_child_properties_last, camel_case_types, file_names, prefer_const_literals_to_create_immutables

import 'package:educare/core/Assets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class P_ContentMath extends StatefulWidget {
  const P_ContentMath({super.key});

  @override
  State<P_ContentMath> createState() => _P_ContentMathState();
}

class _P_ContentMathState extends State<P_ContentMath> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: Stack(children: [
      Image.asset(
        Assets.scientificcontentcolor,
        fit: BoxFit.fill,
        width: 100.w,
        height: 30.h,
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
            Divider(
              height: 6.h,
              color: Colors.transparent,
            ),
            SizedBox(
              height: 2.h,
            ),

            Text("Math",
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
              backgroundColor: Color(0xffD9D9D9),
            ),
            Divider(
              height: 1.h,
              color: Colors.transparent,
            ),

            ////////////////apllied reviewed contacted////////////////////
            Padding(
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
                                backgroundImage: AssetImage(Assets.homewrok),
                                radius: 17.sp,
                                backgroundColor: const Color(0xffD9D9D9),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            const Text(
                              "Lecture 1 ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
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
                                    child: Icon(
                                      Iconsax.arrow_right,
                                      color: Colors.white,
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
            ),
          ]))
    ]))));
  }
}
