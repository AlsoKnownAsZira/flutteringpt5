import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as ziraHttp;
// ignore_for_file: prefer_const_constructors

class putHttp extends StatefulWidget {
  const putHttp({super.key});

  @override
  State<putHttp> createState() => _putHttpState();
}

class _putHttpState extends State<putHttp> {
  TextEditingController nameControl = TextEditingController();
  TextEditingController jobControl = TextEditingController();

  String response = 'no response yet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HTTP put/patch tutorial"),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField(
              controller: nameControl,
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: "name", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: jobControl,
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: "job", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () async {
                  var serverResponse = await ziraHttp.patch(Uri.parse('https://reqres.in/api/users/2'), // put = replace, patch = update
                      body: {'name': nameControl.text, 'job': jobControl.text}); // setting what will be inserted using controller
                  Map<String, dynamic> dataServer = jsonDecode(serverResponse.body); // getting what we just posted to the server
                  print(dataServer);
                  setState(() {
                    response = "${dataServer['name']} - ${dataServer['job']}";
                  });
                },
                child: Text('Submit')),
            SizedBox(
              height: 50,
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text(response)
          ],
        ));
  }
}
