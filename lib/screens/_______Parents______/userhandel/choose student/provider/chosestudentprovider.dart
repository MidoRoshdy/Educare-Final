// ignore_for_file: unused_local_variable, unused_import

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/screens/_______Parents______/userhandel/choose%20student/provider/chosestudentstate.dart';
import 'package:flutter/material.dart';

class ChooseStudentProvider extends ChangeNotifier {
  ChooseStudentState state = ChooseStudentState();

  void onChangeChooseChild(bool? value) async {
    state.ChooseChild = value!;

    notifyListeners();
  }


}
