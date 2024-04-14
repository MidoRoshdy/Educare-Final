import 'package:educare/core/Assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_Tickets extends StatefulWidget {
  const T_Tickets({super.key});

  @override
  State<T_Tickets> createState() => _T_TicketsState();
}

class _T_TicketsState extends State<T_Tickets> {
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
                            Spacer(),
                            Image.asset(
                              Assets.logoonx2,
                              height: 4.h,
                            )
                          ]),
                    ),
                    Text("Tickets",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700)),
                    Divider(
                      height: 6.h,
                      color: Colors.transparent,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("All Tickets",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700)),
                        Text("Create Ticket",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                    Divider(
                      height: 1.h,
                      color: Colors.transparent,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 10.sp),
                            child: Container(
                              height: 10.h,
                              width: 100.w,
                              color: Colors.red,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: 1.h,
                            color: Colors.transparent,
                          );
                        },
                      ),
                    ),
                  ]))
            ])));
  }
}
