import 'package:educare/core/enum.dart';

class HomeState {
  ParentsChosenNavigationItem chosenNavigationItem =
      ParentsChosenNavigationItem.home;
  int navigationIndex = 0;

  LoadingState loadingState = LoadingState.initial;

  LoadingState savedLoadingState = LoadingState.initial;
}
