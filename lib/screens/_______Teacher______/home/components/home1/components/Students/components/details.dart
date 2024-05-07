// ignore_for_file: camel_case_types, unnecessary_import, unused_import, must_call_super, annotate_overrides, prefer_const_constructors, sized_box_for_whitespace

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/core/enum.dart';
import 'package:educare/screens/_______Parents______/home/provider/homeprovider.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/components/Students/components/qrpage.dart';
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

class T_DetailsStudents extends StatefulWidget {
  final String documentId;
  const T_DetailsStudents({super.key, required this.documentId});

  @override
  State<T_DetailsStudents> createState() => _T_ScheduleState();
}

class _T_ScheduleState extends State<T_DetailsStudents> {
  @override
  void initState() {
    getdata();
  }

  bool isloading = true;
  final List<QueryDocumentSnapshot> _data = [];
  getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("students").get();
    _data.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  CollectionReference students =
      FirebaseFirestore.instance.collection('students');
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: students.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Stack(children: [
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
                        Text("Students",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700)),
                        Divider(
                          height: 5.h,
                          color: Colors.transparent,
                        ),
                        Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(data["photo"]),
                                    radius: 30,
                                    backgroundColor: AppColours.primary300,
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        data['user_name'],
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      Text(
                                        "grade : ${data['grade']}",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        "class : ${data['class']}",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => QRPage(
                                                        id: widget.documentId,
                                                      )));
                                        },
                                        child: Image.asset(
                                          Assets.qr,
                                          scale: 10.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                            Divider(
                              height: 5.h,
                              thickness: 2,
                              color: Color(0xff2E3192),
                            ),
                            Text(
                              'Performance profile',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: Color(0xff2E3192),
                              ),
                            ),
                            Divider(
                              height: 5.h,
                              thickness: 2,
                              color: Color(0xff2E3192),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Date OF birth',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  data['birthdate'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 3.h,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Boold',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  data['blood'],
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 3.h,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Gender',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  data["gender"],
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 3.h,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Religion',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  data['religion'],
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 3.h,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Class',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "${data['class']}",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 3.h,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Fathers name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  data['father'],
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 3.h,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Mothers name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  data['mother'],
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 5.h,
                              thickness: 2,
                              color: Color(0xff2E3192),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Attendance',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                    color: Color(0xff2E3192),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 5.h,
                              thickness: 2,
                              color: Color(0xff2E3192),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Text(
                                      'Term I',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(16.0),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xffD4FFEA),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          '235/249 Days',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp,
                                            color: const Color(0xff2ABC74),
                                          ),
                                        ),
                                        Text('Total attendance of the student',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                              color: const Color(0xff2ABC74),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: Text(
                                            'Term II',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16.0),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xffD4FFEA),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                '235/249 Days',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.sp,
                                                  color:
                                                      const Color(0xff2ABC74),
                                                ),
                                              ),
                                              Text(
                                                  'Total attendance of the student',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.sp,
                                                    color:
                                                        const Color(0xff2ABC74),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ])
                                ]),
                            Divider(
                              height: 5.h,
                              thickness: 2,
                              color: Color(0xff2E3192),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Academic performance',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                    color: Color(0xff2E3192),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          height: 5.h,
                          thickness: 2,
                          color: Color(0xff2E3192),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Term I',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 90.w,
                          height: 70.h,
                          child: Column(
                            children: [
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xff3970C1),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Subject',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Qtr 1',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Qtr 2',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Term I',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffF4F5F6),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'English',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A+/96',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A/90',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'A/90',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffE8EAEC),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Arabic',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A/90',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A/90',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'A/90',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffF4F5F6),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Sciences',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A-/94',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A-/94',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'A-/94',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffE8EAEC),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Math        ',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A+/96',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A+/96',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'A+/96',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffF4F5F6),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'History and Geog',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A/90',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A/90',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'A/90',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffE8EAEC),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Religion',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A-/94',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A-/94',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'A-/94',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 1.0),
                              child: Text(
                                'GPA 4.21',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: const Color(0XFFFD3667),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Term II',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 90.w,
                          height: 70.h,
                          child: Column(
                            children: [
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xff3970C1),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Subject',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Qtr 1',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Qtr 2',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Term I',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffF4F5F6),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'English',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A+/96',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A/90',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'A/90',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffE8EAEC),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Arabic',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A/90',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A/90',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'A/90',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffF4F5F6),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Sciences',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A-/94',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A-/94',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'A-/94',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffE8EAEC),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Math        ',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A+/96',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A+/96',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'A+/96',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffF4F5F6),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'History and Geog',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A/90',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A/90',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'A/90',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffE8EAEC),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Religion',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A-/94',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Text(
                                    'A-/94',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff6F6F6F)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'A-/94',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 1.0),
                              child: Text(
                                'GPA 4.21',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: const Color(0XFFFD3667),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Final',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 90.w,
                          height: 70.h,
                          child: Column(
                            children: [
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xff3970C1),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Subject',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(right: 100.0),
                                    child: Text(
                                      'Final',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffF4F5F6),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Text(
                                      'English',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                    Spacer(),
                                    Text(
                                      'A+/96',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    )
                                  ]),
                                ),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffE8EAEC),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Text(
                                      'Arabic',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                    Spacer(),
                                    Text(
                                      'A/90',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    )
                                  ]),
                                ),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffF4F5F6),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Text(
                                      'Sciences',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                    Spacer(),
                                    Text(
                                      'A-/94',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    )
                                  ]),
                                ),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffE8EAEC),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Text(
                                      'Math        ',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                    Spacer(),
                                    Text(
                                      'A+/96',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    )
                                  ]),
                                ),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffF4F5F6),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Text(
                                      'History and Geog',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                    Spacer(),
                                    Text(
                                      'A/90',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    )
                                  ]),
                                ),
                              ),
                              Container(
                                width: 90.w,
                                height: 10.h,
                                color: Color(0xffE8EAEC),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Text(
                                      'Religion',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff3970C1)),
                                    ),
                                    Spacer(),
                                    Text(
                                      'A-/94',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 1.0),
                              child: Text(
                                'GPA 4.21',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: const Color(0XFFFD3667),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          );
        }

        return Scaffold(
            body: Center(
          child: CircularProgressIndicator(),
        ));
      },
    );
  }
}
