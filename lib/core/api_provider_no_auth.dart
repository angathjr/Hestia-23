import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiProviderNoAuth extends GetConnect {
  // Get request
  Future<Response> getApi(String url) => get(url);
  // Post request
  Future<Response> postApi(String url, Map data) => post(url, data);

  @override
  void onInit() {
    final storage = GetStorage();
    httpClient.addRequestModifier<dynamic>((request) {
      log(request.headers.toString());
      log(request.url.toString());
      return request;
    });

    httpClient.baseUrl = 'https://backend.hestiatkmce.live';

    // It's will attach 'apikey' property on header from all requests
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
    log(response.statusCode.toString());
    log(response.body.toString());
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        var responseJson = response.body.toString();
        return responseJson;
      case 500:
        throw "Server Error pls retry later";
      case 403:
        throw 'Invalid token header. No credentials provided.';
      default:
        throw 'Error occurred retry';
    }
  }
}
