import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/function/checkinternet.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

// String _basicAuth = 'Basic ${base64Encode(utf8.encode('wael:wael12345'))}';
// Map<String, String> myheaders = {'authorization': _basicAuth};
Map<String, String> myheaders = {};

class Curd {
  Future<Either<StatusRequest, Map>> postData(String link, Map data) async {
    try {
      if (await checkInternet()) {
        var response =
            await http.post(Uri.parse(link), body: data, headers: myheaders);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print(e);
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> getRequest(String url) async {
    try {
      if (await checkInternet()) {
        // var response = await http.get(Uri.parse(url));
        var response = await http.post(Uri.parse(url), headers: myheaders);

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print(e);
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> postRequestWithFile(
      String url, Map data, File file) async {
    try {
      if (await checkInternet()) {
        var request = http.MultipartRequest("POST", Uri.parse(url));
        var length = await file.length();
        var stream = http.ByteStream(file.openRead());
        var multipartFile = http.MultipartFile("file", stream, length,
            filename: path.basename(file.path));
        request.headers.addAll(myheaders);
        request.files.add(multipartFile);
        data.forEach((key, value) {
          request.fields[key] = value;
        });
        var myrequest = await request.send();
        var response = await http.Response.fromStream(myrequest);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print(e);
      return const Left(StatusRequest.serverException);
    }
  }
}
