import 'package:flutter/material.dart';
//import 'package:http/http.dart';
//import 'package:flutteringpt5/pages/getget.dart';
//import 'pages/getHttp.dart';
//import 'pages/postHttp.dart';
import 'pages/putHttp.dart';
import 'pages/deleteHttp.dart';

// ignore_for_file: prefer_const_constructors
void main() {
  runApp(const ziraApp());
}

class ziraApp extends StatelessWidget {
  const ziraApp({super.key});

    @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: deleteHttp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
