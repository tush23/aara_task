
import 'package:aara_task/app/api/services/base_services.dart';
import 'package:aara_task/app/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import 'error_handler.dart';

class ApiProvider extends GetConnect with BaseApiServices {
  static const String _BASE_URL = 'https://project252.aaratechnologies.in/web/';
  // static const String _X_API_KEY = 'gpbKirgJMVEOnatf';

  @override
  void onInit() {
    httpClient.baseUrl = _BASE_URL;
    httpClient.timeout = Duration(seconds: 5);
    httpClient.errorSafety = true;
    // adding RequestModifier.
    // addRequestModifier();
    // httpClient.
    httpClient.addResponseModifier((request, response) {
      // request.headers['x-api-key'] = _X_API_KEY;
      // request.headers['Authorization'] = USER_TOKEN.value;
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
        '╟ REQUEST ║ ${request.method.toUpperCase()}\n'
        '╟ url: ${request.url}\n'
        '╟ Headers: ${request.headers}\n'
        '╟ Body: ${request.bodyBytes.map((event) => event.asMap().toString())}\n'
        '╟ Status Code: ${response.statusCode}\n'
        '╟ Data: ${response.bodyString?.toString() ?? ''}'
        '\n╚══════════════════════════ Response ══════════════════════════\n',
        wrapWidth: 1024,
      );
      return request;
    });
  }

  @override
  Future<Response> getCategory() async {
    final response = await get(API_CATEGORY);
    return response;
  }

  @override
  Future<Response> getSubCategory() async {
    final response = await get(API_SUBCATEGORY);
    return response;
  }

  // addRequestModifier() {
  //   // print('----Add addRequestModifier Calling ${USER_TOKEN.value} ----');
  //   httpClient.addRequestModifier((Request<dynamic> request) {
  //     request.headers['x-api-key'] = _X_API_KEY;
  //     request.headers['authorization'] = USER_TOKEN.value;
  //     print('----Add addRequestModifier Called----');
  //     // var req=await request;
  //     return request;
  //   });
  // }


}
