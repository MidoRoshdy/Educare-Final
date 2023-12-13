import 'package:educare/core/Assets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/app_routes.dart';

class SuccessPassword extends StatelessWidget {
  const SuccessPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Iconsax.arrow_left_2)),
        actions: [
          Image.asset(
            Assets.logoonx2,
            width: 133.67,
            height: 30,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 310,
            height: 270,
            margin: const EdgeInsets.all(25),
            child: Image.asset(Assets.passwordsuccess),
          ),
          const Center(
              child: Text(
            'Password changed',
            style: TextStyle(
              color: Color(0xff111827),
              fontSize: 22,
            ),
          )),
          const Center(
            child: Text(
              'succesfully!',
              style: TextStyle(
                color: Color(0xff111827),
                fontSize: 22,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Your password has been changed ',
              style: TextStyle(
                color: Color(0xff6B7280),
                fontSize: 13,
              ),
            ),
          ),
          const Center(
            child: Text(
              'successfully, we will let you know if there',
              style: TextStyle(
                color: Color(0xff6B7280),
                fontSize: 13,
              ),
            ),
          ),
          const Center(
            child: Text(
              'are more problems with your account',
              style: TextStyle(
                color: Color(0xff6B7280),
                fontSize: 13,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
            },
            child: Container(
              margin: const EdgeInsets.all(18),
              height: 50,
              width: 390,
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
    );
  }
}
