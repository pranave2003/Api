import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Dogapi extends StatefulWidget {
  const Dogapi({super.key});

  @override
  State<Dogapi> createState() => _DogapiState();
}

class _DogapiState extends State<Dogapi> {
  var userdata;

  Future<dynamic> fetchUser() async {
    var response =
        await get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    userdata = jsonDecode(response.body);
    return userdata;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (userdata == null) Text("press the button"),
              if (userdata != null)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 300,
                            width: 300,
                            child: Image.network(userdata['message'])),
                      ],
                    ),
                    Text("Firstname : ${userdata['Status']}"),
                  ],
                ),
              Icon(Icons.snapchat, color: Colors.amber),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      fetchUser();
                    });
                  },
                  child: Text("Load data")),
            ]),
      ),
      appBar: AppBar(),
    );
  }
}
