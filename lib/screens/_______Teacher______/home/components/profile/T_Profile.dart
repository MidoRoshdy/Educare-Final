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
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Image.asset(
        Assets.colorhome,
        fit: BoxFit.fill,
        width: 100.w,
        height: 30.h,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 9),
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
                    const Spacer(),
                    Image.asset(
                      Assets.logoonx2,
                      height: 4.h,
                    )
                  ]),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Spacer(),
              IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.teacher_login, (route) => false);
                  },
                  icon: Icon(
                    Iconsax.logout_1,
                    color: AppColours.danger500,
                  )),
            ]),
            Text("Profile Page",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
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

            ////////////////apllied reviewed contacted////////////////////
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 234, 190, 243)),
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
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Class",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Age",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "46",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "A-4",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "16",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    ])));
  }
}

// SafeArea(
//       child: Scaffold(
//           body: Stack(
//         children: [
//           Divider(
//             height: 1.h,
//           ),
//           Container(
//             height: 30.h,
//             color: AppColours.primary100,
//           ),
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Divider(
//                   height: 2.7.h,
//                   color: Colors.transparent,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                         onPressed: () =>
//                             context.read<HomeProvider>().returnHome(),
//                         icon: const Icon(Iconsax.arrow_left4)),
//                     Text("profile",
//                         style: TextStyle(
//                             fontSize: 17.sp, fontWeight: FontWeight.w500)),
//                    
//                   ],
//                 ),
//                 Divider(
//                   height: 12.h,
//                 ),
//                 ////////////////pic/////////////////////////////
               
//                 //////////////////////name///////////////////////////
//                 Text(
//                   "${context.watch<HomeProvider>().state.username}",
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.w500),
//                 ),
//                 Divider(
//                   height: 1.h,
//                   color: Colors.transparent,
//                 ),
//                 Text(
//                   context.watch<ProfileProvider>().state.bioController.text,
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: AppColours.neutral500),
//                 ),
//                 //////////////////////apllied reviewed contacted////////////////////
                





//                    Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(children: [
//             Divider(
//               height: 1.h,
//               color: Colors.transparent,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Spacer(),
//                     Image.asset(
//                       Assets.logoonx2,
//                       height: 4.h,
//                     )
//                   ]),
//             ),
//             Column(children: [
//               /////////heder////////////////////////////////
//               Text("Profile Page",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 17.sp,
//                       fontWeight: FontWeight.w700)),
//               Divider(
//                 height: 4.h,
//                 color: Colors.transparent,
//               ),
//               Column(
//                 children: [
//                   IconButton(
//                     
//                     icon: const Icon(Icons.exit_to_app),
//                   )
//                 ],
//               ),
//             ])
//           ]))