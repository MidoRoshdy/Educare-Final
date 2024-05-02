// ignore_for_file: must_call_super, unnecessary_import, camel_case_types, annotate_overrides, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class p_Tickets extends StatefulWidget {
  const p_Tickets({super.key});

  @override
  State<p_Tickets> createState() => _T_TicketsState();
}

class _T_TicketsState extends State<p_Tickets> {
  @override
  void initState() {
    getdata2();
  }

  bool selected = false;

  final List<QueryDocumentSnapshot> _data2 = [];
  bool isloading = true;
  getdata2() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Tickets from web")
        .where("parent id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    _data2.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

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
                    Text("Tickets",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700)),
                    Divider(
                      height: 6.h,
                      color: Colors.transparent,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.Parents_my_tickets);
                          },
                          child: Container(
                            height: 5.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10.sp)),
                            child: Center(
                              child: Text("My Tickets",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.Parents_create_tickets);
                          },
                          child: Container(
                            height: 5.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10.sp)),
                            child: Center(
                              child: Text("Create Ticket",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      height: 1.h,
                      color: Colors.transparent,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: _data2.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = !selected;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.sp),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: selected ? 90.w : 90.w,
                                height: selected ? 25.h : 8.h,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    color: AppColours.Scheduleteacher,
                                    borderRadius: BorderRadius.circular(20.sp)),
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text("Title :",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  _data2[index]["name"],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("From :",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  _data2[index]["from"],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("To :",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  _data2[index]["to"],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Message :",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  _data2[index]["comment"],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: 1.h,
                            color: Colors.transparent,
                          );
                        },
                      ),
                    ),
                  ]))
            ])));
  }
}
