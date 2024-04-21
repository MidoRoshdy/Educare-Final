// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers

import 'package:educare/core/Assets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_ReciveTicket extends StatefulWidget {
  const T_ReciveTicket({super.key});

  @override
  State<T_ReciveTicket> createState() => _MyTicketState();
}

class _MyTicketState extends State<T_ReciveTicket> {
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
                    Text(" Ticket",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700)),
                    Divider(
                      height: 6.h,
                      color: Colors.transparent,
                    ),
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text("From",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w400)),
                                          Container(
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.sp)),
                                            child: TextField(
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17.sp,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                height: 1.h,
                                color: Colors.transparent,
                              );
                            },
                            itemCount: 1))
                  ]))
            ])));
  }
}
