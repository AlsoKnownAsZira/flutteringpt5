import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as ziraHttp;
// ignore_for_file: prefer_const_constructors
// ignore: must_be_immutable
class futureHttp extends StatelessWidget {
  futureHttp({super.key});
  List<Map<String, dynamic>> allUser = [];
  Future getAll() async {
    try {
      var response =
          await ziraHttp.get(Uri.parse("https://reqres.in/api/users?page=2"));
      List dataFetched =
          (jsonDecode(response.body) as Map<String, dynamic>)["data"];
      dataFetched.forEach((element) {
        allUser.add(element);
      });
    } catch (e) {
      print('Error occured');
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Future Builder"),
      ),
      body: FutureBuilder(
          future: getAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("LOADING..........."),
              );
            } else {
              return ListView.builder(
                  itemCount: allUser.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[500],
                          backgroundImage:
                              NetworkImage(allUser[index]['avatar']),
                        ),
                        title: Text(
                            "${allUser[index]['first_name']} ${allUser[index]['last_name']}"),
                        subtitle: Text("${allUser[index]['email']}"),
                      ));
            }
          }),
    );
  }
}
