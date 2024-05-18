// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, file_names, annotate_overrides, must_call_super, non_constant_identifier_names, avoid_print, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Parents______/home/components/Scientific%20content/components/content_parents.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class P_ScientificContent extends StatefulWidget {
  final String user_name;
  final String Class;
  final String grade;
  final String code;
  final String photo;
  const P_ScientificContent(
      {super.key,
      required this.user_name,
      required this.Class,
      required this.grade,
      required this.code,
      required this.photo});

  @override
  State<P_ScientificContent> createState() => _T_NotificationPageState();
}

class _T_NotificationPageState extends State<P_ScientificContent> {
  void initState() {
    getdata();
  }

  final List<QueryDocumentSnapshot> _data = [];
  bool isloading = true;
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('subject')
        .where("grade", isEqualTo: widget.grade)
        .get();
    isloading = false;
    _data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                InkWell(
                  onTap: () {
                    print(widget.user_name);
                    print(widget.Class);
                    print(widget.grade);
                    print(widget.code);
                    print(widget.photo);
                  },
                  child: Text("Scientific Content",
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
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(20),
                                color: AppColours.Scheduleteacher),
                            height: 10.h,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        _data[index]["name"],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        P_Content(
                                                          doc_id:
                                                              _data[index].id,
                                                          doc_name: _data[index]
                                                              ["name"],
                                                        )));
                                          },
                                          child: CircleAvatar(
                                            radius: 15.sp,
                                            backgroundColor:
                                                AppColours.neutral300,
                                            child: Icon(
                                              Icons.arrow_right_alt_rounded,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 1,
                          color: Colors.transparent,
                        );
                      },
                      itemCount: _data.length),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
