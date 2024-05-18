// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, unused_import, must_call_super, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Parents______/home/components/exam%20degree/components/subjectdegree.dart';
import 'package:educare/screens/_______Parents______/home/provider/homeprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class P_ExamDegree extends StatefulWidget {
  final String Class;
  final String grade;
  final String code;

  P_ExamDegree({
    super.key,
    required this.Class,
    required this.grade,
    required this.code,
  });

  @override
  State<P_ExamDegree> createState() => _P_ExamDegreeState();
}

class _P_ExamDegreeState extends State<P_ExamDegree> {
  @override
  void initState() {
    getdata();
  }

  bool isloading = true;
  final List<QueryDocumentSnapshot> _data = [];
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('exam degree')
        .where("studentID", isEqualTo: widget.code)
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
                  Text("Exams degree",
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
                    height: 25.0.h,
                    decoration: BoxDecoration(
                      color: AppColours.Scheduleteacher,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey[500]!),
                    ),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Text("${_data[index]['exam name']}",
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
                                    left: 5.sp, top: 5.0.sp, right: 5.0.sp),
                                child: Row(
                                  children: [
                                    Text(
                                      'Mr: ${_data[index]['TteacherName']}',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                    Padding(padding: EdgeInsets.only()),
                                    Spacer(),
                                    Text(
                                      'Sub: ${_data[index]['TteacherSubject']}',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                    Spacer(),
                                    Text(
                                      'ID: ${_data[index]['TteacherID']}',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: Container(
                                  width: 15.0.w,
                                  height: 6.0.h,
                                  decoration: BoxDecoration(
                                    color: _data[index]['exam degree'] > 50
                                        ? Colors.green[400]
                                        : Colors.red[400],
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                        _data[index]['exam degree'].toString(),
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
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
                                      borderRadius: BorderRadius.circular(10.0),
                                      border:
                                          Border.all(color: Colors.grey[500]!),
                                    ),
                                    child: Center(
                                      child: Text(_data[index]['comment'],
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 0, 0, 0),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500)),
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
//  Container(
//                                   width: 40.0.w,
//                                   height: 23.0.h,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xff168B45),
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   child: ListView.separated(
//                                       itemBuilder: (context, index) {
//                                         return InkWell(
//                                           onTap: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         P_SubjectDegree(
//                                                           Class: widget.Class,
//                                                           grade: widget.grade,
//                                                           code: widget.code,
//                                                         )));
//                                           },
//                                           child: Stack(
//                                             children: [
//                                               Image.asset(
//                                                 Assets.math,
//                                                 fit: BoxFit.cover,
//                                                 width: 42.w,
//                                                 height: 24.h,
//                                                 color: Colors.black
//                                                     .withOpacity(0.5),
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Padding(
//                                                       padding:
//                                                           EdgeInsets.symmetric(
//                                                               vertical: 40,
//                                                               horizontal: 10)),
//                                                   CircleAvatar(
//                                                     radius: 20,
//                                                     backgroundColor:
//                                                         Color(0xffD9D9D9),
//                                                     backgroundImage: AssetImage(
//                                                       Assets.math,
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     'Math',
//                                                     style: TextStyle(
//                                                         color: const Color
//                                                             .fromARGB(255, 255,
//                                                             255, 255)),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                       separatorBuilder: (context, index) {
//                                         return Divider(
//                                           height: 2.h,
//                                           color: Colors.transparent,
//                                         );
//                                       },
//                                       itemCount: 1)),
//                             ]),
//                         Divider(
//                           height: 2.h,
//                           color: Colors.transparent,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Container(
//                               width: 40.0.w,
//                               height: 23.0.h,
//                               decoration: BoxDecoration(
//                                 color: Color(0xff00B091),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Image.asset(
//                                         Assets.science,
//                                         width: 40.w,
//                                         height: 23.h,
//                                         color: Colors.black.withOpacity(0.5),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               vertical: 40, horizontal: 10)),
//                                       CircleAvatar(
//                                         radius: 20,
//                                         backgroundColor: Color(0xffD9D9D9),
//                                         backgroundImage: AssetImage(
//                                           Assets.science,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Sciences',
//                                         style: TextStyle(
//                                             color: const Color.fromARGB(
//                                                 255, 255, 255, 255)),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               width: 40.0.w,
//                               height: 23.0.h,
//                               decoration: BoxDecoration(
//                                 color: Color(0xffA50294),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Image.asset(
//                                         Assets.computer,
//                                         width: 40.w,
//                                         height: 23.h,
//                                         color: Colors.black.withOpacity(0.5),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               vertical: 40, horizontal: 10)),
//                                       CircleAvatar(
//                                         radius: 20,
//                                         backgroundColor: Color(0xffD9D9D9),
//                                         backgroundImage: AssetImage(
//                                           Assets.computer,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Computer',
//                                         style: TextStyle(
//                                             color: const Color.fromARGB(
//                                                 255, 255, 255, 255)),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Divider(
//                           height: 2.h,
//                           color: Colors.transparent,
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                 width: 40.0.w,
//                                 height: 23.0.h,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xff8F7F2A),
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                                 child: Stack(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Image.asset(
//                                           Assets.english,
//                                           width: 40.w,
//                                           height: 23.h,
//                                           color: Colors.black.withOpacity(0.5),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 vertical: 40, horizontal: 10)),
//                                         CircleAvatar(
//                                           radius: 20,
//                                           backgroundColor: Color(0xffD9D9D9),
//                                           backgroundImage: AssetImage(
//                                             Assets.english,
//                                           ),
//                                         ),
//                                         Text(
//                                           'English',
//                                           style: TextStyle(
//                                             color: const Color.fromARGB(
//                                                 255, 255, 255, 255),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 width: 40.0.w,
//                                 height: 23.0.h,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xff1039A3),
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                                 child: Stack(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Image.asset(
//                                           Assets.religon,
//                                           width: 40.w,
//                                           height: 23.h,
//                                           color: Colors.black.withOpacity(0.5),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 vertical: 40, horizontal: 10)),
//                                         CircleAvatar(
//                                           radius: 20,
//                                           backgroundColor: Color(0xffD9D9D9),
//                                           backgroundImage: AssetImage(
//                                             Assets.religon,
//                                           ),
//                                         ),
//                                         Text(
//                                           'Religion',
//                                           style: TextStyle(
//                                               color: const Color.fromARGB(
//                                                   255, 255, 255, 255)),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ]),
//                         Divider(
//                           height: 2.h,
//                           color: Colors.transparent,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Container(
//                               width: 40.0.w,
//                               height: 23.0.h,
//                               decoration: BoxDecoration(
//                                 color: Color(0xff1A9EBB),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Image.asset(
//                                         Assets.history,
//                                         width: 40.w,
//                                         height: 23.h,
//                                         color: Colors.black.withOpacity(0.5),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               vertical: 40, horizontal: 10)),
//                                       CircleAvatar(
//                                         radius: 20,
//                                         backgroundColor: Color(0xffD9D9D9),
//                                         backgroundImage: AssetImage(
//                                           Assets.history,
//                                         ),
//                                       ),
//                                       Text(
//                                         'History',
//                                         style: TextStyle(
//                                             color: const Color.fromARGB(
//                                                 255, 255, 255, 255)),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
