import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class TWedSchedule extends StatefulWidget {
  const TWedSchedule({super.key});

  @override
  State<TWedSchedule> createState() => _TWedScheduleState();
}

class _TWedScheduleState extends State<TWedSchedule> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Column(
        children: [
          SizedBox(
            width: 90.w,
            height: 80.h,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                      height: 20.h,
                      width: 50.w,
                      color: Colors.grey[50],
                      child: Column(children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
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
                                    Text('9:15'),
                                    Text("to"),
                                    Text('10:15'),
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
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0, top: 8.0, right: 8.0),
                                    child: Row(
                                      children: [
                                        Text('Math 1'),
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
                                        const Text('Class I-2'),
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
                itemCount: 5),
          )
        ],
      ),
    );
  }
}
