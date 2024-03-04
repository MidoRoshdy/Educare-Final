// ignore_for_file: prefer_final_fields, must_call_super, unused_field, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Parents______/userhandel/choose%20student/provider/chosestudentprovider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ChooseStudent extends StatefulWidget {
  const ChooseStudent({super.key});

  @override
  State<ChooseStudent> createState() => _ChooseStudentState();
}

class _ChooseStudentState extends State<ChooseStudent> {
  @override
  void initState() {
    getdata();
  }

  bool isloading = true;
  List<QueryDocumentSnapshot> _data = [];
  List<bool> _isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("students").get();
    _data.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
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
                ////////////////////////////////appbar ///////////////////////////////////
                Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  decoration: const BoxDecoration(
                      color: Color(0xff7472E0),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
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
                                )),
                            Image.asset(
                              Assets.logoonx2,
                              height: 4.h,
                            )
                          ]),
                      Divider(height: 3.h, color: Colors.transparent),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" Choose your child ",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 3.h,
                  color: Colors.transparent,
                ),
                ///////////list of childrens////////////////////////
                isloading
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 50.h,
                          width: 100.w,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Container(
                                width: 100.w,
                                height: 18.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xff80A7D6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                            child: const Icon(Iconsax.user),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Name',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  'Code',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  'Class',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(':'),
                                                Text(':'),
                                                Text(':'),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _data[index]["user_name"],
                                                  style: const TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  _data[index]["code"],
                                                  style: const TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  _data[index]["blood"],
                                                  style: const TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
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
                                                  fillColor: MaterialStateColor
                                                      .resolveWith((states) {
                                                    return _isSelected[index]
                                                        ? AppColours.primary500
                                                        : AppColours.neutral300;
                                                  }),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  value: _isSelected[index],
                                                  onChanged: (value) {
                                                    setState(() {
                                                      value == null
                                                          ? null
                                                          : _isSelected[index] =
                                                              value;
                                                    });
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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

                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoutes.Parents_anotherchild);
                    },
                    child: const Text(
                      'Add Another Child',
                      style: TextStyle(
                          color: Color(0xff175073),
                          fontFamily: 'Inter',
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.Parents_home, (route) => false);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColours.primary800,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Continue',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Divider(
                  height: 2.h,
                  color: Colors.transparent,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
