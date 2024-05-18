// ignore_for_file: camel_case_types, unnecessary_import, non_constant_identifier_names, prefer_const_constructors, annotate_overrides, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class P_TuitionExpenses extends StatefulWidget {
  final String user_name;
  final String Class;
  final String grade;
  final String code;
  final String photo;
  const P_TuitionExpenses(
      {super.key,
      required this.user_name,
      required this.Class,
      required this.grade,
      required this.code,
      required this.photo});

  @override
  State<P_TuitionExpenses> createState() => _P_TuitionExpensesState();
}

class _P_TuitionExpensesState extends State<P_TuitionExpenses> {
  void initState() {
    getdata();

    super.initState();
  }

  bool isloading = true;
  final List<QueryDocumentSnapshot> _data = [];
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Tuition Expenses')
        .where("student id", isEqualTo: widget.code)
        .get();
    _data.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
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
            Text("Tuition Expenses",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700)),
            Divider(
              height: 6.h,
              color: Colors.transparent,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return _data.isEmpty
                        ? Center(
                            child: Text("No Data",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500)),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: AppColours.Scheduleteacher,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.grey[700]!),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: Row(
                                    children: [
                                      Text(
                                          "Name : ${_data[index]['student name']}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500)),
                                      Spacer(),
                                      Text("ID : ${_data[index]['student id']}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 75.0.w,
                                        child: Row(
                                          children: [
                                            Text("Payment advance :",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Spacer(),
                                            Container(
                                              width: 30.0.w,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                    color: Colors.grey[500]!),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "${_data[index]['Payment advance']}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 75.0.w,
                                        child: Row(
                                          children: [
                                            Text("Date :",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Spacer(),
                                            Container(
                                              width: 30.0.w,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                    color: Colors.grey[500]!),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "${_data[index]['Date']}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 75.0.w,
                                        child: Row(
                                          children: [
                                            Text("The remaining amount :",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Spacer(),
                                            Container(
                                              width: 30.0.w,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                    color: Colors.grey[500]!),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "${_data[index]['The remaining amount']}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 90.0.w,
                                    height: 15.0.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200]!,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border:
                                          Border.all(color: Colors.grey[700]!),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0.sp),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 75.0.w,
                                                child: Row(
                                                  children: [
                                                    Text("First time amount :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Spacer(),
                                                    Container(
                                                      width: 30.0.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[500]!),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "${_data[index]['First time amount']}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0.sp),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 75.0.w,
                                                child: Row(
                                                  children: [
                                                    Text("First time date :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Spacer(),
                                                    Container(
                                                      width: 30.0.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[500]!),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "${_data[index]['First time date']}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ///////////////////////////////////
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 90.0.w,
                                    height: 15.0.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200]!,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border:
                                          Border.all(color: Colors.grey[700]!),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0.sp),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 75.0.w,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                        "Secound time amount :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Spacer(),
                                                    Container(
                                                      width: 30.0.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[500]!),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "${_data[index]['secound time amount']}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0.sp),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 75.0.w,
                                                child: Row(
                                                  children: [
                                                    Text("Secound time date :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Spacer(),
                                                    Container(
                                                      width: 30.0.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[500]!),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "${_data[index]['secound time date']}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ), /////////////////////////////////////////////
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 90.0.w,
                                    height: 15.0.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200]!,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border:
                                          Border.all(color: Colors.grey[700]!),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0.sp),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 75.0.w,
                                                child: Row(
                                                  children: [
                                                    Text("Thired time amount :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Spacer(),
                                                    Container(
                                                      width: 30.0.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[500]!),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "${_data[index]['thired time amount']}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0.sp),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 75.0.w,
                                                child: Row(
                                                  children: [
                                                    Text("Thired time date :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Spacer(),
                                                    Container(
                                                      width: 30.0.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[500]!),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "${_data[index]['thired time date']}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        ///////////////////////////////////////////////////////////
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
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
          ]))
    ])));
  }
}

// Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: Row(
//                             children: [
//                               Text("${_data[index]['student name']}",
//                                   style: TextStyle(
//                                       color: const Color.fromARGB(255, 0, 0, 0),
//                                       fontSize: 17.sp,
//                                       fontWeight: FontWeight.w500)),
//                               Spacer(),
//                               Text("${_data[index]['student id']}",
//                                   style: TextStyle(
//                                       color: const Color.fromARGB(255, 0, 0, 0),
//                                       fontSize: 17.sp,
//                                       fontWeight: FontWeight.w500)),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               left: 5.sp, top: 5.0.sp, right: 5.0.sp),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Mr: ${_data[index]['Payment advance']}',
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 0, 0, 0)),
//                               ),
//                               Padding(padding: EdgeInsets.only()),
//                               Spacer(),
//                               Text(
//                                 'Sub: ${_data[index]['Date']}',
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 0, 0, 0)),
//                               ),
//                               Spacer(),
//                               Text(
//                                 'ID: ${_data[index]['The remaining amount']}',
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 0, 0, 0)),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Padding(
//                         //   padding: EdgeInsets.all(10.sp),
//                         //   child: Container(
//                         //     width: 15.0.w,
//                         //     height: 6.0.h,
//                         //     decoration: BoxDecoration(
//                         //       color: _data[index]['exam degree'] > 50
//                         //           ? Colors.green[400]
//                         //           : Colors.red[400],
//                         //       borderRadius: BorderRadius.circular(10.0),
//                         //     ),
//                         //     child: Center(
//                         //       child: Text(
//                         //           _data[index]['exam degree'].toString(),
//                         //           style: TextStyle(
//                         //               color: const Color.fromARGB(255, 0, 0, 0),
//                         //               fontSize: 14.sp,
//                         //               fontWeight: FontWeight.w500)),
//                         //     ),
//                         //   ),
//                         // ),
//                         // Row(
//                         //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         //   children: [
//                         //     Text("comment :",
//                         //         style: TextStyle(
//                         //             color: Colors.black,
//                         //             fontSize: 14.sp,
//                         //             fontWeight: FontWeight.w500)),
//                         //     VerticalDivider(
//                         //       width: 2.w,
//                         //       color: Colors.transparent,
//                         //     ),
//                         //     Container(
//                         //       width: 60.0.w,
//                         //       height: 5.0.h,
//                         //       decoration: BoxDecoration(
//                         //         color: Colors.white,
//                         //         borderRadius: BorderRadius.circular(10.0),
//                         //         border: Border.all(color: Colors.grey[500]!),
//                         //       ),
//                         //       child: Center(
//                         //         child: Text(_data[index]['comment'],
//                         //             style: TextStyle(
//                         //                 color:
//                         //                     const Color.fromARGB(255, 0, 0, 0),
//                         //                 fontSize: 14.sp,
//                         //                 fontWeight: FontWeight.w500)),
//                         //       ),
//                         //     ),
//                         //   ],
//                         // ),
//                       ],
//                     );
