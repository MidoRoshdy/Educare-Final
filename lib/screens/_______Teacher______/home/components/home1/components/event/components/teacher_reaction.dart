// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, empty_statements, camel_case_types, unnecessary_import, non_constant_identifier_names, annotate_overrides

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_EventReaction extends StatefulWidget {
  final String Doc_id;
  const T_EventReaction({super.key, required this.Doc_id});

  @override
  State<T_EventReaction> createState() => _T_EventReactionState();
}

class _T_EventReactionState extends State<T_EventReaction> {
  void initState() {
    getdata2();
    super.initState();
  }

  bool isloading = true;

  final List<QueryDocumentSnapshot> _data2 = [];
  getdata2() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('TeacherUsers')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    _data2.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  Future<void> addEventReactionInterested() async {
    CollectionReference reports = FirebaseFirestore.instance
        .collection("Event")
        .doc(widget.Doc_id)
        .collection("Event Reaction");
    ;

    return reports
        .add({
          'TeachernName': username,
          'Teacherid': userid,
          'Reaction': "interested",
        })
        .then((value) => print("Event Added"))
        .catchError((error) => print("Failed to add Event: $error"));
  }

  Future<void> addEventReactionNotInterested() async {
    CollectionReference reports = FirebaseFirestore.instance
        .collection("Event")
        .doc(widget.Doc_id)
        .collection("Event Reaction");
    ;

    return reports
        .add({
          'TeachernName': username,
          'Teacherid': userid,
          'Reaction': "Not interested",
        })
        .then((value) => print("Event Added"))
        .catchError((error) => print("Failed to add Event: $error"));
  }

  String username = '';
  String userid = '';

  CollectionReference events = FirebaseFirestore.instance.collection('Event');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: events.doc(widget.Doc_id).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                            Center(
                              child: Container(
                                width: 100.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                        Assets.bannerevent,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Text(data['Name'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w700)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Text(data['Time'],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w700)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Text(data['Date'],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w700)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Text(data['Location'],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w700)),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 1.h,
                                      color: Colors.transparent,
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              addEventReactionNotInterested();
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 45,
                                              width: 137,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.red[400]),
                                              child: Center(
                                                child: Text(
                                                  'Not interested',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              addEventReactionInterested();
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 45,
                                              width: 137,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.green),
                                              child: Center(
                                                child: Text(
                                                  'interested',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 1.h,
                                      color: Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]))
                    ]))));
          }
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        });
  }
}


            //         Container(
            //           height: 90.h,
            //           child: ListView.separated(
            //               itemBuilder: (context, index) {
            //                 return Container(
            //                   height: 170,
            //                   width: double.infinity,
            //                   decoration: BoxDecoration(
            //                       color: Colors.grey[200],
            //                       border: Border.all(
            //                           color: Colors.grey[700] ??
            //                               Colors.transparent),
            //                       borderRadius: BorderRadius.circular(20)),
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(12.0),
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Text(
            //                           _data[index]['Name'],
            //                           style: TextStyle(
            //                               fontWeight: FontWeight.bold,
            //                               fontSize: 18),
            //                         ),
            //                         Text(
            //                           _data[index]['Time'],
            //                           style: TextStyle(
            //                               fontSize: 14, color: Colors.grey),
            //                         ),
            //                         Text(
            //                           _data[index]['Date'],
            //                           style: TextStyle(
            //                               fontSize: 14, color: Colors.grey),
            //                         ),
            //                         Text(
            //                           _data[index]['Location'],
            //                           style: TextStyle(
            //                               fontSize: 14, color: Colors.grey),
            //                         ),
            //                         Spacer(),
            //                         Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             InkWell(
            //                               onTap: () {},
            //                               child: Container(
            //                                 height: 45,
            //                                 width: 137,
            //                                 decoration: BoxDecoration(
            //                                     borderRadius:
            //                                         BorderRadius.circular(50),
            //                                     color: Colors.red[400]),
            //                                 child: Center(
            //                                   child: Text(
            //                                     'Not interested',
            //                                     style: TextStyle(
            //                                         color: Colors.white),
            //                                   ),
            //                                 ),
            //                               ),
            //                             ),
            //                             InkWell(
            //                               onTap: () {},
            //                               child: Container(
            //                                 height: 45,
            //                                 width: 137,
            //                                 decoration: BoxDecoration(
            //                                     borderRadius:
            //                                         BorderRadius.circular(50),
            //                                     color: Colors.green),
            //                                 child: Center(
            //                                   child: Text(
            //                                     'interested',
            //                                     style: TextStyle(
            //                                         color: Colors.white),
            //                                   ),
            //                                 ),
            //                               ),
            //                             )
            //                           ],
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 );
            //               },
            //               separatorBuilder: (context, index) {
            //                 return Divider(
            //                   height: 1.h,
            //                   color: Colors.transparent,
            //                 );
            //               },
            //               itemCount: _data.length),
            //         )
            //       ]))
            // ]))));