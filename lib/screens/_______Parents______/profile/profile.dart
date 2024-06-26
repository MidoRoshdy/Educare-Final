// ignore_for_file: unused_import, use_build_context_synchronously, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors_in_immutables, avoid_print

import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:restart_app/restart_app.dart';
import 'package:sizer/sizer.dart';

class P_ProfilePage extends StatefulWidget {
  final String user_name;
  final String Class;
  final String grade;
  final String code;
  final String photo;
  P_ProfilePage(
      {super.key,
      required this.user_name,
      required this.Class,
      required this.grade,
      required this.code,
      required this.photo});

  @override
  State<P_ProfilePage> createState() => _P_ProfilePageState();
}

class _P_ProfilePageState extends State<P_ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Image.asset(
          Assets.colorhome,
          fit: BoxFit.fill,
          width: 100.w,
          height: 30.h,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 9),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        Image.asset(
                          Assets.logoonx2,
                          height: 4.h,
                        )
                      ]),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      IconButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.pushNamedAndRemoveUntil(context,
                                AppRoutes.parents_login, (route) => false);
                          },
                          icon: Icon(
                            Iconsax.logout_1,
                            color: Colors.red[600],
                          )),
                    ]),
                InkWell(
                  onTap: () {
                    print(widget.user_name);
                    print(widget.Class);
                    print(widget.grade);
                    print(widget.code);
                    print(widget.photo);
                  },
                  child: Text("Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 3.h,
                          fontWeight: FontWeight.w700)),
                ),
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),
                CircleAvatar(
                  backgroundImage: Image.network(widget.photo).image,
                  radius: 40,
                  backgroundColor: AppColours.primary300,
                ),
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),
                Text(widget.user_name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700)),

                ///////////////////////////////////
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffE3E3F9),
                    ),
                    height: 12.h,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Code",
                              style: TextStyle(
                                  color: Color(0xff33326F),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Class",
                              style: TextStyle(
                                  color: Color(0xff33326F),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Grade",
                              style: TextStyle(
                                  color: Color(0xff33326F),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              widget.code,
                              style: TextStyle(
                                  color: Color(0xff33326F),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.Class,
                              style: TextStyle(
                                  color: Color(0xff33326F),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.grade,
                              style: TextStyle(
                                  color: Color(0xff33326F),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                //////////////////////////////////////////////
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffDBDBDB),
                    ),
                    height: 12.h,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Iconsax.user,
                                color: Colors.purple[400],
                                size: 20.sp,
                              ),
                              Center(
                                  child: Text(
                                " Edit profile",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  height: 1,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "Edit all the basic profile information associated with your profile.",
                                  style: TextStyle(
                                      height: 1,
                                      color: Color(0xff000000),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: CircleAvatar(
                          child: Icon(
                            Iconsax.personalcard,
                            color: Colors.purple[600],
                            size: 20.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Change Student",
                          style: TextStyle(
                              height: 1,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000)),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: CircleAvatar(
                          child: Icon(
                            Iconsax.lamp_on,
                            color: Colors.purple[400],
                            size: 20.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Suggestions and problems",
                          style: TextStyle(
                              height: 1,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000)),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: CircleAvatar(
                          child: Icon(
                            Iconsax.headphone,
                            color: Colors.purple[400],
                            size: 20.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Help Center",
                          style: TextStyle(
                              height: 1,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000)),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: CircleAvatar(
                          child: Icon(
                            Iconsax.information,
                            color: Colors.purple[400],
                            size: 20.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "About us",
                          style: TextStyle(
                              height: 1,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000)),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        )
      ])),
    );
  }
}
