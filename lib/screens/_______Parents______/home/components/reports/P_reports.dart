// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, annotate_overrides, camel_case_types, must_call_super

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class P_reports extends StatefulWidget {
  final String Class;
  final String grade;
  final String code;

  const P_reports(
      {super.key,
      required this.Class,
      required this.grade,
      required this.code});

  @override
  State<P_reports> createState() => _P_reportsState();
}

class _P_reportsState extends State<P_reports> {
  void initState() {
    getdata();
  }

  bool isloading = true;
  final List<QueryDocumentSnapshot> _data = [];
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('report')
        .where("StudentID", isEqualTo: widget.code)
        .get();
    _data.addAll(querySnapshot.docs);
    isloading = false;
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
                  Text("Reports",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700)),
                  Divider(
                    height: 6.h,
                    color: Colors.transparent,
                  ),
                  Container(
                    width: 90.0.w,
                    height: 30.0.h,
                    decoration: BoxDecoration(
                      color: AppColours.Scheduleteacher,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey[500]!),
                    ),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          // ignore: unnecessary_null_comparison
                          return _data == null
                              ? Center(
                                  child: Text("No Data",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w500)),
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        children: [
                                          Text("${_data[index]['report name']}",
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w500)),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 5.sp,
                                          top: 5.0.sp,
                                          right: 5.0.sp),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Mr: ${_data[index]['TteacherName']}',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                          Padding(padding: EdgeInsets.only()),
                                          Spacer(),
                                          Text(
                                            'Sub: ${_data[index]['TteacherSubject']}',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                          Spacer(),
                                          Text(
                                            'ID: ${_data[index]['TteacherID']}',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(10.sp),
                                          child: IntrinsicHeight(
                                            child: Container(
                                              width: 16.0.w,
                                              height: 9.0.h,
                                              decoration: BoxDecoration(
                                                color:
                                                    _data[index]['attend'] > 50
                                                        ? Colors.green[400]
                                                        : Colors.red[400],
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Column(children: [
                                                Text("Attend",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Divider(
                                                  indent: 4.sp,
                                                  endIndent: 4.sp,
                                                  thickness: 0.4.sp,
                                                  height: 1.h,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                    _data[index]['attend']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ]),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.sp),
                                          child: IntrinsicHeight(
                                            child: Container(
                                              width: 16.0.w,
                                              height: 9.0.h,
                                              decoration: BoxDecoration(
                                                color: _data[index]
                                                            ['behavior'] >
                                                        50
                                                    ? Colors.green[400]
                                                    : Colors.red[400],
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Column(children: [
                                                Text("Behavior",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Divider(
                                                  indent: 4.sp,
                                                  endIndent: 4.sp,
                                                  thickness: 0.4.sp,
                                                  height: 1.h,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                    _data[index]['behavior']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ]),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.sp),
                                          child: IntrinsicHeight(
                                            child: Container(
                                              width: 16.0.w,
                                              height: 9.0.h,
                                              decoration: BoxDecoration(
                                                color: _data[index]['exam'] > 50
                                                    ? Colors.green[400]
                                                    : Colors.red[400],
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Column(children: [
                                                Text("Exam",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Divider(
                                                  indent: 4.sp,
                                                  endIndent: 4.sp,
                                                  thickness: 0.4.sp,
                                                  height: 1.h,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                    _data[index]['exam']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ]),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("comment :",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500)),
                                        VerticalDivider(
                                          width: 2.w,
                                          color: Colors.transparent,
                                        ),
                                        Container(
                                          width: 60.0.w,
                                          height: 5.0.h,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                                color: Colors.grey[500]!),
                                          ),
                                          child: Center(
                                            child: Text(_data[index]['comment'],
                                                style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 2.h,
                            color: Colors.transparent,
                          );
                        },
                        itemCount: _data.length),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
