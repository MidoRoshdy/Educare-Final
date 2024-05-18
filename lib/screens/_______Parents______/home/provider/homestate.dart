// ignore_for_file: non_constant_identifier_names

import 'package:educare/core/enum.dart';

class HomeState {
  ParentsChosenNavigationItem chosenNavigationItem =
      ParentsChosenNavigationItem.home;
  int navigationIndex = 0;

  LoadingState loadingState = LoadingState.initial;

  LoadingState savedLoadingState = LoadingState.initial;
  SelectedDayForScheduleparent SelectedDayForScheduleparentt =
      SelectedDayForScheduleparent.sun1;
  String? user_name;
  String? Class;
  String? grade;
  String? code;
  String? photo;

  String? classId;
}
