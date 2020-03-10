import 'dart:convert';
import 'dart:async';

import 'package:meta/meta.dart';
import 'package:dio/dio.dart';


class ApiClient {
  static const baseUrl = 'http://10.0.2.2:3001';

  Future<Response> getClient(String args) async {
    final url = '$baseUrl/$args';

    Response response = await Dio().get(url);
    return response;
  }

  Future<Response> postClient(String args, [Map<String, dynamic> data]) async {
    final url = '$baseUrl/$args';
    Response response = await Dio().post(url, data: data);
    
    return response;
  }
}