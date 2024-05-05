// ignore_for_file: file_names, camel_case_types, unnecessary_string_interpolations, avoid_print, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/components/Question/teacher_question.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/components/exams%20degree/components/gradeexamdegree.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/components/reports/components/grade.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/components/tickets/tickets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class T_HomePage extends StatefulWidget {
  const T_HomePage({super.key});

  @override
  State<T_HomePage> createState() => _T_HomePageState();
}

class _T_HomePageState extends State<T_HomePage> {
  final List<QueryDocumentSnapshot> _data = [];
  bool isloading = true;
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('TeacherUsers')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    _data.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  String teachername = "";
  String teachersubject = "";
  String teacherid = "";
  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              //background image////
              Image.asset(
                Assets.colorhome,
                fit: BoxFit.fill,
                width: 100.w,
                height: 35.h,
              ),

              Padding(
                padding:
                    EdgeInsets.only(left: 8.0.sp, right: 8.0.sp, top: 8.sp),
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
                          Container(
                            height: 3.h,
                            width: 50.w,
                            child: isloading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.separated(
                                    itemBuilder: (context, index) {
                                      return Text(_data[index]["username"],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold));
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        height: 1.h,
                                        color: Colors.transparent,
                                      );
                                    },
                                    itemCount: _data.length),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 20.sp),
                            child: Container(
                                height: 9.h,
                                width: 17.w,
                                decoration: BoxDecoration(
                                  color: AppColours.neutral300,
                                  shape: BoxShape.circle,
                                ),
                                child: isloading
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : ListView.separated(
                                        itemBuilder: (context, index) {
                                          return CircleAvatar(
                                            radius: 30.sp,
                                            backgroundImage: NetworkImage(
                                                _data[index]["profileimage"]),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return Divider(
                                            height: 1.h,
                                            color: Colors.transparent,
                                          );
                                        },
                                        itemCount: _data.length)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.0.sp,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 3.h,
                            width: 50.w,
                            child: isloading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.separated(
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Text(
                                            "sub : ",
                                            style: TextStyle(
                                                color: Colors.grey[300],
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(_data[index]["subject"],
                                              style: TextStyle(
                                                  color: Colors.grey[300],
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        height: 1.h,
                                        color: Colors.transparent,
                                      );
                                    },
                                    itemCount: _data.length),
                          ),
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
                            child: InkWell(
                              onTap: () {
                                print(_data);
                              },
                              child: Center(
                                  child: Text(
                                "2023-2024",
                                style: TextStyle(color: AppColours.primary700),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Divider(
                      height: 4.h,
                      color: Colors.transparent,
                    ),
                    //first row of buttons//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(7.sp),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.teacher_schedule);
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
                                        Iconsax.note_favorite,
                                        color: Colors.purple,
                                        size: 25.sp,
                                      ),
                                    ),
                                    Divider(
                                      height: 3.h,
                                      color: Colors.transparent,
                                    ),
                                    Text("Schedule",
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
                        Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context,
                                  AppRoutes.teacher_scientific_content);
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
                                        Iconsax.book_saved,
                                        color: Colors.purple,
                                        size: 25.sp,
                                      ),
                                    ),
                                    Divider(
                                      height: 3.h,
                                      color: Colors.transparent,
                                    ),
                                    Text("Scientific content",
                                        style: TextStyle(
                                            color: AppColours.primary800,
                                            fontSize: 11.5.sp,
                                            fontWeight: FontWeight.bold)),
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
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context,
                                  AppRoutes.teacher_Choosegradeforexamdegree);
                            },
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
                                                      T_ChooseGradeForExamDegree(
                                                          teachername:
                                                              teachername,
                                                          teachersubject:
                                                              teachersubject,
                                                          teacherid:
                                                              teacherid)));

                                          setState(() {
                                            teachername =
                                                _data[index]["username"];
                                            teacherid =
                                                _data[index]["Educationalcode"];
                                            teachersubject =
                                                _data[index]["subject"];
                                          });
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
                                                  Iconsax.task_square,
                                                  color: Colors.orange[900],
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
                                                builder: (context) =>
                                                    T_ChooseGradeForReport(
                                                        teachername:
                                                            teachername,
                                                        teachersubject:
                                                            teachersubject,
                                                        teacherid: teacherid)));

                                        setState(() {
                                          teachername =
                                              _data[index]["username"];
                                          teacherid =
                                              _data[index]["Educationalcode"];
                                          teachersubject =
                                              _data[index]["subject"];
                                        });
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
                                                Iconsax.note_text,
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
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.teacher_Students);
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
                                        Ionicons.school_outline,
                                        color: AppColours.menuhome3,
                                        size: 25.sp,
                                      ),
                                    ),
                                    Divider(
                                      height: 3.h,
                                      color: Colors.transparent,
                                    ),
                                    Text("Students",
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
                                                    T_Questions(
                                                        teachername:
                                                            teachername,
                                                        teachersubject:
                                                            teachersubject,
                                                        teacherid: teacherid)));

                                        setState(() {
                                          teachername =
                                              _data[index]["username"];
                                          teacherid =
                                              _data[index]["Educationalcode"];
                                          teachersubject =
                                              _data[index]["subject"];
                                        });
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
                                                builder: (context) => T_Tickets(
                                                    teachername: teachername,
                                                    teachersubject:
                                                        teachersubject,
                                                    teacherid: teacherid)));

                                        setState(() {
                                          teachername =
                                              _data[index]["username"];
                                          teacherid =
                                              _data[index]["Educationalcode"];
                                          teachersubject =
                                              _data[index]["subject"];
                                        });
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
                                  context, AppRoutes.teacher_event);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                                        Iconsax.magicpen,
                                        color: AppColours.menuhome3,
                                        size: 25.sp,
                                      ),
                                    ),
                                    Divider(
                                      height: 3.h,
                                      color: Colors.transparent,
                                    ),
                                    Text("Events",
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
