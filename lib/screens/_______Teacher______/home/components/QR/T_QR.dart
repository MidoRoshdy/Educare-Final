// ignore_for_file: file_names, camel_case_types, unnecessary_import, override_on_non_overriding_member, avoid_print, annotate_overrides, prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, duplicate_import, depend_on_referenced_packages, unused_import, unnecessary_null_comparison, non_constant_identifier_names, sized_box_for_whitespace
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:educare/core/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
@override
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart'; // Import your QR code scanning package

import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';
import 'package:educare/core/Assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class T_QRPage extends StatefulWidget {
  const T_QRPage({super.key});

  @override
  State<T_QRPage> createState() => _T_QRPageState();
}

class _T_QRPageState extends State<T_QRPage> {
  List<String> scannedCodes = [];
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
          "subject": TeacherSubject
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
  final List<QueryDocumentSnapshot> _data = [];
  bool isloading = true;
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('TeacherUsers')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                      const Spacer(),
                      Image.asset(
                        Assets.logoonx2,
                        height: 4.h,
                      )
                    ]),
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
                    itemCount: 1),
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
                      child: QRViewWidget(onQRViewCreated: _onQRViewCreated)),
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
                                    borderRadius: BorderRadius.circular(20)),
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
                        itemCount: 1),
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
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                title: Text(scannedCodes[index]),
                              ),
                            ),
                          ],
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
                                    Teachername = _data[index]["username"];
                                    Teacherid = _data[index]["Educationalcode"];
                                    TeacherSubject = _data[index]["subject"];
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
                                    borderRadius: BorderRadius.circular(10),
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
                      ]),
                  Divider(
                    height: 1.h,
                    color: Colors.transparent,
                  )
                ],
              )),
            ]))
      ]))),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      if (!scannedCodes.contains(scanData.code)) {
        setState(() {
          scannedCodes.add(scanData.code!);
        });
      }
    });
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

 
  


// 



//   final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
//   String? code;

//   Widget build(BuildContext context) {
    // return 
//             Divider(
//               height: 4.h,
//               color: Colors.transparent,
//             ),
//             Text(code ?? "No code scanned",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 17.sp,
//                     fontWeight: FontWeight.w700)),
//             Spacer(),
           
                
//           ]))
//     ])));