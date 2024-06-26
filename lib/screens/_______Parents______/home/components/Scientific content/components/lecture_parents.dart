// ignore_for_file: camel_case_types, non_constant_identifier_names, annotate_overrides, avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';

class P_lecture extends StatefulWidget {
  final String doc_id1;
  final String doc_id2;
  final String doc_name;
  const P_lecture(
      {Key? key,
      required this.doc_id1,
      required this.doc_id2,
      required this.doc_name})
      : super(key: key);

  @override
  State<P_lecture> createState() => _P_lectureState();
}

class _P_lectureState extends State<P_lecture> {
  void initState() {
    super.initState();
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
        .doc(widget.doc_id2)
        .collection("lecture")
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
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Iconsax.arrow_left4,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset(
                        Assets.logoonx2,
                        height: 4.h,
                      )
                    ],
                  ),
                  Text(
                    widget.doc_name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
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
                              color: AppColours.Scheduleteacher,
                            ),
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
                                        _data[index]["name"] ??
                                            "", // handle null
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => PDF_View(
                                                  pdfurl: _data[index]["pdf"] ??
                                                      "", // handle null
                                                ),
                                              ),
                                            );
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
                      itemCount: _data.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PDF_View extends StatefulWidget {
  final String pdfurl;
  const PDF_View({Key? key, required this.pdfurl}) : super(key: key);

  @override
  State<PDF_View> createState() => _PDF_ViewState();
}

class _PDF_ViewState extends State<PDF_View> {
  PDFDocument? doc;
  void initailisePdf() async {
    doc = await PDFDocument.fromURL(widget.pdfurl);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initailisePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: doc != null
          ? PDFViewer(
              document: doc!,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
