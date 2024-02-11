// ignore_for_file: file_names

import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______Teacher______/home/provider/T_homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TBottomNavBar extends StatefulWidget {
  const TBottomNavBar({super.key});

  @override
  State<TBottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<TBottomNavBar> {
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<THomeProvider>().T_chosenPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 20.sp,
        selectedFontSize: 9.5.sp,
        unselectedFontSize: 9.5.sp,
        selectedIconTheme: IconThemeData(color: AppColours.primary500),
        selectedItemColor: AppColours.primary500,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedIconTheme: IconThemeData(color: AppColours.neutral400),
        unselectedItemColor: AppColours.neutral400,
        enableFeedback: false,
        backgroundColor: Colors.white,
        currentIndex: _currIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Iconsax.home4),
              activeIcon: Icon(Iconsax.home_15),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.message4),
              activeIcon: Icon(Iconsax.message5),
              label: "Messages"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.notification),
              activeIcon: Icon(Iconsax.notification4),
              label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.qr_code),
              activeIcon: Icon(Ionicons.qr_code_outline),
              label: "QR"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.frame_1),
              activeIcon: Icon(Iconsax.frame5),
              label: "Profile")
        ],
        onTap: (value) {
          setState(() {
            _currIndex = value;
            context.read<THomeProvider>().onNavigationTap(value);
          });
        },
      ),
    );
  }
}
