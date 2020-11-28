import 'dart:convert';

import 'package:http/http.dart' as http;

import 'base_url.dart';

class ApiAuth {
  //register method
  static Future<http.Response> register(body) async {
    final response = await http.post('${URLS.BASE_URL}/user/register',
        body: jsonEncode(body), headers: {"Content-type": "application/json"});

    return response;
  }

  //login method
  static Future<http.Response> login(body) async {
    final response = await http.post('${URLS.BASE_URL}/user/login',
        body: jsonEncode(body), headers: {"Content-type": "application/json"});

    return response;
  }
}
