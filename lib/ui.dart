import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:download_app/funct.dart';

final imgUrl =
    "";

var dio = Dio();

class Uipart extends StatefulWidget {
  const Uipart({ Key key }) : super(key: key);

  @override
  _UipartState createState() => _UipartState();
}

class _UipartState extends State<Uipart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: ElevatedButton(
        child: Text("download"),
        onPressed: () async {
                  String path =
                  await ExtStorage.getExternalStoragePublicDirectory(
                      ExtStorage.DIRECTORY_DOWNLOADS);
                  //String fullPath = tempDir.path + "/boo2.pdf'";
                  String fullPath = "$path/test.jpg";
                  print('full path ${fullPath}');

                  download2(dio, imgUrl, fullPath);
                },
      ),),
      
    );
  }
}