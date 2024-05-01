// ignore_for_file: camel_case_types, unused_import, unnecessary_import, non_constant_identifier_names, must_call_super, avoid_print, use_build_context_synchronously, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_Reports extends StatefulWidget {
  final String doc_id1;
  final String doc_id2;
  final String doc_id3;

  const T_Reports({
    super.key,
    required this.doc_id1,
    required this.doc_id2,
    required this.doc_id3,
  });

  @override
  State<T_Reports> createState() => _T_ReportsState();
}

class _T_ReportsState extends State<T_Reports> {
  @override
  void initState() {
    getdata2();
    getdata();
  }

  final List<QueryDocumentSnapshot> _data2 = [];
  getdata2() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('TeacherUsers')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    _data2.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  String? teachername;
  String? teachersubject;
  String? teacherid;
  Future<void> addreport() async {
    CollectionReference reports = FirebaseFirestore.instance
        .collection("grade")
        .doc(widget.doc_id1)
        .collection("class")
        .doc(widget.doc_id2)
        .collection("students")
        .doc(widget.doc_id3)
        .collection("report");
    return reports
        .add({
          'exam': _currentSliderValue1,
          'attend': _currentSliderValue2,
          'behavior': _currentSliderValue3,
          'interaction': _currentSliderValue4,
          'comment': commentController.text,
          "TteacherName": teachername,
          "TteacherSubject": teachersubject,
          "TteacherID": teacherid,
          "time": DateTime.now(),
        })
        .then((value) => print("Report Added"))
        .catchError((error) => print("Failed to add Report: $error"));
  }

  bool isloading = true;
  final List<QueryDocumentSnapshot> _data = [];
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("grade")
        .doc(widget.doc_id1)
        .collection("class")
        .doc(widget.doc_id2)
        .collection("students")
        .where("docs", isEqualTo: widget.doc_id3)
        .get();
    _data.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  TextEditingController commentController = TextEditingController();
  double _currentSliderValue1 = 0;
  double _currentSliderValue2 = 0;
  double _currentSliderValue3 = 0;
  double _currentSliderValue4 = 0;
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
                    InkWell(
                      onTap: () {
                        print(teachersubject);
                        print(teachername);
                        print(teacherid);
                      },
                      child: Text("Reports",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700)),
                    ),
                    Divider(
                      height: 6.h,
                      color: Colors.transparent,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                Container(
                                  width: 90.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Text("TeacherName :"),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 15.sp),
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 2.h),
                                                alignment: Alignment.center,
                                                height: 5.h,
                                                width: 25.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        width: 1.sp,
                                                        color: AppColours
                                                            .neutral500)),
                                                child: ListView.separated(
                                                    itemBuilder:
                                                        (context, index) {
                                                      _data2[index]
                                                              ["username"] ==
                                                          teachername;
                                                      _data2[index][
                                                              "Educationalcode"] ==
                                                          teacherid;
                                                      _data2[index]
                                                              ["subject"] ==
                                                          teachersubject;
                                                      return Center(
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              teachername =
                                                                  _data2[index][
                                                                      "username"];
                                                              teacherid = _data2[
                                                                      index][
                                                                  "Educationalcode"];
                                                              teachersubject =
                                                                  _data2[index][
                                                                      "subject"];
                                                            });
                                                          },
                                                          child: Text(
                                                            _data2[index]
                                                                ["username"],
                                                            style: TextStyle(
                                                                fontSize:
                                                                    10.sp),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return Divider(
                                                        height: 1.h,
                                                        color:
                                                            Colors.transparent,
                                                      );
                                                    },
                                                    itemCount: _data2.length)),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text("Educationalcode :"),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 15.sp),
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 2.h),
                                                alignment: Alignment.center,
                                                height: 5.h,
                                                width: 25.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        width: 1.sp,
                                                        color: AppColours
                                                            .neutral500)),
                                                child: ListView.separated(
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Center(
                                                        child: Text(
                                                          _data2[index][
                                                              "Educationalcode"],
                                                          style: TextStyle(
                                                              fontSize: 10.sp),
                                                        ),
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return Divider(
                                                        height: 1.h,
                                                        color:
                                                            Colors.transparent,
                                                      );
                                                    },
                                                    itemCount: _data2.length)),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text("subject :"),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 15.sp),
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 2.h),
                                                alignment: Alignment.center,
                                                height: 5.h,
                                                width: 25.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        width: 1.sp,
                                                        color: AppColours
                                                            .neutral500)),
                                                child: ListView.separated(
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Center(
                                                        child: Text(
                                                          _data2[index]
                                                              ["subject"],
                                                          style: TextStyle(
                                                              fontSize: 10.sp),
                                                        ),
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return Divider(
                                                        height: 1.h,
                                                        color:
                                                            Colors.transparent,
                                                      );
                                                    },
                                                    itemCount: _data2.length)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

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
                                                  color:
                                                      AppColours.neutral500)),
                                          child: ListView.separated(
                                              itemBuilder: (context, index) {
                                                return Center(
                                                  child: Text(
                                                    _data[index]["name"],
                                                    style: TextStyle(
                                                        fontSize: 13.sp),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
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
                                                  color:
                                                      AppColours.neutral500)),
                                          child: ListView.separated(
                                              itemBuilder: (context, index) {
                                                return Center(
                                                  child: Text(
                                                    _data[index]["class"],
                                                    style: TextStyle(
                                                        fontSize: 13.sp),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
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
                                                  color:
                                                      AppColours.neutral500)),
                                          child: ListView.separated(
                                              itemBuilder: (context, index) {
                                                return Center(
                                                  child: Text(
                                                    _data[index]["ID"],
                                                    style: TextStyle(
                                                        fontSize: 13.sp),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
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
                                    Container(
                                        width: 70.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Exam :"),
                                            Slider(
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
                                        )),
                                  ],
                                ),
                                Divider(
                                  height: 1.h,
                                  color: Colors.transparent,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 70.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Attend :"),
                                          Slider(
                                            value: _currentSliderValue2,
                                            max: 100,
                                            divisions: 10,
                                            label: _currentSliderValue2
                                                .round()
                                                .toString(),
                                            onChanged: (double value2) {
                                              setState(() {
                                                _currentSliderValue2 = value2;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  height: 1.h,
                                  color: Colors.transparent,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 70.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Behavior :"),
                                          Slider(
                                            value: _currentSliderValue3,
                                            max: 100,
                                            divisions: 10,
                                            label: _currentSliderValue3
                                                .round()
                                                .toString(),
                                            onChanged: (double value3) {
                                              setState(() {
                                                _currentSliderValue3 = value3;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  height: 1.h,
                                  color: Colors.transparent,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 70.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Interaction :"),
                                          Slider(
                                            value: _currentSliderValue4,
                                            max: 100,
                                            divisions: 10,
                                            label: _currentSliderValue4
                                                .round()
                                                .toString(),
                                            onChanged: (double value4) {
                                              setState(() {
                                                _currentSliderValue4 = value4;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
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
                                      margin: EdgeInsets.only(bottom: 2.h),
                                      alignment: Alignment.center,
                                      height: 12.h,
                                      width: 66.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1.sp,
                                              color: AppColours.neutral500)),
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
                                SizedBox(
                                  width: 90.w,
                                  height: 7.h,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await addreport();
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColours.primary800,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Text(
                                      "Submit report",
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
                    ),
                  ]))
            ])));
  }
}
