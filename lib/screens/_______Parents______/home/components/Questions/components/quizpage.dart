// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:educare/core/Assets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class QuizPage extends StatefulWidget {
  final String quizname;
  final String teachername;
  final String teacherid;
  final String teachersubject;
  final String q1;
  final String q2;
  final String q3;
  final String q4;
  final String q5;
  final String q6;
  final String q7;
  final String q8;
  final String q9;
  final String q10;

  const QuizPage(
      {super.key,
      required this.quizname,
      required this.teachername,
      required this.teacherid,
      required this.teachersubject,
      required this.q1,
      required this.q2,
      required this.q3,
      required this.q4,
      required this.q5,
      required this.q6,
      required this.q7,
      required this.q8,
      required this.q9,
      required this.q10});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Stack(children: [
      Image.asset(
        Assets.colorhome,
        fit: BoxFit.fill,
        width: 100.w,
        height: 20.h,
      ),
      Column(children: [
        Divider(
          height: 1.h,
          color: Colors.transparent,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
        Text(widget.quizname,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w700)),
        Divider(
          height: 6.h,
          color: Colors.transparent,
        ),
        Container(
            height: 80.h,
            width: 100.w,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 1))
                          ]),
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Teacher : ${widget.teachername}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w700)),
                              const Spacer(),
                              Text("Subject : ${widget.teachersubject}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w700)),
                              Spacer(),
                              Text("ID : ${widget.teacherid}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          Divider(
                            height: 3.h,
                          ),
                          Row(
                            children: [
                              Text("Q${index + 1}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700)),
                              const Spacer(),
                              Text("Marks : 10",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          const Divider(
                            height: 1,
                            color: Colors.transparent,
                          ),
                          Container(
                            width: 30.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                  index == 0
                                      ? widget.q1
                                      : index == 1
                                          ? widget.q2
                                          : index == 2
                                              ? widget.q3
                                              : index == 3
                                                  ? widget.q4
                                                  : index == 4
                                                      ? widget.q5
                                                      : index == 5
                                                          ? widget.q6
                                                          : index == 6
                                                              ? widget.q7
                                                              : index == 7
                                                                  ? widget.q8
                                                                  : index == 8
                                                                      ? widget
                                                                          .q9
                                                                      : widget
                                                                          .q10,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                      height: 1,
                      color: Colors.transparent,
                    ),
                itemCount: 10))
      ])
    ]))));
  }
}
