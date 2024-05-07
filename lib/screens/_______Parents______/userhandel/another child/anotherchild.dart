// ignore_for_file: prefer_final_fields, unused_field, must_call_super, unnecessary_null_comparison, non_constant_identifier_names, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Parents______/userhandel/choose%20student/choosestudent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class AnotherChild extends StatefulWidget {
  const AnotherChild({super.key});

  @override
  State<AnotherChild> createState() => _AnotherChildState();
}

class _AnotherChildState extends State<AnotherChild> {
  @override
  void initState() {
    getdata();
  }

  String user_name = "";
  String Class = "";
  String grade = "";
  String code = "";
  String photo = "";

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

  // Future<void> _checkRegistrationStatus() async {
  //   String userId = FirebaseAuth.instance.currentUser!.uid;
  //   DocumentSnapshot eventSnapshot = await FirebaseFirestore.instance
  //       .collection('Event')
  //       .doc(widget.docId)
  //       .collection('EventReaction')
  //       .doc(userId)
  //       .get();

  //   if (eventSnapshot.exists) {
  //     setState(() {
  //       isRegistered = true;
  //     });
  //   }
  // }

  Future<void> addmychildreen() async {
    CollectionReference mychildreen = FirebaseFirestore.instance
        .collection("ParentsUsers")
        .doc()
        .collection("my childreen");

    return mychildreen
        .add({
          "parent id": FirebaseAuth.instance.currentUser!.uid,
          "user_name": user_name,
          "class": Class,
          "grade": grade,
          "code": code,
          "photo": photo,
          "time": DateTime.now(),
        })
        .then((value) => print("child Added"))
        .catchError((error) => print("Failed to add a child: $error"));
  }

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
                          Text(" Add Another child ",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    padding: EdgeInsets.all(1.w),
                    margin: EdgeInsets.only(top: 3.5.h, bottom: 2.h),
                    alignment: Alignment.center,
                    height: 7.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 1.sp,
                          color: const Color.fromARGB(255, 197, 197, 197),
                        ),
                        color: Colors.white),
                    child: TextField(
                      onChanged: (value) {},
                      style: TextStyle(fontSize: 10.sp),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Educational code",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 170, 169, 169),
                        ),
                        prefixIcon: Icon(
                          Iconsax.search_normal,
                        ),
                      ),
                    ),
                  ),
                ),

                /////////serach button////////////////
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 4.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 1.sp,
                            color: const Color.fromARGB(255, 197, 197, 197),
                          ),
                          color: Colors.white),
                      child: const Text('Search',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50.h,
                    width: 100.w,
                    child: ListView.separated(
                        itemCount: _data.length,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 48,
                                          width: 48,
                                          decoration: BoxDecoration(
                                            color: AppColours.neutral300,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                              _data[index]["photo"])),
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
                                              _data[index]["class"],
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
                                                      BorderRadius.circular(5)),
                                              value: _isSelected[index],
                                              onChanged: (value) {
                                                setState(() {
                                                  value == null
                                                      ? null
                                                      : _isSelected[index] =
                                                          value;
                                                  user_name =
                                                      _data[index]["user_name"];
                                                  code = _data[index]["code"];
                                                  Class = _data[index]["class"];
                                                  grade = _data[index]["grade"];
                                                  photo = _data[index]["photo"];
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
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: 2.h,
                            color: Colors.transparent,
                          );
                        }),
                  ),
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ChooseStudent(
                          user_name: '',
                          Class: '',
                          grade: '',
                          code: '',
                          photo: '',
                        );
                      }));
                      addmychildreen();
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
