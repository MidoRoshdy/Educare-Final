// ignore_for_file: prefer_const_constructors, camel_case_types, must_call_super, override_on_non_overriding_member, non_constant_identifier_names, avoid_print, annotate_overrides, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_CreateTicket extends StatefulWidget {
  final String teachername;
  final String teachersubject;
  final String teacherid;
  const T_CreateTicket({
    super.key,
    required this.teachername,
    required this.teachersubject,
    required this.teacherid,
  });

  @override
  State<T_CreateTicket> createState() => _T_CreateTicketState();
}

class _T_CreateTicketState extends State<T_CreateTicket> {
  @override
  final List<QueryDocumentSnapshot> _data2 = [];
  bool isloading = true;
  getdata2() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("TeacherUsers")
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    _data2.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  Future<void> addticket() async {
    CollectionReference Ticket =
        FirebaseFirestore.instance.collection("Tickets from teachers");
    return Ticket.add({
      'from': widget.teachername,
      'subject': widget.teachersubject,
      'teacher id': widget.teacherid,
      'to': tocontroller.text,
      'comment': commentController.text,
      "name": ticketnamecontroller.text,
      "answer": null,
      "uid": FirebaseAuth.instance.currentUser!.uid
    })
        .then((value) => print("ticket Added"))
        .catchError((error) => print("Failed to add ticket: $error"));
  }

  @override
  void initState() {
    getdata2();
  }

  TextEditingController commentController = TextEditingController();
  TextEditingController tocontroller = TextEditingController();
  TextEditingController ticketnamecontroller = TextEditingController();
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
                            Spacer(),
                            Image.asset(
                              Assets.logoonx2,
                              height: 4.h,
                            )
                          ]),
                    ),
                    Text("Create Tickets",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700)),
                    Divider(
                      height: 6.h,
                      color: Colors.transparent,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30.h,
                            width: 66.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("From :",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13.sp)),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.sp),
                                        child: Container(
                                            margin:
                                                EdgeInsets.only(bottom: 2.h),
                                            alignment: Alignment.center,
                                            height: 5.h,
                                            width: 32.w,
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
                                                      _data2[index]["username"],
                                                      style: TextStyle(
                                                          fontSize: 10.sp),
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("To :",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13.sp)),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.sp),
                                        child: Container(
                                            margin:
                                                EdgeInsets.only(bottom: 2.h),
                                            alignment: Alignment.center,
                                            height: 5.h,
                                            width: 32.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1.sp,
                                                    color:
                                                        AppColours.neutral500)),
                                            child: TextField(
                                                controller: tocontroller,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                ))),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("Ticket Name :",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10.sp)),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.sp),
                                        child: Container(
                                            margin:
                                                EdgeInsets.only(bottom: 2.h),
                                            alignment: Alignment.center,
                                            height: 5.h,
                                            width: 32.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1.sp,
                                                    color:
                                                        AppColours.neutral500)),
                                            child: TextField(
                                                controller:
                                                    ticketnamecontroller,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                ))),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 1.h,
                      color: Colors.transparent,
                    ),
                    Row(
                      children: [
                        Text("Comment :",
                            style: TextStyle(
                                color: Colors.black, fontSize: 13.sp)),
                      ],
                    ),
                    Divider(
                      height: 3.h,
                      color: Colors.transparent,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.sp),
                          child: Container(
                              margin: EdgeInsets.only(bottom: 2.h),
                              alignment: Alignment.center,
                              height: 20.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1.sp,
                                      color: AppColours.neutral500)),
                              child: Expanded(
                                child: TextField(
                                    controller: commentController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    )),
                              )),
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      width: 90.w,
                      height: 7.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          await addticket();
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: 'Success',
                            desc: 'Ticket Sent Successfully',
                          ).show();
                          // Delay for a short duration to ensure the dialog is shown
                          await Future.delayed(Duration(seconds: 2));
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.teacher_home,
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColours.primary800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Send Ticket",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 2.h,
                    ),
                  ]))
            ])));
  }
}
