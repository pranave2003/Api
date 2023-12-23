import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NumberApi extends StatefulWidget {
  const NumberApi({super.key});

  @override
  State<NumberApi> createState() => _NumberApiState();
}

class _NumberApiState extends State<NumberApi> {
  final number = TextEditingController();
  var userdata;
  var response;
  Future<dynamic> fetchUser(TextEditingController num) async {
    response = await get(Uri.parse('http://numbersapi.com/${num.text}'));
    print(response.body);
    // userdata = jsonDecode(response.body);
    setState(() {
      return response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 200,
                child: TextFormField(
                  controller: number,
                  decoration: InputDecoration(hintText: 'search'),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      fetchUser(number);
                    });
                  },
                  child: Icon(Icons.search))
            ],
          ),
        ),
        Container(
          height: 50,
          width: 300,
          color: Colors.amber,
          child: Text("${response.body}"),
        )
      ]),
    );
  }
}
