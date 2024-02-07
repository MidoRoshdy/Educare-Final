import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Parents______/userhandel/another%20child/provider/anotherchildprovider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AnotherChild extends StatelessWidget {
  const AnotherChild({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              Assets.backgroundapp,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: [
                ////////////////////////////////appbar ///////////////////////////////////
                Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  decoration: const BoxDecoration(
                      color: Color(0xff7472E0),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                      Divider(height: 3.h, color: Colors.transparent),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" Add Another child ",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(1.w),
                    margin: EdgeInsets.only(top: 3.5.h, bottom: 2.h),
                    alignment: Alignment.center,
                    height: 8.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 1.sp,
                          color: const Color.fromARGB(255, 197, 197, 197),
                        ),
                        color: Colors.white),
                    child: TextField(
                      style: TextStyle(fontSize: 14.sp),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Educational code",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 170, 169, 169),
                        ),
                        prefixIcon: Icon(
                          Iconsax.search_normal,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 1.h,
                  color: Colors.transparent,
                ),

                /////////serach button////////////////
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 30.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 1.sp,
                            color: const Color.fromARGB(255, 197, 197, 197),
                          ),
                          color: Colors.white),
                      child: const Text('Search',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                Divider(
                  height: 3.h,
                  color: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xff80A7D6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  color: AppColours.neutral300,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Iconsax.user),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Code',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Class',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(':'),
                                    Text(':'),
                                    Text(':'),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ziad mohamed',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'S-123-124',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '9-B',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  width: 2.3.w,
                                  color: Colors.transparent,
                                ),
                                Column(
                                  children: [
                                    Divider(
                                      height: 4.h,
                                      color: Colors.transparent,
                                    ),
                                    Checkbox(
                                        checkColor: Colors.white,
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) {
                                          return context
                                                  .watch<AnotherChildProvider>()
                                                  .state
                                                  .checkchild
                                              ? AppColours.primary500
                                              : AppColours.neutral300;
                                        }),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        value: context
                                            .watch<AnotherChildProvider>()
                                            .state
                                            .checkchild,
                                        onChanged: context
                                            .read<AnotherChildProvider>()
                                            .onChangeCheckChild),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.choosestudent, (route) => false);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff175073),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Continue',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Divider(
                  height: 2.h,
                  color: Colors.transparent,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
