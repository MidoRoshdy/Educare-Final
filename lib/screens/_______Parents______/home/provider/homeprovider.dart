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
        state.chosenNavigationItem = ChosenNavigationItem.home;
        break;
      case 1:
        state.chosenNavigationItem = ChosenNavigationItem.messages;
        break;
      case 2:
        state.chosenNavigationItem = ChosenNavigationItem.applied;
        break;
      case 3:
        state.chosenNavigationItem = ChosenNavigationItem.saved;
        break;
      case 4:
        state.chosenNavigationItem = ChosenNavigationItem.profile;
        break;
    }
    notifyListeners();
  }

  Widget chosenPage() {
    switch (state.chosenNavigationItem) {
      case ChosenNavigationItem.home:
        return const HomePage();
      case ChosenNavigationItem.messages:
        return const MessagePage();
      case ChosenNavigationItem.applied:
        return const AttendancePage();
      case ChosenNavigationItem.saved:
        return const NotificationPage();
      case ChosenNavigationItem.profile:
        return const ProfilePage();
      default:
        return const SizedBox();
    }
  }

  void returnHome() {
    state.chosenNavigationItem = ChosenNavigationItem.home;
    state.navigationIndex = 0;
    notifyListeners();
  }
}
