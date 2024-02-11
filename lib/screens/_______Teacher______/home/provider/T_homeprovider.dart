// ignore_for_file: file_names, non_constant_identifier_names

import 'package:educare/core/enum.dart';
import 'package:educare/screens/_______Teacher______/home/components/Message/T_message.dart';
import 'package:educare/screens/_______Teacher______/home/components/QR/T_QR.dart';
import 'package:educare/screens/_______Teacher______/home/components/home1/T_home_1.dart';
import 'package:educare/screens/_______Teacher______/home/components/notification/T_notification.dart';
import 'package:educare/screens/_______Teacher______/home/components/profile/T_Profile.dart';
import 'package:educare/screens/_______Teacher______/home/provider/T_homestate.dart';
import 'package:flutter/material.dart';

class THomeProvider extends ChangeNotifier {
  // ignore: unused_field
  final THomeState state = THomeState();

  void onNavigationTap(int value) {
    switch (value) {
      case 0:
        state.chosenNavigationItem = TeacherChosenNavigationItem.home;
        break;
      case 1:
        state.chosenNavigationItem = TeacherChosenNavigationItem.messages;
        break;
      case 2:
        state.chosenNavigationItem = TeacherChosenNavigationItem.notification;
        break;
      case 3:
        state.chosenNavigationItem = TeacherChosenNavigationItem.qr;
        break;
      case 4:
        state.chosenNavigationItem = TeacherChosenNavigationItem.profile;
        break;
    }
    notifyListeners();
  }

  Widget T_chosenPage() {
    switch (state.chosenNavigationItem) {
      case TeacherChosenNavigationItem.home:
        return const T_HomePage();
      case TeacherChosenNavigationItem.messages:
        return const T_MessagePage();
      case TeacherChosenNavigationItem.notification:
        return const T_NotificationPage();
      case TeacherChosenNavigationItem.qr:
        return const T_QRPage();
      case TeacherChosenNavigationItem.profile:
        return const T_ProfilePage();
      default:
        return const SizedBox();
    }
  }

  void returnHome() {
    state.chosenNavigationItem = TeacherChosenNavigationItem.home;
    state.navigationIndex = 0;
    notifyListeners();
  }
}
