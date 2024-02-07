import 'package:educare/screens/_______Parents______/userhandel/another%20child/provider/anotherchildstate.dart';
import 'package:flutter/material.dart';

class AnotherChildProvider extends ChangeNotifier {
  AnotherChildState state = AnotherChildState();

  void onChangeCheckChild(bool? value) async {
    state.checkchild = value!;

    notifyListeners();
  }
}
