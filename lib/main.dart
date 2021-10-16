import 'package:download_app/download_first.dart';
import 'package:download_app/download_second.dart';
import 'package:download_app/ui.dart';
import 'package:flutter/material.dart';
import 'package:download_app/download_third.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ThirdDownload(),
    );
  }
}

