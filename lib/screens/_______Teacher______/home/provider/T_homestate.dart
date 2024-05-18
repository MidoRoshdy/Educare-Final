// ignore_for_file: file_names, unused_import, non_constant_identifier_names

import 'package:educare/core/enum.dart';
import 'package:educare/generated/l10n.dart';

class THomeState {
  TeacherChosenNavigationItem chosenNavigationItem =
      TeacherChosenNavigationItem.home;
  int navigationIndex = 0;

  LoadingState loadingState = LoadingState.initial;

  LoadingState savedLoadingState = LoadingState.initial;
  SelectedDayForSchedule selectedDayForSchedule = SelectedDayForSchedule.sun;

  String? teachername1;
  String? teachersubject1;
  String? teacherid1;
  String? Sub_code;
}
