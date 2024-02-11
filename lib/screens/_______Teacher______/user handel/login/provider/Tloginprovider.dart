// ignore_for_file: file_names

import 'package:educare/core/app_routes.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/login/provider/Tloginstate.dart';
import 'package:flutter/material.dart';

class TLoginProvider extends ChangeNotifier {
  // ignore: unused_field
  final TLoginState state = TLoginState();

  void onPasswordChange(String value) {
    value.isEmpty
        ? state.passwordErrorMessage = "You must enter a password"
        : value.length < 8
            ? state.passwordErrorMessage =
                "Password must be at least 8 characters"
            : state.passwordErrorMessage = null;
    state.password = value;
    notifyListeners();
  }

  void onUsernameChange(String value) {
    value.isEmpty
        ? state.usernameErrorMessage = "You must enter a username"
        : state.usernameErrorMessage = null;
    state.email = value;
    notifyListeners();
  }

  void showPassword() {
    state.hidePass == true ? state.hidePass = false : state.hidePass = true;
    notifyListeners();
  }

  bool validate() {
    if (state.passwordErrorMessage == null &&
        state.usernameErrorMessage == null &&
        state.password != null &&
        state.email != null) {
      return true;
    } else {
      return false;
    }
  }

  navigateToRegister(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.teacher_register);
  }

  // logIn(BuildContext context) {
  //   Navigator.of(context)
  //       .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
  // }

  void onChangeRememberMe(bool? value) async {
    state.rememberMe = value!;

    notifyListeners();
  }

  // navigateToForgotPawwsord(BuildContext context) {
  //   Navigator.of(context).pushNamed(AppRoutes.reset_password);
  // }
}
