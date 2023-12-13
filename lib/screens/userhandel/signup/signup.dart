import 'package:educare/core/app_routes.dart';
import 'package:educare/screens/userhandel/signup/provider/signupprovder.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/Assets.dart';
import '../../../core/colors.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<String> Gender = [
    //   "None Above",
    //   "Male",
    //   "Female",
    // ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 100.w,
              height: 13.h,
              child: Stack(
                children: [
                  //! back button
                  Positioned(
                    top: 6.5.h,
                    left: 3.w,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 5.h,
                      width: 25.w,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.login);
                        },
                        icon: const Icon(Iconsax.arrow_left),
                      ),
                    ),
                  ),
                  //! app logo
                  Positioned(
                    top: 6.5.h,
                    right: 5.w,
                    child: Container(
                      alignment: Alignment.center,
                      height: 5.h,
                      width: 25.w,
                      child: Image.asset(
                        Assets.logoonx2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 100.w,
              height: 117.h,
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! create account text
                    Text("Register",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500)),
                    Divider(
                      color: Colors.transparent,
                      height: 1.5.h,
                    ),
                    Text("Please create an account to track your child",
                        style: TextStyle(
                            fontSize: 9.5.sp, fontWeight: FontWeight.w400)),
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
                                  ? AppColours.neutral300
                                  : context
                                              .watch<CreateAccountProvider>()
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
                                  ? AppColours.neutral300
                                  : context
                                              .watch<CreateAccountProvider>()
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
                        onChanged:
                            context.read<CreateAccountProvider>().onEmailChange,
                        onSubmitted:
                            context.read<CreateAccountProvider>().onEmailChange,
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
                                  ? AppColours.neutral300
                                  : context
                                              .watch<CreateAccountProvider>()
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
                                            .watch<CreateAccountProvider>()
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
                                  ? AppColours.neutral300
                                  : context
                                              .watch<CreateAccountProvider>()
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
                                            .watch<CreateAccountProvider>()
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
                              width: 1.sp, color: AppColours.neutral300)),
                      child: InternationalPhoneNumberInput(
                        keyboardType: TextInputType.number,
                        onSaved: context
                            .read<CreateAccountProvider>()
                            .onPhoneNumberChange,
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.DROPDOWN,
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
                              width: 1.sp, color: AppColours.neutral300)),
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        controller: context
                            .read<CreateAccountProvider>()
                            .state
                            .birthdayController,
                        onChanged: context
                            .read<CreateAccountProvider>()
                            .birthdayChange,
                        onSubmitted: context
                            .read<CreateAccountProvider>()
                            .birthdayChange,
                        style: TextStyle(fontSize: 12.sp),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "BirthDay",
                          suffixIcon: InkWell(
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now())
                                  .then((value) {
                                context
                                    .read<CreateAccountProvider>()
                                    .state
                                    .birthdayController
                                    .text = value.toString();
                              });
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
                                  ? AppColours.neutral300
                                  : context
                                              .watch<CreateAccountProvider>()
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
                        onChanged:
                            context.read<CreateAccountProvider>().addressChange,
                        onSubmitted:
                            context.read<CreateAccountProvider>().addressChange,
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
                                          .gender ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<CreateAccountProvider>()
                                              .state
                                              .genderErrorMessage !=
                                          null
                                      ? AppColours.danger500
                                      : AppColours.primary500)),
                      child: TextField(
                        controller: context
                            .read<CreateAccountProvider>()
                            .state
                            .genderController,
                        onChanged:
                            context.read<CreateAccountProvider>().genderChange,
                        onSubmitted:
                            context.read<CreateAccountProvider>().genderChange,
                        style: TextStyle(fontSize: 13.sp),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Gender",
                            suffixIcon: InkWell(
                                onTap: () {},
                                child: const Icon(Iconsax.arrow_down_1))),
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
                          Navigator.of(context)
                              .pushNamed(AppRoutes.openapppage);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: context
                                        .read<CreateAccountProvider>()
                                        .validate() ==
                                    true
                                ? AppColours.text
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
      ),
    );
  }
}
