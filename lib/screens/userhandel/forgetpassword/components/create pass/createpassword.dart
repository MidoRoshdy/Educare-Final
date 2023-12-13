import 'package:educare/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/Assets.dart';

//
class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Iconsax.arrow_left4)),
                Image.asset(
                  Assets.logoonx2,
                  height: 5.h,
                )
              ]),
              const Text(
                "Creat New Password",
                style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 29.05,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                " Your new password must be different",
                style: TextStyle(
                    color: Color(0xff7D7D7D),
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    height: 1.2125,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                " from previously used password.",
                style: TextStyle(
                    color: Color(0xff7D7D7D),
                    height: 1.2125,
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500),
              ),
              const Divider(
                height: 100,
                color: Colors.transparent,
              ),
              TextField(
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
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Password must be at least 8 characters',
                  style: TextStyle(color: Color(0xff9CA3AF)),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: " Confirm Password",
                    prefixIcon: const Icon(Iconsax.lock),
                    suffixIcon: const Icon(Iconsax.eye),
                    hintStyle:
                        const TextStyle(color: Color(0xff9CA3AF), fontSize: 14),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Both password must match',
                  style: TextStyle(color: Color(0xff9CA3AF)),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.sucesspassword, (route) => false);
                },
                child: Container(
                  height: 48,
                  width: 343,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xff175073),
                  ),
                  child: const Center(
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
