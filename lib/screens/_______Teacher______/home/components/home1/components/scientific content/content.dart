import 'package:educare/core/Assets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class T_content extends StatefulWidget {
  const T_content({super.key});

  @override
  State<T_content> createState() => _T_contentState();
}

class _T_contentState extends State<T_content> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Image.asset(
          Assets.scientificcontentcolor,
          fit: BoxFit.fill,
          width: 100.w,
          height: 20.h,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
              Text("Lecture 1",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700)),
              Divider(
                height: 1.h,
                color: Colors.transparent,
              ),
            ]))
      ])),
    );
  }
}
