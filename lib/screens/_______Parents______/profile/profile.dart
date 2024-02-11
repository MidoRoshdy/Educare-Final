// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:restart_app/restart_app.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: TextButton(
      child: const Text(
        'Restart App',
        style: TextStyle(fontSize: 20, color: Colors.red),
      ),
      onPressed: () {
        Restart.restartApp();
      },
    )));
  }
}
