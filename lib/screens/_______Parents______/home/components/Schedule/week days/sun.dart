// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_import

import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class PSunDaySchedule extends StatefulWidget {
  const PSunDaySchedule({super.key});

  @override
  State<PSunDaySchedule> createState() => _TSunDayScheduleState();
}

class _TSunDayScheduleState extends State<PSunDaySchedule> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 90.h,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                      height: 10.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(children: [
                        Row(
                          children: [
                            SizedBox(
                                height: 3.h,
                                width: 3.w,
                                child: const Column(
                                  children: [],
                                )),
                            Container(
                              height: 10.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.1)),
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColours.Scheduleteacher),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0.sp),
                                    child: Row(
                                      children: [
                                        Text(
                                          '8:15 To 9:00',
                                          style: TextStyle(
                                              color: Color(
                                                0xff33326F,
                                              ),
                                              fontSize: 10.sp),
                                        ),
                                        VerticalDivider(
                                          thickness: 1,
                                          width: 3.w,
                                          color: Color(0xff33326F),
                                        ),
                                        CircleAvatar(
                                          radius: 12.sp,
                                          backgroundColor: Color(0xff9E3E3E),
                                          backgroundImage:
                                              AssetImage(Assets.arabic),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Arabic ',
                                          style: TextStyle(
                                            color: Color(
                                              0xff33326F,
                                            ),
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
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
                itemCount: 9),
          )
        ],
      ),
    );
  }
}

//  Row(
//                           children: [
//                             Column(
//                               children: [
//                                 const Text('Time'),
//                                 Divider(
//                                   height: 2.h,
//                                   color: Colors.transparent,
//                                 ),
//                                 const Text('9:15'),
//                                 const Text("to"),
//                                 const Text('10:15'),
//                               ],
//                             ),
//                             VerticalDivider(
//                               width: 3.w,
//                               color: Colors.black,
//                             ),
//                             Column(
//                               children: [
//                                 Divider(
//                                   height: 1.h,
//                                   color: Colors.transparent,
//                                 ),
//                                 SizedBox(
//                                   width: 70.w,
//                                   child: const Row(
//                                     children: [
//                                       Text("Class"),
//                                     ],
//                                   ),
//                                 ),
//                                 Divider(
//                                   height: 1.h,
//                                   color: Colors.transparent,
//                                 ),
//                                 Container(
//                                   width: 70.w,
//                                   height: 12.h,
//                                   color: Colors.blue,
//                                   child: const Center(
//                                     child: Text('Class 1'),
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
