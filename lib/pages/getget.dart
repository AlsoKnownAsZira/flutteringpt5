import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as productHttp;

// ignore_for_file: prefer_const_constructors
class getget extends StatefulWidget {
  const getget({super.key});

  @override
  State<getget> createState() => _getgetState();
}

class _getgetState extends State<getget> {
  int id = 0;
  String brand = '';
  String product = '';
  num price = 0;
  int stock = 0;
  String status = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("id: $id"),
            Text("brand:$brand"),
            Text("product name:$product"),
            Text("price:$price USD"),
            Text("stock:$stock  pcs"),
            Text("status: $status"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  var response = await productHttp
                      .get(Uri.parse('https://dummyjson.com/products/1'));
                  if (response.statusCode == 200) {
                    Map<String, dynamic>  fetchedData =
                        jsonDecode(response.body);
                    setState(() {
                      id = fetchedData['id'];
                      brand = fetchedData['brand'];
                      product = fetchedData['title'];
                      price = fetchedData['price'];
                      stock = fetchedData['stock'];
                      status = '202';
                    });
                  } else {
                    status = '404';
                  }
                },
                child: Text("Get product data"))
          ],
        ),
      ),
    );
  }
}
