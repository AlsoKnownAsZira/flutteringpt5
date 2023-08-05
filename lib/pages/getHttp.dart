import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as ziraHttp;

// ignore_for_file: prefer_const_constructors
class getHttp extends StatefulWidget {
  const getHttp({super.key});

  @override
  State<getHttp> createState() => _getHttpState();
}

class _getHttpState extends State<getHttp> {
  late String id;
  late String email;
  late String name;

//initializing variables
  @override
  void initState() {
    // TODO: implement initState
    id = '';
    email = '';
    name = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Tutorial"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ID:$id ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "email:$email ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Name:$name ",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                // use await and async for waiting until the data is fetched ( in case of slow connection )
                onPressed: () async {
                  // get the data from dummy server and parse it
                  var serverResponse = await ziraHttp
                      .get(Uri.parse("https://reqres.in/api/users/9"));
                  if (serverResponse.statusCode == 200) {
                    // successfully get data (status 200)
                    //jsonDecode to decode string source to dynamic object
                    Map<String, dynamic> dataResp =
                        json.decode(serverResponse.body);
                    // use 'data' because it is stated like that in the API and to load the body
                    dataResp = dataResp['data'];
                    setState(() {
                      id = dataResp["id"].toString();
                      email = dataResp["email"].toString();
                      name =
                          "${dataResp["first_name"]} ${dataResp["last_name"]}";
                    });
                  } else {
                    //failed to get data (i.e status 404)
                    print("ERROR CODE: ${serverResponse.statusCode}");
                    setState(() {
                      id = 'ERROR';
                      email = 'ERROR';
                      name = 'ERROR';
                    });
                  }
                },
                child: Text("Get Data"))
          ],
        ),
      ),
    );
  }
}
