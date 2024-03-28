// ignore_for_file: must_call_super, camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_ExamsDegree extends StatefulWidget {
  final String doc_id1;
  final String doc_id2;
  final String doc_id3;

  const T_ExamsDegree(
      {super.key,
      required this.doc_id1,
      required this.doc_id2,
      required this.doc_id3});

  @override
  State<T_ExamsDegree> createState() => _T_ExamsDegreeState();
}

class _T_ExamsDegreeState extends State<T_ExamsDegree> {
  @override
  void initState() {
    getdata2();
  }

  Future<void> addrexamdegree() async {
    CollectionReference reports = FirebaseFirestore.instance
        .collection("grade")
        .doc(widget.doc_id1)
        .collection("class")
        .doc(widget.doc_id2)
        .collection("students")
        .doc(widget.doc_id3)
        .collection("exam degree");
    return reports
        .add({
          'exam degree': _currentSliderValue1,
          'comment': commentController.text,
          'exam name': ExamNameController.text,
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
                                                  _data2[index]["name"],
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
                                                  _data2[index]["ID"],
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
                                height: 40.h,
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
                                            width: 5.w,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.sp),
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 2.h),
                                              alignment: Alignment.center,
                                              height: 5.h,
                                              width: 50.w,
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
                                      const Spacer(),
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
                                      const Spacer(),
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
                                            height: 15.h,
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
                              const Spacer(),
                              SizedBox(
                                width: 90.w,
                                height: 7.h,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await addrexamdegree();
                                    Navigator.pop(context);
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
