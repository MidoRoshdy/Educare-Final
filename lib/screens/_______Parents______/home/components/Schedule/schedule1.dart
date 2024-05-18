// ignore_for_file: camel_case_types, unnecessary_import, unused_import, prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'dart:convert';
import 'package:educare/core/colors.dart';
import 'package:educare/core/enum.dart';
import 'package:educare/screens/_______Parents______/home/provider/homeprovider.dart';
import 'package:educare/screens/_______Teacher______/home/provider/T_homeprovider.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/cupertino.dart';
import 'package:jiffy/jiffy.dart';
import 'package:educare/core/Assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class P_Schedule extends StatefulWidget {
  final String Class;
  final String grade;
  final String code;
  const P_Schedule(
      {super.key,
      required this.Class,
      required this.grade,
      required this.code});

  @override
  State<P_Schedule> createState() => _T_ScheduleState();
}

ScrollController scrollController = ScrollController();

DateTime now = DateTime.now();
int year = now.year;
int month = now.month;
int day = now.day;
int hour = now.hour;
int minute = now.minute;
int second = now.second;
String dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thur", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';

  dynamic monthData =
      '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

  return json.decode(dayData)['${date.weekday}'] +
      ", " +
      date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'] +
      " " +
      date.year.toString();
}

class _T_ScheduleState extends State<P_Schedule> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
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
                Text("Student schedule ",
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
                  child: Row(
                    children: [
                      Text(Jiffy.now().format(pattern: "dd"),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w700)),
                      VerticalDivider(
                        color: Colors.black,
                        width: 2.w,
                      ),
                      Column(
                        children: [
                          Text(Jiffy.now().format(pattern: "EE"),
                              style: TextStyle(
                                  color: AppColours.neutral500,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500)),
                          Row(
                            children: [
                              Text(Jiffy.now().format(pattern: "MMM"),
                                  style: TextStyle(
                                      color: AppColours.neutral500,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500)),
                              VerticalDivider(
                                color: Colors.black,
                                width: 1.w,
                              ),
                              Text(Jiffy.now().format(pattern: "yyyy"),
                                  style: TextStyle(
                                      color: AppColours.neutral500,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2.h,
                  color: Colors.transparent,
                ),
                Container(
                  width: 95.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black.withOpacity(0.6)),
                    color: Color(0xff33326F),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0.sp, right: 8.0.sp),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => setState(() {
                            context
                                    .read<HomeProvider>()
                                    .state
                                    .SelectedDayForScheduleparentt =
                                SelectedDayForScheduleparent.sun1;
                          }),
                          child: Container(
                            width: 7.w,
                            height: 7.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: context
                                            .read<HomeProvider>()
                                            .state
                                            .SelectedDayForScheduleparentt ==
                                        SelectedDayForScheduleparent.sun1
                                    ? AppColours.menuhome4
                                    : null),
                            //Description
                            child: Text(
                              "Sun",
                              style: TextStyle(
                                  fontSize: 9.5.sp,
                                  fontWeight: FontWeight.w500,
                                  color: context
                                              .read<HomeProvider>()
                                              .state
                                              .SelectedDayForScheduleparentt ==
                                          SelectedDayForScheduleparent.sun1
                                      ? Colors.white
                                      : Colors.white),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => setState(() {
                            context
                                    .read<HomeProvider>()
                                    .state
                                    .SelectedDayForScheduleparentt =
                                SelectedDayForScheduleparent.mon1;
                          }),
                          child: Container(
                            width: 7.w,
                            height: 7.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: context
                                            .read<HomeProvider>()
                                            .state
                                            .SelectedDayForScheduleparentt ==
                                        SelectedDayForScheduleparent.mon1
                                    ? AppColours.menuhome4
                                    : null),
                            //company
                            child: Text(
                              "Mon",
                              style: TextStyle(
                                  fontSize: 9.5.sp,
                                  fontWeight: FontWeight.w500,
                                  color: context
                                              .read<HomeProvider>()
                                              .state
                                              .SelectedDayForScheduleparentt ==
                                          SelectedDayForScheduleparent.mon1
                                      ? Colors.white
                                      : Colors.white),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => setState(() {
                            context
                                    .read<HomeProvider>()
                                    .state
                                    .SelectedDayForScheduleparentt =
                                SelectedDayForScheduleparent.tue1;
                          }),
                          child: Container(
                            width: 7.w,
                            height: 7.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: context
                                            .read<HomeProvider>()
                                            .state
                                            .SelectedDayForScheduleparentt ==
                                        SelectedDayForScheduleparent.tue1
                                    ? AppColours.menuhome4
                                    : null),
                            //people
                            child: Text(
                              "Tue",
                              style: TextStyle(
                                  fontSize: 9.5.sp,
                                  fontWeight: FontWeight.w500,
                                  color: context
                                              .read<HomeProvider>()
                                              .state
                                              .SelectedDayForScheduleparentt ==
                                          SelectedDayForScheduleparent.tue1
                                      ? Colors.white
                                      : Colors.white),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => setState(() {
                            context
                                    .read<HomeProvider>()
                                    .state
                                    .SelectedDayForScheduleparentt =
                                SelectedDayForScheduleparent.wed1;
                          }),
                          child: Container(
                            width: 7.w,
                            height: 7.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: context
                                            .read<HomeProvider>()
                                            .state
                                            .SelectedDayForScheduleparentt ==
                                        SelectedDayForScheduleparent.wed1
                                    ? AppColours.menuhome4
                                    : null),
                            //people
                            child: Text(
                              "wed",
                              style: TextStyle(
                                  fontSize: 9.5.sp,
                                  fontWeight: FontWeight.w500,
                                  color: context
                                              .read<HomeProvider>()
                                              .state
                                              .SelectedDayForScheduleparentt ==
                                          SelectedDayForScheduleparent.wed1
                                      ? Colors.white
                                      : Colors.white),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => setState(() {
                            context
                                    .read<HomeProvider>()
                                    .state
                                    .SelectedDayForScheduleparentt =
                                SelectedDayForScheduleparent.thu1;
                          }),
                          child: Container(
                            width: 7.w,
                            height: 7.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: context
                                            .read<HomeProvider>()
                                            .state
                                            .SelectedDayForScheduleparentt ==
                                        SelectedDayForScheduleparent.thu1
                                    ? AppColours.menuhome4
                                    : null),
                            //people
                            child: Text(
                              "thu",
                              style: TextStyle(
                                  fontSize: 9.5.sp,
                                  fontWeight: FontWeight.w500,
                                  color: context
                                              .read<HomeProvider>()
                                              .state
                                              .SelectedDayForScheduleparentt ==
                                          SelectedDayForScheduleparent.thu1
                                      ? Colors.white
                                      : Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 2.h,
                ),
                Container(
                  width: 100.w,
                  height: 60.h,
                  child: FadingEdgeScrollView.fromSingleChildScrollView(
                      gradientFractionOnEnd: 0.6,
                      child: SingleChildScrollView(
                          controller: scrollController,
                          child: context
                              .watch<HomeProvider>()
                              .chosenscheduleforteacher())),
                )
              ]))
        ]),
      ),
    );
  }
}
