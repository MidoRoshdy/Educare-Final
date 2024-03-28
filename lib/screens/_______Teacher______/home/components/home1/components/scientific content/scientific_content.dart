// ignore_for_file: camel_case_types, avoid_unnecessary_containers, unused_import, must_call_super

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/components/scientific%20content/content.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_ScientificContent extends StatefulWidget {
  const T_ScientificContent({
    super.key,
  });

  @override
  State<T_ScientificContent> createState() => _T_ScientificContentState();
}

class _T_ScientificContentState extends State<T_ScientificContent> {
  @override
  void initState() {
    getdata();
  }

  final List<QueryDocumentSnapshot> _data = [];
  bool isloading = true;
  getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('subject').get();
    isloading = false;
    _data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              child: Stack(children: [
        Image.asset(
          Assets.colorhome,
          fit: BoxFit.fill,
          width: 100.w,
          height: 25.h,
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

              Text("Subjects",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700)),
              Divider(
                height: 1.h,
                color: Colors.transparent,
              ),

              Divider(
                height: 10.h,
                color: Colors.transparent,
              ),

              ////////////////apllied reviewed contacted////////////////////
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
                                                      T_content(
                                                        doc_id1:
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
      ]))),
    );
  }
}
