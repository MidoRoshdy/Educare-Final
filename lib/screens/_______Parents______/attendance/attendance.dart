// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names, unused_import, no_leading_underscores_for_local_identifiers, unused_local_variable, avoid_print, prefer_const_declarations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AttendancePage extends StatefulWidget {
  final String user_name;
  final String Class;
  final String grade;
  final String code;
  final String photo;

  const AttendancePage({
    Key? key,
    required this.user_name,
    required this.Class,
    required this.grade,
    required this.code,
    required this.photo,
  }) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  DateTime today = DateTime.now();
  bool isLoading = true;
  final List<Meeting> meetings = [];

  @override
  void initState() {
    super.initState();
    getData();
    // Call the method to fetch data from Firestore
  }

  Future<void> getData() async {
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
        final DateTime startTime = DateTime(year, month, day, 0, 0, 0);
        final DateTime endTime = DateTime(year, month, day, 0, 0, 0);
        //startTime.add(const Duration(hours: 2));
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background image or color
            Image.asset(
              Assets.colorhome,
              fit: BoxFit.fill,
              width: 100.w,
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                        Spacer(),
                        Image.asset(
                          Assets.logoonx2,
                          height: 4.h,
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Action on tap
                          print(widget.code);
                          print(meetings);
                        },
                        child: Text(
                          "Attendance",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Divider(
                        height: 6.h,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                  isLoading
                      ? CircularProgressIndicator()
                      : Container(
                          height: 70.h,
                          width: 90.w,
                          child: SfCalendar(
                            view: CalendarView.month,
                            dataSource: MeetingDataSource(meetings),
                            monthViewSettings: MonthViewSettings(
                              appointmentDisplayMode:
                                  MonthAppointmentDisplayMode.indicator,
                              showAgenda: true,
                            ),
                          ),
                        ),
                  Spacer(),
                ],
              ),
            ),
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
