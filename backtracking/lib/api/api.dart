import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "https://10.0.2.2:8080/website-Api/public/api/";
  Future<http.Response> postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    Uri myUri = Uri.parse(fullUrl);
    print(json.encode(data));

    return await http.post(
      myUri,
      body: json.encode(data),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': "application/json",
      },
      // 'connection': 'keep-alive',
      //   'Accept-Encoding' : 'gzip, deflate, br',
    );
  }

  Future<http.Response> getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    print(fullUrl);

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
