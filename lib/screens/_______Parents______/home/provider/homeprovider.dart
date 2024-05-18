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
  void init() {
    notifyListeners();
  }

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
        return HomePage(
          user_name: state.user_name!,
          Class: state.Class!,
          grade: state.grade!,
          code: state.code!,
          photo: state.photo!,
        );
      case ParentsChosenNavigationItem.messages:
        return P_MessagePage(
          user_name: state.user_name!,
          Class: state.Class!,
          grade: state.grade!,
          code: state.code!,
          photo: state.photo!,
        );
      case ParentsChosenNavigationItem.notification:
        return NotificationPage(
          user_name: state.user_name!,
          Class: state.Class!,
          grade: state.grade!,
          code: state.code!,
          photo: state.photo!,
        );
      case ParentsChosenNavigationItem.attendance:
        return AttendancePage(
          user_name: state.user_name!,
          Class: state.Class!,
          grade: state.grade!,
          code: state.code!,
          photo: state.photo!,
        );
      case ParentsChosenNavigationItem.profile:
        return P_ProfilePage(
          user_name: state.user_name!,
          Class: state.Class!,
          grade: state.grade!,
          code: state.code!,
          photo: state.photo!,
        );
      default:
        return const SizedBox();
    }
  }

  Widget chosenscheduleforteacher() {
    switch (state.SelectedDayForScheduleparentt) {
      case SelectedDayForScheduleparent.sun1:
        return PSunDaySchedule(
          Class: state.Class!,
          grade: state.grade!,
          code: state.code!,
        );
      case SelectedDayForScheduleparent.mon1:
        return PMonDaySchedule(
          Class: state.Class!,
          grade: state.grade!,
          code: state.code!,
        );
      case SelectedDayForScheduleparent.tue1:
        return PTueSchedule(
          Class: state.Class!,
          grade: state.grade!,
          code: state.code!,
        );
      case SelectedDayForScheduleparent.wed1:
        return PWedSchedule(
          Class: state.Class!,
          grade: state.grade!,
          code: state.code!,
        );
      case SelectedDayForScheduleparent.thu1:
        return PThuSchedule(
          Class: state.Class!,
          grade: state.grade!,
          code: state.code!,
        );
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
