import 'package:educare/screens/_______Parents______/home/provider/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/bottom_nav_bar/bottom_nav_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<HomeProvider>().chosenPage(),
        bottomNavigationBar: const BottomNavBar());
  }
}
