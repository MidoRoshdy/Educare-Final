// ignore_for_file: prefer_final_fields, unused_field, must_call_super, unnecessary_null_comparison, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
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
    // getdata();
  }

  String Code = "";
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
  // getdata() async {
  //   QuerySnapshot querySnapshot =
  //       await FirebaseFirestore.instance.collection("students").get();
  //   _data.addAll(querySnapshot.docs);
  //   isloading = false;
  //   setState(() {});
  // }

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
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(1.w),
                    margin: EdgeInsets.only(top: 3.5.h, bottom: 2.h),
                    alignment: Alignment.center,
                    height: 8.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 1.sp,
                          color: const Color.fromARGB(255, 197, 197, 197),
                        ),
                        color: Colors.white),
                    child: TextField(
                      onChanged: (value) {},
                      style: TextStyle(fontSize: 14.sp),
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
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),

                /////////serach button////////////////
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
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
                Divider(
                  height: 3.h,
                  color: Colors.transparent,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: (Code != "" && Code != null)
                        ? FirebaseFirestore.instance
                            .collection("students")
                            .where("code", arrayContains: Code)
                            .snapshots()
                        : FirebaseFirestore.instance
                            .collection("students")
                            .snapshots(),
                    builder: (context, snapshot) {
                      return (snapshot.connectionState ==
                              ConnectionState.waiting)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 36.h,
                                width: 100.w,
                                child: ListView.separated(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      DocumentSnapshot data =
                                          snapshot.data!.docs[index];
                                      return Container(
                                        width: 100.w,
                                        height: 18.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: const Color(0xff80A7D6),
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
                                                      color:
                                                          AppColours.neutral300,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: const Icon(
                                                        Iconsax.user),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    const Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          data["user_name"],
                                                          style:
                                                              const TextStyle(
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        Text(
                                                          data["code"],
                                                          style:
                                                              const TextStyle(
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        Text(
                                                          data["blood"],
                                                          style:
                                                              const TextStyle(
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
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        Checkbox(
                                                          checkColor:
                                                              Colors.white,
                                                          fillColor:
                                                              MaterialStateColor
                                                                  .resolveWith(
                                                                      (states) {
                                                            return _isSelected[
                                                                    index]
                                                                ? AppColours
                                                                    .primary500
                                                                : AppColours
                                                                    .neutral300;
                                                          }),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          value: _isSelected[
                                                              index],
                                                          onChanged: (value) {
                                                            setState(() {
                                                              value == null
                                                                  ? null
                                                                  : _isSelected[
                                                                          index] =
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
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Divider(
                                        height: 2.h,
                                        color: Colors.transparent,
                                      );
                                    }),
                              ),
                            );
                    }),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.Parents_choosestudent, (route) => false);
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




 // isloading
                //     ? const Center(child: CircularProgressIndicator())
                //     : Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: SizedBox(
                //           height: 20.h,
                //           width: 100.w,
                //           child: ListView.separated(
                //             itemBuilder: (context, index) {
                //               return Container(
                //                 width: 100.w,
                //                 height: 18.h,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(30),
                //                   color: const Color(0xff80A7D6),
                //                 ),
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(16.0),
                //                   child: Row(
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     children: [
                //                       Column(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.start,
                //                         children: [
                //                           Container(
                //                             height: 48,
                //                             width: 48,
                //                             decoration: BoxDecoration(
                //                               color: AppColours.neutral300,
                //                               shape: BoxShape.circle,
                //                             ),
                //                             child: const Icon(Iconsax.user),
                //                           ),
                //                         ],
                //                       ),
                //                       SizedBox(
                //                         width: 5.w,
                //                       ),
                //                       Padding(
                //                         padding: const EdgeInsets.only(top: 8),
                //                         child: Row(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.center,
                //                           children: [
                //                             const Column(
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.start,
                //                               children: [
                //                                 Text(
                //                                   'Name',
                //                                   style: TextStyle(
                //                                     fontFamily: 'Inter',
                //                                     fontWeight: FontWeight.w400,
                //                                     fontSize: 16,
                //                                   ),
                //                                 ),
                //                                 Text(
                //                                   'Code',
                //                                   style: TextStyle(
                //                                     fontFamily: 'Inter',
                //                                     fontWeight: FontWeight.w400,
                //                                     fontSize: 16,
                //                                   ),
                //                                 ),
                //                                 Text(
                //                                   'Class',
                //                                   style: TextStyle(
                //                                     fontFamily: 'Inter',
                //                                     fontWeight: FontWeight.w400,
                //                                     fontSize: 16,
                //                                   ),
                //                                 ),
                //                               ],
                //                             ),
                //                             SizedBox(
                //                               width: 2.w,
                //                             ),
                //                             const Column(
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.start,
                //                               children: [
                //                                 Text(':'),
                //                                 Text(':'),
                //                                 Text(':'),
                //                               ],
                //                             ),
                //                             SizedBox(
                //                               width: 2.w,
                //                             ),
                //                             Column(
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.start,
                //                               children: [
                //                                 Text(
                //                                   _data[index]["user_name"],
                //                                   style: const TextStyle(
                //                                     fontFamily: 'Inter',
                //                                     fontWeight: FontWeight.w400,
                //                                     fontSize: 16,
                //                                   ),
                //                                 ),
                //                                 Text(
                //                                   _data[index]["code"],
                //                                   style: const TextStyle(
                //                                     fontFamily: 'Inter',
                //                                     fontWeight: FontWeight.w400,
                //                                     fontSize: 16,
                //                                   ),
                //                                 ),
                //                                 Text(
                //                                   _data[index]["blood"],
                //                                   style: const TextStyle(
                //                                     fontFamily: 'Inter',
                //                                     fontWeight: FontWeight.w400,
                //                                     fontSize: 16,
                //                                   ),
                //                                 ),
                //                               ],
                //                             ),
                //                             VerticalDivider(
                //                               width: 10.w,
                //                               color: Colors.transparent,
                //                             ),
                //                             Column(
                //                               children: [
                //                                 Divider(
                //                                   height: 4.h,
                //                                   color: Colors.transparent,
                //                                 ),
                //                                 Checkbox(
                //                                   checkColor: Colors.white,
                //                                   fillColor: MaterialStateColor
                //                                       .resolveWith((states) {
                //                                     return _isSelected[index]
                //                                         ? AppColours.primary500
                //                                         : AppColours.neutral300;
                //                                   }),
                //                                   shape: RoundedRectangleBorder(
                //                                       borderRadius:
                //                                           BorderRadius.circular(
                //                                               5)),
                //                                   value: _isSelected[index],
                //                                   onChanged: (value) {
                //                                     setState(() {
                //                                       value == null
                //                                           ? null
                //                                           : _isSelected[index] =
                //                                               value;
                //                                     });
                //                                   },
                //                                 )
                //                               ],
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               );
                //             },
                //             separatorBuilder: (context, index) => 
                //             itemCount: _data.length,
                //           ),
                //         ),
                //       ),
