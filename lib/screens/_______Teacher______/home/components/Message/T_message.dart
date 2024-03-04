import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Parents______/home/provider/homeprovider.dart';
import 'package:educare/screens/_______Teacher______/home/provider/T_homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class T_MessagePage extends StatefulWidget {
  const T_MessagePage({super.key});

  @override
  State<T_MessagePage> createState() => _T_MessagePageState();
}

class _T_MessagePageState extends State<T_MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
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
                    const Spacer(),
                    Image.asset(
                      Assets.logoonx2,
                      height: 4.h,
                    )
                  ]),
            ),
            
            Column(children: [
              /////////heder////////////////////////////////
              Text("Messsages",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700)),
              Divider(
                height: 4.h,
                color: Colors.transparent,
              ),
              /////search bar //////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: AppColours.neutral300, width: 0.5.sp),
                          borderRadius: BorderRadius.circular(50)),
                      width: 80.w,
                      height: 7.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 3.w,
                          ),
                          Icon(
                            Iconsax.search_normal,
                            size: 20.sp,
                            color: Colors.grey[500],
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text("Search",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400)),
                        ],
                      )),
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Message filters",
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 2.h,
                                  color: Colors.transparent,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.all(1),
                                    height: 6.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColours.neutral100,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          VerticalDivider(
                                            width: 2.w,
                                            color: Colors.transparent,
                                          ),
                                          const Text(
                                            "Unread",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Spacer(),
                                          const Icon(Iconsax.arrow_right_1)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 2.h,
                                  color: Colors.transparent,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(1),
                                  height: 6.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColours.neutral100,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        VerticalDivider(
                                          width: 2.w,
                                          color: Colors.transparent,
                                        ),
                                        const Text(
                                          "Spam",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Spacer(),
                                        const Icon(Iconsax.arrow_right_1)
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 2.h,
                                  color: Colors.transparent,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(1),
                                  height: 6.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColours.neutral100,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        VerticalDivider(
                                          width: 2.w,
                                          color: Colors.transparent,
                                        ),
                                        const Text(
                                          "Archived",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Spacer(),
                                        const Icon(Iconsax.arrow_right_1)
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 6.h,
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
              SizedBox(
                height: 63.h,
                width: 100.w,
                /////////////////////////////////empty message///////////////////////////
                child: ListView.separated(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.all(3.w),
                          height: 12.h,
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
                                Column(
                                  children: [
                                    Divider(
                                      height: 1.h,
                                    ),
                                    Image.asset(
                                      Assets.person,
                                      scale: 7.w,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            "khaleed",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: 50.w,
                                          ),
                                          Text(
                                            "10:45",
                                            style: TextStyle(fontSize: 9.sp),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 70.w,
                                        child: Text(
                                          "Hello, how are you?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: AppColours.neutral600,
                                              fontSize: 13),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ]),
                              ])),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.transparent,
                      height: 0.0,
                    );
                  },
                ),
              ),
            ])
          ]),
        )
      ]),
    ));
  }
}
