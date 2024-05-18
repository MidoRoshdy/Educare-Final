// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_single_cascade_in_expression_statements

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class AnotherChild extends StatefulWidget {
  final String doc_id;

  const AnotherChild({
    Key? key,
    required this.doc_id,
  }) : super(key: key);

  @override
  State<AnotherChild> createState() => _AnotherChildState();
}

class _AnotherChildState extends State<AnotherChild> {
  late String user_name1 = '';
  late String Class1 = '';
  late String grade1 = '';
  late String code1 = '';
  late String photo1 = '';
  late bool isloading;
  late List<QueryDocumentSnapshot> _data;
  late List<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    isloading = true;
    _data = [];
    _isSelected = List.generate(15, (index) => false);
    getdata();
  }

  Future<void> addMyChildren() async {
    CollectionReference myChildren =
        FirebaseFirestore.instance.collection("MyChildren");

    await myChildren.add({
      "parent id": FirebaseAuth.instance.currentUser!.uid,
      "user_name": user_name1,
      "class": Class1,
      "grade": grade1,
      "code": code1,
      "photo": photo1,
      "time": DateTime.now(),
    }).then((value) {
      print("Child Added");
    }).catchError((error) {
      print("Failed to add a child: $error");
    });
  }

  Future<void> getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("students").get();
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
                        EdgeInsets.only(left: 8.0.sp, right: 8.sp, top: 8.sp),
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
                                " Add Another Child ",
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
                // Search Bar
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8),
                  child: Container(
                    padding: EdgeInsets.all(1.w),
                    margin: EdgeInsets.only(top: 3.5.h, bottom: 2.h),
                    alignment: Alignment.center,
                    height: 6.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 1.sp,
                        color: const Color.fromARGB(255, 197, 197, 197),
                      ),
                      color: Colors.white,
                    ),
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
                          Icons.search,
                        ),
                      ),
                    ),
                  ),
                ),
                // Search Button
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
                        color: Colors.white,
                      ),
                      child: const Text(
                        'Search',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                // List of Children
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: isloading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.separated(
                            itemCount: _data.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                height: 2.h,
                                color: Colors.transparent,
                              );
                            },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    for (int i = 0;
                                        i < _isSelected.length;
                                        i++) {
                                      _isSelected[i] = i == index;
                                    }
                                    user_name1 = _data[index]["user_name"];
                                    code1 = _data[index]["code"];
                                    Class1 = _data[index]["class"];
                                    grade1 = _data[index]["grade"];
                                    photo1 = _data[index]["photo"];
                                  });
                                },
                                child: Container(
                                  width: 100.w,
                                  height: 18.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: _isSelected[index]
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
                                              child: Image.network(
                                                _data[index]["photo"],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 5.w),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "name",
                                                style: const TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                "code",
                                                style: const TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                "class",
                                                style: const TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
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
                                        SizedBox(width: 10.w),
                                        Checkbox(
                                          checkColor: Colors.white,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                            (states) {
                                              return _isSelected[index]
                                                  ? AppColours.primary500
                                                  : AppColours.neutral300;
                                            },
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          value: _isSelected[index],
                                          onChanged: (value) {
                                            setState(() {
                                              _isSelected[index] = value!;
                                              if (value) {
                                                user_name1 =
                                                    _data[index]["user_name"];
                                                code1 = _data[index]["code"];
                                                Class1 = _data[index]["class"];
                                                grade1 = _data[index]["grade"];
                                                photo1 = _data[index]["photo"];
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
                // Continue Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      if (user_name1.isNotEmpty &&
                          Class1.isNotEmpty &&
                          photo1.isNotEmpty &&
                          grade1.isNotEmpty &&
                          code1.isNotEmpty) {
                        addMyChildren();
                        Navigator.pop(context);
                      } else {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.bottomSlide,
                          title: 'Error',
                          desc: 'Please select a child',
                          btnOkOnPress: () {},
                        )..show();
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
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
