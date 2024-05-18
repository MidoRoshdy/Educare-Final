// ignore_for_file: avoid_print, prefer_const_constructors, non_constant_identifier_names, annotate_overrides, prefer_const_declarations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';

import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Parents______/home/components/Questions/Questions.dart';
import 'package:educare/screens/_______Parents______/home/components/Scientific%20content/Scientific_content.dart';
import 'package:educare/screens/_______Parents______/home/components/event/parents_event.dart';
import 'package:educare/screens/_______Parents______/home/components/exam%20degree/exam_degree.dart';
import 'package:educare/screens/_______Parents______/home/components/reports/P_reports.dart';
import 'package:educare/screens/_______Parents______/home/components/tution%20expenses/tuitionexpenses.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePage extends StatefulWidget {
  final String user_name;
  final String Class;
  final String grade;
  final String code;
  final String photo;

  const HomePage({
    super.key,
    required this.user_name,
    required this.Class,
    required this.grade,
    required this.code,
    required this.photo,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String parentname = "";
  String parentid = "";
  void initState() {
    getdata();
    getdata2();
    getData3();
    super.initState();
  }

  bool isLoading = true;
  final List<Meeting> meetings = [];

  Future<void> getData3() async {
    try {
      print("Fetching data...");
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('qr code')
          .where("code", arrayContainsAny: [widget.code]).get();
      print("Data fetched: ${querySnapshot.docs.length} documents found.");

      for (var doc in querySnapshot.docs) {
        print("Document data: ${doc.data()}");

        final eventName = doc['subject'] ?? 'Conference';
        final int year = doc['year'];
        final int month = doc['month'];
        final int day = doc['day'];
        final DateTime startTime = DateTime(year, month, day, 9, 0, 0);
        final DateTime endTime = startTime.add(const Duration(hours: 2));
        final Color background = const Color(0xFF0F8644);
        final bool isAllDay = false;

        print("Adding meeting: $eventName on $startTime");

        meetings
            .add(Meeting(eventName, startTime, endTime, background, isAllDay));
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  bool isloading = true;
  final List<QueryDocumentSnapshot> _data = [];
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('ParentsUsers')
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    _data.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  final List<QueryDocumentSnapshot> _data2 = [];
  getdata2() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('MyChildreen')
        .where("parent id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    _data2.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

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
              padding: EdgeInsets.only(left: 8.0.sp, right: 8.0.sp, top: 8.sp),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(
                      height: 2.5.h,
                      color: Colors.transparent,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.sp),
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
                      padding: EdgeInsets.only(left: 8.sp),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(widget.user_name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 20.sp),
                            child: Container(
                                height: 9.h,
                                width: 14.w,
                                decoration: BoxDecoration(
                                  color: AppColours.neutral300,
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                  radius: 1.sp,
                                  backgroundImage: NetworkImage(widget.photo),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0.sp, right: 8.0..sp),
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
                      padding: EdgeInsets.only(left: 8.sp),
                      child: Row(
                        children: [
                          Container(
                            height: 4.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              color: AppColours.neutral200,
                              border: Border.all(color: AppColours.primary400),
                              borderRadius: BorderRadius.circular(10.sp),
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
                      height: 2.h,
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
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          AppRoutes.Parents_choosestudent);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(7.sp),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 9.h,
                                            width: 25.w,
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
                                          Text(_data2.length.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22.sp,
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
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    height: 1.h,
                                    color: Colors.transparent,
                                  );
                                },
                                itemCount: 1)),
                        Container(
                            height: 26.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              color: AppColours.neutral100,
                              border: Border.all(color: AppColours.primary400),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(7.sp),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 9.h,
                                          width: 25.w,
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
                                        Text(
                                            '${(meetings.length / 100 * 100).toStringAsFixed(2)}%', // Calculates the percentage and converts it to a string with two decimal places
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 22.sp,
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
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    height: 1.h,
                                    color: Colors.transparent,
                                  );
                                },
                                itemCount: 1)),
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
                          padding: EdgeInsets.all(7.sp),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColours.menuhome,
                              border: Border.all(color: AppColours.primary300),
                              borderRadius: BorderRadius.circular(20.sp),
                            ),
                            height: 20.h,
                            width: 40.w,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.Parents_schedule);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(7.sp),
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
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => P_ScientificContent(
                                      user_name: widget.user_name,
                                      Class: widget.Class,
                                      grade: widget.grade,
                                      code: widget.code,
                                      photo: widget.photo,
                                    ),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColours.menuhome,
                                border:
                                    Border.all(color: AppColours.primary300),
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              height: 20.h,
                              width: 40.w,
                              child: Padding(
                                padding: EdgeInsets.all(7.sp),
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
                                                fontSize: 11.5.sp,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
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
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: AppColours.primary300),
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              height: 20.h,
                              width: 40.w,
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    P_ExamDegree(
                                                      Class: widget.Class,
                                                      grade: widget.grade,
                                                      code: widget.code,
                                                    )));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(7.sp),
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
                                                    color:
                                                        AppColours.primary800,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 1.h,
                                      color: Colors.transparent,
                                    );
                                  },
                                  itemCount: 1)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: AppColours.primary300),
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              height: 20.h,
                              width: 40.w,
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => P_reports(
                                                      Class: widget.Class,
                                                      grade: widget.grade,
                                                      code: widget.code,
                                                    )));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(8.sp),
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
                                                    color:
                                                        AppColours.primary800,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 1.h,
                                      color: Colors.transparent,
                                    );
                                  },
                                  itemCount: 1)),
                        ),
                      ],
                    ),
                    //third row of buttons//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                              decoration: BoxDecoration(
                                color: AppColours.menuhome,
                                border:
                                    Border.all(color: AppColours.primary300),
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              height: 20.h,
                              width: 40.w,
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => P_Event(
                                                      parentname: parentname,
                                                      parentid: parentid,
                                                    )));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(7.sp),
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
                                                    color:
                                                        AppColours.primary800,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 1.h,
                                      color: Colors.transparent,
                                    );
                                  },
                                  itemCount: 1)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.Parents_tickets);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColours.menuhome,
                                border:
                                    Border.all(color: AppColours.primary300),
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              height: 20.h,
                              width: 40.w,
                              child: Padding(
                                padding: EdgeInsets.all(7.sp),
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
                                        Ionicons.ticket_outline,
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
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
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
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: AppColours.primary300),
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              height: 20.h,
                              width: 40.w,
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    P_TuitionExpenses(
                                                      user_name:
                                                          widget.user_name,
                                                      Class: widget.Class,
                                                      grade: widget.grade,
                                                      code: widget.code,
                                                      photo: widget.photo,
                                                    )));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(7.sp),
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
                                                    color:
                                                        AppColours.primary800,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 1.h,
                                      color: Colors.transparent,
                                    );
                                  },
                                  itemCount: 1)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                              decoration: BoxDecoration(
                                color: AppColours.menuhome,
                                border:
                                    Border.all(color: AppColours.primary300),
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              height: 20.h,
                              width: 40.w,
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    P_Questions(
                                                      Class: widget.Class,
                                                      grade: widget.grade,
                                                      code: widget.code,
                                                    )));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(7.sp),
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
                                                Iconsax.message_question4,
                                                color: AppColours.menuhome3,
                                                size: 25.sp,
                                              ),
                                            ),
                                            Divider(
                                              height: 3.h,
                                              color: Colors.transparent,
                                            ),
                                            Text("Periodic questions",
                                                style: TextStyle(
                                                    color:
                                                        AppColours.primary800,
                                                    fontSize: 11.5.sp,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 1.h,
                                      color: Colors.transparent,
                                    );
                                  },
                                  itemCount: 1)),
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

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
