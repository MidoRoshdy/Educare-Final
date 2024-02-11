// ignore_for_file: file_names

import 'package:educare/core/enum.dart';

class THomeState {
  TeacherChosenNavigationItem chosenNavigationItem =
      TeacherChosenNavigationItem.home;
  int navigationIndex = 0;

  LoadingState loadingState = LoadingState.initial;

  LoadingState savedLoadingState = LoadingState.initial;
}
