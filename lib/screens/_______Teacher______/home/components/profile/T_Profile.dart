// ignore_for_file: file_names, camel_case_types, use_build_context_synchronously, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_ProfilePage extends StatefulWidget {
  const T_ProfilePage({super.key});

  @override
  State<T_ProfilePage> createState() => _T_ProfilePageState();
}

class _T_ProfilePageState extends State<T_ProfilePage> {
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
                        const Icon(
                          Iconsax.arrow_left4,
                          color: Colors.white,
                        ),
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
                                AppRoutes.teacher_login, (route) => false);
                          },
                          icon: Icon(
                            Iconsax.logout_1,
                            color: Colors.red[600],
                          )),
                    ]),
                Text("Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 3.h,
                        fontWeight: FontWeight.w700)),
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(Assets.person),
                  radius: 40,
                  backgroundColor: AppColours.primary300,
                ),
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),
                Text("Ziad Ahmed",
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
                    child: const Column(
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
                              "Age",
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
                              "14357",
                              style: TextStyle(
                                  color: Color(0xff33326F),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "12 A",
                              style: TextStyle(
                                  color: Color(0xff33326F),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "16",
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
                                  fontSize: 15,
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
                              Text(
                                "Edit all the basic profile information associated with your profile.",
                                style: TextStyle(
                                    height: 1,
                                    color: Color(0xff000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
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
