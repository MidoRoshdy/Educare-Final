// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, unused_import, unnecessary_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/screens/_______Teacher______/home/components/event/components/teacher_reaction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_Event extends StatefulWidget {
  const T_Event({
    super.key,
  });

  @override
  State<T_Event> createState() => _T_EventState();
}

class _T_EventState extends State<T_Event> {
  @override
  void initState() {
    getdata();

    super.initState();
  }

  bool isloading = true;
  final List<QueryDocumentSnapshot> _data = [];
  getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Event').get();
    _data.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Stack(children: [
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
                      Text("Events",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700)),
                      Divider(
                        height: 6.h,
                        color: Colors.transparent,
                      ),
                      ///////////////////////////////////////////////////////////////////////
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              height: 90.h,
                              width: double.infinity,
                              child: ListView.separated(
                                  itemCount: _data.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 20.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          border: Border.all(
                                              color: Colors.grey[700] ??
                                                  Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _data[index]['Name'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              _data[index]['Time'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              _data[index]['Date'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              _data[index]['Location'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                            Row(
                                              children: [
                                                Spacer(),
                                                Container(
                                                  height: 5.h,
                                                  width: 10.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color: Colors.grey[200]),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  T_EventReaction(
                                                                      Doc_id: _data[
                                                                              index]
                                                                          .id)));
                                                    },
                                                    child: Icon(
                                                      Iconsax.arrow_right,
                                                      color: Colors.black,
                                                      size: 20.sp,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 1.h,
                                      color: Colors.transparent,
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ]))
              ]),
            )));
  }
}


//  Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 InkWell(
//                                                   onTap: () {},
//                                                   child: Container(
//                                                     height: 45,
//                                                     width: 137,
//                                                     decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(50),
//                                                         color: Colors.red[400]),
//                                                     child: Center(
//                                                       child: Text(
//                                                         'Not interested',
//                                                         style: TextStyle(
//                                                             color:
//                                                                 Colors.white),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 InkWell(
//                                                   onTap: () {},
//                                                   child: Container(
//                                                     height: 45,
//                                                     width: 137,
//                                                     decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(50),
//                                                         color: Colors.green),
//                                                     child: Center(
//                                                       child: Text(
//                                                         'interested',
//                                                         style: TextStyle(
//                                                             color:
//                                                                 Colors.white),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )
//                                               ],
//                                             )