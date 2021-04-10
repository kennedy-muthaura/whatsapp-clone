import 'package:flutter/material.dart';
import 'package:whatsappclone/constants.dart';
import 'package:whatsappclone/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal.shade800,
        fontFamily: "montserrat",
      ),
      home: HomePage(),
    );
  }
}
