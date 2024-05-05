// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_import, unused_import, avoid_print, annotate_overrides, must_call_super, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/components/Question/components/create_question.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/components/Question/components/grade1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_Questions extends StatefulWidget {
  final String teachername;
  final String teachersubject;
  final String teacherid;
  const T_Questions(
      {super.key,
      required this.teachername,
      required this.teachersubject,
      required this.teacherid});

  @override
  State<T_Questions> createState() => _T_QuestionsState();
}

class _T_QuestionsState extends State<T_Questions> {
  void initState() {
    getdata();
  }

  final List<QueryDocumentSnapshot> _data = [];
  bool isloading = true;
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Question from teachers')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    isloading = false;
    _data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                Assets.colorhome,
                fit: BoxFit.fill,
                width: 100.w,
                height: 20.h,
              ),
              Column(
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
                  Text("Questions",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700)),
                  Divider(
                    height: 6.h,
                    color: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              T_ChooseGradeForQuestion(
                                                  teachername:
                                                      widget.teachername,
                                                  teachersubject:
                                                      widget.teachersubject,
                                                  teacherid:
                                                      widget.teacherid)));
                                  // Navigator.pushNamed(context,
                                  //     AppRoutes.teacher_create_question);
                                },
                                child: Container(
                                  width: 30.0.w,
                                  height: 5.0.h,
                                  decoration: BoxDecoration(
                                    color: Color(0xff3970C1),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Create Quiz',
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                        Divider(
                          height: 2.h,
                          color: Colors.transparent,
                        ),
                        Container(
                            height: 70.0.h,
                            width: double.infinity,
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 50.h,
                                    height: 21.0.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xffDBDBDB),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                _data[index]["Quizname"],
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                              Text(
                                                "Grade : ${_data[index]["Grade"]}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                              Text(
                                                "Class : ${_data[index]["Class"]}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.sp,
                                                    left: 15.sp,
                                                    top: 5.sp),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "1 :${_data[index]["q1"]}",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff6F6F6F),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "2 :${_data[index]["q2"]}",
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff6F6F6F)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "3 :${_data[index]["q3"]}",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff6F6F6F)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "4 :${_data[index]["q4"]}",
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff6F6F6F)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "5 :${_data[index]["q5"]}",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff6F6F6F)),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 20.sp, left: 10.sp),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "6 :${_data[index]["q6"]}",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff6F6F6F),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "7 :${_data[index]["q7"]}",
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff6F6F6F)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "8 :${_data[index]["q8"]}",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff6F6F6F)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "9 :${_data[index]["q9"]}",
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff6F6F6F)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "10 :${_data[index]["q10"]}",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff6F6F6F)),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
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
                                itemCount: _data.length))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
