// ignore_for_file: file_names, camel_case_types, use_build_context_synchronously

import 'package:educare/core/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class T_ProfilePage extends StatelessWidget {
  const T_ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text("Profile Page"),
              IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.teacher_login, (route) => false);
                },
                icon: const Icon(Icons.exit_to_app),
              )
            ],
          ),
        ),
      ),
    );
  }
}
