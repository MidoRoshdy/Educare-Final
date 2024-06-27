// ignore_for_file: file_names, camel_case_types, unused_import, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Teacher______/home/components/Message/components/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_MessagePage extends StatefulWidget {
  const T_MessagePage({super.key});

  @override
  State<T_MessagePage> createState() => _T_MessagePageState();
}

class _T_MessagePageState extends State<T_MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
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
                Column(children: [
                  /////////header////////////////////////////////
                  Text("Messages",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700)),
                  Divider(
                    height: 6.h,
                    color: Colors.transparent,
                  ),
                  /////search bar //////////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 6.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              width: 1.sp,
                              color: const Color.fromARGB(255, 197, 197, 197),
                            ),
                            color: Colors.white),
                        child: TextField(
                          onChanged: (value) {},
                          style: TextStyle(fontSize: 12.sp),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search...",
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 170, 169, 169),
                            ),
                            prefixIcon: Icon(Iconsax.search_normal),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            enableDrag: true,
                            isScrollControlled: true,
                            isDismissible: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
                            useRootNavigator: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                alignment: Alignment.topLeft,
                                height: 40.h,
                                width: 95.w,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Message filters",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 2.h,
                                      color: Colors.transparent,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.all(1),
                                        height: 6.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColours.neutral100,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(50))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              VerticalDivider(
                                                width: 2.w,
                                                color: Colors.transparent,
                                              ),
                                              const Text(
                                                "Unread",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const Spacer(),
                                              const Icon(Iconsax.arrow_right_1)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 2.h,
                                      color: Colors.transparent,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.all(1),
                                        height: 6.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColours.neutral100,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(50))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              VerticalDivider(
                                                width: 2.w,
                                                color: Colors.transparent,
                                              ),
                                              const Text(
                                                "Spam",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const Spacer(),
                                              const Icon(Iconsax.arrow_right_1)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 2.h,
                                      color: Colors.transparent,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.all(1),
                                        height: 6.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColours.neutral100,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(50))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              VerticalDivider(
                                                width: 2.w,
                                                color: Colors.transparent,
                                              ),
                                              const Text(
                                                "Archived",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const Spacer(),
                                              const Icon(Iconsax.arrow_right_1)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 5.h,
                          width: 12.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColours.neutral300, width: 0.5.sp),
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(Iconsax.setting_4),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    height: 2.h,
                    color: Colors.transparent,
                  ),
                  Container(
                    height: 10.h,
                    width: 100.w,
                    child: _builduserlistAdmin(),
                  ),
                  SizedBox(
                    width: 100.w,
                    child: _builduserlist(),
                  ),
                ])
              ]))
        ]),
      ),
    );
  }
}

Widget _builduserlist() {
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection("ParentsUsers").snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text(
          "Error",
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        );
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Text(
          "Loading",
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        );
      }
      return SizedBox(
        height: 60.h,
        width: 100.w,
        child: ListView(
          children: snapshot.data!.docs
              .where((doc) =>
                  doc['uid'] != null) // Filter out documents without UID
              .map<Widget>((doc) => _builduserlistitem(doc, context))
              .toList(),
        ),
      );
    },
  );
}

Widget _builduserlistitem(DocumentSnapshot document, context) {
  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
  if (FirebaseAuth.instance.currentUser!.email != data["email"]) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => T_ChatScreen(
              receiveruseremail: data["username"],
              receiverId: data["uid"],
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(3.w),
        height: 12.h,
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              width: 0.3.w,
              color: AppColours.neutral300,
            ),
          ),
        ),
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            CircleAvatar(
              child: Image.network(
                data["profileimage"],
                scale: 4.w,
              ),
            ),
            VerticalDivider(
              width: 2.w,
              color: Colors.transparent,
            ),
            Text(
              data["username"],
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              "10:45",
              style: TextStyle(
                fontSize: 9.sp,
              ),
            )
          ],
        ),
      ),
    );
  } else {
    return Container();
  }
}

////////////////Admin//////////////////////////////////////////////////////////////

_builduserlistAdmin() {
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection("userProfiles").snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text(
          "Error",
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        );
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Text(
          "Loading",
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        );
      }
      return SizedBox(
        height: 60.h,
        width: 100.w,
        child: ListView(
          children: snapshot.data!.docs
              .where((doc) =>
                  doc['uid'] != null) // Filter out documents without UID
              .map<Widget>((doc) => _builduserlistitemAdmin(doc, context))
              .toList(),
        ),
      );
    },
  );
}

Widget _builduserlistitemAdmin(DocumentSnapshot document, context) {
  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
  if (FirebaseAuth.instance.currentUser!.email != data["email"]) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => T_ChatScreen(
              receiveruseremail: "Admin",
              receiverId: data["uid"],
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(3.w),
        height: 12.h,
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              width: 0.3.w,
              color: AppColours.neutral300,
            ),
          ),
        ),
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            CircleAvatar(
              child: Image.asset(
                Assets.person,
                scale: 4.w,
              ),
            ),
            VerticalDivider(
              width: 2.w,
              color: Colors.transparent,
            ),
            Text(
              "Admin",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              "10:45",
              style: TextStyle(
                fontSize: 9.sp,
              ),
            )
          ],
        ),
      ),
    );
  } else {
    return Container();
  }
}
