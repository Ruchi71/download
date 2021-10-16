import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:permission_handler/permission_handler.dart';



class ApiDownload extends StatefulWidget {
  const ApiDownload({Key key}) : super(key: key);

  @override
  _ApiDownloadState createState() => _ApiDownloadState();
}

class _ApiDownloadState extends State<ApiDownload> {

  @override
  void initState() {
    // TODO: implement initState
    getPermission();
  }
  @override
  Widget build(BuildContext context) {
    final imgurl = "https://riptutorial.com/Download/dart.pdf";
    var dio = Dio();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("download"),
          onPressed: ()async{
            String path = await ExtStorage.getExternalStoragePublicDirectory(
                ExtStorage.DIRECTORY_DOWNLOADS
            );
            String fullpath = "$path/document.jpg";
            download2(dio,imgurl,fullpath);

          },
        ),
      ),

    );
  }

  void getPermission()async {
    print("get permission");
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);

  }

  Future download2(Dio dio, String url, String savepath) async {
    try {
      Response response = await dio.get(url,
        onReceiveProgress: showdownloadprogress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status){
              return status<500;
            }
        ),);
      File file = File(savepath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeByteSync(response.data);
      await raf.close();

    } catch (e){
      print(e);
    }
  }

  void showdownloadprogress(received, total) {
    if(total != -1){
      print((received/total * 100).toString() + "%");
    }
  }
}

