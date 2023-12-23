import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Withoutbutton extends StatefulWidget {
  const Withoutbutton({super.key});

  @override
  State<Withoutbutton> createState() => _WithoutbuttonState();
}

class _WithoutbuttonState extends State<Withoutbutton> {
  @override
  var userdata;
  Future<dynamic> fetchUser() async {
    var response =
        await get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    userdata = jsonDecode(response.body);
    return userdata;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
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
                                child: Image.network(snapshot.data['message'])),
                          ],
                        ),
                        Text("status : ${snapshot.data['status']}"),
                      ],
                    ),
                  Icon(CupertinoIcons.sparkles,
                      color: Color.fromARGB(255, 237, 196, 12)),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          fetchUser();
                        });
                      },
                      child: Text("Load data")),
                ]);
          },
        ),
      ),
      appBar: AppBar(),
    );
  }
}
