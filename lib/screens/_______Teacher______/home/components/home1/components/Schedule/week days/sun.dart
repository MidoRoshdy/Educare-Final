// ignore_for_file: annotate_overrides, must_call_super, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class TSunDaySchedule extends StatefulWidget {
  final String teachername;
  final String teachersubject;
  final String teacherid;
  final String Sub_code;
  const TSunDaySchedule(
      {super.key,
      required this.teachername,
      required this.teachersubject,
      required this.teacherid,
      required this.Sub_code});

  @override
  State<TSunDaySchedule> createState() => _TSunDayScheduleState();
}

class _TSunDayScheduleState extends State<TSunDaySchedule> {
  void initState() {
    getdata();
  }

  final List<QueryDocumentSnapshot> _data = [];
  bool isloading = true;
  getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Schedule').get();
    isloading = false;
    _data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Column(
        children: [
          SizedBox(
            width: 90.w,
            height: 19.h,
            child: isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                          height: 18.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 5.h,
                                  width: 25.w,
                                  child: const Row(
                                    children: [
                                      Text("Time"),
                                      Spacer(),
                                      Text("Class ")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 10.h,
                                    width: 13.w,
                                    child: const Column(
                                      children: [
                                        Text('8:15'),
                                        Text("to"),
                                        Text('9:00'),
                                      ],
                                    )),
                                Container(
                                  height: 12.h,
                                  width: 75.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.1)),
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColours.Scheduleteacher),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, top: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Text(_data[index]['Sun_Subject1'] !=
                                                    widget.teachersubject
                                                ? (_data[1]['Sun_Subject1'] !=
                                                        widget.teachersubject
                                                    ? "you have no class today"
                                                    : _data[1]['Sun_Subject1'])
                                                : _data[index]['Sun_Subject1']),
                                            Spacer(),
                                            Icon(Iconsax.more4)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Iconsax.location,
                                              size: 15.sp,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(_data[index]['Sun_Subject1'] !=
                                                    widget.teachersubject
                                                ? (_data[1]['Sun_Subject1'] !=
                                                        widget.teachersubject
                                                    ? ""
                                                    : _data[1]['Class'])
                                                : _data[index]['Class']),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ]));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 2.h,
                        color: Colors.transparent,
                      );
                    },
                    itemCount: 1),
          ),
          Divider(
            height: 3.h,
            color: Colors.transparent,
          ),
          SizedBox(
            width: 90.w,
            height: 19.h,
            child: isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                          height: 18.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 5.h,
                                  width: 25.w,
                                  child: const Row(
                                    children: [
                                      Text("Time"),
                                      Spacer(),
                                      Text("Class ")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 10.h,
                                    width: 13.w,
                                    child: const Column(
                                      children: [
                                        Text('9:00'),
                                        Text("to"),
                                        Text('9:45'),
                                      ],
                                    )),
                                Container(
                                  height: 12.h,
                                  width: 75.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.1)),
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColours.Scheduleteacher),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, top: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Text(_data[index]['Sun_Subject2'] !=
                                                    widget.teachersubject
                                                ? (_data[1]['Sun_Subject2'] !=
                                                        widget.teachersubject
                                                    ? "you have no class today"
                                                    : _data[1]['Sun_Subject2'])
                                                : _data[index]['Sun_Subject2']),
                                            Spacer(),
                                            Icon(Iconsax.more4)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Iconsax.location,
                                              size: 15.sp,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(_data[index]['Sun_Subject2'] !=
                                                    widget.teachersubject
                                                ? (_data[1]['Sun_Subject2'] !=
                                                        widget.teachersubject
                                                    ? ""
                                                    : _data[1]['Class'])
                                                : _data[index]['Class']),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ]));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1.h,
                        color: Colors.transparent,
                      );
                    },
                    itemCount: 1),
          ),
          Divider(
            height: 3.h,
            color: Colors.transparent,
          ),
          SizedBox(
            width: 90.w,
            height: 19.h,
            child: isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                          height: 18.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 5.h,
                                  width: 25.w,
                                  child: const Row(
                                    children: [
                                      Text("Time"),
                                      Spacer(),
                                      Text("Class ")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 10.h,
                                    width: 13.w,
                                    child: const Column(
                                      children: [
                                        Text('9:45'),
                                        Text("to"),
                                        Text('10:30'),
                                      ],
                                    )),
                                Container(
                                  height: 12.h,
                                  width: 75.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.1)),
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColours.Scheduleteacher),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, top: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Text(_data[index]['Sun_Subject3'] !=
                                                    widget.teachersubject
                                                ? (_data[1]['Sun_Subject3'] !=
                                                        widget.teachersubject
                                                    ? "you have no class today"
                                                    : _data[1]['Sun_Subject3'])
                                                : _data[index]['Sun_Subject3']),
                                            Spacer(),
                                            Icon(Iconsax.more4)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Iconsax.location,
                                              size: 15.sp,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(_data[index]['Sun_Subject3'] !=
                                                    widget.teachersubject
                                                ? (_data[1]['Sun_Subject3'] !=
                                                        widget.teachersubject
                                                    ? ""
                                                    : _data[1]['Class'])
                                                : _data[index]['Class']),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ]));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1.h,
                        color: Colors.transparent,
                      );
                    },
                    itemCount: 1),
          ),
          Divider(
            height: 3.h,
            color: Colors.transparent,
          ),
          SizedBox(
            width: 90.w,
            height: 19.h,
            child: isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                          height: 18.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 5.h,
                                  width: 25.w,
                                  child: const Row(
                                    children: [
                                      Text("Time"),
                                      Spacer(),
                                      Text("Class ")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 10.h,
                                    width: 13.w,
                                    child: const Column(
                                      children: [
                                        Text('10:30'),
                                        Text("to"),
                                        Text('11:15'),
                                      ],
                                    )),
                                Container(
                                    height: 12.h,
                                    width: 75.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.1)),
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColours.boxchooseuser),
                                    child: Center(
                                      child: Text(_data[index]['Break'],
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.white)),
                                    ))
                              ],
                            )
                          ]));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1.h,
                        color: Colors.transparent,
                      );
                    },
                    itemCount: 1),
          ),
          Divider(
            height: 3.h,
            color: Colors.transparent,
          ),
          SizedBox(
            width: 90.w,
            height: 19.h,
            child: isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                          height: 18.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 5.h,
                                  width: 25.w,
                                  child: const Row(
                                    children: [
                                      Text("Time"),
                                      Spacer(),
                                      Text("Class ")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 10.h,
                                    width: 13.w,
                                    child: const Column(
                                      children: [
                                        Text('11:15'),
                                        Text("to"),
                                        Text('12:00'),
                                      ],
                                    )),
                                Container(
                                  height: 12.h,
                                  width: 75.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.1)),
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColours.Scheduleteacher),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, top: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Text(_data[index]['Sun_Subject4'] !=
                                                    widget.teachersubject
                                                ? (_data[1]['Sun_Subject4'] !=
                                                        widget.teachersubject
                                                    ? "you have no class today"
                                                    : _data[1]['Sun_Subject4'])
                                                : _data[index]['Sun_Subject4']),
                                            Spacer(),
                                            Icon(Iconsax.more4)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Iconsax.location,
                                              size: 15.sp,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(_data[index]['Sun_Subject4'] !=
                                                    widget.teachersubject
                                                ? (_data[1]['Sun_Subject4'] !=
                                                        widget.teachersubject
                                                    ? ""
                                                    : _data[1]['Class'])
                                                : _data[index]['Class']),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ]));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1.h,
                        color: Colors.transparent,
                      );
                    },
                    itemCount: 1),
          ),
          Divider(
            height: 3.h,
            color: Colors.transparent,
          ),
          Divider(
            height: 3.h,
            color: Colors.transparent,
          ),
          SizedBox(
            width: 90.w,
            height: 19.h,
            child: isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                          height: 18.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 5.h,
                                  width: 25.w,
                                  child: const Row(
                                    children: [
                                      Text("Time"),
                                      Spacer(),
                                      Text("Class ")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 10.h,
                                    width: 13.w,
                                    child: const Column(
                                      children: [
                                        Text('12:00'),
                                        Text("to"),
                                        Text('12:45'),
                                      ],
                                    )),
                                Container(
                                  height: 12.h,
                                  width: 75.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.1)),
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColours.Scheduleteacher),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, top: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Text(_data[index]['Sun_Subject5'] !=
                                                    widget.teachersubject
                                                ? (_data[1]['Sun_Subject5'] !=
                                                        widget.teachersubject
                                                    ? "you have no class today"
                                                    : _data[1]['Sun_Subject5'])
                                                : _data[index]['Sun_Subject5']),
                                            Spacer(),
                                            Icon(Iconsax.more4)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Iconsax.location,
                                              size: 15.sp,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(_data[index]['Sun_Subject5'] !=
                                                    widget.teachersubject
                                                ? (_data[1]['Sun_Subject5'] !=
                                                        widget.teachersubject
                                                    ? "you have no class today"
                                                    : _data[1]['Class'])
                                                : _data[index]['Class']),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ]));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1.h,
                        color: Colors.transparent,
                      );
                    },
                    itemCount: 1),
          ),
          Divider(
            height: 3.h,
            color: Colors.transparent,
          ),
          Divider(
            height: 3.h,
            color: Colors.transparent,
          ),
          SizedBox(
            width: 90.w,
            height: 19.h,
            child: isloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                          height: 18.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 5.h,
                                  width: 25.w,
                                  child: const Row(
                                    children: [
                                      Text("Time"),
                                      Spacer(),
                                      Text("Class ")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 10.h,
                                    width: 13.w,
                                    child: const Column(
                                      children: [
                                        Text('12:45'),
                                        Text("to"),
                                        Text('1:30'),
                                      ],
                                    )),
                                Container(
                                  height: 12.h,
                                  width: 75.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.1)),
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColours.Scheduleteacher),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, top: 8.0, right: 8.0),
                                        child: Row(
                                          children: [
                                            Text(_data[index]['Sun_Subject6'] !=
                                                    widget.teachersubject
                                                ? (_data[1]['Sun_Subject6'] !=
                                                        widget.teachersubject
                                                    ? "you have no class today"
                                                    : _data[1]['Sun_Subject6'])
                                                : _data[index]['Sun_Subject6']),
                                            Spacer(),
                                            Icon(Iconsax.more4)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Iconsax.location,
                                              size: 15.sp,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(_data[index]['Sun_Subject6'] !=
                                                    widget.teachersubject
                                                ? (_data[1]['Sun_Subject6'] !=
                                                        widget.teachersubject
                                                    ? ""
                                                    : _data[1]['Class'])
                                                : _data[index]['Class']),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ]));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1.h,
                        color: Colors.transparent,
                      );
                    },
                    itemCount: 1),
          ),
          Divider(
            height: 3.h,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
