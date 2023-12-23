import 'package:flutter/material.dart';

class plash extends StatefulWidget {
  const plash({super.key});

  @override
  State<plash> createState() => _plashState();
}

class _plashState extends State<plash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          color: Colors.amber,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(""), fit: BoxFit.fill)),
        )
      ]),
    );
  }
}
