// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_print, non_constant_identifier_names, prefer_const_constructors, depend_on_referenced_packages

import 'dart:io';
import 'package:path/path.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/screens/_______Parents______/userhandel/signup/provider/signupprovder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/Assets.dart';
import '../../../../core/colors.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => CreateAccountstate();
}

class CreateAccountstate extends State<CreateAccount> {
  File? file;
  String? url;
  getimage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image_gallary =
        await picker.pickImage(source: ImageSource.gallery);
    if (image_gallary != null) {
      file = File(image_gallary.path);
    }
    var imagename = basename(image_gallary!.path);
    var refstorge = FirebaseStorage.instance.ref("profileimages/$imagename");
    await refstorge.putFile(file!);
    url = await refstorge.getDownloadURL();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String? selectedValue;

    final formKey = GlobalKey<FormState>();
    final List<String> genderItems = [
      'Male',
      'Female',
    ];
    CollectionReference ParentsUser =
        FirebaseFirestore.instance.collection('ParentsUsers');

    Future<void> AddParentUser() {
      // Call the user's CollectionReference to add a new user
      return ParentsUser.add({
        "username":
            context.read<CreateAccountProvider>().state.UsernameController.text,
        "email":
            context.read<CreateAccountProvider>().state.emailController.text,
        "password":
            context.read<CreateAccountProvider>().state.passwordController.text,
        "Educationalcode": context
            .read<CreateAccountProvider>()
            .state
            .EducationalcodeController
            .text,
        "phone":
            context.read<CreateAccountProvider>().state.phoneController.text,
        "address":
            context.read<CreateAccountProvider>().state.addressController.text,
        "birthday":
            context.read<CreateAccountProvider>().state.birthdayController.text,
        "Gender": selectedValue,
        "profileimage": url ?? "null",
        // "id": FirebaseAuth.instance.currentUser!.uid,
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    List<String> items = ['Male', 'Female'];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    Assets.colorhome,
                    fit: BoxFit.fill,
                    width: 100.w,
                    height: 21.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            AppRoutes.parents_login,
                                            (route) => false);
                                  },
                                  icon: const Icon(
                                    Iconsax.arrow_left4,
                                    color: Colors.white,
                                  )),
                              Image.asset(
                                Assets.logoonx2,
                                height: 4.h,
                              )
                            ]),
                        Divider(
                          height: 1.h,
                          color: Colors.transparent,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.05,
                                    fontWeight: FontWeight.w700),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20.sp),
                                child: Image.asset(
                                  Assets.family,
                                  height: 5.5.h,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1.h,
                color: Colors.transparent,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Please create an account to Join Our World ",
                    style: TextStyle(
                        color: Color(0xff7D7D7D),
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        height: 1.2125,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 140.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            color: Colors.transparent,
                            height: 1.5.h,
                          ),

                          //! educational code text field
                          Container(
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.only(top: 3.5.h, bottom: 2.h),
                            alignment: Alignment.center,
                            height: 8.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1.sp,
                                    color: context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .Educationalcode ==
                                            null
                                        ? AppColours.neutral500
                                        : context
                                                    .watch<
                                                        CreateAccountProvider>()
                                                    .state
                                                    .EducationalcodeErrorMessage !=
                                                null
                                            ? AppColours.danger500
                                            : AppColours.primary500)),
                            child: TextField(
                              controller: context
                                  .read<CreateAccountProvider>()
                                  .state
                                  .EducationalcodeController,
                              onChanged: context
                                  .read<CreateAccountProvider>()
                                  .EducationalcodeChange,
                              onSubmitted: context
                                  .read<CreateAccountProvider>()
                                  .EducationalcodeChange,
                              style: TextStyle(fontSize: 13.sp),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Educational code",
                                prefixIcon: const Icon(
                                  Iconsax.d_cube_scan,
                                ),
                                prefixIconColor: context
                                            .watch<CreateAccountProvider>()
                                            .state
                                            .Educationalcode ==
                                        null
                                    ? AppColours.neutral300
                                    : context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .EducationalcodeErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.primary500,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.only(bottom: 2.h),
                            alignment: Alignment.center,
                            height: 8.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1.sp,
                                    color: context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .name ==
                                            null
                                        ? AppColours.neutral500
                                        : context
                                                    .watch<
                                                        CreateAccountProvider>()
                                                    .state
                                                    .usernameErrorMessage !=
                                                null
                                            ? AppColours.danger500
                                            : AppColours.primary500)),
                            child: TextField(
                              controller: context
                                  .read<CreateAccountProvider>()
                                  .state
                                  .UsernameController,
                              onChanged: context
                                  .read<CreateAccountProvider>()
                                  .nameChange,
                              onSubmitted: context
                                  .read<CreateAccountProvider>()
                                  .nameChange,
                              style: TextStyle(fontSize: 13.sp),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Username",
                                prefixIcon: const Icon(
                                  Iconsax.user,
                                ),
                                prefixIconColor: context
                                            .watch<CreateAccountProvider>()
                                            .state
                                            .email ==
                                        null
                                    ? AppColours.neutral300
                                    : context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .emailErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.primary500,
                              ),
                            ),
                          ),
                          //! email text field
                          Container(
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.only(bottom: 2.h),
                            alignment: Alignment.center,
                            height: 8.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1.sp,
                                    color: context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .email ==
                                            null
                                        ? AppColours.neutral500
                                        : context
                                                    .watch<
                                                        CreateAccountProvider>()
                                                    .state
                                                    .emailErrorMessage !=
                                                null
                                            ? AppColours.danger500
                                            : AppColours.primary500)),
                            child: TextField(
                              controller: context
                                  .read<CreateAccountProvider>()
                                  .state
                                  .emailController,
                              onChanged: context
                                  .read<CreateAccountProvider>()
                                  .onEmailChange,
                              onSubmitted: context
                                  .read<CreateAccountProvider>()
                                  .onEmailChange,
                              style: TextStyle(fontSize: 13.sp),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                prefixIcon: const Icon(
                                  Iconsax.sms4,
                                ),
                                prefixIconColor: context
                                            .watch<CreateAccountProvider>()
                                            .state
                                            .email ==
                                        null
                                    ? AppColours.neutral300
                                    : context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .emailErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.primary500,
                              ),
                            ),
                          ),
                          //! password text field
                          Container(
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.only(bottom: 2.h),
                            alignment: Alignment.center,
                            height: 8.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1.sp,
                                    color: context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .password ==
                                            null
                                        ? AppColours.neutral500
                                        : context
                                                    .watch<
                                                        CreateAccountProvider>()
                                                    .state
                                                    .passwordErrorMessage !=
                                                null
                                            ? AppColours.danger500
                                            : AppColours.primary500)),
                            child: TextField(
                              obscureText: context
                                  .watch<CreateAccountProvider>()
                                  .state
                                  .hidePass,
                              controller: context
                                  .read<CreateAccountProvider>()
                                  .state
                                  .passwordController,
                              onChanged: context
                                  .read<CreateAccountProvider>()
                                  .onPasswordChange,
                              onSubmitted: context
                                  .read<CreateAccountProvider>()
                                  .onPasswordChange,
                              style: TextStyle(fontSize: 13.sp),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  prefixIcon: const Icon(
                                    Iconsax.lock,
                                  ),
                                  prefixIconColor: context
                                              .watch<CreateAccountProvider>()
                                              .state
                                              .password ==
                                          null
                                      ? AppColours.neutral300
                                      : context
                                                  .watch<
                                                      CreateAccountProvider>()
                                                  .state
                                                  .passwordErrorMessage !=
                                              null
                                          ? AppColours.danger500
                                          : AppColours.primary500,
                                  suffixIcon: IconButton(
                                    onPressed: () => context
                                        .read<CreateAccountProvider>()
                                        .showPassword(),
                                    icon: context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .hidePass ==
                                            true
                                        ? const Icon(Iconsax.eye_slash4)
                                        : const Icon(Iconsax.eye3),
                                  )),
                            ),
                          ),
                          //! password error message
                          Text("Password must be at least 8 characters",
                              style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w400,
                                color: context
                                            .watch<CreateAccountProvider>()
                                            .state
                                            .password ==
                                        null
                                    ? AppColours.neutral400
                                    : context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .passwordErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.success500,
                              )),
                          Divider(
                            height: 1.h,
                            color: Colors.transparent,
                          ),
                          //retype password text field
                          Container(
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.only(bottom: 2.h),
                            alignment: Alignment.center,
                            height: 8.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1.sp,
                                    color: context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .Retypepassword ==
                                            null
                                        ? AppColours.neutral500
                                        : context
                                                    .watch<
                                                        CreateAccountProvider>()
                                                    .state
                                                    .RetypepasswordErrorMessage !=
                                                null
                                            ? AppColours.danger500
                                            : AppColours.primary500)),
                            child: TextField(
                              obscureText: context
                                  .watch<CreateAccountProvider>()
                                  .state
                                  .hidePass2,
                              controller: context
                                  .read<CreateAccountProvider>()
                                  .state
                                  .RetypepasswordController,
                              onChanged: context
                                  .read<CreateAccountProvider>()
                                  .RetypePasswordChange,
                              onSubmitted: context
                                  .read<CreateAccountProvider>()
                                  .RetypePasswordChange,
                              style: TextStyle(fontSize: 13.sp),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Retype Password",
                                  prefixIcon: const Icon(
                                    Iconsax.lock,
                                  ),
                                  prefixIconColor: context
                                              .watch<CreateAccountProvider>()
                                              .state
                                              .Retypepassword ==
                                          null
                                      ? AppColours.neutral300
                                      : context
                                                  .watch<
                                                      CreateAccountProvider>()
                                                  .state
                                                  .RetypepasswordErrorMessage !=
                                              null
                                          ? AppColours.danger500
                                          : AppColours.primary500,
                                  suffixIcon: IconButton(
                                    onPressed: () => context
                                        .read<CreateAccountProvider>()
                                        .showPassword2(),
                                    icon: context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .hidePass2 ==
                                            true
                                        ? const Icon(Iconsax.eye_slash4)
                                        : const Icon(Iconsax.eye3),
                                  )),
                            ),
                          ),
                          //! password error message
                          Text("Password must be same as the first password",
                              style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w400,
                                color: context
                                            .watch<CreateAccountProvider>()
                                            .state
                                            .password ==
                                        context
                                            .watch<CreateAccountProvider>()
                                            .state
                                            .Retypepassword
                                    ? AppColours.success500
                                    : context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .RetypepasswordErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.neutral400,
                              )),
                          Divider(
                            height: 1.h,
                            color: Colors.transparent,
                          ),
                          //phonr number
                          Container(
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.only(bottom: 2.h),
                            alignment: Alignment.center,
                            height: 9.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1.sp, color: AppColours.neutral500)),
                            child: InternationalPhoneNumberInput(
                              keyboardType: TextInputType.number,
                              onSaved: context
                                  .read<CreateAccountProvider>()
                                  .onPhoneNumberChange,
                              selectorConfig: const SelectorConfig(
                                selectorType: PhoneInputSelectorType.DIALOG,
                              ),
                              ignoreBlank: true,
                              onInputChanged: context
                                  .read<CreateAccountProvider>()
                                  .onPhoneNumberChange,
                              inputBorder: InputBorder.none,
                            ),
                          ),
                          //birthday
                          Container(
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.only(bottom: 2.h),
                            alignment: Alignment.center,
                            height: 8.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1.sp, color: AppColours.neutral500)),
                            child: TextField(
                              readOnly: true,
                              keyboardType: TextInputType.datetime,
                              controller: context
                                  .read<CreateAccountProvider>()
                                  .state
                                  .birthdayController,
                              style: TextStyle(fontSize: 12.sp),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "BirthDay",
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    context
                                            .read<CreateAccountProvider>()
                                            .state
                                            .Datetime =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime.now());
                                    if (context
                                            .read<CreateAccountProvider>()
                                            .state
                                            .Datetime !=
                                        null) {
                                      setState(() {
                                        context
                                            .read<CreateAccountProvider>()
                                            .state
                                            .birthdayController
                                            .text = DateFormat(
                                                'yyyy-MM-dd')
                                            .format(context
                                                    .read<
                                                        CreateAccountProvider>()
                                                    .state
                                                    .Datetime ??
                                                DateTime.now());
                                      });
                                    }
                                  },
                                  child: const Icon(
                                    Iconsax.calendar_2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //address
                          Container(
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.only(bottom: 2.h),
                            alignment: Alignment.center,
                            height: 8.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1.sp,
                                    color: context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .address ==
                                            null
                                        ? AppColours.neutral500
                                        : context
                                                    .watch<
                                                        CreateAccountProvider>()
                                                    .state
                                                    .addressErrorMessage !=
                                                null
                                            ? AppColours.danger500
                                            : AppColours.primary500)),
                            child: TextField(
                              controller: context
                                  .read<CreateAccountProvider>()
                                  .state
                                  .addressController,
                              onChanged: context
                                  .read<CreateAccountProvider>()
                                  .addressChange,
                              onSubmitted: context
                                  .read<CreateAccountProvider>()
                                  .addressChange,
                              style: TextStyle(fontSize: 13.sp),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Address",
                                prefixIcon: const Icon(
                                  Iconsax.map_1,
                                ),
                                prefixIconColor: context
                                            .watch<CreateAccountProvider>()
                                            .state
                                            .address ==
                                        null
                                    ? AppColours.neutral300
                                    : context
                                                .watch<CreateAccountProvider>()
                                                .state
                                                .addressErrorMessage !=
                                            null
                                        ? AppColours.danger500
                                        : AppColours.primary500,
                              ),
                            ),
                          ),
                          //gender

                          DropdownButtonFormField2<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 16),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: AppColours.danger900)),
                            ),
                            hint: const Text(
                              'Select Your Gender',
                              style: TextStyle(fontSize: 14),
                            ),
                            items: genderItems
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select gender.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              //Do something when selected item is changed.
                            },
                            onSaved: (value) {
                              selectedValue = value.toString();
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 24,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                          Divider(
                            height: 1.h,
                            color: Colors.transparent,
                          ),

                          //profile image
                          Container(
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.only(bottom: 2.h),
                            alignment: Alignment.center,
                            height: 20.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1.sp, color: AppColours.neutral500)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Profile Image",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColours.neutral500)),
                                if (url != null)
                                  Image.network(url!)
                                else
                                  Container(
                                    height: 10.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColours.neutral300,
                                    ),
                                    child: Center(
                                      child: Text("No Image"),
                                    ),
                                  ),
                                IconButton(
                                    onPressed: () {
                                      getimage();
                                    },
                                    icon: const Icon(Iconsax.camera))
                              ],
                            ),
                          ),

                          const Spacer(),
                          //! already a user
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?",
                                  style: TextStyle(
                                      fontSize: 9.5.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColours.neutral400)),
                              SizedBox(
                                width: 1.w,
                              ),
                              InkWell(
                                onTap: () => context
                                    .read<CreateAccountProvider>()
                                    .navigateToLogin(context),
                                child: Text("Login",
                                    style: TextStyle(
                                        fontSize: 9.5.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColours.text3)),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.transparent,
                            height: 2.h,
                          ),
                          //create account button
                          SizedBox(
                            width: 90.w,
                            height: 7.h,
                            child: ElevatedButton(
                              onPressed: () async {
                                AddParentUser();
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: context
                                        .read<CreateAccountProvider>()
                                        .state
                                        .emailController
                                        .text,
                                    password: context
                                        .read<CreateAccountProvider>()
                                        .state
                                        .passwordController
                                        .text,
                                  );
                                  FirebaseAuth.instance.currentUser!
                                      .sendEmailVerification();
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      AppRoutes.teacher_setupaccount,
                                      (route) => false);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    print('The password provided is too weak.');
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                      desc:
                                          'The password provided is too weak.',
                                    ).show();
                                  } else if (e.code == 'email-already-in-use') {
                                    print(
                                        'The account already exists for that email.');
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                      desc:
                                          'The account already exists for that email.',
                                    ).show();
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: context
                                              .read<CreateAccountProvider>()
                                              .validate() ==
                                          true
                                      ? AppColours.primary800
                                      : AppColours.neutral300,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: context
                                                .read<CreateAccountProvider>()
                                                .validate() ==
                                            true
                                        ? Colors.white
                                        : AppColours.neutral500,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),

                          Divider(
                            color: Colors.transparent,
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
