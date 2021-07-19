import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "https://7228741f62e1.ngrok.io/website-api/public/api/";
  Future<http.Response> postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    Uri myUri = Uri.parse(fullUrl);

    return await http.post(
      myUri,
      body: json.encode(data),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': "application/json",
      },
    );
  }

  Future<http.Response> getData(apiUrl) async {
    var fullUrl = _url + apiUrl;

    Uri myUri = Uri.parse(fullUrl);
    return await http.get(
      myUri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': "*/*",
        'connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br',
      },
    );
  }
}
