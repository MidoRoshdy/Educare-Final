import 'package:educare/core/enum.dart';

class HomeState {
  ChosenNavigationItem chosenNavigationItem = ChosenNavigationItem.home;
  int navigationIndex = 0;

  LoadingState loadingState = LoadingState.initial;

  LoadingState savedLoadingState = LoadingState.initial;
}
