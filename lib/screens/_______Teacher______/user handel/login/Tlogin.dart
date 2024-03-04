// ignore_for_file: must_call_super, avoid_print, use_build_context_synchronously, unused_local_variable, file_names, dead_code_on_catch_subtype

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/screens/_______Teacher______/user%20handel/login/provider/Tloginprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/Assets.dart';
import '../../../../core/colors.dart';

class TLoginPage extends StatefulWidget {
  const TLoginPage({super.key});

  @override
  State<TLoginPage> createState() => _TloginPageState();
}

class _TloginPageState extends State<TLoginPage> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('===========User is currently signed out!========');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  Assets.colorhome,
                  fit: BoxFit.fill,
                  width: 100.w,
                  height: 20.h,
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
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      AppRoutes.chooseuser, (route) => false);
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
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.05,
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.sp),
                              child: Image.asset(
                                Assets.teacher,
                                height: 5.5.h,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 100.w,
              height: 76.h,
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! create account text

                    Divider(
                      color: Colors.transparent,
                      height: 1.5.h,
                    ),
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Please login to Join Our  World ",
                            style: TextStyle(
                                color: Color(0xff7D7D7D),
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                                height: 1.2125,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                    ////////////////////////////////// email////////////////////////////////////////////////////
                    Container(
                      padding: EdgeInsets.all(1.w),
                      margin: EdgeInsets.only(top: 3.5.h, bottom: 2.h),
                      alignment: Alignment.center,
                      height: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1.sp,
                              color:
                                  context.watch<TLoginProvider>().state.email ==
                                          null
                                      ? AppColours.neutral300
                                      : context
                                                  .watch<TLoginProvider>()
                                                  .state
                                                  .usernameErrorMessage !=
                                              null
                                          ? AppColours.danger500
                                          : AppColours.primary500)),
                      child: TextField(
                        controller: context
                            .read<TLoginProvider>()
                            .state
                            .emailController,
                        onChanged:
                            context.read<TLoginProvider>().onUsernameChange,
                        onSubmitted:
                            context.read<TLoginProvider>().onUsernameChange,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          prefixIcon: const Icon(
                            Iconsax.sms,
                          ),
                          prefixIconColor:
                              context.watch<TLoginProvider>().state.email ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<TLoginProvider>()
                                              .state
                                              .usernameErrorMessage !=
                                          null
                                      ? AppColours.danger500
                                      : AppColours.primary500,
                        ),
                      ),
                    ),
                    /////////////////////////////////////////////////// password////////////////////////////////
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
                                          .watch<TLoginProvider>()
                                          .state
                                          .password ==
                                      null
                                  ? AppColours.neutral300
                                  : context
                                              .watch<TLoginProvider>()
                                              .state
                                              .passwordErrorMessage !=
                                          null
                                      ? AppColours.danger500
                                      : AppColours.primary500)),
                      child: TextField(
                        obscureText:
                            context.watch<TLoginProvider>().state.hidePass,
                        controller: context
                            .read<TLoginProvider>()
                            .state
                            .passwordController,
                        onChanged:
                            context.read<TLoginProvider>().onPasswordChange,
                        onSubmitted:
                            context.read<TLoginProvider>().onPasswordChange,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            prefixIcon: const Icon(
                              Iconsax.lock,
                            ),
                            prefixIconColor: context
                                        .watch<TLoginProvider>()
                                        .state
                                        .password ==
                                    null
                                ? AppColours.neutral300
                                : context
                                            .watch<TLoginProvider>()
                                            .state
                                            .passwordErrorMessage !=
                                        null
                                    ? AppColours.danger500
                                    : AppColours.primary500,
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  context.read<TLoginProvider>().showPassword(),
                              icon: context
                                          .watch<TLoginProvider>()
                                          .state
                                          .hidePass ==
                                      true
                                  ? const Icon(Iconsax.eye_slash4)
                                  : const Icon(Iconsax.eye3),
                            )),
                      ),
                    ),
                    /////////////////////////////////////////////////Checkbox////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            child: Row(
                          children: [
                            Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateColor.resolveWith((states) {
                                  return context
                                          .watch<TLoginProvider>()
                                          .state
                                          .rememberMe
                                      ? AppColours.primary500
                                      : AppColours.neutral300;
                                }),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                value: context
                                    .watch<TLoginProvider>()
                                    .state
                                    .rememberMe,
                                onChanged: context
                                    .read<TLoginProvider>()
                                    .onChangeRememberMe),
                            Text("Remember me",
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    color: AppColours.neutral800,
                                    fontWeight: FontWeight.w400))
                          ],
                        )),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.teacher_forgetPassword);
                          },
                          child: Text("Forgot password?",
                              style: TextStyle(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColours.textonboarding)),
                        )
                      ],
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                            style: TextStyle(
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColours.neutral400)),
                        SizedBox(
                          width: 1.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.teacher_register);
                          },
                          child: Text("Register",
                              style: TextStyle(
                                  fontSize: 9.5.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColours.textonboarding)),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 2.h,
                    ),
                    ///////////////////////////////////////////login button////////////////////////////////////
                    SizedBox(
                      width: 90.w,
                      height: 7.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: context
                                        .read<TLoginProvider>()
                                        .state
                                        .emailController
                                        .text,
                                    password: context
                                        .read<TLoginProvider>()
                                        .state
                                        .passwordController
                                        .text);

                            if (credential.user!.emailVerified) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoutes.teacher_home, (route) => false);
                            } else {
                              print('No user found for that email.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.warning,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'Please verify your email.',
                              ).show();
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'No user found for that email.',
                              ).show();
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'Wrong password provided for that user.',
                              ).show();
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'No user found for that email.',
                              ).show();
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'Wrong password provided for that user.',
                              ).show();
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                context.read<TLoginProvider>().validate() ==
                                        true
                                    ? AppColours.primary800
                                    : AppColours.neutral300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color:
                                  context.read<TLoginProvider>().validate() ==
                                          true
                                      ? Colors.white
                                      : AppColours.neutral500,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
