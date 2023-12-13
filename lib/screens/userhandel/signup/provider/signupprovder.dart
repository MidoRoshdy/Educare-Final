import 'package:educare/core/app_routes.dart';
import 'package:educare/screens/userhandel/signup/provider/signupstate.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CreateAccountProvider extends ChangeNotifier {
  // ignore: unused_field
  final CreateAccountState state = CreateAccountState();

  void onEmailChange(String value) {
    value.isEmpty
        ? state.emailErrorMessage = "You must enter a mail"
        : EmailValidator.validate(value)
            ? state.emailErrorMessage = null
            : state.emailErrorMessage = "Enter a valid mail";
    state.email = value;
    notifyListeners();
  }

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

  void RetypePasswordChange(String value) {
    value != state.password
        ? state.RetypepasswordErrorMessage = "You must enter a same  password"
        : state.RetypepasswordErrorMessage = null;
    state.Retypepassword = value;
    notifyListeners();
  }

  void EducationalcodeChange(String value) {
    value.isEmpty
        ? state.EducationalcodeErrorMessage =
            "You must enter a Educational code"
        : state.EducationalcodeErrorMessage = null;
    state.Educationalcode = value;
    notifyListeners();
  }

  void onPhoneNumberChange(PhoneNumber value) {
    state.phoneNumber = value;
    notifyListeners();
  }

  void addressChange(String value) {
    value.isEmpty
        ? state.addressErrorMessage = "You must enter a address"
        : state.addressErrorMessage = null;
    state.address = value;
    notifyListeners();
  }

  void birthdayChange(String value) {
    value.isEmpty
        ? state.birthdayErrorMessage = "You must enter a birthday"
        : state.birthdayErrorMessage = null;
    state.name = value;
    notifyListeners();
  }

  void genderChange(String value) {
    value.isEmpty
        ? state.birthdayErrorMessage = "You must enter a birthday"
        : state.birthdayErrorMessage = null;
    state.name = value;
    notifyListeners();
  }

  void showPassword() {
    state.hidePass == true ? state.hidePass = false : state.hidePass = true;
    notifyListeners();
  }

  void showPassword2() {
    state.hidePass2 == true ? state.hidePass2 = false : state.hidePass2 = true;
    notifyListeners();
  }

  navigateToLogin(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  createAccount(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
  }

  bool validate() {
    if (state.emailErrorMessage == null &&
        state.passwordErrorMessage == null &&
        state.EducationalcodeErrorMessage == null &&
        state.RetypepasswordErrorMessage == null &&
        state.email != null &&
        state.password != null &&
        state.Educationalcode != null &&
        // state.address != null &&
        // state.gender != null &&
        state.Retypepassword != null &&
        state.password == state.Retypepassword) {
      return true;
    } else {
      return false;
    }
  }
}
