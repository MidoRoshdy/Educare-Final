// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_null_comparison, sized_box_for_whitespace, unused_import, non_constant_identifier_names, unnecessary_import, prefer_final_fields

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Parents______/home/components/home1/home1.dart';
import 'package:educare/screens/_______Parents______/home/home.dart';
import 'package:educare/screens/_______Parents______/home/provider/homeprovider.dart';
import 'package:educare/screens/_______Parents______/userhandel/another%20child/anotherchild.dart';
import 'package:educare/screens/_______Parents______/userhandel/another%20child/provider/anotherchildstate.dart';
import 'package:educare/screens/_______Parents______/userhandel/choose%20student/provider/chosestudentprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ChooseStudent extends StatefulWidget {
  final String user_name;
  final String Class;
  final String grade;
  final String code;
  final String photo;

  const ChooseStudent({
    Key? key,
    required this.user_name,
    required this.Class,
    required this.grade,
    required this.code,
    required this.photo,
  }) : super(key: key);

  @override
  State<ChooseStudent> createState() => _ChooseStudentState();
}

class _ChooseStudentState extends State<ChooseStudent> {
  int selectedChildIndex = -1;

  @override
  void initState() {
    getdata();
    getdata2();
    super.initState();
  }

  String doc_id = '';
  final List<QueryDocumentSnapshot> _data2 = [];
  getdata2() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('ParentsUsers')
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    _data2.addAll(querySnapshot.docs);
    setState(() {
      isloading = false;
    });
  }

  bool isloading = true;
  List<QueryDocumentSnapshot> _data = [];
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("MyChildreen")
        .where("parent id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    _data.addAll(querySnapshot.docs);
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              Assets.backgroundapp,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  decoration: const BoxDecoration(
                    color: Color(0xff7472E0),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 8.sp, left: 8.sp, right: 8.sp),
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
                            ),
                          ],
                        ),
                        Divider(height: 3.h, color: Colors.transparent),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                " Choose your child ",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                isloading
                    ? Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 62.h,
                          width: 100.w,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedChildIndex = index;
                                  });
                                },
                                child: Container(
                                  width: 100.w,
                                  height: 18.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: selectedChildIndex == index
                                        ? Colors.blue
                                        : Color(0xff80A7D6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 48,
                                              width: 48,
                                              decoration: BoxDecoration(
                                                color: AppColours.neutral300,
                                                shape: BoxShape.circle,
                                              ),
                                              child: NetworkImage(_data[index]
                                                          ["photo"]) ==
                                                      null
                                                  ? Image.asset(
                                                      Assets.person,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.network(
                                                      _data[index]["photo"],
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 5.w),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Name',
                                                    style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Code',
                                                    style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Class',
                                                    style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 2.w),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(':'),
                                                  Text(':'),
                                                  Text(':'),
                                                ],
                                              ),
                                              SizedBox(width: 2.w),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _data[index]["user_name"],
                                                    style: const TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    _data[index]["code"],
                                                    style: const TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    _data[index]["class"],
                                                    style: const TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              VerticalDivider(
                                                width: 10.w,
                                                color: Colors.transparent,
                                              ),
                                              Column(
                                                children: [
                                                  Divider(
                                                    height: 4.h,
                                                    color: Colors.transparent,
                                                  ),
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    fillColor:
                                                        MaterialStateColor
                                                            .resolveWith(
                                                      (states) {
                                                        return selectedChildIndex ==
                                                                index
                                                            ? AppColours
                                                                .primary500
                                                            : AppColours
                                                                .neutral300;
                                                      },
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    value: selectedChildIndex ==
                                                        index,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if (value != null &&
                                                            value) {
                                                          selectedChildIndex =
                                                              index;
                                                        } else {
                                                          selectedChildIndex =
                                                              -1;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(
                              height: 2.h,
                              color: Colors.transparent,
                            ),
                            itemCount: _data.length,
                          ),
                        ),
                      ),
                Spacer(),
                Container(
                  height: 5.h,
                  width: 100.w,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return TextButton(
                        onPressed: () {
                          setState(() {
                            doc_id = _data2[index].id;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnotherChild(
                                doc_id: doc_id,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Add Another Child',
                          style: TextStyle(
                            color: Color(0xff175073),
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      height: 2.h,
                      color: Colors.transparent,
                    ),
                    itemCount: 1,
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 8.h,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            if (selectedChildIndex != -1) {
                              setState(() {
                                context.read<HomeProvider>().state.user_name =
                                    _data[selectedChildIndex]["user_name"];
                                context.read<HomeProvider>().state.Class =
                                    _data[selectedChildIndex]["class"];
                                context.read<HomeProvider>().state.grade =
                                    _data[selectedChildIndex]["grade"];
                                context.read<HomeProvider>().state.code =
                                    _data[selectedChildIndex]["code"];
                                context.read<HomeProvider>().state.photo =
                                    _data[selectedChildIndex]["photo"];
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ),
                              );
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.bottomSlide,
                                title: 'Error',
                                desc: 'Please select a child',
                                btnOkOnPress: () {},
                              ).show();
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColours.primary800,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Continue',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      height: 2.h,
                      color: Colors.transparent,
                    ),
                    itemCount: 1,
                  ),
                ),
                Divider(
                  height: 2.h,
                  color: Colors.transparent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
