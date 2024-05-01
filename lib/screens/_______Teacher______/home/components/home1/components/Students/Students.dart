// ignore_for_file: camel_case_types, must_call_super, file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/components/Students/components/details.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_Students extends StatefulWidget {
  const T_Students({super.key});

  @override
  State<T_Students> createState() => _T_StudentsState();
}

class _T_StudentsState extends State<T_Students> {
  @override
  void initState() {
    getdata();
  }

  bool isloading = true;
  final List<QueryDocumentSnapshot> _data = [];
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
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
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
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Iconsax.arrow_left_2,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        Assets.logoonx2,
                        height: 4.h,
                      )
                    ]),
              ),
              Text("Students",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700)),
              Divider(
                height: 5.h,
                color: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Choose Students :",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
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
                        hintText: "Educational code",
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
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 4.h,
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
              isloading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.separated(
                        itemCount: _data.length,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.all(3.w),
                              height: 12.h,
                              width: 95.w,
                              decoration: BoxDecoration(
                                  border: Border.symmetric(
                                      horizontal: BorderSide(
                                          width: 0.3.w,
                                          color: AppColours.neutral300))),
                              alignment: Alignment.topLeft,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      height: 1.h,
                                    ),
                                    CircleAvatar(
                                        radius: 3.h,
                                        backgroundImage: NetworkImage(
                                            _data[index]["photo"])),
                                    VerticalDivider(
                                      width: 2.w,
                                      color: Colors.transparent,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _data[index]["user_name"],
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          T_DetailsStudents(
                                                              documentId:
                                                                  _data[index]
                                                                      .id)));
                                            },
                                            child: Icon(Iconsax.arrow_right_1)),
                                      ],
                                    ),
                                  ]));
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: Colors.transparent,
                            height: 0.3,
                          );
                        },
                      ),
                    ),
            ]))
      ]),
    ));
  }
}
