import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
class getHttp extends StatelessWidget {
  const getHttp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Get Tutorial"),
centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No data yet"),
            SizedBox(height: 12,),
            ElevatedButton(onPressed: (){}, child: Text("Get Data"))
          ],
        ),
      ),
    );
  }
}