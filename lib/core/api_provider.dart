import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiProvider extends GetConnect {
  // Get request
  Future<Response> getApi(String url) => get(url);
  // Post request
  Future<Response> postApi(String url, Map data) => post(url, data);
  // Put request
  Future<Response> putApi(String url, Map data) => put(url, data);
  // patch request
  Future<Response> patchApi(String url, Map data) => patch(url, data);
  // delete request
  Future<Response> deleteApi(String url, Map data) => delete(url);

  @override
  void onInit() {
    final storage = GetStorage();

    // Request Modifier
    httpClient.addRequestModifier<dynamic>((request) {
      //add header
      final token = storage.read('authToken');
      log('AuthTOken: $token');
      request.headers['Authorization'] = "token $token";
      log(request.headers.toString());
      log(request.url.toString());
      return request;
    });

    httpClient.baseUrl = 'https://backend.hestiatkmce.live';

    // Response Modifiers
    httpClient.addResponseModifier((request, response) {
      debugPrint(
        '${response.body}',
      );
      errorHandler(response);
      return response;
    });

    httpClient.maxAuthRetries = 3;
  }

  dynamic errorHandler(Response response) {
    try {
      log(response.statusCode.toString());
      log(response.body.toString());
      // switch (response.statusCode) {
      //   case 200:
      //   case 201:
      //   case 202:
      //     var responseJson = response.body.toString();
      //     return responseJson;
      //   case 500:
      //     throw "Server Error pls retry later";
      //   case 403:
      //     throw 'Invalid token header. No credentials provided.';
      //   case 500:
      //   default:
      //     throw 'Error occurred retry';
      // }
    } catch (e) {
      print(e);
    }
  }
}
