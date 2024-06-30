// ignore_for_file: sized_box_for_whitespace, avoid_print, non_constant_identifier_names, camel_case_types, annotate_overrides, prefer_const_constructors, file_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:educare/core/Assets.dart';
import 'package:sizer/sizer.dart';

class T_QRPage extends StatefulWidget {
  const T_QRPage({Key? key}) : super(key: key);

  @override
  State<T_QRPage> createState() => _T_QRPageState();
}

class _T_QRPageState extends State<T_QRPage> {
  List<String> scannedCodes = [];
  List<String> studentNames = [];
  Future<void> addscan() async {
    CollectionReference reports =
        FirebaseFirestore.instance.collection("qr code");

    return reports
        .add({
          "day": int.parse(Jiffy.now().format(pattern: "dd")),
          "month": int.parse(Jiffy.now().format(pattern: "MM")),
          "year": int.parse(Jiffy.now().format(pattern: "yyyy")),
          "teacher id": FirebaseAuth.instance.currentUser!.uid,
          "teacher name": Teachername,
          "teacher school id": Teacherid,
          'code': scannedCodes,
          "subject": TeacherSubject,
          "seconds": Jiffy.now().second,
          "minutes": Jiffy.now().minute,
          "hour": Jiffy.now().hour,
          // "time": Jiffy.now().format(pattern: "hh:mm a"),
        })
        .then((value) => print("scan Added"))
        .catchError((error) => print("Failed to add scan: $error"));
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  String? Teachername = "";
  String? Teacherid = "";
  String? TeacherSubject = "";
  final List<DocumentSnapshot> _data = [];
  bool isloading = true;
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('TeacherUsers')
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    _data.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Image.asset(
                Assets.colorhome,
                fit: BoxFit.fill,
                width: 100.w,
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
                          const Spacer(),
                          Image.asset(
                            Assets.logoonx2,
                            height: 4.h,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 7.h,
                      width: 100.w,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Center(
                            child: Text("QR Page",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700)),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 1.h,
                            color: Colors.transparent,
                          );
                        },
                        itemCount: 1,
                      ),
                    ),
                    Divider(
                      height: 6.h,
                      color: Colors.transparent,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                              height: 30.h,
                              width: 50.w,
                              child: QRViewWidget(
                                  onQRViewCreated: _onQRViewCreated)),
                          Divider(
                            height: 1.h,
                            color: Colors.transparent,
                          ),
                          Container(
                            height: 7.h,
                            width: 100.w,
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ListTile(
                                        title: InkWell(
                                          onTap: () {},
                                          child: Text("Students Codes :",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: 1.h,
                                  color: Colors.transparent,
                                );
                              },
                              itemCount: 1,
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemCount: scannedCodes.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                        width: 90.w,
                                        decoration: BoxDecoration(
                                            color: AppColours.primary100,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              // Check if studentNames has a name at the current index before accessing it
                                              studentNames.isNotEmpty &&
                                                      index <
                                                          studentNames.length
                                                  ? Text(studentNames[index],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w700))
                                                  : Text(
                                                      "", // Or display a placeholder if no name is available
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                              Spacer(),
                                              Text(scannedCodes[index],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w700))
                                            ],
                                          ),
                                        )),
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  height: 1.h,
                                  color: Colors.transparent,
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 70.w,
                                height: 7.h,
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return ElevatedButton(
                                      onPressed: () async {
                                        setState(() {
                                          Teachername =
                                              _data[index]["username"];
                                          Teacherid =
                                              _data[index]["Educationalcode"];
                                          TeacherSubject =
                                              _data[index]["subject"];
                                        });

                                        if (scannedCodes.isEmpty) {
                                          // Check if scannedCodes is empty instead of null
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.error,
                                            animType: AnimType.rightSlide,
                                            title: 'Error',
                                            desc: 'Please scan a code first',
                                          ).show();
                                        } else {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.success,
                                            animType: AnimType.rightSlide,
                                            title: 'Success',
                                            desc: 'Scan Submitted Successfully',
                                          ).show();
                                          await addscan(); // Wait for addscan() to finish before clearing scannedCodes
                                          setState(() {
                                            scannedCodes.clear();
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColours.primary800,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        "Submit Scan",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 1.h,
                                      color: Colors.transparent,
                                    );
                                  },
                                  itemCount: 1,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 1.h,
                            color: Colors.transparent,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) async {
      if (!scannedCodes.contains(scanData.code)) {
        setState(() {
          scannedCodes.add(scanData.code!);
        });
        // Fetch username from Firestore based on the scanned code
        await fetchUsername(scanData.code!);
      }
    });
  }

  Future<void> fetchUsername(String code) async {
    try {
      // Fetch document from 'students' collection where 'user_code' field matches the scanned code
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('students')
          .where("code", isEqualTo: code)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        // Retrieve the username from the fetched document
        String username = querySnapshot.docs.first.get("user_name");
        setState(() {
          // Update Teachername with the fetched username
          studentNames.add(username);
        });
      } else {
        // Handle case where no document matches the scanned code
        print("No student found with the scanned code: $code");
      }
    } catch (error) {
      print("Error fetching username: $error");
    }
  }
}

class QRViewWidget extends StatelessWidget {
  final Function(QRViewController) onQRViewCreated;

  const QRViewWidget({Key? key, required this.onQRViewCreated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: GlobalKey(debugLabel: 'QR'),
      onQRViewCreated: onQRViewCreated,
    );
  }
}
