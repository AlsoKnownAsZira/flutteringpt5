import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutteringpt5/models/userModel.dart';
import 'package:http/http.dart ' as ziraHttp;

// ignore_for_file: prefer_const_constructors
// ignore: must_be_immutable
class futureHttp extends StatelessWidget {
  futureHttp({super.key});
  List<UserModel> allUser = [];
  Future getAll() async {
    try {
      var response =
          await ziraHttp.get(Uri.parse("https://reqres.in/api/users?page=2"));
      List dataFetched =
          (jsonDecode(response.body) as Map<String, dynamic>)["data"];
      dataFetched.forEach((element) {
        allUser.add(UserModel.fromJson(element));
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
              if (allUser.length == 0) {
                return Center(
                  child: Text("NO DATA"),
                );
              }
              return ListView.builder(
                  itemCount: allUser.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[500],
                          backgroundImage: NetworkImage(allUser[index].avatar),
                        ),
                        title: Text(
                            "${allUser[index].firstName} ${allUser[index].lastName}"),
                        subtitle: Text("${allUser[index].email}"),
                      ));
            }
          }),
    );
  }
}
