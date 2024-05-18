// ignore_for_file: camel_case_types, unnecessary_import, unused_import, non_constant_identifier_names

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

class T_Schedule extends StatefulWidget {
  final String teachername;
  final String teachersubject;
  final String teacherid;
  final String Sub_code;
  const T_Schedule(
      {super.key,
      required this.teachername,
      required this.teachersubject,
      required this.teacherid,
      required this.Sub_code});

  @override
  State<T_Schedule> createState() => _T_ScheduleState();
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

class _T_ScheduleState extends State<T_Schedule> {
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
                Text("Schedule",
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
                      color: AppColours.neutral100),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => setState(() {
                          context
                                  .read<THomeProvider>()
                                  .state
                                  .selectedDayForSchedule =
                              SelectedDayForSchedule.sun;
                        }),
                        child: Container(
                          width: 15.w,
                          height: 7.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: context
                                          .read<THomeProvider>()
                                          .state
                                          .selectedDayForSchedule ==
                                      SelectedDayForSchedule.sun
                                  ? AppColours.menuhome4
                                  : null),
                          //Description
                          child: Text(
                            "Sun",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w500,
                                color: context
                                            .read<THomeProvider>()
                                            .state
                                            .selectedDayForSchedule ==
                                        SelectedDayForSchedule.sun
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => setState(() {
                          context
                                  .read<THomeProvider>()
                                  .state
                                  .selectedDayForSchedule =
                              SelectedDayForSchedule.mon;
                        }),
                        child: Container(
                          width: 15.w,
                          height: 7.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: context
                                          .read<THomeProvider>()
                                          .state
                                          .selectedDayForSchedule ==
                                      SelectedDayForSchedule.mon
                                  ? AppColours.menuhome4
                                  : null),
                          //company
                          child: Text(
                            "Mon",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w500,
                                color: context
                                            .read<THomeProvider>()
                                            .state
                                            .selectedDayForSchedule ==
                                        SelectedDayForSchedule.mon
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => setState(() {
                          context
                                  .read<THomeProvider>()
                                  .state
                                  .selectedDayForSchedule =
                              SelectedDayForSchedule.tue;
                        }),
                        child: Container(
                          width: 15.w,
                          height: 7.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: context
                                          .read<THomeProvider>()
                                          .state
                                          .selectedDayForSchedule ==
                                      SelectedDayForSchedule.tue
                                  ? AppColours.menuhome4
                                  : null),
                          //people
                          child: Text(
                            "Tue",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w500,
                                color: context
                                            .read<THomeProvider>()
                                            .state
                                            .selectedDayForSchedule ==
                                        SelectedDayForSchedule.tue
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => setState(() {
                          context
                                  .read<THomeProvider>()
                                  .state
                                  .selectedDayForSchedule =
                              SelectedDayForSchedule.wed;
                        }),
                        child: Container(
                          width: 15.w,
                          height: 7.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: context
                                          .read<THomeProvider>()
                                          .state
                                          .selectedDayForSchedule ==
                                      SelectedDayForSchedule.wed
                                  ? AppColours.menuhome4
                                  : null),
                          //people
                          child: Text(
                            "wed",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w500,
                                color: context
                                            .read<THomeProvider>()
                                            .state
                                            .selectedDayForSchedule ==
                                        SelectedDayForSchedule.wed
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => setState(() {
                          context
                                  .read<THomeProvider>()
                                  .state
                                  .selectedDayForSchedule =
                              SelectedDayForSchedule.thu;
                        }),
                        child: Container(
                          width: 15.w,
                          height: 7.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: context
                                          .read<THomeProvider>()
                                          .state
                                          .selectedDayForSchedule ==
                                      SelectedDayForSchedule.thu
                                  ? AppColours.menuhome4
                                  : null),
                          //people
                          child: Text(
                            "thu",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w500,
                                color: context
                                            .read<THomeProvider>()
                                            .state
                                            .selectedDayForSchedule ==
                                        SelectedDayForSchedule.thu
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 2.h,
                ),
                Expanded(
                    child: FadingEdgeScrollView.fromSingleChildScrollView(
                        gradientFractionOnEnd: 0.6,
                        child: SingleChildScrollView(
                            controller: scrollController,
                            child: context
                                .watch<THomeProvider>()
                                .chosenscheduleforteacher())))
              ]))
        ]),
      ),
    );
  }
}
