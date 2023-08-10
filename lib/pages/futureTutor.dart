import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as appHttp;

class futureTutor extends StatefulWidget {
  futureTutor({super.key});

  @override
  State<futureTutor> createState() => _futureTutorState();
}

class _futureTutorState extends State<futureTutor> {
  List<Map<String, dynamic>> allProduct = [];

  Future getAllProduct() async {
    try {
      var response =
          await appHttp.get(Uri.parse('https://dummyjson.com/products'));
      List dataFetched =
          (jsonDecode(response.body) as Map<String, dynamic>)['products'];
      dataFetched.forEach((element) {
        allProduct.add(element);
      });
    } catch (e) {
      print('Error Occured');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Products List"),
      ),
      body: FutureBuilder(
          future: getAllProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text("Loading products..."));
            } else {
              return ListView.builder(
                itemCount: allProduct.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => openProduct(index),
                      )),
                  leading: Container(
                    height: 500,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      image: DecorationImage(
                          image: NetworkImage(allProduct[index]['thumbnail']),
                          fit: BoxFit.cover),
                    ),
                  ),
                  title: Text("${allProduct[index]['title']}"),
                  subtitle: Text("\$${allProduct[index]['price']}"),
                ),
              );
            }
          }),
    );
  }

  openProduct(int index) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${allProduct[index]['title']}"),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[500],
                image: DecorationImage(
                    image: NetworkImage(allProduct[index]['thumbnail']),
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 5),
              child: Text(
                "${allProduct[index]['title']}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 5),
              child: Text(
                "\$${allProduct[index]['price']}",
                style: TextStyle(fontSize: 15),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                "Rating:${allProduct[index]['rating']}",
                style: TextStyle(fontSize: 15),
              ),
            ),
              Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                "Stock:${allProduct[index]['stock']}",
                style: TextStyle(fontSize: 15),
              ),
            ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                "${allProduct[index]['description']}",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
