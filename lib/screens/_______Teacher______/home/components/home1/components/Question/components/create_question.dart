// ignore_for_file: camel_case_types, sized_box_for_whitespace, avoid_print, prefer_typing_uninitialized_variables, prefer_const_constructors, non_constant_identifier_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_CreateQuestion extends StatefulWidget {
  final String teachername;
  final String teachersubject;
  final String teacherid;
  final String doc_1;
  final String doc_2;
  final String studentgrade;
  final String studentclass;
  const T_CreateQuestion({
    super.key,
    required this.teachername,
    required this.teachersubject,
    required this.teacherid,
    required this.doc_1,
    required this.doc_2,
    required this.studentgrade,
    required this.studentclass,
  });

  @override
  State<T_CreateQuestion> createState() => _T_CreateQuestionState();
}

class _T_CreateQuestionState extends State<T_CreateQuestion> {
  TextEditingController q1 = TextEditingController();
  TextEditingController q2 = TextEditingController();
  TextEditingController q3 = TextEditingController();
  TextEditingController q4 = TextEditingController();
  TextEditingController q5 = TextEditingController();
  TextEditingController q6 = TextEditingController();
  TextEditingController q7 = TextEditingController();
  TextEditingController q8 = TextEditingController();
  TextEditingController q9 = TextEditingController();
  TextEditingController q10 = TextEditingController();
  TextEditingController quizname = TextEditingController();
  final List<QueryDocumentSnapshot> _data2 = [];
  bool isloading = true;
  getdata2() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('TeacherUsers')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    _data2.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getdata2();
  }

  Future<void> addquestion() async {
    CollectionReference Question = FirebaseFirestore.instance
        .collection("grade")
        .doc(widget.doc_1)
        .collection("class")
        .doc(widget.doc_2)
        .collection("question");

    return Question.add({
      "Quizname": quizname.text,
      "q1": q1.text,
      "q2": q2.text,
      "q3": q3.text,
      "q4": q4.text,
      "q5": q5.text,
      "q6": q6.text,
      "q7": q7.text,
      "q8": q8.text,
      "q9": q9.text,
      "q10": q10.text,
      "TteacherName": widget.teachername,
      "TteacherSubject": widget.teachersubject,
      "TteacherID": widget.teacherid,
      "Grade": widget.studentgrade,
      "Class": widget.studentclass,
      "uid": FirebaseAuth.instance.currentUser!.uid,
      "time": DateTime.now(),
    })
        .then((value) => print("Questions Added"))
        .catchError((error) => print("Failed to add Questions: $error"));
  }

  Future<void> addquestion2() async {
    CollectionReference Question =
        FirebaseFirestore.instance.collection("Question from teachers");

    return Question.add({
      "Quizname": quizname.text,
      "q1": q1.text,
      "q2": q2.text,
      "q3": q3.text,
      "q4": q4.text,
      "q5": q5.text,
      "q6": q6.text,
      "q7": q7.text,
      "q8": q8.text,
      "q9": q9.text,
      "q10": q10.text,
      "TteacherName": widget.teachername,
      "TteacherSubject": widget.teachersubject,
      "TteacherID": widget.teacherid,
      "Grade": widget.studentgrade,
      "Class": widget.studentclass,
      "uid": FirebaseAuth.instance.currentUser!.uid,
      "time": DateTime.now(),
    })
        .then((value) => print("Questions Added"))
        .catchError((error) => print("Failed to add Questions: $error"));
  }

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
            Column(children: [
              Text("Questions",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700)),
              Divider(
                height: 4.h,
                color: Colors.transparent,
              ),
              Container(
                height: 13.h,
                width: 100.w,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Text(
                          "from : ",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        Row(children: [
                          Container(
                            alignment: Alignment.center,
                            height: 4.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1.sp,
                                  color:
                                      const Color.fromARGB(255, 197, 197, 197),
                                ),
                                color: Colors.white),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                ),
                                child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      return Center(
                                        child: Text(
                                          _data2[index]["username"],
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        height: 1.h,
                                        color: Colors.transparent,
                                      );
                                    },
                                    itemCount: _data2.length)),
                          ),
                        ])
                      ]),
                    ),
                    Divider(
                      height: 1.h,
                      color: Colors.transparent,
                    ),
                    Row(children: [
                      Text(
                        "    to :  ",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      VerticalDivider(
                        width: 1.h,
                        color: Colors.transparent,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 4.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1.sp,
                              color: const Color.fromARGB(255, 197, 197, 197),
                            ),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: TextFormField(
                            controller: quizname,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              Divider(
                height: 1.h,
                color: Colors.transparent,
              ),
              Container(
                  height: 62.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1.sp,
                        color: Color.fromARGB(255, 148, 147, 147),
                      ),
                      color: Colors.grey[200]),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(children: [
                        Text(
                          "Q1 :  ",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        Row(children: [
                          Container(
                            alignment: Alignment.center,
                            height: 4.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 1.sp,
                                  color:
                                      const Color.fromARGB(255, 197, 197, 197),
                                ),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                              ),
                              child: TextFormField(
                                controller: q1,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ])
                      ]),
                    ),
                    Row(children: [
                      Text(
                        "   Q2 :  ",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 4.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.sp,
                                color: const Color.fromARGB(255, 197, 197, 197),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: TextFormField(
                              controller: q2,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "   Q3 :  ",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 4.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.sp,
                                color: const Color.fromARGB(255, 197, 197, 197),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: TextFormField(
                              controller: q3,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "   Q4 :  ",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 4.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.sp,
                                color: const Color.fromARGB(255, 197, 197, 197),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: TextFormField(
                              controller: q4,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "   Q5 :  ",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 4.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.sp,
                                color: const Color.fromARGB(255, 197, 197, 197),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: TextFormField(
                              controller: q5,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "   Q6 :  ",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 4.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.sp,
                                color: const Color.fromARGB(255, 197, 197, 197),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: TextFormField(
                              controller: q6,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "   Q7 :  ",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 4.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.sp,
                                color: const Color.fromARGB(255, 197, 197, 197),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: TextFormField(
                              controller: q7,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "   Q8 :  ",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 4.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.sp,
                                color: const Color.fromARGB(255, 197, 197, 197),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: TextFormField(
                              controller: q8,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "   Q9 :  ",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 4.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.sp,
                                color: const Color.fromARGB(255, 197, 197, 197),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: TextFormField(
                              controller: q9,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ])
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "  Q10 : ",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 4.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.sp,
                                color: const Color.fromARGB(255, 197, 197, 197),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: TextFormField(
                              controller: q10,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ])
                    ]),
                    Spacer(),
                    InkWell(
                      onTap: () async {
                        if (quizname.text.isNotEmpty ||
                            q1.text.isNotEmpty ||
                            q2.text.isNotEmpty ||
                            q3.text.isNotEmpty ||
                            q4.text.isNotEmpty ||
                            q5.text.isNotEmpty ||
                            q6.text.isNotEmpty ||
                            q7.text.isNotEmpty ||
                            q8.text.isNotEmpty ||
                            q9.text.isNotEmpty ||
                            q10.text.isNotEmpty) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: 'Success',
                            desc: 'Scan Submitted Successfully',
                          ).show();
                          addquestion();
                          addquestion2();
                          Navigator.pushNamedAndRemoveUntil(context,
                              AppRoutes.teacher_homepage, (route) => false);
                        } else {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'Please add a Questions first',
                          ).show();
                        }
                      },
                      child: Container(
                        height: 4.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff2E3192),
                        ),
                        child: const Center(
                          child: Text(
                            'Send',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 1.h,
                      color: Colors.transparent,
                    )
                  ]))
            ])
          ]))
    ])));
  }
}
