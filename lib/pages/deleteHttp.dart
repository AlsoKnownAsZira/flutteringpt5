import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as ziraHttp;

class deleteHttp extends StatefulWidget {
  const deleteHttp({super.key});

  @override
  State<deleteHttp> createState() => _deleteHttpState();
}

class _deleteHttpState extends State<deleteHttp> {
  String data = 'No data yet';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP DELETE"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                var response = await ziraHttp
                    .get(Uri.parse('https://reqres.in/api/users/2'));
                Map<String, dynamic> dataFetched = jsonDecode(response.body);
                print(dataFetched);
                dataFetched = dataFetched['data'];
                setState(() {
                  data =
                      "User name: ${dataFetched['first_name']} ${dataFetched['last_name']}  -email${dataFetched['email']}";
                });
              },
              icon: const Icon(Icons.download))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(data),
            ElevatedButton(
                onPressed: () async {
                  var deletion = await ziraHttp.delete(Uri.parse(
                      'https://reqres.in/api/users/2')); // data will be deleted with 204 status code
                  if (deletion.statusCode == 204) {
                    setState(() {
                      data = "Product deleted";
                    });
                  }
                },
                child: const Text("Delete product "))
          ],
        ),
      ),
    );
  }
}
