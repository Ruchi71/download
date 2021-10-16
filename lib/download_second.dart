import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:permission_handler/permission_handler.dart';

final imgurl = "";

class DownloadSecond extends StatefulWidget {
  const DownloadSecond({Key key}) : super(key: key);

  @override
  _DownloadSecondState createState() => _DownloadSecondState();
}

class _DownloadSecondState extends State<DownloadSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Download"),
          onPressed: (){
            imgurl;
          },
        ),
      ),
    );
  }
}
