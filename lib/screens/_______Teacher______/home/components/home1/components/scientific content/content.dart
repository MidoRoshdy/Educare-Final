// ignore_for_file: camel_case_types, unnecessary_import, non_constant_identifier_names, must_call_super, unused_field, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/components/scientific%20content/lecture.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';

class T_content extends StatefulWidget {
  final String doc_id1;
  const T_content({
    super.key,
    required this.doc_id1,
  });

  @override
  State<T_content> createState() => _T_contentState();
}

class _T_contentState extends State<T_content> {
  @override
  void initState() {
    getdata();
    // getdata2();
  }

  final List<QueryDocumentSnapshot> _data = [];
  bool isloading = true;
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('subject')
        .doc(widget.doc_id1)
        .collection("content")
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
          Assets.scientificcontentcolor,
          fit: BoxFit.fill,
          width: 100.w,
          height: 20.h,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Iconsax.arrow_left4,
                      color: Colors.white,
                    )),
                Image.asset(
                  Assets.logoonx2,
                  height: 4.h,
                )
              ]),
              Text("content ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700)),
              Divider(
                height: 8.h,
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
                                                      T_Lecture(
                                                        doc_id1: widget.doc_id1,
                                                        doc_id2:
                                                            _data[index].id,
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
            ]))
      ])),
    );
  }
}
