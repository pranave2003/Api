import 'package:api/dogapi%20without%20button.dart';
import 'package:api/location.dart';
import 'package:api/numberApi.dart';
import 'package:flutter/material.dart';

import 'dog api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Location());
  }
}
