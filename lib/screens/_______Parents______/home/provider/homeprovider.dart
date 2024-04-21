import 'package:educare/core/enum.dart';
import 'package:educare/screens/_______Parents______/Message/message.dart';
import 'package:educare/screens/_______Parents______/attendance/attendance.dart';
import 'package:educare/screens/_______Parents______/Notification/Notification.dart';
import 'package:educare/screens/_______Parents______/home/components/home1/home1.dart';
import 'package:educare/screens/_______Parents______/profile/profile.dart';
import 'package:flutter/material.dart';

import 'homestate.dart';

class HomeProvider extends ChangeNotifier {
  // ignore: unused_field
  final HomeState state = HomeState();

  void onNavigationTap(int value) {
    switch (value) {
      case 0:
        state.chosenNavigationItem = ParentsChosenNavigationItem.home;
        break;
      case 1:
        state.chosenNavigationItem = ParentsChosenNavigationItem.messages;
        break;
      case 2:
        state.chosenNavigationItem = ParentsChosenNavigationItem.notification;
        break;
      case 3:
        state.chosenNavigationItem = ParentsChosenNavigationItem.attendance;
        break;
      case 4:
        state.chosenNavigationItem = ParentsChosenNavigationItem.profile;
        break;
    }
    notifyListeners();
  }

  Widget chosenPage() {
    switch (state.chosenNavigationItem) {
      case ParentsChosenNavigationItem.home:
        return const HomePage();
      case ParentsChosenNavigationItem.messages:
        return const P_MessagePage();
      case ParentsChosenNavigationItem.notification:
        return const AttendancePage();
      case ParentsChosenNavigationItem.attendance:
        return const NotificationPage();
      case ParentsChosenNavigationItem.profile:
        return const P_ProfilePage();
      default:
        return const SizedBox();
    }
  }

  void returnHome() {
    state.chosenNavigationItem = ParentsChosenNavigationItem.home;
    state.navigationIndex = 0;
    notifyListeners();
  }
}
