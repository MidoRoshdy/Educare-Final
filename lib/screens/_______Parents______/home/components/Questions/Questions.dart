// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_const_constructors_in_immutables, annotate_overrides, file_names, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Parents______/home/components/Questions/components/quizpage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class P_Questions extends StatefulWidget {
  final String Class;
  final String grade;
  final String code;
  P_Questions(
      {super.key,
      required this.Class,
      required this.grade,
      required this.code});

  @override
  State<P_Questions> createState() => _P_QuestionsState();
}

class _P_QuestionsState extends State<P_Questions> {
  void initState() {
    getdata();
    super.initState();
  }

  bool isloading = true;
  final List<QueryDocumentSnapshot> _data = [];
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Question from teachers')
        .where("Class", isEqualTo: widget.Class)
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
        Text("Questions",
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w700)),
        Divider(
          height: 6.h,
          color: Colors.transparent,
        ),
        isloading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                height: 80.h,
                width: 100.w,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(_data[index]["Quizname"],
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
                                                      builder: (context) =>
                                                          QuizPage(
                                                            quizname: _data[
                                                                    index]
                                                                ["Quizname"],
                                                            teachername: _data[
                                                                    index][
                                                                "TteacherName"],
                                                            teacherid: _data[
                                                                    index]
                                                                ["TteacherID"],
                                                            teachersubject: _data[
                                                                    index][
                                                                "TteacherSubject"],
                                                            q1: _data[index]
                                                                ["q1"],
                                                            q2: _data[index]
                                                                ["q2"],
                                                            q3: _data[index]
                                                                ["q3"],
                                                            q4: _data[index]
                                                                ["q4"],
                                                            q5: _data[index]
                                                                ["q5"],
                                                            q6: _data[index]
                                                                ["q6"],
                                                            q7: _data[index]
                                                                ["q7"],
                                                            q8: _data[index]
                                                                ["q8"],
                                                            q9: _data[index]
                                                                ["q9"],
                                                            q10: _data[index]
                                                                ["q10"],
                                                          )));
                                            },
                                            icon: const Icon(
                                                Iconsax.arrow_right_1,
                                                color: Colors.black))
                                      ],
                                    ),
                                  ])),
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
      ])
    ]))));
  }
}
