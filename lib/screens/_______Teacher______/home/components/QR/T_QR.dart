// ignore_for_file: file_names, camel_case_types, unnecessary_import, override_on_non_overriding_member, avoid_print, annotate_overrides, prefer_const_constructors
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:educare/core/colors.dart';

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
  @override
  Future<void> addscan() async {
    CollectionReference reports =
        FirebaseFirestore.instance.collection("qr code");

    return reports
        .add({
          'date': DateTime.now(),
          'scan': code,
        })
        .then((value) => print("scan Added"))
        .catchError((error) => print("Failed to add scan: $error"));
  }

  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? code;
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text("QR Page",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700)),
            Divider(
              height: 4.h,
              color: Colors.transparent,
            ),
            Divider(
              height: 4.h,
              color: Colors.transparent,
            ),
            Text(code ?? "No code scanned",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 40.w,
                  height: 7.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                          context: context,
                          onCode: (code) {
                            setState(() {
                              this.code = code;
                            });
                          });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColours.boxchooseuser,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Scan Here",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40.w,
                  height: 7.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (code == null) {
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
                        addscan();
                        code = null;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColours.primary800,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Submit Scan",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 2.h,
              color: Colors.transparent,
            ),
          ]))
    ])));
  }
}
