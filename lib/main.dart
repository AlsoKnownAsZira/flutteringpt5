import 'package:flutter/material.dart';
import 'pages/getHttp.dart';
// ignore_for_file: prefer_const_constructors
void main() {
  runApp(const ziraApp());
}

class ziraApp extends StatelessWidget {
  const ziraApp({super.key});

    @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: getHttp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
