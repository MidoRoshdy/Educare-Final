// ignore_for_file: must_call_super, avoid_print, non_constant_identifier_names, camel_case_types, file_names, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/components/exams%20degree/examdegree.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/components/reports/reports.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_chooseStudentsForExamDegree extends StatefulWidget {
  final String doc_id1;
  final String doc_id2;
  final String teachername;
  final String teachersubject;
  final String teacherid;
  final String gradeID;
  final String classID;
  const T_chooseStudentsForExamDegree(
      {super.key,
      required this.doc_id1,
      required this.doc_id2,
      required this.teachername,
      required this.teachersubject,
      required this.teacherid,
      required this.gradeID,
      required this.classID});

  @override
  State<T_chooseStudentsForExamDegree> createState() =>
      _T_chooseStudentsForExamDegreeState();
}

class _T_chooseStudentsForExamDegreeState
    extends State<T_chooseStudentsForExamDegree> {
  @override
  void initState() {
    getdata();
  }

  final List<QueryDocumentSnapshot> _data = [];

  bool isloading = true;
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('grade')
        .doc(widget.doc_id1)
        .collection('class')
        .doc(widget.doc_id2)
        .collection('students')
        .get();
    isloading = false;
    _data.addAll(querySnapshot.docs);
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
            Text("Exams Degree",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700)),
            Divider(
              height: 5.h,
              color: Colors.transparent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Choose Student :",
                    style: TextStyle(
                        fontSize: 13.sp, fontWeight: FontWeight.w700)),
              ],
            ),
            Divider(
              height: 1.h,
              color: Colors.transparent,
            ),
            isloading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    width: 1,
                                    color: Colors.black.withOpacity(0.2)),
                                color: AppColours.Scheduleteacher),
                            height: 10.h,
                            width: double.infinity,
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, right: 6),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(_data[index]["user_name"],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400)),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => T_ExamsDegree(
                                                            doc_id1:
                                                                widget.doc_id1,
                                                            doc_id2:
                                                                widget.doc_id2,
                                                            doc_id3:
                                                                _data[index].id,
                                                            teachername: widget
                                                                .teachername,
                                                            teachersubject: widget
                                                                .teachersubject,
                                                            teacherid: widget
                                                                .teacherid,
                                                            gradeID:
                                                                widget.gradeID,
                                                            classID:
                                                                widget.classID,
                                                            StudentID:
                                                                _data[index]
                                                                    ["code"])));
                                              },
                                              icon: const Icon(
                                                  Iconsax.arrow_right_1,
                                                  color: Colors.black))
                                        ],
                                      ),
                                    ])),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 1.h,
                            color: Colors.transparent,
                          );
                        },
                        itemCount: _data.length))
          ]))
    ])));
  }
}
