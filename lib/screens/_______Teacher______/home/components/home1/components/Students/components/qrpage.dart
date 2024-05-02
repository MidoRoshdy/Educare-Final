// ignore_for_file: must_call_super, unnecessary_import, prefer_const_constructors, annotate_overrides, unused_local_variable, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class QRPage extends StatefulWidget {
  const QRPage({super.key, required this.id});
  final String id;
  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  @override
  void initState() {
    getdata();
  }

  bool isloading = true;
  final List<QueryDocumentSnapshot> _data = [];
  getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("students").get();
    _data.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  CollectionReference students =
      FirebaseFirestore.instance.collection('students');
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: students.doc(widget.id).get(),
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
                            Text("Students",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700)),
                            Divider(
                              height: 5.h,
                              color: Colors.transparent,
                            ),
                            Container(
                                height: 50.h,
                                width: 100.w,
                                child: Image.network(
                                  data['qrCodeURL'],
                                  height: 2.h,
                                  width: 2.h,
                                  fit: BoxFit.contain,
                                ))
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
