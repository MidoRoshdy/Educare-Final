// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class T_QRPage extends StatefulWidget {
  const T_QRPage({super.key});

  @override
  State<T_QRPage> createState() => _T_QRPageState();
}

class _T_QRPageState extends State<T_QRPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("QR Page"),
        ),
      ),
    );
  }
}
