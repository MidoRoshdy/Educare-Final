// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:educare/core/enum.dart';
import 'package:educare/screens/_______Parents______/Message/P_message.dart';
import 'package:educare/screens/_______Parents______/attendance/attendance.dart';
import 'package:educare/screens/_______Parents______/Notification/Notification.dart';
import 'package:educare/screens/_______Parents______/home/components/Schedule/week%20days/mon.dart';
import 'package:educare/screens/_______Parents______/home/components/Schedule/week%20days/sun.dart';
import 'package:educare/screens/_______Parents______/home/components/Schedule/week%20days/thu.dart';
import 'package:educare/screens/_______Parents______/home/components/Schedule/week%20days/tue.dart';
import 'package:educare/screens/_______Parents______/home/components/Schedule/week%20days/wed.dart';
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
        return const NotificationPage();
      case ParentsChosenNavigationItem.attendance:
        return const AttendancePage();
      case ParentsChosenNavigationItem.profile:
        return const P_ProfilePage();
      default:
        return const SizedBox();
    }
  }

  Widget chosenscheduleforteacher() {
    switch (state.SelectedDayForScheduleparentt) {
      case SelectedDayForScheduleparent.sun1:
        return const PSunDaySchedule();
      case SelectedDayForScheduleparent.mon1:
        return const PMonDaySchedule();
      case SelectedDayForScheduleparent.tue1:
        return const PTueSchedule();
      case SelectedDayForScheduleparent.wed1:
        return const PWedSchedule();
      case SelectedDayForScheduleparent.thu1:
        return const PThuSchedule();
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
