import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';

final imgUrl =
    "";

var dio = Dio();

class ThirdDownload extends StatefulWidget {
  const ThirdDownload({Key key}) : super(key: key);

  @override
  _ThirdDownloadState createState() => _ThirdDownloadState();
}

class _ThirdDownloadState extends State<ThirdDownload> {


  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }
  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
                onPressed: () async {
                  String path =
                  await ExtStorage.getExternalStoragePublicDirectory(
                      ExtStorage.DIRECTORY_DOWNLOADS);
                  String fullPath = "$path/test.jpg";
                  print('full path ${fullPath}');

                  download2(dio, imgUrl, fullPath);
                },
                icon: Icon(
                  Icons.file_download,
                  color: Colors.white,
                ),
                color: Colors.green,
                textColor: Colors.white,
                label: Text('Dowload')),

          ],
        ),
      ),

    );
  }
}
