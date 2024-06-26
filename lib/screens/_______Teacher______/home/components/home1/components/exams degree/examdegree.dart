// ignore_for_file: must_call_super, camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously, sized_box_for_whitespace, prefer_const_constructors, unused_import

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_ExamsDegree extends StatefulWidget {
  final String doc_id1;
  final String doc_id2;
  final String doc_id3;
  final String teachername;
  final String teachersubject;
  final String teacherid;
  final String gradeID;
  final String classID;
  final String StudentID;
  const T_ExamsDegree(
      {super.key,
      required this.doc_id1,
      required this.doc_id2,
      required this.doc_id3,
      required this.teachername,
      required this.teachersubject,
      required this.teacherid,
      required this.gradeID,
      required this.classID,
      required this.StudentID});

  @override
  State<T_ExamsDegree> createState() => _T_ExamsDegreeState();
}

class _T_ExamsDegreeState extends State<T_ExamsDegree> {
  @override
  void initState() {
    getdata2();
  }

  Future<void> addrexamdegree() async {
    CollectionReference examdegree = FirebaseFirestore.instance
        .collection("grade")
        .doc(widget.doc_id1)
        .collection("class")
        .doc(widget.doc_id2)
        .collection("students")
        .doc(widget.doc_id3)
        .collection("exam degree");
    return examdegree
        .add({
          'exam degree': _currentSliderValue1,
          'comment': commentController.text,
          'exam name': ExamNameController.text,
          "TteacherName": widget.teachername,
          "TteacherSubject": widget.teachersubject,
          "TteacherID": widget.teacherid,
          "uid": FirebaseAuth.instance.currentUser!.uid,
          "time": DateTime.now(),
          "gradeID": widget.gradeID,
          "classID": widget.classID,
          "studentID": widget.StudentID,
        })
        .then((value) => print("exam degree Added"))
        .catchError((error) => print("Failed to add exam degree: $error"));
  }

  Future<void> addrexamdegree2() async {
    CollectionReference examdegree =
        FirebaseFirestore.instance.collection("exam degree");
    return examdegree
        .add({
          'exam degree': _currentSliderValue1,
          'comment': commentController.text,
          'exam name': ExamNameController.text,
          "TteacherName": widget.teachername,
          "TteacherSubject": widget.teachersubject,
          "TteacherID": widget.teacherid,
          "uid": FirebaseAuth.instance.currentUser!.uid,
          "time": DateTime.now(),
          "gradeID": widget.gradeID,
          "classID": widget.classID,
          "studentID": widget.StudentID,
        })
        .then((value) => print("exam degree Added"))
        .catchError((error) => print("Failed to add exam degree: $error"));
  }

  bool isloading = true;

  final List<QueryDocumentSnapshot> _data2 = [];
  getdata2() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("grade")
        .doc(widget.doc_id1)
        .collection("class")
        .doc(widget.doc_id2)
        .collection("students")
        .where("docs", isEqualTo: widget.doc_id3)
        .get();
    _data2.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  TextEditingController commentController = TextEditingController();
  TextEditingController ExamNameController = TextEditingController();
  double _currentSliderValue1 = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                    Text("Exams Degree",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700)),
                    Divider(
                      height: 6.h,
                      color: Colors.transparent,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                              ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                              Row(
                                children: [
                                  const Text("Name :"),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.sp),
                                    child: Container(
                                        margin: EdgeInsets.only(bottom: 2.h),
                                        alignment: Alignment.center,
                                        height: 5.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1.sp,
                                                color: AppColours.neutral500)),
                                        child: ListView.separated(
                                            itemBuilder: (context, index) {
                                              return Center(
                                                child: Text(
                                                  _data2[index]["user_name"],
                                                  style: TextStyle(
                                                      fontSize: 13.sp),
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
                                ],
                              ),
                              Divider(
                                height: 1.h,
                                color: Colors.transparent,
                              ),
                              Row(
                                children: [
                                  const Text("class :"),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 18.sp),
                                    child: Container(
                                        margin: EdgeInsets.only(bottom: 2.h),
                                        alignment: Alignment.center,
                                        height: 5.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1.sp,
                                                color: AppColours.neutral500)),
                                        child: ListView.separated(
                                            itemBuilder: (context, index) {
                                              return Center(
                                                child: Text(
                                                  _data2[index]["class"],
                                                  style: TextStyle(
                                                      fontSize: 13.sp),
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
                                ],
                              ),
                              Divider(
                                height: 1.h,
                                color: Colors.transparent,
                              ),
                              Row(
                                children: [
                                  const Text("Code :"),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.sp),
                                    child: Container(
                                        margin: EdgeInsets.only(bottom: 2.h),
                                        alignment: Alignment.center,
                                        height: 5.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1.sp,
                                                color: AppColours.neutral500)),
                                        child: ListView.separated(
                                            itemBuilder: (context, index) {
                                              return Center(
                                                child: Text(
                                                  _data2[index]["code"],
                                                  style: TextStyle(
                                                      fontSize: 13.sp),
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
                                ],
                              ),
                              Container(
                                height: 30.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.black.withOpacity(0.2)),
                                    color: Colors.grey.withOpacity(0.1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text("Exam Name :"),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.sp),
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 2.h),
                                              alignment: Alignment.center,
                                              height: 5.h,
                                              width: 40.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      width: 1.sp,
                                                      color: AppColours
                                                          .neutral500)),
                                              child: TextField(
                                                controller: ExamNameController,
                                                style:
                                                    TextStyle(fontSize: 13.sp),
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    prefixIconColor:
                                                        AppColours.neutral300),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("Exam Degree :"),
                                          Slider(
                                            inactiveColor: Colors.white,
                                            secondaryActiveColor: Colors.white,
                                            value: _currentSliderValue1,
                                            max: 100,
                                            divisions: 10,
                                            label: _currentSliderValue1
                                                .round()
                                                .toString(),
                                            onChanged: (double value1) {
                                              setState(() {
                                                _currentSliderValue1 = value1;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 1.h,
                                        color: Colors.transparent,
                                      ),
                                      Divider(
                                        height: 1.h,
                                        color: Colors.transparent,
                                      ),
                                      Row(
                                        children: [
                                          const Text("Comment :"),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.only(bottom: 2.h),
                                            alignment: Alignment.center,
                                            height: 10.h,
                                            width: 60.w,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1.sp,
                                                    color:
                                                        AppColours.neutral500)),
                                            child: TextField(
                                              controller: commentController,
                                              style: TextStyle(fontSize: 13.sp),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  prefixIconColor:
                                                      AppColours.neutral300),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 90.w,
                                height: 7.h,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await addrexamdegree();
                                    await addrexamdegree2();
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.success,
                                      animType: AnimType.rightSlide,
                                      title: 'Success',
                                      desc: 'Degree Sent Successfully',
                                    ).show();
                                    // Delay for a short duration to ensure the dialog is shown
                                    await Future.delayed(Duration(seconds: 2));
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      AppRoutes.teacher_home,
                                      (route) => false,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColours.primary800,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Text(
                                    "Submit Degree",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.transparent,
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]))
            ])));
  }
}
