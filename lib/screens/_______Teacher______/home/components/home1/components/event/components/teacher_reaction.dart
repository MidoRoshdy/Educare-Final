// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, camel_case_types, library_private_types_in_public_api, avoid_print, non_constant_identifier_names

import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_EventReaction extends StatefulWidget {
  final String docId;

  final String teachername;
  final String teachersubject;
  final String teacherid;
  const T_EventReaction(
      {Key? key,
      required this.docId,
      required this.teachername,
      required this.teachersubject,
      required this.teacherid})
      : super(key: key);

  @override
  _T_EventReactionState createState() => _T_EventReactionState();
}

class _T_EventReactionState extends State<T_EventReaction> {
  bool isRegistered = false;

  @override
  void initState() {
    super.initState();
    _checkRegistrationStatus();
  }

  Future<void> _checkRegistrationStatus() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot eventSnapshot = await FirebaseFirestore.instance
        .collection('Event')
        .doc(widget.docId)
        .collection('EventReaction')
        .doc(userId)
        .get();

    if (eventSnapshot.exists) {
      setState(() {
        isRegistered = true;
      });
    }
  }

  Future<void> _registerForEvent() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('Event')
        .doc(widget.docId)
        .collection('EventReaction')
        .doc(userId)
        .set({
      'TeachernName': widget.teachername,
      'Teacherid': widget.teacherid,
      "TeacherSubject": widget.teachersubject,
      'Teacheruid': userId,
      'Reaction': 'interested',
    });

    // Show registration confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Registration'),
          content: Text('You have successfully registered for the event.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    setState(() {
      isRegistered = true;
    });
  }

  Future<void> _NOregisterForEvent() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('Event')
        .doc(widget.docId)
        .collection('EventReaction')
        .doc(userId)
        .set({
      'TeachernName': widget.teachername,
      'Teacherid': widget.teacherid,
      "TeacherSubject": widget.teachersubject,
      'Teacheruid': userId,
      'Reaction': 'Not interested',
    });

    // Show registration confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Registration'),
          content: Text('You have successfully registered for the event.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    setState(() {
      isRegistered = true;
    });
  }

  CollectionReference events = FirebaseFirestore.instance.collection('Event');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: events.doc(widget.docId).get(),
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
                                      child: isRegistered
                                          ? Container(
                                              height: 5.h,
                                              width: 90.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color:
                                                      AppColours.boxchooseuser),
                                              child: Center(
                                                child: Text(
                                                  'You have already registered for this event.',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    _NOregisterForEvent();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: 137,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        color: Colors.red[400]),
                                                    child: Center(
                                                      child: Text(
                                                        'Not interested',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    _registerForEvent();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: 137,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        color: Colors.green),
                                                    child: Center(
                                                      child: Text(
                                                        'interested',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
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
