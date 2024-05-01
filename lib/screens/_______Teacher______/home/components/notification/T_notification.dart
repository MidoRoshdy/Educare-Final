// ignore_for_file: file_names, camel_case_types, unused_import, unnecessary_import, prefer_const_constructors

import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_NotificationPage extends StatefulWidget {
  const T_NotificationPage({super.key});

  @override
  State<T_NotificationPage> createState() => _T_NotificationPageState();
}

class _T_NotificationPageState extends State<T_NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Image.asset(
        Assets.colorhome,
        fit: BoxFit.fill,
        width: 100.w,
        height: 20.h,
      ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Divider(
              height: 1.h,
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Image.asset(
                      Assets.logoonx2,
                      height: 4.h,
                    )
                  ]),
            ),
            Text("Notification",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700)),
            Divider(
              height: 6.h,
              color: Colors.transparent,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(3.w),
                        height: 11.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(Colors.grey.value),
                            ),
                            borderRadius: BorderRadius.circular(2.w)),
                        child: Row(children: [
                          Column(
                            children: [
                              Image.asset(
                                Assets.homewrok,
                                scale: 10.sp,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            width: 4.w,
                            color: Colors.transparent,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("H.W "),
                              Divider(
                                height: 2.h,
                              ),
                              Text("EX:5 P:120",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 10.sp,
                                  )),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                      backgroundColor: Colors.yellow,
                                      radius: 5),
                                  VerticalDivider(
                                    width: 1.w,
                                  ),
                                  const Text("10.00AM"),
                                ],
                              )
                            ],
                          )
                        ]),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 1.h,
                    );
                  },
                  itemCount: 4),
            )
          ]))
    ])));
  }
}
