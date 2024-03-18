// ignore_for_file: file_names, camel_case_types

import 'package:educare/core/Assets.dart';
import 'package:flutter/material.dart';
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
            Column(children: [
              /////////heder////////////////////////////////
              Text("Notification",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700)),
              Divider(
                height: 4.h,
                color: Colors.transparent,
              ),
            ])
          ]))
    ])));
  }
}
