// ignore_for_file: file_names

import 'package:educare/screens/_______Teacher______/home/components/bottom_nav_bar/Tbottom_nav_bar.dart';
import 'package:educare/screens/_______Teacher______/home/provider/T_homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class THome extends StatelessWidget {
  const THome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<THomeProvider>().T_chosenPage(),
        bottomNavigationBar: const TBottomNavBar());
  }
}
