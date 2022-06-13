import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../common/constants.dart';

class ApiBase{

  // ApiBase apiBase = ApiBase._internal();

  Future<http.Response> request(String method, String url,
      Map<String, String>? header, Map<String, dynamic>? body)async{
    var headers = header;
    var request = http.Request(method, Uri.parse(Constants.BASE_URL + url));
    request.body = json.encode(body);
    request.headers.addAll(headers!);
    http.StreamedResponse streamResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamResponse);
    return response;
  }
}