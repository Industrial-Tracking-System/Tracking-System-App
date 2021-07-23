import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "https://448b852b6cf8.ngrok.io/website-api/public/api/";
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
    );
  }

  Future<http.Response> getData(apiUrl) async {
    var fullUrl = _url + apiUrl;

    Uri myUri = Uri.parse(fullUrl);
    print(myUri);

    return await http.get(
      myUri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': "*/*",
      },
    );
  }
}
