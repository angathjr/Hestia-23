import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';

class ApiProvider extends GetConnect {
  // Get request
  Future<Response> getApi(String url) => get(url);
  // Post request
  Future<Response> postApi(String url, Map data) => post(url, data);

  @override
  void onInit() {
    final storage = GetStorage();
    httpClient.addRequestModifier<dynamic>((request) {
      //add header
      final token = storage.read('user');
      request.headers['Authorization'] = "$token";
      log(request.headers.toString());
      log(request.url.toString());
      return request;
    });

    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com';

    // It's will attach 'apikey' property on header from all requests
    httpClient.addResponseModifier((request, response) {
      debugPrint(
        '${response.body}',
      );
      errorHandler(response);
      return response;
    });

    httpClient.addAuthenticator<dynamic>((request) async {
      // Set the header
      // final token = storage.read('user');
      // request.headers['Authorization'] = "$token";
      return request;
    });

    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    httpClient.maxAuthRetries = 3;
  }

  // Post request with File
  // Future<Response<CasesModel>> postCases(List<int> image) {
  //   final form = FormData({
  //     'file': MultipartFile(image, filename: 'avatar.png'),
  //     'otherFile': MultipartFile(image, filename: 'cover.png'),
  //   });
  //   return post('http://youapi/users/upload', form);
  // }

  dynamic errorHandler(Response response) {
    print(response.toString());
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        var responseJson = response.body.toString();
        return responseJson;
      case 500:
        throw "Server Error pls retry later";
      case 403:
        throw 'Error occurred pls check internet and retry.';
      case 500:
      default:
        throw 'Error occurred retry';
    }
  }
}
