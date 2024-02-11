import 'package:educare/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/Assets.dart';

//
class TCreatePassword extends StatelessWidget {
  const TCreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              decoration: const BoxDecoration(
                  color: Color(0xff7472E0),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Row(
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Creat New Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.05,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " Your new password must be different \n       from previously used password. ",
                  style: TextStyle(
                      color: Color(0xff7D7D7D),
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      height: 1.2125,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Text(
              " ",
              style: TextStyle(
                  color: Color(0xff7D7D7D),
                  height: 1.2125,
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500),
            ),
            const Divider(
              height: 20,
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                style: const TextStyle(fontSize: 8),
                decoration: InputDecoration(
                  hintText: " New Password",
                  prefixIcon: const Icon(Iconsax.lock),
                  suffixIcon: const Icon(Iconsax.eye),
                  hintStyle:
                      const TextStyle(color: Color(0xff9CA3AF), fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Password must be at least 8 characters',
                style: TextStyle(color: Color(0xff9CA3AF)),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                style: const TextStyle(fontSize: 8),
                decoration: InputDecoration(
                    hintText: " Confirm Password",
                    prefixIcon: const Icon(Iconsax.lock),
                    suffixIcon: const Icon(Iconsax.eye),
                    hintStyle:
                        const TextStyle(color: Color(0xff9CA3AF), fontSize: 14),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Both password must match',
                style: TextStyle(color: Color(0xff9CA3AF)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 20),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.teacher_sucesspassword);
          },
          child: Container(
            height: 48,
            width: 343,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xff2E3192),
            ),
            child: const Center(
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
