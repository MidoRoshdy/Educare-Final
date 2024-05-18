// ignore_for_file: prefer_const_constructors, unused_import, non_constant_identifier_names, prefer_const_constructors_in_immutables, sized_box_for_whitespace, annotate_overrides, must_call_super

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class PWedSchedule extends StatefulWidget {
  final String Class;
  final String grade;
  final String code;
  PWedSchedule(
      {super.key,
      required this.Class,
      required this.grade,
      required this.code});

  @override
  State<PWedSchedule> createState() => _TWedScheduleState();
}

class _TWedScheduleState extends State<PWedSchedule> {
  void initState() {
    getdata();
  }

  final List<QueryDocumentSnapshot> _data = [];
  bool isloading = true;
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Schedule')
        .where("Class", isEqualTo: widget.Class)
        .get();
    isloading = false;
    _data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            /////////////////1/////////////////////
            isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: 80.w,
                    height: 11.h,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 11.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(15),
                                color: AppColours.Scheduleteacher),
                            child: Column(
                              children: [
                                Divider(
                                  height: 1.h,
                                  color: Colors.transparent,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Text(
                                          '8:15 To 9:00',
                                          style: TextStyle(
                                              color: Color(
                                                0xff33326F,
                                              ),
                                              fontSize: 11.sp),
                                        ),
                                        VerticalDivider(
                                          thickness: 2,
                                          width: 5.w,
                                          color: Color(0xff33326F),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              _data[index]['wed_Subject1'],
                                              style: TextStyle(
                                                color: Color(
                                                  0xff33326F,
                                                ),
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                            Divider(
                                              height: 1.h,
                                              color: Colors.transparent,
                                            ),
                                            Text(
                                              ' Mr: ${_data[index]["wed_Teacher1"]}',
                                              style: TextStyle(
                                                color: Color(
                                                  0xff33326F,
                                                ),
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
                        itemCount: 1),
                  ),
            Divider(
              height: 2.h,
              color: Colors.transparent,
            ),
            /////////////////2/////////////////////
            isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: 80.w,
                    height: 11.h,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 11.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(15),
                                color: AppColours.Scheduleteacher),
                            child: Column(
                              children: [
                                Divider(
                                  height: 1.h,
                                  color: Colors.transparent,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Text(
                                          '9:00 To 9:45',
                                          style: TextStyle(
                                              color: Color(
                                                0xff33326F,
                                              ),
                                              fontSize: 11.sp),
                                        ),
                                        VerticalDivider(
                                          thickness: 2,
                                          width: 5.w,
                                          color: Color(0xff33326F),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              _data[index]['wed_Subject2'],
                                              style: TextStyle(
                                                color: Color(
                                                  0xff33326F,
                                                ),
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                            Divider(
                                              height: 1.h,
                                              color: Colors.transparent,
                                            ),
                                            Text(
                                              ' Mr: ${_data[index]["wed_Teacher2"]}',
                                              style: TextStyle(
                                                color: Color(
                                                  0xff33326F,
                                                ),
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
                        itemCount: 1),
                  ),
            Divider(
              height: 2.h,
              color: Colors.transparent,
            ),
            /////////////////3/////////////////////
            isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: 80.w,
                    height: 11.h,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 11.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(15),
                                color: AppColours.Scheduleteacher),
                            child: Column(
                              children: [
                                Divider(
                                  height: 1.h,
                                  color: Colors.transparent,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Text(
                                          '9:45 To 10:30',
                                          style: TextStyle(
                                              color: Color(
                                                0xff33326F,
                                              ),
                                              fontSize: 10.sp),
                                        ),
                                        VerticalDivider(
                                          thickness: 2,
                                          width: 5.w,
                                          color: Color(0xff33326F),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              _data[index]['wed_Subject3'],
                                              style: TextStyle(
                                                color: Color(
                                                  0xff33326F,
                                                ),
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                            Divider(
                                              height: 1.h,
                                              color: Colors.transparent,
                                            ),
                                            Text(
                                              ' Mr: ${_data[index]["wed_Teacher3"]}',
                                              style: TextStyle(
                                                color: Color(
                                                  0xff33326F,
                                                ),
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
                        itemCount: 1),
                  ),
            Divider(
              height: 2.h,
              color: Colors.transparent,
            ),
            /////////////////break/////////////////////
            isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: 80.w,
                    height: 11.h,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 11.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(15),
                                color: AppColours.boxchooseuser),
                            child: Column(
                              children: [
                                Divider(
                                  height: 2.h,
                                  color: Colors.transparent,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Text(
                                          '10:30 To 11:15',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 10.sp),
                                        ),
                                        VerticalDivider(
                                          thickness: 2,
                                          width: 5.w,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        Text(
                                          _data[index]['Break'],
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                        itemCount: 1),
                  ),
            Divider(
              height: 2.h,
              color: Colors.transparent,
            ),
            /////////////////4/////////////////////
            isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: 80.w,
                    height: 11.h,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 11.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(15),
                                color: AppColours.Scheduleteacher),
                            child: Column(
                              children: [
                                Divider(
                                  height: 1.h,
                                  color: Colors.transparent,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Text(
                                          '11:15 To 12:00',
                                          style: TextStyle(
                                              color: Color(
                                                0xff33326F,
                                              ),
                                              fontSize: 10.sp),
                                        ),
                                        VerticalDivider(
                                          thickness: 2,
                                          width: 5.w,
                                          color: Color(0xff33326F),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              _data[index]['wed_Subject4'],
                                              style: TextStyle(
                                                color: Color(
                                                  0xff33326F,
                                                ),
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                            Divider(
                                              height: 1.h,
                                              color: Colors.transparent,
                                            ),
                                            Text(
                                              ' Mr: ${_data[index]["wed_Teacher4"]}',
                                              style: TextStyle(
                                                color: Color(
                                                  0xff33326F,
                                                ),
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
                        itemCount: 1),
                  ),
            Divider(
              height: 2.h,
              color: Colors.transparent,
            ),
            /////////////////5/////////////////////
            isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: 80.w,
                    height: 11.h,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 11.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(15),
                                color: AppColours.Scheduleteacher),
                            child: Column(
                              children: [
                                Divider(
                                  height: 1.h,
                                  color: Colors.transparent,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Text(
                                          '12:00 To 12:45',
                                          style: TextStyle(
                                              color: Color(
                                                0xff33326F,
                                              ),
                                              fontSize: 10.sp),
                                        ),
                                        VerticalDivider(
                                          thickness: 2,
                                          width: 5.w,
                                          color: Color(0xff33326F),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              _data[index]['wed_Subject5'],
                                              style: TextStyle(
                                                color: Color(
                                                  0xff33326F,
                                                ),
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                            Divider(
                                              height: 1.h,
                                              color: Colors.transparent,
                                            ),
                                            Text(
                                              ' Mr: ${_data[index]["wed_Teacher5"]}',
                                              style: TextStyle(
                                                color: Color(
                                                  0xff33326F,
                                                ),
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
                        itemCount: 1),
                  ),
            Divider(
              height: 2.h,
              color: Colors.transparent,
            ),
            /////////////////6/////////////////////
            isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: 80.w,
                    height: 11.h,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 11.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(15),
                                color: AppColours.Scheduleteacher),
                            child: Column(
                              children: [
                                Divider(
                                  height: 1.h,
                                  color: Colors.transparent,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Text(
                                          '12:45 To 1:30',
                                          style: TextStyle(
                                              color: Color(
                                                0xff33326F,
                                              ),
                                              fontSize: 11.sp),
                                        ),
                                        VerticalDivider(
                                          thickness: 2,
                                          width: 5.w,
                                          color: Color(0xff33326F),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              _data[index]['wed_Subject6'],
                                              style: TextStyle(
                                                color: Color(
                                                  0xff33326F,
                                                ),
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                            Divider(
                                              height: 1.h,
                                              color: Colors.transparent,
                                            ),
                                            Text(
                                              ' Mr: ${_data[index]["wed_Teacher6"]}',
                                              style: TextStyle(
                                                color: Color(
                                                  0xff33326F,
                                                ),
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
                        itemCount: 1),
                  ),
            Divider(
              height: 2.h,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
